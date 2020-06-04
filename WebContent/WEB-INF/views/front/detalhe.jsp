<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<html>
<head>
<meta charset="UTF-8">
<title>Produtos - Novo</title>
</head>
<body>
	<div>
		<h4>Dados do Produto</h4>
	</div>
	<div>
		<ul>
			<li>Id: ${front.id}</li>
			<li>Descrição: ${front.descricao}</li>
			<li>Quantidade: ${front.quantidade}</li>
			<li>Localização: ${front.localizacao}</li>
			<li>Categoria: ${front.categoria}</li>
		</ul>
	</div>
	<div>
		<img alt="foto do produto" src="${pageContext.request.contextPath}/${front.caminhoFoto}">
	</div>
	
	<div>
		<a href="${s:mvcUrl('listarProdutoFrontUrl').build()}">voltar</a>
	</div>
</body>
</html>