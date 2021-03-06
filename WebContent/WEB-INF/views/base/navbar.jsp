<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<nav class="navbar navbar-inverse navbar-fixed-top">
<img class="logo" src="${pageContext.request.contextPath}/static/img/logo_fundo.png">
	<h3 class="logo-titulo">Cryptolog <span>Solu��es em Sistemas</span></h3>
<ul class="nav navbar-nav navbar-right">
           	
           		<sec:authorize access="!isAuthenticated()">
					<li><a href="${s:mvcUrl('loginUrl').build()} ">Entrar</a></li>
           		</sec:authorize>
           		
           		<sec:authorize access="isAuthenticated()">
           			<sec:authentication property="principal" var="user"/>
           			
					<li class="dropdown usuario-button">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${user.name} <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="${s:mvcUrl('perfilUsuarioUrl').build()}">Detalhes</a></li>
							
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<li role="separator" class="divider"></li>
								<li><a href="${s:mvcUrl('listarPerfilAcessoUrl').build()}">Perfis de Acesso</a></li>
								<li><a href="${s:mvcUrl('listarUsuarioUrl').build()}">Usu�rios</a></li>
							</sec:authorize>
							
							<li role="separator" class="divider"></li>
							<li><a href="${pageContext.request.contextPath}/logout">Sair</a></li>
						</ul>
					</li>
					
				</sec:authorize>
				
            </ul>			
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
		    	<span class="sr-only">Toggle navigation</span>
		    	<span class="icon-bar"></span>
		    	<span class="icon-bar"></span>
		    	<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${s:mvcUrl('homeUrl').build()}">Gest�o de Estoque</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="${s:mvcUrl('listarProdutoUrl').build()}">
				<svg xmlns="http://www.w3.org/2000/svg" id="Layer_1" data-name="Layer 1" viewBox="0 0 512 512" width="512" height="512"><title>Commercial delivery </title><path d="M472.916,224H448.007a24.534,24.534,0,0,0-23.417-18H398V140.976a6.86,6.86,0,0,0-3.346-6.062L207.077,26.572a6.927,6.927,0,0,0-6.962,0L12.48,134.914A6.981,6.981,0,0,0,9,140.976V357.661a7,7,0,0,0,3.5,6.062L200.154,472.065a7,7,0,0,0,3.5.938,7.361,7.361,0,0,0,3.6-.938L306,415.108v41.174A29.642,29.642,0,0,0,335.891,486H472.916A29.807,29.807,0,0,0,503,456.282v-202.1A30.2,30.2,0,0,0,472.916,224Zm-48.077-4A10.161,10.161,0,0,1,435,230.161v.678A10.161,10.161,0,0,1,424.839,241H384.161A10.161,10.161,0,0,1,374,230.839v-.678A10.161,10.161,0,0,1,384.161,220ZM203.654,40.717l77.974,45.018L107.986,185.987,30.013,140.969ZM197,453.878,23,353.619V153.085L197,253.344Zm6.654-212.658-81.668-47.151L295.628,93.818,377.3,140.969ZM306,254.182V398.943l-95,54.935V253.344L384,153.085V206h.217A24.533,24.533,0,0,0,360.8,224H335.891A30.037,30.037,0,0,0,306,254.182Zm183,202.1A15.793,15.793,0,0,1,472.916,472H335.891A15.628,15.628,0,0,1,320,456.282v-202.1A16.022,16.022,0,0,1,335.891,238h25.182a23.944,23.944,0,0,0,23.144,17H424.59a23.942,23.942,0,0,0,23.143-17h25.183A16.186,16.186,0,0,1,489,254.182Z"/><path d="M343.949,325h7.327a7,7,0,1,0,0-14H351V292h19.307a6.739,6.739,0,0,0,6.655,4.727A7.019,7.019,0,0,0,384,289.743v-4.71A7.093,7.093,0,0,0,376.924,278H343.949A6.985,6.985,0,0,0,337,285.033v32.975A6.95,6.95,0,0,0,343.949,325Z"/><path d="M344,389h33a7,7,0,0,0,7-7V349a7,7,0,0,0-7-7H344a7,7,0,0,0-7,7v33A7,7,0,0,0,344,389Zm7-33h19v19H351Z"/><path d="M351.277,439H351V420h18.929a7.037,7.037,0,0,0,14.071.014v-6.745A7.3,7.3,0,0,0,376.924,406H343.949A7.191,7.191,0,0,0,337,413.269v32.975A6.752,6.752,0,0,0,343.949,453h7.328a7,7,0,1,0,0-14Z"/><path d="M393.041,286.592l-20.5,20.5-6.236-6.237a7,7,0,1,0-9.9,9.9l11.187,11.186a7,7,0,0,0,9.9,0l25.452-25.452a7,7,0,0,0-9.9-9.9Z"/><path d="M393.041,415.841l-20.5,20.5-6.236-6.237a7,7,0,1,0-9.9,9.9l11.187,11.186a7,7,0,0,0,9.9,0l25.452-25.452a7,7,0,0,0-9.9-9.9Z"/><path d="M464.857,295H420.891a7,7,0,0,0,0,14h43.966a7,7,0,0,0,0-14Z"/><path d="M464.857,359H420.891a7,7,0,0,0,0,14h43.966a7,7,0,0,0,0-14Z"/><path d="M464.857,423H420.891a7,7,0,0,0,0,14h43.966a7,7,0,0,0,0-14Z"/></svg>
				<span class="titulo-menu">Produtos</span></a></li>
				<li><a href="${s:mvcUrl('listarFornecedorUrl').build()}">
				<svg id="Layer_5" enable-background="new 0 0 64 64" height="512" viewBox="0 0 64 64" width="512" xmlns="http://www.w3.org/2000/svg"><path d="m45 43h2v2h-2z"/><path d="m41 43h2v2h-2z"/><path d="m37 43h2v2h-2z"/><path d="m37 39h10v2h-10z"/><path d="m63 14c0-7.168-5.832-13-13-13s-13 5.832-13 13c0 2.578.764 4.977 2.063 7h-20.063v26c-.732 0-1.409.212-2 .556v-19.556-3c0-1.654-1.346-3-3-3h-10c-1.654 0-3 1.346-3 3s1.346 3 3 3h11v23c0 1.352.677 2.543 1.706 3.268-1.037.917-1.706 2.242-1.706 3.732 0 2.757 2.243 5 5 5s5-2.243 5-5c0-1.13-.391-2.162-1.026-3h21.051c-.634.838-1.025 1.87-1.025 3 0 2.757 2.243 5 5 5s5-2.243 5-5-2.243-5-5-5h-30c-1.103 0-2-.897-2-2s.897-2 2-2h32.228c2.072 0 3.954-1.304 4.683-3.244l2.026-5.404-1.873-.703-2.026 5.404c-.437 1.165-1.566 1.947-2.81 1.947h-.228v-20.051c6.701-.514 12-6.119 12-12.949zm-59 12c-.552 0-1-.448-1-1s.448-1 1-1h10c.552 0 1 .448 1 1v1zm19 32c0 1.654-1.346 3-3 3s-3-1.346-3-3 1.346-3 3-3 3 1.346 3 3zm29 0c0 1.654-1.346 3-3 3s-3-1.346-3-3 1.346-3 3-3 3 1.346 3 3zm-5.499-37.944c-2.159-1.251-3.501-3.572-3.501-6.056v-.697l1.535-2.303h2.465v6h6v-6h2.465l1.535 2.303v.697c0 2.484-1.342 4.805-3.501 6.056l-.499.289v4.229c-.955.271-1.959.426-3 .426s-2.045-.155-3-.426v-4.229zm3.499-17.056c6.065 0 11 4.935 11 11 0 4.264-2.444 7.961-6 9.786v-2.311c2.481-1.663 4-4.476 4-7.475v-1.303l-2.465-3.697h-5.535v6h-2v-6h-5.535l-2.465 3.697v1.303c0 2.999 1.519 5.812 4 7.475v2.311c-3.556-1.825-6-5.521-6-9.786 0-6.065 4.935-11 11-11zm-19 20h8v4h-8zm-10 24v-24h8v6h12v-5.641c2.112 2.032 4.904 3.353 8 3.59v20.051z"/></svg>
				<span class="titulo-menu">Fornecedores</span></a></li>
				<li><a href="${s:mvcUrl('listarPedidoCompraUrl').build()}">
				
				<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
									 viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
								<g>
									<g>
										<g>
											<path d="M480,74.667h-72.533c-17.634-30.633-56.762-41.172-87.395-23.538c-9.785,5.633-17.905,13.753-23.538,23.538H256v-64
												C256,4.776,251.224,0,245.333,0h-192c-5.891,0-10.667,4.776-10.667,10.667v64H32c-17.673,0-32,14.327-32,32V384
												c0,17.673,14.327,32,32,32h160v26.56c-21.532,7.353-37.431,25.739-41.6,48.107H128V512h256v-21.333h-22.4
												c-4.169-22.368-20.068-40.753-41.6-48.107V416h160c17.673,0,32-14.327,32-32V106.667C512,88.994,497.673,74.667,480,74.667z
												 M352,64c23.564,0,42.667,19.103,42.667,42.667c0,35.413-19.093,64-42.667,64c-23.573,0-42.667-28.907-42.667-64
												C309.333,83.103,328.436,64,352,64z M394.667,256v53.333h-85.333V256H288v53.333h-21.333v-64c0-17.673,14.327-32,32-32
												c16.359,0.216,31.4-8.942,38.72-23.573c9.547,3.005,19.786,3.005,29.333,0c7.303,14.596,22.293,23.748,38.613,23.573
												c17.673,0,32,14.327,32,32v64H416V256H394.667z M64,21.333h170.667v149.333h-32c-5.891,0-10.667,4.776-10.667,10.667v19.627
												l-32.853-27.84c-1.932-1.652-4.391-2.56-6.933-2.56H64V21.333z M21.333,106.667C21.333,100.776,26.109,96,32,96h10.667v85.333
												c0,5.891,4.776,10.667,10.667,10.667h95.04l47.467,40.107c4.526,3.77,11.252,3.158,15.023-1.369
												c1.577-1.893,2.45-4.274,2.471-6.738v-32h32c5.891,0,10.667-4.776,10.667-10.667V96h32.96c-0.621,3.522-0.942,7.09-0.96,10.667
												c-1.177,27.685,9.952,54.473,30.4,73.173c-3.61,7.585-11.335,12.345-19.733,12.16c-29.455,0-53.333,23.878-53.333,53.333v64h-224
												V106.667z M339.627,490.667H172.373c3.733-12.8,15.253-32,51.627-32h32v-21.333h-32c-3.733,0-7.253,0-10.667,0V416h85.333v21.333
												c-3.413,0-6.933,0-10.667,0v21.333C324.373,458.667,335.893,477.867,339.627,490.667z M490.667,384
												c0,5.891-4.776,10.667-10.667,10.667H32c-5.891,0-10.667-4.776-10.667-10.667v-53.333h469.333V384z M490.667,309.333h-32v-64
												c0-29.455-23.878-53.333-53.333-53.333c-8.473,0.128-16.218-4.77-19.733-12.48c20.361-18.627,31.482-45.279,30.4-72.853
												c-0.018-3.576-0.339-7.145-0.96-10.667H480c5.891,0,10.667,4.776,10.667,10.667V309.333z"/>
											<rect x="42.667" y="352" width="21.333" height="21.333"/>
											<rect x="74.667" y="352" width="21.333" height="21.333"/>
											<rect x="106.667" y="352" width="21.333" height="21.333"/>
											<rect x="96" y="64" width="106.667" height="21.333"/>
											<rect x="96" y="106.667" width="106.667" height="21.333"/>
										</g>
									</g>
								</g>
								</svg>
				<span class="titulo-menu">Pedido de Compra</span></a></li>
				<li><a href="${s:mvcUrl('listarMovimentoUrl').build()}">
				<svg id="Layer_5" enable-background="new 0 0 64 64" height="512" viewBox="0 0 64 64" width="512" xmlns="http://www.w3.org/2000/svg"><path d="m33 63h30v-24h-30zm12-22h6v2h-6zm-10 0h8v4h10v-4h8v20h-26z"/><path d="m57 57h2v2h-2z"/><path d="m53 57h2v2h-2z"/><path d="m49 57h2v2h-2z"/><path d="m61 21h-2v-20h-26v20h-2v-20h-26v20h-2c-1.103 0-2 .897-2 2v2c0 1.103.897 2 2 2h5.263c-.166.641-.263 1.308-.263 2 0 2.78 1.427 5.231 3.585 6.665-6.123 1.89-10.585 7.6-10.585 14.335 0 2.045 1.237 3.802 3 4.576v8.424h27v-13c0-6.735-4.462-12.445-10.585-14.335 2.158-1.434 3.585-3.885 3.585-6.665 0-.692-.097-1.359-.263-2h37.263c1.103 0 2-.897 2-2v-2c0-1.103-.897-2-2-2zm-18-18h6v2h-6zm-8 0h6v4h10v-4h6v18h-6v-4h-10v4h-6zm14 18h-6v-2h6zm-34-18h6v2h-6zm-8 0h6v4h10v-4h6v18h-6v-4h-10v4h-6zm8 18v-2h6v2zm-12 4v-2h7.726c-.65.572-1.206 1.247-1.644 2zm3 30h4v6h-4zm9.5-7h-3.5v-5h7v5h5v13h-12v-6h3.5c1.93 0 3.5-1.57 3.5-3.5s-1.57-3.5-3.5-3.5zm5.5-3.586 1.586 1.586h-1.586zm8 5.586v11h-3v-14.414l-5.586-5.586h-10.414v7h-3v2h8.5c.827 0 1.5.673 1.5 1.5s-.673 1.5-1.5 1.5h-9.5c-1.654 0-3-1.346-3-3 0-7.168 5.832-13 13-13s13 5.832 13 13zm-13-15c-3.309 0-6-2.691-6-6s2.691-6 6-6 6 2.691 6 6-2.691 6-6 6zm45-10h-38.082c-.437-.753-.994-1.428-1.644-2h39.726z"/><path d="m49 53h10v2h-10z"/></svg>
				<span class="titulo-menu">Movimento Estoque</span></a></li>
			</ul>
           		
		</div>
	</div>
</nav>	
