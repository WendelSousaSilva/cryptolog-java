package br.com.pentagono.estoque.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.pentagono.estoque.models.Carrinho;
import br.com.pentagono.estoque.models.StatusPedido;

@Repository
public class CarrinhoDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public List<Carrinho> listarTodos() {
		return manager.createQuery("select c from Carrinho c order by id").getResultList();
	}

	public Carrinho buscarPorId(Long id) {
		return manager.find(Carrinho.class, id);
	}

	public void salvar(Carrinho carrinhoQueSeraSalvo) {
		if (carrinhoQueSeraSalvo.getId() == null) {
			manager.persist(carrinhoQueSeraSalvo);
		} else {
			manager.merge(carrinhoQueSeraSalvo);
		}
	}

	public void excluir(Carrinho registro) {
		manager.remove(registro);
	}
}


