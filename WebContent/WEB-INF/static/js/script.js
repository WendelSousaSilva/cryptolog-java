$(document).ready(function(){
 
//Slick carrousel da HOME  

$('.carousel').slick({
    dots: true,
    autoplay: true,
    infinite: true,
    speed: 1000,
    fade: true,
    cssEase: 'linear'
  });

//FIM Slick Carrousel da HOME


// Troca de menus ao descer e subir tela

$(document).on("scroll",function(){
  if($(document).scrollTop() >250){

    $('.header-bloco-1').addClass('hide');

} else{
   $('.header-bloco-1').removeClass('hide');
}

if($(document).scrollTop() <250){

  $('.header-bloco-2').addClass('hide');

} else{
 $('.header-bloco-2').removeClass('hide');
}


});

//FIM Troca de menus ao descer e subir tela


//Aparecer botão back to top

$(document).on("scroll",function(){
  if($(document).scrollTop() > 550){

    $('.back-top').fadeIn();
} else{
   $('.back-top').fadeOut();
}

});

//FIM Aparecer botão back to top

//Subir para o topo com o botão

$('.back-top').click(function(){

  $("html, body").animate({ scrollTop: 0 }, "slow");


});

//FIM Subir para o topo com o botão

//Pintar o botão do filtro

$('.produto-bloco-2 .conteudo .filtro .marcas .conteudo-filtro #btn-filtro').click(function(){

  $('.produto-bloco-2 .conteudo .filtro .marcas .conteudo-filtro #btn-filtro').removeClass('active-fornecedor');
  $(this).addClass('active-fornecedor');


});

//FIM Pintar o botão do filtro

//Filtro config

  $('.marcas #btn-filtro').click(function(event){

    var elemento = event.target;
    var fornecedor = $(elemento).data("fornecedor");

    console.log(elemento);

    $('.lista-produtos li').fadeOut();

    $('.lista-produtos li').each(function(index){

      if ($(this).data("fornecedor") === fornecedor){
          $(this).fadeIn();

      }

    });
  });

//FIM Filtro config

$('#view-4').click(function(){

  $('ul.produtos-lista').addClass('lista-de-produtos-2');

});

$('#view-3').click(function(){

 
  $('ul.produtos-lista').removeClass('lista-de-produtos-2');

});

$('.view ul').click(function(){

  $('.view ul').removeClass('view-ativo');
  $(this).addClass('view-ativo');

});


$('.produto-bloco-2 .conteudo .filtro-icon').on('click',function(){

    $('.produto-bloco-2 .conteudo .filtro').slideToggle();

});


});

