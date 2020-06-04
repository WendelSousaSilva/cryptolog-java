package br.com.pentagono.estoque.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.pentagono.estoque.daos.MovimentoEstoqueDAO;
import br.com.pentagono.estoque.daos.UsuarioDAO;
import br.com.pentagono.estoque.models.MovimentoEstoque;
import br.com.pentagono.estoque.models.Usuario;


@Controller
@RequestMapping("/movimento")
public class MovimentoEstoqueController {
	
	@Autowired
	private MovimentoEstoqueDAO movimentoEstoqueDAO;
	
	@Autowired
	private UsuarioDAO usuarioDAO;
	
	@RequestMapping(method = RequestMethod.GET, name = "listarMovimentoUrl")
	public ModelAndView listarMovimento() {

		ModelAndView mav = new ModelAndView("movimento/lista");
		List<MovimentoEstoque> dados = movimentoEstoqueDAO.listarTodos();
		mav.addObject("listaDeMovimento", dados);

		return mav;
	}
		
	@RequestMapping(value = "/{id}", name = "detalharMovimentoUrl")
		public ModelAndView detalhar(@PathVariable Long id) {
		
		MovimentoEstoque movimentoVindoDoBanco = movimentoEstoqueDAO.buscarPorId(id);
		Usuario usuario= usuarioDAO.buscarPorId(movimentoVindoDoBanco.getLoginUsuario());
		
		ModelAndView mav = new ModelAndView("movimento/detalhe");
		mav.addObject("movimento", movimentoVindoDoBanco);
		mav.addObject("usuario", usuario);
		return mav;
		
		

	}
	
	

}
