package br.com.pentagono.estoque.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.pentagono.estoque.daos.ProdutoDAO;
import br.com.pentagono.estoque.models.Produto;


@RestController
@RequestMapping("/api/produtos")
@CrossOrigin

public class ProdutoApiController {

	@Autowired
	private ProdutoDAO produtoDAO;
	
	
	@GetMapping
	public List<Produto> listar() {
		return produtoDAO.listarTodos();
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<Produto> listarPorId(@PathVariable Long id) {
		
		Produto produto = produtoDAO.buscaPorId(id);

		if (produto == null) {
			return new ResponseEntity<Produto>(HttpStatus.NOT_FOUND);
		}		
		
		return new ResponseEntity<Produto>(produto, HttpStatus.OK);
	}

}
