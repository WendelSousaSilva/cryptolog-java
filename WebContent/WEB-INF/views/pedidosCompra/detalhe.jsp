<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<html>
	<%@ include file="../base/header.jsp" %>

<body>
	<%@ include file="../base/navbar.jsp" %>
	
	<div class="container">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">Detalhes do Pedido de Compra Nº: ${pedidoCompra.id}</h3>
			</div>
			
			<div class="panel-body">
				<div class="row">
					<div class="col-md-12">
						<ul>
							<li><strong>Fornecedor:</strong> ${pedidoCompra.fornecedor.razaoSocial}</li>
							<li><strong>Data:</strong> ${pedidoCompra.data} </li>
							<li><strong>Condição de Pagamento:</strong> ${pedidoCompra.condicaoPagamento}</li>
						</ul>					
					</div>				
				</div>
				
				<div class="row">
					<div class="col-md-12">			
						<table class="table table-condensed table-striped" id="tbItens">
							<thead>
								<tr>
									<th>#</th>
									<th>Produto</th>
									<th>Quantidade</th>
									<th>Preço Unitário</th>
									<th>Valor Total</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pedidoCompra.itens}" var="itemPedido" varStatus="status">
									<tr>
										<td>${status.index+1}</td>
										<td>${itemPedido.produto.descricao}</td>
										<td>${itemPedido.quantidade}</td>
										<td>${itemPedido.precoUnitario}</td>		
										<td>${itemPedido.precoTotal}</td>
									</tr>		
								</c:forEach>								
							</tbody>											
						</table>
					</div>				
				</div>
			</div>
			
			<div class="panel-footer">
				<div class="row">
					<div class="col-md-12">
						<a class="btn btn-warning" href="${s:mvcUrl('listarPedidoCompraUrl').build()}">voltar</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../base/scripts.jsp" %>
</body>
</html>