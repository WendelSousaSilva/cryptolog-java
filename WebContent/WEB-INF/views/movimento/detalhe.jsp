<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<html>
	<%@ include file="../base/header.jsp" %>

<body>
	<%@ include file="../base/navbar.jsp" %>
	<div class="container detalhes">
		<div class="title">
			<h4>Dados do Estoque</h4>
		</div>
		<div>
			<ul>
				<li><span>Id:</span> ${movimento.pedido.id}</li>
				<li><span>Nome Produto:</span> ${movimento.produto.descricao}</li>
				<li><span>Nome Produto:</span> ${movimento.quantidade}</li>
				<li><span>Data e Hora:</span> ${movimento.dataHora}</li>
				<li><span>Login Usuario:</span> ${usuario.name}</li>
				
			</ul>
		</div>
		<div>
			<a class="btn btn-warning" href="${s:mvcUrl('listarMovimentoUrl').build()}">voltar</a>
		</div>
		<%@ include file="../base/modalExcluir.jsp" %>	
	</div>
	<%@ include file="../base/scripts.jsp" %>
</body>
</html>