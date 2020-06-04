<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
		    	<span class="sr-only">Toggle navigation</span>
		    	<span class="icon-bar"></span>
		    	<span class="icon-bar"></span>
		    	<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${s:mvcUrl('homeUrl').build()}">Gestão de Estoque</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="${s:mvcUrl('listarProdutoUrl').build()}">Produtos</a></li>
				<li><a href="${s:mvcUrl('listarFornecedorUrl').build()}">Fornecedores</a></li>
				<li><a href="${s:mvcUrl('listarPedidoCompraUrl').build()}">Pedido de Compra</a></li>
			</ul>
           	<ul class="nav navbar-nav navbar-right">
           	
           		<sec:authorize access="!isAuthenticated()">
					<li><a href="${s:mvcUrl('loginUrl').build()} ">Entrar</a></li>
           		</sec:authorize>
           		
           		<sec:authorize access="isAuthenticated()">
           			<sec:authentication property="principal" var="user"/>
           			
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${user.name} <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="${s:mvcUrl('perfilUsuarioUrl').build()}">Detalhes</a></li>
							
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<li role="separator" class="divider"></li>
								<li><a href="${s:mvcUrl('listarPerfilAcessoUrl').build()}">Perfis de Acesso</a></li>
								<li><a href="${s:mvcUrl('listarUsuarioUrl').build()}">Usuários</a></li>
							</sec:authorize>
							
							<li role="separator" class="divider"></li>
							<li><a href="${pageContext.request.contextPath}/logout">Sair</a></li>
						</ul>
					</li>
					
				</sec:authorize>
				
            </ul>			
		</div>
	</div>
</nav>	
