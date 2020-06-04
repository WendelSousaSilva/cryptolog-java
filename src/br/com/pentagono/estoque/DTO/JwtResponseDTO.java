package br.com.pentagono.estoque.DTO;

import java.io.Serializable;

public class JwtResponseDTO implements Serializable {

	private static final long serialVersionUID = 7908768980231881532L;

	private final String jwttoken;

	public JwtResponseDTO(String jwttoken) {
		this.jwttoken = jwttoken;
	}

	public String getToken() {
		return this.jwttoken;
	}

}
