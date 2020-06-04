<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<html>
	<%@ include file="../base/header.jsp" %>
	<body>
		<%@ include file="../base/navbar.jsp" %>
	
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<h2>Dados do Fornecedor</h2>
				</div>
			</div>
			
			<f:form action="${s:mvcUrl('salvarFornecedorUrl').build()}" method="post" modelAttribute="fornecedor">
				<f:hidden path="id"/>
				
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<label for="razaoSocial">Razão Social</label>
							<f:input path="razaoSocial" cssClass="form-control" />
							<f:errors path="razaoSocial" />
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12" >
						<div class="form-group" >
							<label for="nomeFantasia">Nome Fantasia</label>
							<f:input path="nomeFantasia" cssClass="form-control" />
							<f:errors path="nomeFantasia"  />
						</div>		
					</div>
				</div>				
				
				<div class="row">
					<div class="col-md-12" >
						<div class="form-group" >
							<label for="cnpj">CNPJ</label>
							<f:input path="cnpj" cssClass="form-control" maxlength="14" />
							<f:errors path="cnpj"  />
						</div>		
					</div>
				</div>		

				<div class="row">
					<div class="col-md-12" >
						<div class="form-group" >
							<label for="email">Email</label>
							<f:input path="email" cssClass="form-control" />
							<f:errors path="email"  />
						</div>		
					</div>
				</div>

				<div class="row">
					<div class="col-md-12" >
						<div class="form-group" >
							<label for="telefone">Telefone</label>
							<f:input path="telefone" cssClass="form-control" />
							<f:errors path="telefone"  />
						</div>		
					</div>
				</div>		
				
				<!-- Endereco -->
				<div class="row">
					<div class="col-md-2">
						<div class="form-group">
							<label for="cep">CEP</label>
							<f:input path="endereco.cep" cssClass="form-control" />
							<f:errors path="endereco.cep" />
						</div>					
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<label for="logradouro">Logradouro</label>
							<f:input path="endereco.logradouro" cssClass="form-control" />
							<f:errors path="endereco.logradouro" />
						</div>					
					</div>
				</div>
				<div class="row">
					<div class="col">
					</div>
				</div>
				<div class="row">
					<div class="col-md-2">
						<div class="form-group">
							<label for="numero">Número</label>
							<f:input path="endereco.numero" cssClass="form-control" />
							<f:errors path="endereco.numero" />
						</div>					
					</div>
					<div class="col-md-5">
						<div class="form-group">
							<label for="complemento">Complemento</label>
							<f:input path="endereco.complemento" cssClass="form-control" />
							<f:errors path="endereco.complemento" />
						</div>					
					</div>
					<div class="col-md-5">
						<div class="form-group">
							<label for="bairro">Bairro</label>
							<f:input path="endereco.bairro" cssClass="form-control" />
							<f:errors path="endereco.bairro" />
						</div>					
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-8">
						<div class="form-group">
							<label for="municipio">Município</label>
							<f:input path="endereco.municipio" cssClass="form-control" />
							<f:errors path="endereco.municipio" />
						</div>					
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label for="uf">UF</label>
							<f:input path="endereco.uf" cssClass="form-control" />
							<f:errors path="endereco.uf" />
						</div>					
					</div>
				</div>
				
				<!-- Fim Endereco -->
				
				<div class="row">
					<div class="col-md-12">
						<input class="btn btn-success" type="submit" value="Salvar">
					</div>
				</div>
						
			</f:form>
		</div>
	</body>
	
	<%@ include file="../base/scripts.jsp" %>
	
	<script type="text/javascript">
		$(document).ready(function(){
			console.log('teste5');
			
			$("#endereco\\.cep").change(function(){
				var cepInformado = $("#endereco\\.cep").val();
				
				console.log("Cep capturado " + cepInformado);
				
				$.ajax({
					type: "GET",
					url: "http://viacep.com.br/ws/" + cepInformado +"/json/",
					dataType: "json",
					contentType: "application/json; charset=utf-8",
					success: function (retorno) {
						if (retorno != null) {
							
							if (retorno.erro) {
								alert("CEP não localizado");	
							} else {
								//Se foi tudo bem atribui os valores
								$("#endereco\\.logradouro").val(retorno.logradouro);
								$("#endereco\\.complemento").val(retorno.complemento);
								$("#endereco\\.bairro").val(retorno.bairro);
								$("#endereco\\.municipio").val(retorno.localidade);
								$("#endereco\\.uf").val(retorno.uf);
							}
						}
					},
					error: function() {
						alert("CEP fora do formato");		
					}
				});				
			});			
		});	
	</script>	
	
</html>