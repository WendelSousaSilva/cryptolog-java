package br.com.pentagono.estoque.converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import br.com.pentagono.estoque.daos.ProdutoDAO;
import br.com.pentagono.estoque.models.Produto;

@Component
public class StringToProdutoConverter implements Converter<String, Produto> {

	@Autowired
	private ProdutoDAO produtoDAO;

	@Override
	public Produto convert(String source) {
		Long id = Long.parseLong(source);

		try {
			return produtoDAO.buscaPorId(id);
		} catch (Exception e) {
			return new Produto();
		}
	}
}
