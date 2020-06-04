package br.com.pentagono.estoque.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.pentagono.estoque.models.PedidoCompra;
import br.com.pentagono.estoque.models.StatusPedido;

@Repository
public class PedidoCompraDAO {
	
	@PersistenceContext
	private EntityManager manager;

	public List<PedidoCompra> listarTodos() {
		return manager.createQuery("select p from PedidoCompra p order by id").getResultList();
	}

	public PedidoCompra buscarPorId(Long id) {
		return manager.find(PedidoCompra.class, id);
	}

	public void salvar(PedidoCompra registro) {
		if (registro.getId() == null) {
			registro.setStatus(StatusPedido.EM_ABERTO);
			manager.persist(registro);
		} else {
			manager.merge(registro);
		}
	}

	public void excluir(PedidoCompra registro) {
		manager.remove(registro);
	}
}
