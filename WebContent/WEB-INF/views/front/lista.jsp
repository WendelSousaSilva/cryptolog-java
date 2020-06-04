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
					<h4>Lista de Produtos</h4>
				</div>
			
			</div>
			
			<div class="row">
				<div class="table-responsive col-md-12">
					<table id="tabProdutos" class="table table-striped">
						<thead>
							<tr>
								<th>Id</th>
								<th>Fornecedor</th>
								<th>Descrição</th>
								<th>Quantidade</th>
								<th>Localização</th>
								<th>Ações</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listaDeProdutosFront}" var="front" >
								<tr>
									<td>${front.id}</td>
									<td>${front.fornecedor.razaoSocial} </td>
									<td>${front.descricao}</td>
									<td>${front.quantidade}</td>
									<td>${front.localizacao}</td>
									<td>
		<img alt="foto do produto" src="${pageContext.request.contextPath}/${front.caminhoFoto}">
	</td>
									
									<td>
								
											<a class="btn btn-success btn-xs" href="${s:mvcUrl('detalharFrontProdutoUrl').arg(0, front.id).build()}">detalhes</a>
											
		
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