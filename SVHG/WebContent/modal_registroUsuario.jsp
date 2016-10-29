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
								<input maxlength="8" pattern=".{8,8}" required title="Ingrese 8 dígitos" id="txtDNI"
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
							<input maxlength="9" pattern=".{11}" required title="Debe tener 11 dígitos" id="txtRUC"
								onkeypress="return solonumeros(event)" name="txtRUC"
								data-required="1" class="form-control">
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
								class="form-control" data-required="1" required/>
						</div>
						<label class="control-label col-md-2">Re-Contraseña: <span
							class="required"> * </span>
						</label>
						<div class="col-md-3">
							<input name="txtContraseña2" id="txtContraseña2" type="password"
								class="form-control" data-required="1"  required />
						</div>
					</div>						
					
					<div class="form-group">
						<label class="control-label col-md-3">Correo <span
							class="required"> * </span>
						</label>
						<div class="col-md-3">
							<input type="email" name="txtCorreo" id="txtCorreo" onchange="validarCorreo()"
								class="form-control" data-required="1" required />
						</div>						
						<label class="control-label col-md-2">Teléfono : <span
							class="required"> * </span>
						</label>
						<div class="col-md-3">
							<input maxlength="9" pattern=".{7}|.{9}" required title="Ingrese 7 o 9 dígitos" id="txtTel"
								onkeypress="return solonumeros(event)" name="txtTel" onChange="validarTelefono()"
								data-required="1" class="form-control">
							<input type="hidden" name="action" value="2">
						</div>
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
							<label id='mensajepequeno' for="lblRucCor" name='ms'> El número de RUC es incorrecto o no está registrado</label>
						</div>
					</div>
					<div  id="botones" style="visibility: hidden;">
					<div class="modal-footer">
			
						
						<input type="submit" class="btn btn-primary" value="Registrar Usuario" id="btnRegistro">
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
		  $.get('http://env-9625104.jelasticlw.com.br/service/Gestionar_Persona', {
			  
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
							$('#txtDNI').prop('readonly', true);
							document.getElementById("formulario").style.visibility = "visible";
							document.getElementById("botones").style.visibility = "visible";
							$( "#btnRegistro" ).prop( 'disabled', false );
					}else{
						document.getElementById("registro").style.visibility = "visible";
						$( "#btnRegistro" ).prop( 'disabled', true );
						document.getElementById("formulario").style.visibility = "hidden";
						document.getElementById("botones").style.visibility = "hidden";
					}		
		  });
	}
		
		function buscarRuc(){
			  var ruc = $('#txtRUC').val();
			 // console.log("asdasd"+dni);
			 var accion='buscarRuc';
			  $.get('http://env-9625104.jelasticlw.com.br/service/Gestionar_Empresa', {
				  
						accion : accion,
						ruc:ruc
					}, function(response) {		
						console.log("entasd"+response);
						if (response!=null) {
							console.log("entrooo");	
							document.getElementById("ruc").style.visibility = "hidden";
								$('#txtRazSoc').val(response['object']['razonSocial']); ; 
								$( "#btnRegistro" ).prop( 'disabled', false );
						}else{
							$( "#btnRegistro" ).prop( 'disabled', true );
							document.getElementById("ruc").style.visibility = "visible";
							jQuery("label[for='lblRUC']").html("El número de RUC es incorrecto o no está registrado");
						}		
			  });
		}
		
		function validarCorreo(){
			var x;
			  emailRegex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
			 	if(emailRegex.test($('#txtCorreo').val())){
					x=1;
				}else{
					x=2;
				}
			 	if(x==1){
			 		document.getElementById("ruc").style.visibility = "hidden";
			 		$( "#btnRegistro" ).prop( 'disabled', false );
			 	}
			 	if(x==2){
			 		$( "#btnRegistro" ).prop( 'disabled', true );
			 			document.getElementById("ruc").style.visibility = "visible";
			 			jQuery("label[for='lblRucCor']").html("Correo no valido. Utilize el sgt. Formato:\ncorreo@domain");
				}
		}
		
		function validarTelefono(){
			var txtCelular = $('#txtTel').val();
			 var longNum=txtCelular.length;
			  var  num=txtCelular.charAt(0);
			  var y=0;
			  if((num!='9' && longNum=='9') || ((num=='1' || num=='8' || num=='9'  ) && longNum=='7' ) || longNum<7) {
				  y=1;
			  }else{
				  y=2;
			  }
			  if(y==2){
			 		document.getElementById("ruc").style.visibility = "hidden";
			 		$( "#btnRegistro" ).prop( 'disabled', false );
			 	}
			  if(y==1){
			 		$( "#btnRegistro" ).prop( 'disabled', true );
			 			document.getElementById("ruc").style.visibility = "visible";
			 			jQuery("label[for='lblRucCor']").html("Teléfono no válido");
				}
		}
			  
		
		
		
		
		
	</script>
	</body>
