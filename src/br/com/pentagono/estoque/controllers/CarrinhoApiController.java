package br.com.pentagono.estoque.controllers;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.pentagono.estoque.daos.CarrinhoDAO;
import br.com.pentagono.estoque.daos.ProdutoDAO;
import br.com.pentagono.estoque.models.Carrinho;
import br.com.pentagono.estoque.models.ItemCarrinho;
import br.com.pentagono.estoque.models.Produto;

@Transactional
@CrossOrigin
@RestController
@RequestMapping("/api/carrinho")
public class CarrinhoApiController {
	
	@Autowired
	private CarrinhoDAO carrinhorDAO;
	
	@Autowired
	private ProdutoDAO produtoDAO;
	
	@GetMapping
	public List<Carrinho> listar() {
		return carrinhorDAO.listarTodos();
	}

	@GetMapping("/{id}")
	public ResponseEntity<Carrinho> listarPorId(@PathVariable Long id) {

		Carrinho carrinho = carrinhorDAO.buscarPorId(id);

		if (carrinho == null) {
			return new ResponseEntity<Carrinho>(HttpStatus.NOT_FOUND);
		}		
		
		return new ResponseEntity<Carrinho>(carrinho, HttpStatus.OK);
	}



@PostMapping("/finalizar")
		public Carrinho salvar(@RequestBody Carrinho carrinhoQueSeraSalvo) {
		
		for (ItemCarrinho itemCarrinho : carrinhoQueSeraSalvo.getItens()) {
			itemCarrinho.setCarrinho(carrinhoQueSeraSalvo);
			carrinhorDAO.salvar(carrinhoQueSeraSalvo);
			
			Produto produtoCompleto = produtoDAO.buscaPorId(itemCarrinho.getProduto().getId());
			Long quantidadeAtual = produtoCompleto.getQuantidade();
			quantidadeAtual = quantidadeAtual - Math.round(itemCarrinho.getQuantidade());

			produtoCompleto.setQuantidade(quantidadeAtual);
			produtoDAO.salvar(produtoCompleto);
			
		}
		return carrinhoQueSeraSalvo;
		
			}
	

	

}	



