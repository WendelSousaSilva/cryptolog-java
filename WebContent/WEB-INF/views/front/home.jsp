<jsp:include page="header.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<section class="home-bloco-1">

    <div class="carousel">
        <div>
            <a href="a-empresa.jsp">
                <img src="${pageContext.request.contextPath}/static/img/aempresa-banner.jpg" width="100%" height="100%">
            </a>
        </div>
        
        <div>
            <a href="produto-listagem.jsp">
                <img src="${pageContext.request.contextPath}/static/img/produtos.jpg" width="100%" height="100%">
            </a>
        </div>

        <div>
            <a href="contato">
            <img src="${pageContext.request.contextPath}/static/img/fale-conosco.jpg" width="100%" height="100%">
            </a>
        </div>
    </div>
    
</section>

<section class="home-bloco-2">
    <div class="titulo">
        <h2>
				     Cryptolog
		    <small>Soluções em Sistemas</small>
				    <span></span>
        </h2>
    </div> 
    <div class="texto-home">
        <p>
            A <strong>CRYPTOLOG</strong>, fundada em março de 2019, iniciando suas atividades primariamente como uma empresa de fins avaliativos da instituição de ensino superior FAPEN. 
            Nosso objetivo é desenvolver uma ferramenta tecnológica que supra uma necessidade latente do mercado atual referente a escalas de trabalho. 
            Assim sendo a <strong>CRYPTOLOG</strong>, se propôs a desenvolver um sistema de escalas, que integre todas as informações pertinentes de uma empresa, referentes ao seu quadro de funcionários. 
            Nosso sistema permite controlar informações de ponto do usuário, tais como: horários de entrada, saída, horas extras, gerenciamento de folgas, entre outros. Por fim, buscamos desenvolver uma sistema que reúna toda uma gama de informações, 
            e as organize de forma prática, com um feedback intuitivo, visando sempre a qualidade na segurança de dados e informações.
        
        </p>
    </div>
    <div class="elastic">
        <div class="bloco-sobre">
            <div class="box-sobre-1">
            <img src="${pageContext.request.contextPath}/static/img/visao.png" width="90px" height="90px">
            <p class="titulo-sobre">Visão</p>
            <p class="descricao-sobre">Ser nacionalmente a empresa mais conhecida em inovação e 
                otimização de processos com soluções flexíveis e diferenciadas para cada cliente.
            </p>
            </div>

            <div class="box-sobre-2">
                    <img src="${pageContext.request.contextPath}/static/img/missao.png" width="90px" height="90px">
                    <p class="titulo-sobre">Missão</p>
                    <p class="descricao-sobre">Oferecer software de solução com as melhores tecnologias de informação, 
                        proporcionando a todos os clientes experiencias únicas.
                    </p>
            </div>

            <div class="box-sobre-3">
                    <img src="${pageContext.request.contextPath}/static/img/valores.png" width="90px" height="90px">
                    <p class="titulo-sobre">Valores</p>
                    <p class="descricao-sobre">Qualidade, Eficiência, Comprometimento, 
                    Dedicação e Valorização Humana.</p>     
            </div>
        </div>
     <div class="elastic">

    <a href=""><button class="botao-sobre"><span>Conheça mais sobre a Cryptolog</span></button></a>
    
</section>

<section class="home-bloco-3">
    <div class="faixa-home">
        <span class="left"></span>
        <span class="right"></span>

        <a href="">
	        <div class="roda-home">
	            <img src="${pageContext.request.contextPath}/static/img/produto.png" width="130px" height="130px">
	            <p>Conheça nossos produtos</p>
	        </div> 
        </a> 
    </div>
</section>

<section class="home-bloco-4">
    <div class="parceiros">
        <div class="titulo">
            <h2>
				        NOSSOS PARCEIROS
		        <small>Juntos, somos referência no mercado!</small>
				        <span></span>
            </h2>
        </div> 

        <div class="parceiros-conteudo">
            <div class="parceiros-card">
                <img src="${pageContext.request.contextPath}/static/img/ibc-logo.png">
            </div>

            <div class="parceiros-card">
                    <img src="${pageContext.request.contextPath}/static/img/tecnibra-logo.png">
            </div>

            <div class="parceiros-card">
                    <img src="${pageContext.request.contextPath}/static/img/intelbras-logo.png">
            </div>

            <div class="parceiros-card">
                    <img src="${pageContext.request.contextPath}/static/img/promtec-logo.png">
            </div>

            <div class="parceiros-card">
                    <img src="${pageContext.request.contextPath}/static/img/almitec-logo.png">
            </div>

            <div class="parceiros-card">
                    <img src="${pageContext.request.contextPath}/static/img/adgitec-logo.png">
            </div>

            <div class="parceiros-card">
                    <img src="${pageContext.request.contextPath}/static/img/sind-nox-logo.png">
            </div>

            <div class="parceiros-card">
                    <img src="${pageContext.request.contextPath}/static/img/zk-teco-logo.png">
            </div>     
        </div>
    </div>
</section>

<section class="home-bloco-5">

        <div class="faixa-contato">
                <span class="left"></span>
                <span class="right"></span>
        
                <div class="conteudo-faixa-contato">
                    <h2>tem interesse em contratar a <strong>cryptolog</strong>?</h2>
                    <a href="" title="Entre em contato">
                    <a href="">
	                    <div class="button">
	                        <span>Entre em contato<span>></span></span>
	                    </div> 
                    </a>     
               </div>
                    </a>
            </div>
</section>



<jsp:include page="footer.jsp"/>

   
