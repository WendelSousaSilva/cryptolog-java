package br.com.pentagono.estoque.controllers;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.pentagono.estoque.models.Produto;
import br.com.pentagono.estoque.daos.ProdutoDAO;


@Controller
@Transactional
@RequestMapping("/front")


public class FrontController {
	
	@Autowired
	private ProdutoDAO produtoDAO;
	
	
	@RequestMapping(method = RequestMethod.GET, name = "listarProdutoFrontUrl")
	public ModelAndView listarProdutosFront() {

		ModelAndView mav = new ModelAndView("front/produtos-listagem");
		List<Produto> dados = produtoDAO.listarTodos();
		mav.addObject("listaDeProdutosFront", dados);

		return mav;
	}
	
	@RequestMapping(value = "/{id}", name = "detalharFrontProdutoUrl")
	public ModelAndView detalharProdutoFront(@PathVariable Long id) {

		Produto produtoVindoDoBanco = produtoDAO.buscaPorId(id);
		ModelAndView mav = new ModelAndView("front/detalhe");
		mav.addObject("front", produtoVindoDoBanco);
		return mav;
	}
	
	@RequestMapping(value = "/home", name = "homeUrl")
	public String home() {
		return "front/home";
		
	}
	
	@RequestMapping(value = "/empresa", name = "empresaUrl")
	public String empresa() {
		return "front/empresa";
		
	}
	
	@RequestMapping(value = "/contato", name = "contatoUrl")
	public String contato() {
		return "front/contato";
		
	}

}
