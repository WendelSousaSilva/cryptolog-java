package br.com.pentagono.estoque.controllers;

import java.security.Principal;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.pentagono.estoque.daos.FornecedorDAO;
import br.com.pentagono.estoque.daos.MovimentoEstoqueDAO;
import br.com.pentagono.estoque.daos.PedidoCompraDAO;
import br.com.pentagono.estoque.daos.ProdutoDAO;
import br.com.pentagono.estoque.models.ItemPedidoCompra;
import br.com.pentagono.estoque.models.MovimentoEstoque;
import br.com.pentagono.estoque.models.PedidoCompra;
import br.com.pentagono.estoque.models.Produto;
import br.com.pentagono.estoque.models.StatusPedido;
import br.com.pentagono.estoque.validations.PedidoCompraValidator;

@Controller
@Transactional
@RequestMapping("/pedidos-compra")
public class PedidoCompraController {

	@Autowired
	private PedidoCompraDAO pedidoCompraDAO;

	@Autowired
	private FornecedorDAO fornecedorDAO;

	@Autowired
	private ProdutoDAO produtoDAO;

	@Autowired
	private MovimentoEstoqueDAO movimentoEstoqueDAO;

	@InitBinder
	protected void init(WebDataBinder binder) {
		binder.setValidator(new PedidoCompraValidator());
	}

	@RequestMapping(value = "/novo", name = "novoPedidoComprarUrl")
	public ModelAndView form(PedidoCompra pedidoCompra) {

		ModelAndView mav = new ModelAndView("pedidosCompra/form");
		mav.addObject("fornecedores", fornecedorDAO.listarTodos());

		if (pedidoCompra.getFornecedor() != null && pedidoCompra.getFornecedor().getId() != null) {
			mav.addObject("produtosFornecedor", produtoDAO.listarPorFornecedor(pedidoCompra.getFornecedor().getId()));
		}

		return mav;
	}

	@RequestMapping(method = RequestMethod.POST, name = "salvarPedidoCompraUrl")
	public ModelAndView salvarNoBanco(@Valid PedidoCompra registroQueSeraSalvo, BindingResult resultadoValidacao,
			RedirectAttributes atributos) {

		if (resultadoValidacao.hasErrors()) {
			return form(registroQueSeraSalvo);
		}

		for (ItemPedidoCompra itemPedido : registroQueSeraSalvo.getItens()) {
			itemPedido.setPedido(registroQueSeraSalvo);
		}
		pedidoCompraDAO.salvar(registroQueSeraSalvo);

		ModelAndView mav = new ModelAndView("redirect:/pedidos-compra");
		return mav;
	}

	@RequestMapping(method = RequestMethod.GET, name = "listarPedidoCompraUrl")
	public ModelAndView listar() {

		ModelAndView mav = new ModelAndView("pedidosCompra/lista");
		List<PedidoCompra> dados = pedidoCompraDAO.listarTodos();
		mav.addObject("listaDePedidos", dados);

		return mav;
	}

	@RequestMapping(value = "{id}/edit", name = "alterarPedidoCompraUrl")
	public ModelAndView alterar(@PathVariable Long id, Model model) {

		PedidoCompra pedidoEncontrado = pedidoCompraDAO.buscarPorId(id);
		model.addAttribute(pedidoEncontrado);

		return form(pedidoEncontrado);
	}

	@RequestMapping(value = "/{id}", name = "detalharPedidoCompraUrl")
	public ModelAndView detalhar(@PathVariable Long id) {

		PedidoCompra pedidoVindoDoBanco = pedidoCompraDAO.buscarPorId(id);
		ModelAndView mav = new ModelAndView("pedidosCompra/detalhe");
		mav.addObject("pedidoCompra", pedidoVindoDoBanco);

		return mav;
	}

	@RequestMapping(value = "/{id}/delete", method = RequestMethod.POST, name = "excluirPedidoCompraUrl")
	public String excluir(@PathVariable Long id) {

		PedidoCompra pedidoEncontrado = pedidoCompraDAO.buscarPorId(id);
		pedidoCompraDAO.excluir(pedidoEncontrado);
		return "redirect:/pedidos-compra";
	}

	@RequestMapping(value = "/{id}/status", method = RequestMethod.GET, name = "detalharPedidoStatusUrl")
	public ModelAndView detalharPedidoParaAlterarStatus(@PathVariable Long id, PedidoCompra pedidoStatus) {

		PedidoCompra pedidoVindoDoBanco = pedidoCompraDAO.buscarPorId(id);
		ModelAndView mav = new ModelAndView("pedidosCompra/alteraStatus");
		mav.addObject("pedidoCompra", pedidoVindoDoBanco);
		mav.addObject("listaDeStatus", StatusPedido.values());

		return mav;
	}

	@RequestMapping(value = "/status", method = RequestMethod.POST, name = "alterarStatusPedidoUrl")
	public ModelAndView alterarStatusPedido(PedidoCompra pedidoStatus, Principal principal) {

		PedidoCompra pedidoCompleto = pedidoCompraDAO.buscarPorId(pedidoStatus.getId());

		if (pedidoStatus.getStatus().equals(StatusPedido.RECEBIDO)) {
			for (ItemPedidoCompra itemPedido : pedidoCompleto.getItens()) {

				// Soma as quantidades em estoque
				Produto produtoCompleto = produtoDAO.buscaPorId(itemPedido.getProduto().getId());
				Long quantidadeAtual = produtoCompleto.getQuantidade();
				quantidadeAtual = quantidadeAtual + Math.round(itemPedido.getQuantidade());

				produtoCompleto.setQuantidade(quantidadeAtual);
				produtoDAO.salvar(produtoCompleto);

				// Criar um registro de Movimento do Estoque
				MovimentoEstoque movimento = new MovimentoEstoque();

				movimento.setDataHora(LocalDateTime.now(ZoneId.of("GMT-3")));
				movimento.setPedido(pedidoCompleto);
				movimento.setProduto(produtoCompleto);
				movimento.setQuantidade (Math.round (itemPedido.getQuantidade()));
				movimento.setLoginUsuario(principal.getName());

				movimentoEstoqueDAO.salvar(movimento);
			}
		}

		// Atualiza o Status do Pedido
		pedidoCompleto.setStatus(pedidoStatus.getStatus());
		pedidoCompleto.setDataRecebimento(pedidoStatus.getDataRecebimento());
		pedidoCompraDAO.salvar(pedidoCompleto);

		ModelAndView mav = new ModelAndView("redirect:/pedidos-compra");
		return mav;
	}

}
