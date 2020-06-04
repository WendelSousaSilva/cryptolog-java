package br.com.pentagono.estoque.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.pentagono.estoque.DTO.JwtRequestDTO;
import br.com.pentagono.estoque.DTO.JwtResponseDTO;
import br.com.pentagono.estoque.daos.UsuarioDAO;
import br.com.pentagono.estoque.utils.JwtTokenUtils;

@CrossOrigin
@RestController
@RequestMapping("/api/usuarios")
public class UsuarioApiController {

	@Autowired
	private AuthenticationManager managerAuthSpring;

	@Autowired
	private JwtTokenUtils jwtTokenUtils;

	@Autowired
	private UsuarioDAO usuarioDAO;

	@PostMapping(value = "/login")
	public ResponseEntity<?> createAuthenticationToken(@RequestBody JwtRequestDTO authenticationRequest) throws Exception {
		authenticate(authenticationRequest.getUsername(), authenticationRequest.getPassword());
		final UserDetails userDetails = usuarioDAO.loadUserByUsername(authenticationRequest.getUsername());
		final String token = jwtTokenUtils.generateToken(userDetails);
		return ResponseEntity.ok(new JwtResponseDTO(token));
	}

	private void authenticate(String username, String password) throws Exception {
		try {
			managerAuthSpring.authenticate(new UsernamePasswordAuthenticationToken(username, password));
		} catch (DisabledException e) {
			throw new Exception("USER_DISABLED", e);
		} catch (BadCredentialsException e) {
			throw new Exception("INVALID_CREDENTIALS", e);
		}
	}

}
