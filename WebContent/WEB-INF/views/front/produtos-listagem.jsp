<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>

<%@ include file="header.jsp" %>

<section class="produto-bloco-1">
    <div class="conteudo">
        <div class="titulo">
            <h2>
                        Produtos
                <small>Sinonimo de Qualidade</small>
                        <span></span>
            </h2>
        </div>
    </div>
</section>

<section class="produto-bloco-2">
    <div class="conteudo">
        <div class="filtro-icon">Filtro</div>
        <div class="filtro">
            <div class="marcas">
                <div class="conteudo-filtro" >
                    <span class="filtro-nome">Intelbras</span>
                    <div id="btn-filtro" data-fornecedor="intelbras"></div>
                </div>
                <div class="conteudo-filtro" >
                    <span class="filtro-nome">Promtec</span>
                    <div id="btn-filtro" data-fornecedor="promtec"></div>
                    
                </div>
                <div class="conteudo-filtro" >
                        <span class="filtro-nome">Tecnibra</span>
                        <div id="btn-filtro" data-fornecedor="tecnibra"></div>
                        
                </div>
                <div class="conteudo-filtro" >
                        <span class="filtro-nome">IBC</span>
                        <div id="btn-filtro" data-fornecedor="ibc"></div>
                        
                </div>
                <div class="conteudo-filtro" >
                        <span class="filtro-nome">Almitec</span>
                        <div id="btn-filtro" data-fornecedor="almitec"></div>
                        
                </div>
                <div class="conteudo-filtro" >
                        <span class="filtro-nome">Adigitec</span>
                        <div id="btn-filtro" data-fornecedor="adigitec"></div>
                        
                </div>
                <div class="conteudo-filtro" >
                        <span class="filtro-nome">Sind Nox</span>
                        <div id="btn-filtro" data-fornecedor="sindnox"></div>
                        
                </div>
                <div class="conteudo-filtro" >
                        <span class="filtro-nome">ZKT eco</span>
                        <div id="btn-filtro" data-fornecedor="zkteco"></div>    
                </div>
            </div>
        </div>
    </div>
</section>

<section class="produto-bloco-3">
    <div class="conteudo">
        <ul class="lista-produtos">
        <c:forEach items="${listaDeProdutosFront}" var="front" >
            <li class="card" data-fornecedor="intelbras">
                <img class="foto-produto" src="${pageContext.request.contextPath}/${front.caminhoFoto}">
                <br/>
                <h2>${front.descricao}</h2>
                <div class="detalhes">
                    <div class="simbolo-mais">
                        <div></div>  
                        <div></div>
                    </div>
                </div>
                <p class="forn">${prod.fornecedor.razaoSocial}</p>
            </li>
        </c:forEach>
        </ul>
    </div>
</section>

<jsp:include page="footer.jsp"/>