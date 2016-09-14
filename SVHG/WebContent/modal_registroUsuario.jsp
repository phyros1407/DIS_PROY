  <%if(session.getAttribute("nombreApellidoPersonaAdmi")==null ) {
                  request.getRequestDispatcher("home.jsp").forward(request, response);
                  }
                  %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
<!-- ----------------------modal registrar Proveedor-------------------------------------------- -->
		<div class="modal-dialog" role="document" style="width:1000px;">
			<div class="modal-content">
				<form class="form-horizontal" action="Gestionar_Usuario" method="post">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Registrar Usuario</h4>
					</div>
					<input type="hidden" name="idU" value="0">
					<br>
					<div class="form-group">
						<label class="control-label col-md-4">Cargo: <span
							class="required"> * </span>
						</label>
						<div class="col-md-3">
							<select name="selCar" id="selCar" class="form-control" onchange="proveedor()">
							<option value="1">Administrador</option>
							<option value="2">Almacenero</option>
							<option value="3">Vendedor</option>
							<option value="4">Proveedor</option>
							</select>
						</div>
					</div>
					<br>
					<div class="form-group"  >
						
						<label class="control-label col-md-4">DNI : <span
							class="required"> * </span>
						</label>
						<div class="col-md-3">
								<input maxlength="8" pattern=".{8,8}" required title="Ingrese 8 dÃ­gitos" id="txtDNI"
								onkeypress="return solonumeros(event)" name="txtDNI"
								data-required="1" class="form-control">
						</div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="col-md-3">
							<input type="button" id="btnReniec" value="Cargar datos de RENIEC" 
							name="btnReniec" class="btn btn-default" onclick="buscarReniec();" />
						</div>
					</div>
					<hr>
					<br>
					<div id=formulario style="visibility: hidden;">
					<div class="form-group">
						<label class="control-label col-md-3">Nombres : <span
							class="required"> * </span>
						</label>
						<div class="col-md-3">
							<input type="text" maxlength="45" id="txtNombres"
								onkeypress="return sololetras(event)" name="txtNombres"
								data-required="1" class="form-control" required readonly />
						</div>
						<label class="control-label col-md-2">Fecha nacimiento:<span
							class="required"> * </span>
						</label>
						<div class="col-md-3">
							<input type="date" name="dateFecNac" id="dateFecNac" 
							class="form-control" data-required="1" required readonly/>
						</div>
						
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Apellidos Pat: <span class="required"> * </span>
						</label>
						<div class="col-md-3">
							<input name="txtApePat" id="txtApePat" type="text"
								onkeypress="return sololetras(event)" data-required="1"
								class="form-control" required readonly />
						</div>
						<div id="fecLab" ></div>
					</div>
					<div class="form-group">
					<label class="control-label col-md-3">Apellidos Mat: <span class="required"> * </span>
						</label>
						<div class="col-md-3">
							<input name="txtApeMat" id="txtApeMat" type="text"
								onkeypress="return sololetras(event)" data-required="1"
								class="form-control" required readonly/>
						</div>
						<label class="control-label col-md-2">DirecciÃ³n: <span
							class="required"> * </span>
						</label>
						<div class="col-md-3">
							<input name="txtDireccion" id="txtDireccion" type="text"
								class="form-control" data-required="1" required readonly />
						</div>
					</div>
					<div class="form-group" id="proveedor" style="visibility: hidden;">
						<label class="control-label col-md-3">RUC: <span
							class="required"> * </span>
						</label>
						<div class="col-md-2">
							<input maxlength="9" pattern=".{11}" required title="Debe tener 11 dígitos" id="txtRUC"
								onkeypress="return solonumeros(event)" name="txtRUC"
								data-required="1" class="form-control">
						</div>
						<div class="col-md-1">
							<input name="btnRaz" id="btnRaz" type="button" value="Buscar" onclick="buscarRuc();" class="btn btn-default"/>
						</div>
						<label class="control-label col-md-2">RazÃ³n Social: <span
							class="required"> * </span>
						</label>
						<div class="col-md-3">
							<input name="txtRazSoc" id="txtRazSoc" type="text"
								class="form-control" readonly/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">ContraseÃ±a: <span
							class="required"> * </span>
						</label>
						<div class="col-md-3">
							<input name="txtContraseÃ±a1" id="txtContraseÃ±a1" type="password"
								class="form-control" data-required="1" required/>
						</div>
						<label class="control-label col-md-2">Re-ContraseÃ±a: <span
							class="required"> * </span>
						</label>
						<div class="col-md-3">
							<input name="txtContraseÃ±a2" id="txtContraseÃ±a2" type="password"
								class="form-control" data-required="1"  required />
						</div>
					</div>						
					
					<div class="form-group">
						<label class="control-label col-md-3">Correo <span
							class="required"> * </span>
						</label>
						<div class="col-md-3">
							<input type="email" name="txtCorreo" id="txtCorreo" onkeyup="validarCorreo(event)"
								class="form-control" data-required="1" required />
						</div>						
						<label class="control-label col-md-2">Teléfono : <span
							class="required"> * </span>
						</label>
						<div class="col-md-3">
							<input maxlength="9" pattern=".{7}|.{9}" required title="Ingrese 7 o 9 dÃ­gitos" id="txtTel"
								onkeypress="return solonumeros(event)" name="txtTel"
								data-required="1" class="form-control">
							<input type="hidden" name="action" value="2">
						</div>
					</div>
					</div>			
					<div id="registro" style="visibility: hidden;">
						<div class='alert alert-danger' style="margin-top: 15px;"
							role='alert'>
							<label id='mensajepequeno' name='ms'>el número de DNI es incorrecto o no estÃ¡ registrado en la RENIEC</label>
						</div>
					</div>
					<div id="ruc" style="visibility: hidden;">
						<div class='alert alert-danger' style="margin-top: 15px;"
							role='alert'>
							<label id='mensajepequeno' for="lblRucCor" name='ms'> El número de RUC es incorrecto o no está registrado</label>
						</div>
					</div>
					<div  id="botones" style="visibility: hidden;">
					<div class="modal-footer">
			
						
						<input type="submit" class="btn btn-primary" value="Registrar Usuario">
						<button type="button" class="btn btn-default"
							onclick="limpiarRegistro();" data-dismiss="modal">Salir</button>
					</div></div>

				</form>

			</div>
		</div>

	<!--------------------------------------------------------------fin registrar usuario modal-------------------------------------->
	<script type="text/javascript">
	function proveedor(){
		if(document.getElementById("selCar").value==4  && document.getElementById("formulario").style.visibility =="visible"){
			document.getElementById("proveedor").style.visibility = "visible";
			document.getElementById("txtRUC").required = true;
			document.getElementById("txtRazSoc").required = true;
		}else{
			document.getElementById("proveedor").style.visibility = "hidden";
			document.getElementById("txtRUC").required = false;
			document.getElementById("txtRazSoc").required = false;
		}
	}

	function buscarReniec(){
		  var dni = $('#txtDNI').val();
		 var accion='buscarDni';
		  $.get('http://env-0307453.jelasticlw.com.br/service/Gestionar_Persona', {
			  
					accion : accion,
					dni:dni
				}, function(response) {		
					console.log("entasd"+response);
					if (response!=null) {
						console.log("entrooo");
						document.getElementById("registro").style.visibility = "hidden";
							$('#txtNombres').val(response['object']['nombres']); ; 
							$('#txtApePat').val(response['object']['apePat']); 
							$('#txtApeMat').val(response['object']['apeMat']); 
							$('#dateFecNac').val(response['object']['fechaNac']);
							$('#txtDireccion').val(response['object']['direccion']);
							document.getElementById("formulario").style.visibility = "visible";
							document.getElementById("botones").style.visibility = "visible";
					}else{
						document.getElementById("registro").style.visibility = "visible";
						document.getElementById("formulario").style.visibility = "hidden";
						document.getElementById("botones").style.visibility = "hidden";
					}		
		  });
	}
		
		function buscarRuc(){
			  var ruc = $('#txtRUC').val();
			 // console.log("asdasd"+dni);
			 var accion='buscarRuc';
			  $.get('http://env-0307453.jelasticlw.com.br/service/Gestionar_Empresa', {
				  
						accion : accion,
						ruc:ruc
					}, function(response) {		
						console.log("entasd"+response);
						if (response!=null) {
							console.log("entrooo");	
							document.getElementById("ruc").style.visibility = "hidden";
								$('#txtRazSoc').val(response['object']['razonSocial']); ; 
								
						}else{
							document.getElementById("ruc").style.visibility = "visible";
							jQuery("label[for='lblRUC']").html("El número de RUC es incorrecto o no está registrado");
						}		
			  });
		}
		
		function validarCorreo(e){
			  var x;
			  emailRegex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
			 	if(emailRegex.test(txtCorreo)){
					x=1;
				}else{
					x=2;
				}
			 	if(x==1){
			 		document.getElementById("ruc").style.visibility = "hidden";
			 	}
			 	if(x==2){
			 		
			 			document.getElementById("ruc").style.visibility = "visible";
			 			jQuery("label[for='lblRucCor']").html("Correo no valido. Utilize el sgt. Formato:\ncorreo@domain");
				}
		}
		
	</script>
	</body>
