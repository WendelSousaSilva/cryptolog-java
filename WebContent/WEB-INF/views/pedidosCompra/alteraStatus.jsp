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
				<h3 class="panel-title">Pedido de Compra Nº: ${pedidoCompra.id}</h3>
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
				
				<div class="row">
					<div class="col-md-12">
						<f:form action="${s:mvcUrl('alterarStatusPedidoUrl').build()}" method="POST" modelAttribute="pedidoCompra" >
						
							<f:hidden path="id" valeu="${pedidoCompra.id}" />
						
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label for="status">Status</label>
										<f:select path="status" cssClass="form-control">
											<f:options items="${listaDeStatus}" />
										</f:select>
									</div>		
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label for="dataRecebimento">Data</label>
										<f:input path="dataRecebimento" cssClass="form-control" type="date" />
									</div>		
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<button class="btn btn-success" type="submit">Confirmar</button>
								</div>
							</div>
						
						</f:form>
					</div>
				</div>				
				
			</div>
			
			<div class="panel-footer">
				<div class="row">
					<div class="col-md-12">
						<a class="btn btn-warning pull-right" href="${s:mvcUrl('listarPedidoCompraUrl').build()}">voltar</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../base/scripts.jsp" %>
</body>
</html>