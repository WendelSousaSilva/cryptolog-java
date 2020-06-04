package br.com.pentagono.estoque.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.pentagono.estoque.models.MovimentoEstoque;
import br.com.pentagono.estoque.models.PedidoCompra;

@Repository
public class MovimentoEstoqueDAO {
	
	@PersistenceContext
	private EntityManager manager;

	public List<MovimentoEstoque> listarTodos() {
		return manager.createQuery("select m from MovimentoEstoque m order by id").getResultList();
	}

	public MovimentoEstoque buscarPorId(Long id) {
		return manager.find(MovimentoEstoque.class, id);
	}

	public void salvar(MovimentoEstoque registro) {
		if (registro.getId() == null) {
			manager.persist(registro);
		} else {
			manager.merge(registro);
		}
	}

	public void excluir(MovimentoEstoque registro) {
		manager.remove(registro);
	}
}
