<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <linK href="${pageContext.request.contextPath}/static/css/style-jonathan.css" rel="stylesheet" type="text/css">
    <linK href="${pageContext.request.contextPath}/static/css/slick.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/slick.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/script.js"></script>
    <%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
</head>
    
    <section class="header-bloco-1">
        <div class="conteudo-topo">
            <img src="${pageContext.request.contextPath}/static/img/logo_fundo.png" width="130px" height="130px">
            
            <nav>
                <ul>
                    <a href="${s:mvcUrl('homeUrl').build()}"><li>Home</li></a>
                    <a href="${s:mvcUrl('listarProdutoFrontUrl').build()}"><li>Produtos</li></a>
                    <a href="${s:mvcUrl('empresaUrl').build()}"><li>A Empresa</li></a>
                    <a href="${s:mvcUrl('contatoUrl').build()}"><li>Contato</li></a>
                </ul>
            </nav> 

        <a href="${s:mvcUrl('listarProdutoUrl').build()}"><button><img src="${pageContext.request.contextPath}/static/img/icone.png" title="Login" alt="Login" width="50px" height="50px"><p>login</p></button></a>
        </div>
    </section>
        

    <section class="header-bloco-2 hide">
        <div class="conteudo-topo-2">
                <img class="logo" src="${pageContext.request.contextPath}/static/img/logo_fundo.png" width="50px" height="50px">
                <nav>
                    <ul>
                        <a href="${s:mvcUrl('homeUrl').build()}"><li>Home</li></a>
                        <a href="${s:mvcUrl('listarProdutoFrontUrl').build()}"><li>Produtos</li></a>
                        <a href="${s:mvcUrl('empresaUrl').build()}"><li>A Empresa</li></a>
                        <a href="${s:mvcUrl('contatoUrl').build()}"><li>Contato</li></a>
                    </ul>
                </nav> 
            <a href="${s:mvcUrl('listarProdutoUrl').build()}" ><img src="${pageContext.request.contextPath}/static/img/icone-white.png" class="login" title="Login" alt="Login" width="30px" height="30px"></a>
        </div>
    </section>

