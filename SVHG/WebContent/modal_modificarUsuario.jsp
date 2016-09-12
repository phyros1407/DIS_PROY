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

<style>
.margTop{
padding-top: 9px;
}
</style>

</head>


<body>
<!-- ----------------------modal registrar Proveedor-------------------------------------------- -->
		<div class="modal-dialog" role="document" style="width:800px;">
			<div class="modal-content">
				<form class="form-horizontal" action="Gestionar_Usuario" method="post">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Modificar Usuario</h4>
					</div>
					<input type="hidden" name="idU" value="0">					
					<br>										
					<div class="form-group">
						<label class="control-label col-md-3">Contraseña antigua: <span
							class="required"> * </span>
						</label>
						<div class="col-md-6">
							<input type="password" name="txtConA" id="txtConA"
								class="form-control" data-required="1" required disabled />
						</div>							
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Nueva contraseña: <span
							class="required"> * </span>
						</label>
						<div class="col-md-6">
							<input type="password" name="txtConN" id="txtConN"
								class="form-control" data-required="1" required />
						</div>							
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Repetir contraseña: <span
							class="required"> * </span>
						</label>
						<div class="col-md-6">
							<input type="password" name="txtConR" id="txtConR"
								class="form-control" data-required="1" required />
						</div>							
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Correo: <span
							class="required"> * </span>
						</label>
						<div class="col-md-6">
							<input type="email" name="txtCorreo1" id="txtCorreo1"
								class="form-control" data-required="1" required />
						</div>							
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Teléfono: <span
							class="required"> * </span>
						</label>
						<div class="col-md-6">
							<input maxlength="9" pattern=".{7}|.{9}" required title="Ingrese 7 o 9 dígitos" id="txtTel1"
								onkeypress="return solonumeros(event)" name="txtTel1"
								data-required="1" class="form-control">
								
						</div>							
					</div>
					
					<div id="registro" style="visibility: hidden;">
						<div class='alert alert-danger' style="margin-top: 15px;"
							role='alert'>
							<label id='mensajepequeno' name='ms'>El Cliente ya se
								encuentra Registrado</label>
						</div>
					</div>
					<div class="modal-footer">
						
						<input type="submit" class="btn btn-primary" value="Guardar">
						<button type="button" class="btn btn-default"
							onclick="limpiarRegistro();" data-dismiss="modal">Salir</button>
					</div>

				</form>

			</div>
		</div>

	<!--------------------------------------------------------------fin registrar usuario modal-------------------------------------->
	<script type="text/javascript">

		function modificar(id,cargo){
			
			var accion = "detalle";
			var id = id;
			var cargo=cargo;
			console.log("entro al function");
			$.get('Gestionar_Usuario',{	
				
				id : id,
				cargo:cargo,
				accion : accion
			},function(response){
				console.log("entro al response "+response);
				console.log(cargo);
				console.log(response['object']['correo']);
				$('#txtConA').val(response['object']['contrase�a']); ; 
				$('#txtCorreo1').val(response['object']['correo']); ; 
				$('#txtTel1').val(response['object']['telefono']); ;
				$('#txtDNIH').val(response['object']['dni']); ; 				
				
				$("#myModal2").modal()
				
			});}	
	</script>
	</body>
