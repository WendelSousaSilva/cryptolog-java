<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<html>
	<%@ include file="../base/header.jsp" %>

<body>
	<%@ include file="../base/navbar.jsp" %>
	<div class="container detalhes">
		<div class="title">
			<h4>Dados do Fornecedor</h4>
		</div>
		<div>
			<ul>
				<li><span>Id:</span> ${fornecedor.id}</li>
				<li><span>Razão Social:</span> ${fornecedor.razaoSocial}</li>
				<li><span>Nome Fantasia:</span> ${fornecedor.nomeFantasia}</li>
				<li><span>CNPJ:</span> ${fornecedor.cnpj}</li>
				<li><span>Email:</span> ${fornecedor.email}</li>
				<li><span>Telefone:</span> ${fornecedor.telefone}</li>
			</ul>
		</div>
		<div>
			<a class="btn btn-warning" href="${s:mvcUrl('listarFornecedorUrl').build()}">voltar</a>
		</div>
	</div>
	<%@ include file="../base/scripts.jsp" %>
</body>
</html>