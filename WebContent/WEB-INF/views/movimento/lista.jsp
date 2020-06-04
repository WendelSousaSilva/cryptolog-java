<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<html>
	<%@ include file="../base/header.jsp" %>
	
	<body>
		<%@ include file="../base/navbar.jsp" %>
		
		<div class="container">

			<div>
				<p>${status}</p>
			</div>
		
			<div class="row">
				<div class="col-md-6 title">
					<h4>Movimento Estoque</h4>
				</div>

			</div>
			
			<div class="row">
				<div class="table-responsive col-md-12">
					<table id="tabProdutos" class="table table-striped">
						<thead>
							<tr>
								<th>Numero Pedido</th>
								<th>Nome Produto</th>
								<th>Quantidade Produto</th>
								<th>Data e Hora</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listaDeMovimento}" var="registro" >
								<tr>
									<td>${registro.pedido.id}</td>
									<td>${registro.produto.descricao}</td>
									<td>${registro.quantidade}</td>
									<td>${registro.dataHora}</td>
									
									<td>
										<a id="detalhePedido" class="btn btn-success btn-xs" href="${s:mvcUrl('detalharMovimentoUrl').arg(0, registro.id).build()}">detalhes</a>
										
									</td>
								</tr>			
							</c:forEach>		
						</tbody>	
					</table>
				</div>
			</div>			
		</div>
		<%@ include file="../base/modalExcluir.jsp" %>	
	</body>
	<%@ include file="../base/scripts.jsp" %>
</html>