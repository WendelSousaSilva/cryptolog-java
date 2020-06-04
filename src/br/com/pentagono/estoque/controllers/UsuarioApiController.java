package br.com.pentagono.estoque.controllers;

import java.security.Principal;
import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.pentagono.estoque.daos.UsuarioDAO;
import br.com.pentagono.estoque.models.Usuario;

@Transactional
@RestController
@RequestMapping("/api/usuarios")
@CrossOrigin
public class UsuarioApiController {
	
	@Autowired
	private UsuarioDAO usuarioDAO;
	
	
	@GetMapping
	public List<Usuario> listar() {
		return usuarioDAO.listarTodos();
	}

	
	@GetMapping("/{id}")
	public ResponseEntity<Usuario> listarPorId(@PathVariable String id) {
		
		Usuario usuario = usuarioDAO.buscarPorId(id);

		if (usuario == null) {
			return new ResponseEntity<Usuario>(HttpStatus.NOT_FOUND);
		}		
		
		return new ResponseEntity<Usuario>(usuario, HttpStatus.OK);
	}
	
	@PostMapping
	public Usuario salvarUsuario(@RequestBody Usuario usuarioApiQueSeraSalvo) {
		return usuarioDAO.salvarApi(usuarioApiQueSeraSalvo);
	}
	


	}

