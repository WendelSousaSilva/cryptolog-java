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

import br.com.pentagono.estoque.daos.FornecedorDAO;
import br.com.pentagono.estoque.daos.ProdutoDAO;
import br.com.pentagono.estoque.models.Fornecedor;
import br.com.pentagono.estoque.models.Produto;

@RestController
@RequestMapping("/api/fornecedores")
@CrossOrigin
public class FornecedorApiController {

	@Autowired
	private FornecedorDAO fornecedorDAO;
	
	@Autowired
	private ProdutoDAO produtoDAO;

	@GetMapping
	public List<Fornecedor> listar() {
		return fornecedorDAO.listarTodos();
	}

	@GetMapping("/{id}")
	public ResponseEntity<Fornecedor> listarPorId(@PathVariable Long id) {

		Fornecedor fornecedor = fornecedorDAO.buscarPorId(id);

		if (fornecedor == null) {
			return new ResponseEntity<Fornecedor>(HttpStatus.NOT_FOUND);
		}		
		
		return new ResponseEntity<Fornecedor>(fornecedor, HttpStatus.OK);
	}
	
	@GetMapping("/{idFornecedor}/produtos")
	public List<Produto> listarProdutosFornecedor(@PathVariable Long idFornecedor) {
		
		return produtoDAO.listarPorFornecedor(idFornecedor);
	}
	
	
	
	
	
	
	
	
}
