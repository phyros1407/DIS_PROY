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
    <link rel="shortcut icon" href="imagesOut/ico/logo_gym.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    <script src="bower_components/es6-promise/promise.min.js"></script>

<script src="bower_components/sweetalert2/dist/sweetalert2.min.js"></script>
<link rel="stylesheet" href="bower_components/sweetalert2/dist/sweetalert2.min.css">
</head>
	<script type="text/javascript">
	var x=false;
	var a=false;
		function buscarReniec(){
			
		 var y=document.getElementById("txtDni");
		 
		 if(x){
			 document.getElementById("txtNombres").value="";
			 document.getElementById("txtApePat").value="";
			 document.getElementById("txtApeMat").value="";
			 
			 x=false;
			 y.readOnly=false; 
			 y.value="";
		 }else{
			var dni = $('#txtDni').val();
			x=true;
			y.readOnly =true;
			 // console.log("asdasd"+dni);
			 var accion='buscarDni';
			  $.get('http://servicios.jelasticlw.com.br/service/Gestionar_Persona', {
				
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
							x=false;
							 y.readOnly=false; 
							 y.value="";
							alert("El número de DNI es incorrecto o no está registrado en la RENIEC")
							
						}		
			  });
		 }
		 
	}
		
		function buscarRuc(){
			var y=document.getElementById("txtRuc");
			
			if(a){
				 document.getElementById("txtRazon").value="";
				 document.getElementById("txtRuc").value="";
			
				 a=false;
				 y.readOnly=false; 
				 y.value="";
				 
			}else{
				 var ruc = $('#txtRuc').val();
				 a=true;
					y.readOnly =true;
				 // console.log("asdasd"+dni);
				 var accion='buscarRuc';
				  $.get('http://servicios.jelasticlw.com.br/service/Gestionar_Empresa', {
					
							accion : accion,
							ruc:ruc
						}, function(response) {		
							console.log("entasd"+response);
							if (response!=null) {
								console.log("entrooo");	
									$('#txtRazon').val(response['object']['razonSocial']); ; 
									
							}else{
								a=false;
								 y.readOnly=false; 
								 y.value="";
								alert("El número de RUC es incorrecto o no está registrado en la SUNAT")

							}			
				  });
				
			}
			
			 
		}
			
		var xx="persona";
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
			  var optradio=xx;
			
			 
			  var usuario=(txt_nombre.charAt(0)+txt_apepat+txt_apemat.charAt(0)).toUpperCase();
			  
			 
			  var longNum=txtCelular.length;
			  var  num=txtCelular.charAt(0);
			  var y=0;
			  if((num!='9' && longNum=='9') || ((num=='1' || num=='8' || num=='9'  ) && longNum=='7' ) || longNum<7) {
				  y=1;
			  }
			  var x;
			  emailRegex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
			 	if(emailRegex.test(txtCorreo)){
					x=1;
				}else{
					x=2;
				}
			 	
			if(txt_dni==''){
				alert("Debe llenar los campos obligatorios.");
			  }else if(txtRuc==''){
				  alert("Debe llenar los campos obligatorios.");
			  }else if(txtCorreo==''){
				  alert("Debe llenar los campos obligatorios.");
			  }else if(x==2){
				  alert("Correo no válido. Utilize el sgt. Formato:\ncorreo@domain");
			  }else if(txtClave==''){
				  alert("Debe llenar los campos obligatorios.");
			  }else if(txtClave2==''){
				  alert("Debe llenar los campos obligatorios.");
			  }else if(txtCelular==''){
				  alert("Ingrese numero de celular o fijo.");
			  }else if(y=='1'){
				  if(longNum=='9'){
					    alert("Número de celular incorrecto. Debe iniciar con 9");
				  }
				  if(longNum=='7'){
					  alert("Número fijo incorrecto")
				  }
					  alert("Ingrese número de celular o fijo.");
				  
				  
			  }else if(optradio==''){
				  alert("Debe llenar los campos obligatorios.");
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
							
									alert("Cliente Registrado. Su usuario es: "+response['object']['fechaNacimiento'])
									document.location.href="home.jsp";
								}else{

									alert("Error al registrar.Intente de nuevo.");
									
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
								alert("El correo está en uso. Vuelva a intentar con otro correo.")
								
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
						<form  class="form-horizontal" action="<%=getServletContext().getContextPath() %>/ServletCliente"  role="form">
						<!-- Fila 1 -->
							<div class="row">
								<div class="col-sm-4">
									<!-- Tipo de cliene -->
									<div class="radio">
							     		<label><input type="radio" onclick="desaparecerCampoRuc()" id="optradio" name="optradio" value="persona">Persona</label>
							    	</div>
							   		<div class="radio">
							     		<label><input type="radio" onclick="aparecerCampoRuc()"id="optradio" name="optradio" value="empresa">Empresa</label>
							    	</div>
							    	
							    <script type="text/javascript">
							    function aparecerCampoRuc(){
							    	xx="empresa";
							    	document.getElementById("divRuc").innerHTML  = "<label>RUC</label><input  type=number class=form-control name=campoRuc id=txtRuc>";		    	
							    	document.getElementById("divBoton").innerHTML  = "<input type=button class=btn btn-warning onclick='buscarRuc();' value=Buscar>";		    	
							    	document.getElementById("divRazon").innerHTML  = "<label>Razon Social</label><input readonly type=text class=form-control name=campoRazon id=txtRazon>";
							    }
							    function desaparecerCampoRuc(){
							    	xx="persona";
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
						        	  <div id="divClave"><input required  id="txtCorreo" onchange="buscarCorreo()" name="txtCorreo" class="form-control"></div>	
						        	<br>
								</div>		
								<div class="col-sm-4">
									<label >Clave:</label>
						      	<input onchange="validarClave2()" maxlength="15"  required type="password" id="txtClave" name="txtClave" id=txtClave1 class="form-control" required> 
								</div>
							</div>
							
						<!-- Fila 7-->
						<br>
							<div class="row">
								<div class="col-sm-4">
						       		<label >Teléfono:</label>
						        	<input max="999999999" onchange="longitudCampoTelefono()" required type="number" id="txtCelular" name="txtCelular"  class="form-control"> 
								</div>	
								<div class="col-sm-4">
									<label >Repetir Clave:</label>
						        	<input maxlength="15" required type="password" onchange="validarClave()" name="txtClave2" id="txtClave2" class="form-control" required> 
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
					function longitudCampoTelefono(){
						var x=document.getElementById("txtCelular").value;
						var y=x.length;
				
					
						
				
						if(y!=7 && y!=9){
							document.getElementById("txtCelular").value = "";
							alert("Número de telefono incorrecto intente de nuevo");
						
						}
					}	
					function validarClave(){
						var p1 = document.getElementById("txtClave").value;
						var p2 = document.getElementById("txtClave2").value;
						
						if(p1.length!=0){
						if (p1 != p2) {
							document.getElementById("txtClave").value   ="";
							  document.getElementById("txtClave2").value   ="";
							  document.getElementById("divError").innerHTML  ="<div class=alert alert-danger><strong>ERROR!</strong> Las claves no coinciden.</div>";
							  
							  document.getElementById("botonSubmit").disabled = true;
							  return false;
						}else{
						
							 document.getElementById("divError").innerHTML  ="";
							 document.getElementById("botonSubmit").disabled = false;
						}
						}
					}
					
				function validarClave2(){
						
						var p1 = document.getElementById("txtClave").value;
						var p2 = document.getElementById("txtClave2").value;
						if(p2.length!=0){
						if (p1 != p2) {
							document.getElementById("txtClave").innerHTML  ="";
							  document.getElementById("txtClave2").innerHTML  ="";
							  document.getElementById("divError").innerHTML  ="<div class=alert alert-danger><strong>ERROR!</strong> Las claves no coinciden.</div>";
							  
							  document.getElementById("botonSubmit").disabled = true;
							  return false;
						}else{
						
							 document.getElementById("divError").innerHTML  ="";
							 document.getElementById("botonSubmit").disabled = false;
						}
						}}
					
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