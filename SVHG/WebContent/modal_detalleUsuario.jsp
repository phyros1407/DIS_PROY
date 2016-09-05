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
						<h4 class="modal-title" id="myModalLabel">Detalle Usuario</h4>
					</div>
					<input type="hidden" name="idU" value="0">					
					<br>
					<div class="form-group"  >
						
						<label class="control-label col-md-4">DNI : 
						</label>
						<div class="col-md-3">
							<label for="lblDNI" class="margTop"></label>
						</div>
					</div>
					<hr>
					<br>
					<div class="form-group">
						<label class="control-label col-md-3">Usuario :
						</label>
						<div class="col-md-3">
							<label for="lblUsu" class="margTop"></label>
						</div>
						<label class="control-label col-md-2">Cargo:
						</label>
						<div class="col-md-3">
							<label for="lblCar" class="margTop"></label>
						</div>
						
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Correo:
						</label>
							<div class="col-md-3">
							<label for="lblCor" class="margTop"></label>
							</div>
						<div id="fecLab" >
						<label class="control-label col-md-2">Teléfono:
						</label>
						<div class="col-md-3">
							<label for="lblTel" class="margTop"></label>
						</div></div>
					</div>
					<div class="form-group">
					<label class="control-label col-md-3">Fecha de nacimiento:
						</label>
						<div class="col-md-3">
							<label for="lblFecNac" class="margTop"></label>
						</div>					
					</div>
					<div class="form-group" id="proveedor">
						<label class="control-label col-md-3">IDUsuario: 
						</label>
						<div class="col-md-3">
							<label for="lblIdU" class="margTop"></label>
						</div>
						<label class="control-label col-md-2">Contraseña: 
						</label>
						<div class="col-md-3">
							<label for="lblCon" class="margTop"></label>
						</div>
					</div>	
					<div class="form-group" id="proveedor">
						<label class="control-label col-md-3" for="ruc">RUC: </label>
						<div class="col-md-3">
							<label for="lblRUC" class="margTop"></label>
						</div>
						<label class="control-label col-md-2" for="razSoc">Razón social :</label>
						<div class="col-md-3">
							<label for="lblRazSoc" class="margTop"></label>
						</div>
					</div>												
					
					<div id="registro" style="visibility: hidden;">
						<div class='alert alert-danger' style="margin-top: 15px;"
							role='alert'>
							<label id='mensajepequeno' name='ms'>El Cliente ya se
								encuentra Registrado</label>
						</div>
					</div>

				</form>

			</div>
		</div>

	<!--------------------------------------------------------------fin registrar usuario modal-------------------------------------->
	<script type="text/javascript">

		function detalle(id,cargo){
			
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
				var usuario = response ['object']['usuario'];
				var rol = response ['object']['rol'];
				var correo = response ['object']['correo'];
				var telefono = response['object']['telefono'];
				var fecNac = response['object']['fecNac'];
				var id_usuario = response['object']['id_usuario'];
				var contraseña = response['object']['contraseña'];
				if(cargo==4){
					jQuery("label[for='lblRUC']").html(response['object']['ruc']);
					jQuery("label[for='lblRazSoc']").html(response['object']['razSoc']);
					jQuery("label[for='ruc']").html("RUC :");
					jQuery("label[for='razSoc']").html("Razón social :");
				}else{
					jQuery("label[for='ruc']").html("");
					jQuery("label[for='lblRUC']").html("");
					jQuery("label[for='razSoc']").html("");
					jQuery("label[for='lblRazSoc']").html("");
				}
				jQuery("label[for='lblDNI']").html(response['object']['dni'])
				jQuery("label[for='lblUsu']").html(usuario);
				jQuery("label[for='lblCar']").html(rol);
				jQuery("label[for='lblCor']").html(correo);
				jQuery("label[for='lblTel']").html(telefono);
				jQuery("label[for='lblFecNac']").html(fecNac);
				jQuery("label[for='lblIdU']").html(id_usuario);
				jQuery("label[for='lblCon']").html(contraseña);
				$("#myModal1").modal()
				
			});}	
	</script>
	</body>