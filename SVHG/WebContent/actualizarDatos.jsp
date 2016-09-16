<%@page import="beans.PersonaBean"%>
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
	 <%
	 PersonaBean persona=(PersonaBean) request.getAttribute("persona");
		
	%>
</head>
S
<body>
<%@include file="../includeOut/header.jsp" %>
<script type="text/javascript">

		function actualizarCliente(){	  
		
			  var txtClave = $('#txtClave').val();
			  var txtClave2 = $('#txtClave2').val();
			  var txtCorreo = $('#txtCorreo').val();
			  var txtCelular = $('#txtCelular').val();
			  

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
			 	
			if(txtCorreo==''){
				  alert("Debe llenar los campos obligatorios.");
			  }else if(x==2){
				  alert("Correo no valido. Utilize el sgt. Formato:\ncorreo@domain");
			  }else if(txtClave==''){
				  alert("Debe llenar los campos obligatorios.");
			  }else if(txtClave2==''){
				  alert("Debe llenar los campos obligatorios.");
			  }else if(txtCelular==''){
				  alert("Debe llenar los campos obligatorios.");
			  }else if(y=='1'){
				  if(longNum=='9'){
					    alert("Numero de celular incorrecto. Debe iniciar con 9");
				  }
				  if(longNum=='7'){
					  alert("Numero fijo incorrecto. Formato: 5555555")
				  }
					  alert("Ingrese numero de celular o fijo.");
				  
				  
			  }else { 
				
				  var accion='actualizarCliente';
				  $.post('<%=request.getContextPath() %>/ServletCliente', {
					  
					  	txtClave : txtClave,
					  	txtCorreo : txtCorreo,
					  	txtCelular : txtCelular,
					
							accion : accion
						}, function(response) {
							
							if (response.success==true) {
								location.reload();
							
									alert("Actualizacion de datos correcta")
									document.location.href="home.jsp";
								}else{

									alert("Error al actualizar datos");
									
								}	
				  });
			  }
			
		  }
		
		function buscarCorreo(){
			 var txtCorreo = $('#txtCorreo').val();
			 var accion='buscarCorreo';
			  $.post('<%=request.getContextPath()%>/ServletCliente', {
				  	txtCorreo : txtCorreo,
						accion : accion
					}, function(response) {
						
						if (response.success==true) {
								document.getElementById("divCorreo").innerHTML="<input type=email class=form-control onchange=buscarCorreo() autofocus name=txtCorreo id=txtCorreo>";
								alert("El correo esta en uso. Vuelva a intentar con otro correo.")
								if(document.getElementById("xCorreo").value!=txtCorreo){
									alert("xxx");
								}
								
							}else{
				
//								alert("Correo valido");
							}	
			  });
		  }
		

	</script>
<section>
		<div class="container">
			<div class="row">
				<%@include file="../includeOut/sidebar.jsp" %>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Actualizar Datos</h2>
						<form class="form-horizontal" action="<%=getServletContext().getContextPath() %>/ServletCliente"  role="form">
						<!-- Fila 1 -->
							
							<hr><hr>
						<!-- Fila 2 -->
						<br>
							<div class="row">
								<div class="col-sm-4">
							       		<label >Nombre:</label>
							        	<input value="<%=persona.getNombre()%>" type="text" id="txtNombres" name="txtNombres" class="form-control" readonly> 
								</div>	
							</div>
						<!-- Fila 3 -->
						<h1></h1>
						<br>
							<div class="row">
								<div class="col-sm-4">
							       		<label >Apellido Paterno:</label>
							        	<input value="<%=persona.getApellidoPaterno()%>" type="text" name="txtApePat"  id="txtApePat" class="form-control" readonly> 
								</div>	
							</div>
							
						
						<!-- Fila 4 -->
						<br>
							<div class="row">
								<div class="col-sm-4">
							       		<label >Apellido Materno:</label>
							        	<input value="<%=persona.getApellidoMaterno()%>" type="text" name="txtApeMat"  id="txtApeMat" class="form-control" readonly> 
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
						        	 <div  id="divCorreo"><input value="<%=persona.getCorreo()%>"  required  id="txtCorreo" onchange="buscarCorreo()" name="txtCorreo" class="form-control"></div>
						        	 <input value="<%=persona.getCorreo()%>" hidden  id="xCorreo" > 
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
						        	<input  value="<%=persona.getTelefono()%>"  type="number" id="txtCelular" name="txtCelular"  class="form-control"> 
								</div>	
								<div class="col-sm-4">
									<label >Repetir Clave:</label>
						        	<input type="password"  onchange="validarClave()" id="txtClave2" class="form-control" required> 
								</div>
							</div>
							<br><br>
						<!-- Fila 8 -->
							<div class="row">
							
							<center><button type="button" class="btn btn-warning" onclick="actualizarCliente()">Registrar</button></center>
								<center><div id="divError"></div></center>
							</div>
							
						</form>
					</div><!--features_items-->
<!---------------------- Script validacion de clave---------------- -->
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
<!----------------------Final Script validacion de clave---------------- -->				
					
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