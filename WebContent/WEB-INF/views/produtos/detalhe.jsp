<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<html>
	<%@ include file="../base/header.jsp" %>

<body>
	<%@ include file="../base/navbar.jsp" %>
	<div class="container detalhes">
		<div class="title">
			<h4>Dados do Produto</h4>
		</div>
		<div>
			<ul>
			<li><span>Id:</span> ${produto.id}</li>
			<li><span>Descrição:</span> ${produto.descricao}</li>
			<li><span>Quantidade:</span> ${produto.quantidade}</li>
			<li><span>Localização:</span> ${produto.localizacao}</li>
			<li><span>Categoria:</span> ${produto.categoria}</li>
		</ul>
		
		</div>
        <div class="foto-produto">
        	<h3>Foto do Produto:</h3>
		    <img alt="foto do produto" src="${pageContext.request.contextPath}/${produto.caminhoFoto}">
	    </div>
		<div>
			<a class="btn btn-warning" href="${s:mvcUrl('listarFornecedorUrl').build()}">voltar</a>
		</div>
	</div>
	<%@ include file="../base/scripts.jsp" %>
</body>
</html>