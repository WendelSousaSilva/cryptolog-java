package br.com.pentagono.estoque.DTO;

import java.io.Serializable;

public class JwtRequestDTO implements Serializable {

	private static final long serialVersionUID = -1753688041038397492L;

	private String username;
	private String password;

	public JwtRequestDTO() {
		super();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
