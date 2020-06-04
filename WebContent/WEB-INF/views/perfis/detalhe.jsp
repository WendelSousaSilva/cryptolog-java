<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<html>
	<%@ include file="../base/header.jsp" %>

<body>
	<%@ include file="../base/navbar.jsp" %>
	<div class="container detalhes">
		<div class="title">
			<h4>Dados do Perfil de Acesso</h4>
		</div>
		<div>
			<ul>
				<li><span>Nome:</span> ${perfilAcesso.authority}</li>
				<li><span>Descrição:</span> ${perfilAcesso.descricao}</li>
			</ul>
		</div>
		<div>
			<a class="btn btn-warning" href="${s:mvcUrl('listarPerfilAcessoUrl').build()}">voltar</a>
		</div>
	</div>
	<%@ include file="../base/scripts.jsp" %>
</body>
</html>