package br.com.pentagono.estoque.validations;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import br.com.pentagono.estoque.models.PedidoCompra;

public class PedidoCompraValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return PedidoCompra.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

	}

}
