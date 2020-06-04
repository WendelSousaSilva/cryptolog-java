<jsp:include page="header.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<section class="contato-bloco-1">
    <div class="conteudo">
        <div class="titulo">
            <h2>
                            Contato
                <small>Entre em contato conosco</small>
                        <span></span>
            </h2>
        </div>
    </div>
</section>


<section class="contato-bloco-2">

    <div class="conteudo">
        <div class="grid">
            <div class='esquerda'>
                <div class="card">
                    <img src="${pageContext.request.contextPath}/static/img/whatsapp.svg">
                    <p class="titulo">Whatsapp</p>
                    <p class="desc">9 000000000</p>
                </div>
                <div class="card">
                    <img src="${pageContext.request.contextPath}/static/img/instagram.svg">
                    <p class="titulo">Instagram</p>
                    <p class="desc">@CryptologOfficial</p>
                </div>
                <div class="card">
                    <img src="${pageContext.request.contextPath}/static/img/enviar.svg">
                    <p class="titulo">Email</p>
                    <p class="desc">Cryptologdrive@gmail.com</p>
                </div>
                <div class="card">
                    <img src="${pageContext.request.contextPath}/static/img/facebook.svg">
                    <p class="titulo">Facebook</p>
                    <p class="desc">/CryptologOfficial</p>
                </div>
            </div>
            
            <div class="direita">
                <p>
                    Não seja timido entre agora em contato 
                    conosco por um dos canais ao lado. Responderemos 
                    assim que possivel.

                </p>
            </div>
        </div>
    </div>
</section>

<section class="contato-bloco-3">
    <div class="map">

            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3654.4039810018157!2d-46.531478885020356!3d-23.661506884633223!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce42890ae627ef%3A0x934856e70030c41a!2sFAPEN%20-%20Faculdade%20Pent%C3%A1gono!5e0!3m2!1spt-BR!2sbr!4v1574923503524!5m2!1spt-BR!2sbr" width="100%" height="350" frameborder="0" style="border:0;" allowfullscreen=""></iframe>

    </div>
</section>

<jsp:include page="footer.jsp"/>