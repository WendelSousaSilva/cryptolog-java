<!DOCTYPE html>

<html>
	<%@ include file="base/header.jsp" %>
	<body>
		<%@ include file="base/navbar.jsp" %>
		
		<div class="container">
			<h1>Home do sistema de estoque</h1>
			
			<div class="row">
				<div class="col-md-12">
					<button id="btnTeste" class="btn btn-warning" >Teste API</button> 
				</div>			
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<select id="comboFornecedor" class="form-control"></select>
					</div>
				</div>			
			</div>
		</div>
		
	</body>
	
	<%@ include file="base/scripts.jsp" %>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnTeste").click(function() {
				
				$.ajax({
					type: "GET",
					url: "/estoque/api/fornecedores",
					dataType: "json",
					contentType: "application/json; charset=utf-8",
					success: function (retorno) {
						if (retorno != null) {
							var comboBox = $("#comboFornecedor");
							comboBox.find("option").remove();

							$.each(retorno, function (i, d) {
		                        $('<option>').val(d.id).text(d.nomeFantasia).appendTo(comboBox);
		                    });							
						}
					}
				});				
			});			
		});
	</script>	
	
</html>