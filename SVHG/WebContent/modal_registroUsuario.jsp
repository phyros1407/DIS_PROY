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
							<input type="number" maxlength="8" id="txtDNI"
								onkeypress="return solonumeros(event)" name="txtDNI"
								data-required="1" class="form-control" required />
						</div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="col-md-3">
							<input type="button" id="btnReniec" value="Cargar datos de RENIEC" 
							name="btnReniec" class="btn btn-default" onclick="buscarReniec();" />
						</div>
					</div>
					<hr>
					<br>
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
						<label class="control-label col-md-2">Dirección: <span
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
							<input name="txtRUC" id="txtRUC" type="text" onkeypress="return solonumeros(event)"
								class="form-control"/>
						</div>
						<div class="col-md-1">
							<input name="btnRaz" id="btnRaz" type="button" value="Buscar" onclick="buscarRuc();" class="btn btn-default"/>
						</div>
						<label class="control-label col-md-2">Razón Social: <span
							class="required"> * </span>
						</label>
						<div class="col-md-3">
							<input name="txtRazSoc" id="txtRazSoc" type="text"
								class="form-control" readonly/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Contraseña: <span
							class="required"> * </span>
						</label>
						<div class="col-md-3">
							<input name="txtContraseña1" id="txtContraseña1" type="password"
								class="form-control" data-required="1" />
						</div>
						<label class="control-label col-md-2">Re-Contraseña: <span
							class="required"> * </span>
						</label>
						<div class="col-md-3">
							<input name="txtContraseña2" id="txtContraseña2" type="password"
								class="form-control" data-required="1"  />
						</div>
					</div>						
					
					<div class="form-group">
						<label class="control-label col-md-3">Correo <span
							class="required"> * </span>
						</label>
						<div class="col-md-3">
							<input type="email" name="txtCorreo" id="txtCorreo"
								class="form-control" data-required="1" required />
						</div>						
						<label class="control-label col-md-2">Teléfono : <span
							class="required"> * </span>
						</label>
						<div class="col-md-3">
							<input type="number" maxlength="9" id="txtTel"
								onkeypress="return solonumeros(event)" name="txtTel"
								data-required="1" class="form-control" required />
							<input type="hidden" name="action" value="2">
						</div>
					</div>
					<div id="registro" style="visibility: hidden;">
						<div class='alert alert-danger' style="margin-top: 15px;"
							role='alert'>
							<label id='mensajepequeno' name='ms'>el número de DNI es incorrecto o no está registrado en la RENIEC</label>
						</div>
					</div>
					<div id="ruc" style="visibility: hidden;">
						<div class='alert alert-danger' style="margin-top: 15px;"
							role='alert'>
							<label id='mensajepequeno' name='ms'> El número de RUC es incorrecto o no está registrado</label>
						</div>
					</div>
					<div class="modal-footer">
						
						<input type="submit" class="btn btn-primary" value="Registrar Usuario">
						<button type="button" class="btn btn-default"
							onclick="limpiarRegistro();" data-dismiss="modal">Salir</button>
					</div>

				</form>

			</div>
		</div>

	<!--------------------------------------------------------------fin registrar usuario modal-------------------------------------->
	<script type="text/javascript">
	function proveedor(){
		if(document.getElementById("selCar").value==4){
			document.getElementById("proveedor").style.visibility = "visible";
		}else{
			document.getElementById("proveedor").style.visibility = "hidden";
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
					}else{
						document.getElementById("registro").style.visibility = "visible";
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
						}		
			  });
		}
	</script>
	</body>