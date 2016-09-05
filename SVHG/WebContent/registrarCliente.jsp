<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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
    <script src="bower_components/es6-promise/promise.min.js"></script>

<script src="bower_components/sweetalert2/dist/sweetalert2.min.js"></script>
<link rel="stylesheet" href="bower_components/sweetalert2/dist/sweetalert2.min.css">
</head>
	<script type="text/javascript">
		function buscarReniec(){
		  var dni = $('#txtDni').val();
		 // console.log("asdasd"+dni);
		 var accion='buscarDni';
		  $.get('http://env-0307453.jelasticlw.com.br/service/Gestionar_Persona', {
					accion : accion,
					dni:dni
				}, function(response) {		
					console.log("entasd"+response);
					if (response!=null) {
						console.log("entrooo");	
							$('#txtNombres').val(response['object']['nombres']); ; 
							$('#txtApePat').val(response['object']['apePat']); 
							$('#txtApeMat').val(response['object']['apeMat']); 
					}else{
						alert("El número de DNI es incorrecto o no está registrado en la RENIEC")

					}		
		  });
	}
		
		function buscarRuc(){
			  var ruc = $('#txtRuc').val();
			 // console.log("asdasd"+dni);
			 var accion='buscarRuc';
			  $.get('http://env-0307453.jelasticlw.com.br/service/Gestionar_Empresa', {
				  
						accion : accion,
						ruc:ruc
					}, function(response) {		
						console.log("entasd"+response);
						if (response!=null) {
							console.log("entrooo");	
								$('#txtRazon').val(response['object']['razonSocial']); ; 
								
						}else{
							alert("El número de RUC es incorrecto o no está registrado en la SUNAT")

						}			
			  });
		}
			
		
		function registrarCliente(){
			  var txt_dni = $('#txtDni').val();
			  var txt_nombre = $('#txtNombres').val();
			  var txt_apepat = $('#txtApePat').val();
			  var txt_apemat = $('#txtApeMat').val();
			  var txtClave = $('#txtClave').val();
			  var txtClave2 = $('#txtClave2').val();
			  var txtCorreo = $('#txtCorreo').val();
			  var txtCelular = $('#txtCelular').val();
			  var txtRuc=$('#txtRuc').val();
			  var txtRazon=$('#txtRazon').val();
			  var optradio=$('#optradio').val();
			if(txt_dni==''){
				alert("Falta ingresar DNI");
			  }else if(txtCorreo==''){
				  alert("Falta ingresar Correo");
			  }else if(txtClave==''){
				  alert("Falta ingresar Clave");
			  }else if(txtClave2==''){
				  alert("Falta ingresar Clave 2");
			  }else if(txtCelular==''){
				  alert("Falta ingresar Celular");
			  }else if(optradio==''){
				  alert("Falta seleccionar tipo de persona");
			  }else{
				  var accion='registrarCliente';
				  $.post('<%=request.getContextPath() %>/ServletCliente', {
					  	txt_dni : txt_dni,
					  	txt_nombre : txt_nombre,
					  	txt_apemat : txt_apemat,
					  	txt_apepat : txt_apepat,
					  	txtClave : txtClave,
					  	txtCorreo : txtCorreo,
					  	txtCelular : txtCelular,
					  	txtRuc : txtRuc,
					  	txtRazon : txtRazon,
					  	optradio : optradio,
					  
							accion : accion
						}, function(response) {
							
							if (response.success==true) {
								location.reload();
							
									alert("cliente Registrado, el usuario generado es la primera letra de su nombre, seguido de su apellido paterno y la primera letra de su apellido materno")
									document.location.href="home.jsp";
								}else{

									alert("	 existe");
									
								}	
				  });
			  }
			
		  }
		
		function buscarCorreo(){
			 var txtCorreo = $('#txtCorreo').val();
			 var accion='buscarCorreo';
			  $.post('<%=request.getContextPath() %>/ServletCliente', {
				  	txtCorreo : txtCorreo,
						accion : accion
					}, function(response) {
						
						if (response.success==true) {
								document.getElementById("divClave").innerHTML="<input type=email class=form-control onchange=buscarCorreo() autofocus name=txtCorreo id=txtCorreo>";
								alert("El correo esta en uso. Vuelva a intentar con otro correo.")
								
							}else{
				
//								alert("Correo valido");
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
						<h2 class="title text-center">Registrar Cliente</h2>
						<form class="form-horizontal" action="<%=getServletContext().getContextPath() %>/ServletCliente"  role="form">
						<!-- Fila 1 -->
							<div class="row">
								<div class="col-sm-4">
									<!-- Tipo de cliene -->
									<div class="radio">
							     		<label><input   type="radio" onclick="desaparecerCampoRuc()" id="optradio" name="optradio" value="persona">Persona</label>
							    	</div>
							   		<div class="radio">
							     		<label><input type="radio" onclick="aparecerCampoRuc()"id="optradio" name="optradio" value="empresa">Empresa</label>
							    	</div>
							    	
							    <script type="text/javascript">
							    function aparecerCampoRuc(){
							    	document.getElementById("divRuc").innerHTML  = "<label>RUC</label><input  type=number class=form-control name=campoRuc id=txtRuc>";		    	
							    	document.getElementById("divBoton").innerHTML  = "<input type=button class=btn btn-warning onclick='buscarRuc();' value=Buscar>";		    	
							    	document.getElementById("divRazon").innerHTML  = "<label>Razon Social</label><input readonly type=text class=form-control name=campoRazon id=txtRazon>";
							    }
							    function desaparecerCampoRuc(){
							    	document.getElementById("divRuc").innerHTML  = "";
							    	document.getElementById("divBoton").innerHTML  = "";
							    	document.getElementById("divRazon").innerHTML  = "";
							    }
							  
							    </script>
								</div>
								<div class="col-sm-3">
									 <div class="form-group">
								     	<label class="sr-only" >Ingresa tu DNI:</label>
								     <input required  type="number" min="10000000"  max="99999999" id="txtDni" name="txtDni" class="form-control" placeholder="Ingresa DNI">
								    </div>
								</div>
								<div class="col-sm-5">
								<input required type="button" class="btn btn-warning" onclick="buscarReniec();"  value="Buscar">
								</div>
							</div>
							<hr><hr>
						<!-- Fila 2 -->
						<br>
							<div class="row">
								<div class="col-sm-4">
							       		<label >Nombre:</label>
							        	<input required type="text" id="txtNombres" name="txtNombres" class="form-control" readonly> 
								</div>	
							</div>
						<!-- Fila 3 -->
						<br>
							<div class="row">
								<div class="col-sm-4">
							       		<label >Apellido Paterno:</label>
							        	<input required type="text" name="txtApePat"  id="txtApePat" class="form-control" readonly> 
								</div>	
							</div>
							
						
						<!-- Fila 4 -->
						<br>
							<div class="row">
								<div class="col-sm-4">
							       		<label >Apellido Materno:</label>
							        	<input required type="text" name="txtApeMat"  id="txtApeMat" class="form-control" readonly> 
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
						        	  <div id="divClave"><input required type="email" id="txtCorreo" onchange="buscarCorreo()" name="txtCorreo" class="form-control"></div>	
						        	<br>
						        	 <center><div id="divCorreoError"></div></center>
								</div>		
								<div class="col-sm-4">
									<label >Clave:</label>
						      	<input  required type="password" id="txtClave" name="txtClave" id=txtClave1 class="form-control" required> 
								</div>
							</div>
							
						<!-- Fila 7-->
						<br>
							<div class="row">
								<div class="col-sm-4">
						       		<label >Celular:</label>
						        	<input required type="number" id="txtCelular" name="txtCelular"  class="form-control"> 
								</div>	
								<div class="col-sm-4">
									<label >Repetir Clave:</label>
						        	<input required type="password" onchange="validarClave()" name="txtClave2" id="txtClave2" class="form-control" required> 
								</div>
							</div>
							<br><br>
						<!-- Fila 8 -->
							<div class="row">
							<input type="hidden" name="accion" id="accion" value="registrarCliente">
							<center><button type="button" id="botonSubmit" class="btn btn-warning" onclick="registrarCliente()">Registrar</button></center>
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
						  document.getElementById("botonSubmit").disabled = true;
						  return false;
					}else{
						 document.getElementById("divError").innerHTML  ="";
						  document.getElementById("botonSubmit").disabled = false;
					}
					}
					</script>
					
					
				</div>
			</div>
		</div>
	</section>

<%@include file="../includeOut/footer.jsp" %>
</body>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
    <script src="dist/sweetalert.min.js"></script> <link rel="stylesheet" type="text/css" href="dist/sweetalert.css">
</html>