<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<html>
	<%@ include file="../base/header.jsp" %>
	
	<body>
		<%@ include file="../base/navbar.jsp"%>
		
		<div class="container">

			<div>
				<p>${status}</p>
			</div>
		
			<div class="row">
				<div class="col-md-9">
					<h4>Pedidos de Compra</h4>
				</div>
				<div class="col-md-3 h4">
					<a class="btn btn-primary" href="${s:mvcUrl('novoPedidoComprarUrl').build()}" >Novo Pedido</a>
				</div>
			</div>
			
			<div class="row">
				<div class="table-responsive col-md-12">
					<table id="tabProdutos" class="table table-striped">
						<thead>
							<tr>
								<th>Id</th>
								<th>Fornecedor</th>
								<th>Data Lançamento</th>
								<th>Condição de Pagamento</th>
								<th>Status</th>
								<th>Ações</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listaDePedidos}" var="registro" >
								<tr>
									<td>${registro.id}</td>
									<td>${registro.fornecedor.razaoSocial} </td>
									<td>${registro.data}</td>
									<td>${registro.condicaoPagamento}</td>
									<td>${registro.getStatusFmt()}</td>
									<td>
										<f:form action="${s:mvcUrl('excluirPedidoCompraUrl').arg(0, registro.id).build()}" method="post">
											<a class="btn btn-success btn-xs" href="${s:mvcUrl('detalharPedidoCompraUrl').arg(0, registro.id).build()}">detalhes</a>
											
											<c:if test="${registro.status == 'EM_ABERTO'}">
												<a class="btn btn-warning btn-xs" href="${s:mvcUrl('alterarPedidoCompraUrl').arg(0, registro.id).build()}">editar</a>
												<button class="btn btn-danger btn-xs" type="submit">Excluir</button>
												<a class="btn btn-primary btn-xs" href="${s:mvcUrl('detalharPedidoStatusUrl').arg(0, registro.id).build()}">receber</a>
											</c:if>
										</f:form>
									</td>
								</tr>			
							</c:forEach>		
						</tbody>	
					</table>
				</div>
			</div>
		
		</div>
	</body>
	
	<%@ include file="../base/scripts.jsp" %>
	
</html>