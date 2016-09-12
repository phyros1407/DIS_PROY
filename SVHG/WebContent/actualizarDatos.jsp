<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    
</head>
<!-- RegistrarCliente -->
	<script type="text/javascript">

		function registrarCliente(){
			  var txt_dni = $('#txtDni').val();
			  var txt_nombre = $('#txtNombres').val();
			  var txt_apepat = $('#txtApePat').val();
			  var txt_apemat = $('#txtApeMat').val();
			  var txtClave = $('#txtClave').val();
			  var txtCorreo = $('#txtCorreo').val();
			  var txtCelular = $('#txtCelular').val();
			  
			 var accion='registrarCliente';
			  $.post('<%=request.getContextPath() %>/ServletCliente', {
				  	txt_dni : txt_dni,
				  	txt_nombre : txt_nombre,
				  	txt_apemat : txt_apemat,
				  	txt_apepat : txt_apepat,
				  	txtClave : txtClave,
				  	txtCorreo : txtCorreo,
				  	txtCelular : txtCelular,
				  	
				  	
				  
						accion : accion
					}, function(response) {
						
						if (response.success==true) {
							location.reload();
						
								alert("cliente Registrado")
								document.location.href="index.jsp";
							}else{

								alert("	 existe");
								
							}	
			  });
		  }

	</script>
<body>
<%@include file="../includeOut/header.jsp" %>

<section>
		<div class="container">
			<div class="row">
				<%@include file="../includeOut/sidebar.jsp" %>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Actualizar Datos</h2>
						<form class="form-horizontal" action="<%=getServletContext().getContextPath() %>/ServletCliente" onSubmit="return validarClave()" role="form">
						<!-- Fila 1 -->
							<div class="row">
								<div class="col-sm-4">
						
								</div>
								<div class="col-sm-3">
									 <div class="form-group">
								     	<label class="sr-only" >Ingresa tu DNI:</label>
								     <input type="text" id="txtDni" name="txtDni" class="form-control" placeholder="Ingresa DNI">
								    </div>
								</div>
								<div class="col-sm-5">
								<input type="button" class="btn btn-warning" onclick="buscarReniec();"  value="Buscar">
								</div>
							</div>
							<hr><hr>
						<!-- Fila 2 -->
						<br>
							<div class="row">
								<div class="col-sm-4">
							       		<label >Nombre:</label>
							        	<input type="text" id="txtNombres" name="txtNombres" class="form-control" readonly> 
								</div>	
							</div>
						<!-- Fila 3 -->
						<br>
							<div class="row">
								<div class="col-sm-4">
							       		<label >Apellido Paterno:</label>
							        	<input type="text" name="txtApePat"  id="txtApePat" class="form-control" readonly> 
								</div>	
							</div>
							
						
						<!-- Fila 4 -->
						<br>
							<div class="row">
								<div class="col-sm-4">
							       		<label >Apellido Materno:</label>
							        	<input type="text" name="txtApeMat"  id="txtApeMat" class="form-control" readonly> 
								</div>	
							</div>
							
						
						<hr>
						<!-- Fila 5 -->
						<br>
							<div class="row">
								<div class="col-sm-4">
									<div id="divBoton"></div>	
								</div>	
								<div class="col-sm-4">
							       		<div id="divRuc"></div>
								</div>
							</div>	
							<div class="row">
								<div class="col-sm-4"></div>
								<div class="col-sm-4">
									<div id="divRazon"></div>
								</div>
							</div>
						<!-- Fila 6 -->
						<hr>
						<br>
							<div class="row">
								<div class="col-sm-4">
						       		<label >Correo:</label>
						        	<input type="email" id="txtCorreo" name="txtCorreo" class="form-control"> 
								</div>	
								<div class="col-sm-4">
									<label >Clave:</label>
						        	<input type="password" id="txtClave" name="txtClave" id=txtClave1 class="form-control" required> 
								</div>
							</div>
							
						<!-- Fila 7-->
						<br>
							<div class="row">
								<div class="col-sm-4">
						       		<label >Celular:</label>
						        	<input type="number" id="txtCelular" name="txtCelular"  class="form-control"> 
								</div>	
								<div class="col-sm-4">
									<label >Repetir Clave:</label>
						        	<input type="password"  id="txtClave2" class="form-control" required> 
								</div>
							</div>
							<br><br>
						<!-- Fila 8 -->
							<div class="row">
							<input type="hidden" name="accion" id="accion" value="registrarCliente">
							<center><button type="button" class="btn btn-warning" onclick="registrarCliente()">Registrar</button></center>
								<center><div id="divError"></div></center>
							</div>
							
						</form>
					</div><!--features_items-->
				
					<script>
					function validarClave(){
					var p1 = document.getElementById("txtClave").value;
					var p2 = document.getElementById("txtClave2").value;
					
					if (p1 != p2) {
						  document.getElementById("divError").innerHTML  ="<div class=alert alert-danger><strong>ERROR!</strong> Las claves no coinciden.</div>";
						  return false;
						}
					}
					</script>
					
					
				</div>
			</div>
		</div>
	</section>

<%@include file="../include/footer.jsp" %>
</body>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</html>