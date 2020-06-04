package br.com.pentagono.estoque.models;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Entity
public class PedidoCompra {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate data;

	@ManyToOne
	@JoinColumn(name = "fornecedor_id")
	private Fornecedor fornecedor;
	private String condicaoPagamento;

	@OneToMany(mappedBy = "pedido", cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
	private List<ItemPedidoCompra> itens = new ArrayList<>();

	@Enumerated(EnumType.STRING)
	private StatusPedido status;
	
	@DateTimeFormat(iso=ISO.DATE)
	private LocalDate dataRecebimento;

	public LocalDate getDataRecebimento() {
		return dataRecebimento;
	}

	public void setDataRecebimento(LocalDate dataRecebimento) {
		this.dataRecebimento = dataRecebimento;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public LocalDate getData() {
		return data;
	}

	public void setData(LocalDate data) {
		this.data = data;
	}

	public Fornecedor getFornecedor() {
		return fornecedor;
	}

	public void setFornecedor(Fornecedor fornecedor) {
		this.fornecedor = fornecedor;
	}

	public String getCondicaoPagamento() {
		return condicaoPagamento;
	}

	public void setCondicaoPagamento(String condicaoPagamento) {
		this.condicaoPagamento = condicaoPagamento;
	}

	public List<ItemPedidoCompra> getItens() {
		return itens;
	}

	public void setItens(List<ItemPedidoCompra> itens) {
		this.itens = itens;
	}

	public StatusPedido getStatus() {
		return status;
	}

	public String getStatusFmt() {
		if (this.status.equals(StatusPedido.EM_ABERTO)) {
			return "EM ABERTO";
		} else {
			return this.status.toString();
		}
	}

	public void setStatus(StatusPedido status) {
		this.status = status;
	}
}
