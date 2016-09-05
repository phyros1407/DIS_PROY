  <%if(session.getAttribute("nombreApellidoPersonaAdmi")==null ) {
                  request.getRequestDispatcher("home.jsp").forward(request, response);
                  }
                  %>
<%@page import="beans.ProveedorBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	ArrayList<ProveedorBean> proveedor = (ArrayList<ProveedorBean>) request
			.getAttribute("proveedores");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<%@ include file="include/head.jsp"%>

<!-- END HEAD -->

<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
	<!-- BEGIN HEADER -->
	<%@ include file="include/headSideBar.jsp"%>
	<!-- END HEADER -->
	<!-- BEGIN HEADER & CONTENT DIVIDER -->
	<div class="clearfix"></div>
	<!-- END HEADER & CONTENT DIVIDER -->
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
		<%@ include file="include/sidebar.jsp"%>
		<!-- END SIDEBAR -->
		<!-- BEGIN CONTENT -->
		<div class="page-content-wrapper">
			<!-- BEGIN CONTENT BODY -->
			<div class="page-content">
				<!-- BEGIN PAGE HEADER-->
				<!-- BEGIN THEME PANEL -->
				<!-- END THEME PANEL -->
				<!-- BEGIN PAGE BAR -->
				<div class="page-bar">
					<ul class="page-breadcrumb">
						<li><a href="inicio.jsp">Inicio</a> <i class="fa fa-circle"></i>
						</li>
						<li><span>ADMINISTRADOR</span></li>
					</ul>
					<div class="page-toolbar">
						<div id="dashboard-report-range"
							class="pull-right tooltips btn btn-sm" data-container="body"
							data-placement="bottom"
							data-original-title="Change dashboard date range">
							<i class="icon-calendar"></i>&nbsp; <span
								class="thin uppercase hidden-xs"></span>&nbsp; <i
								class="fa fa-angle-down"></i>
						</div>
					</div>
				</div>


				<button>Registrar Proveedor</button>
				<div>
					<table id="myTable">
						<thead>
							<tr>
								<th>RUC</th>
								<th>RAZÓN SOCIAL</th>
								<th>DIRECCIÓN</th>
								<th>TELEFONO</th>
								<th>EDITAR</th>
								<th>ELIMINAR</th>
							</tr>
						</thead>
						<tbody>

							<%
								for (int i = 0; i < proveedor.size(); i++) {
							%>
							<tr>
								<td><%=proveedor.get(i).getRuc()%></td>
								<td><%=proveedor.get(i).getRazonSocial()%></td>
								<td><%=proveedor.get(i).getDireccion()%></td>
								<td><%=proveedor.get(i).getTelefono()%></td>

								<td><a class=""> Editar </a></td>
								<td><a class=""> Eliminar </a></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>

				</div>

				<div class="clearfix"></div>

			</div>
			<!-- END CONTENT -->
			<!-- BEGIN QUICK SIDEBAR -->

			<!-- END QUICK SIDEBAR -->
		</div>
	</div>
	<!-- END CONTAINER -->
	<%@ include file="include/footer.jsp"%>

	<!-- ----------------------modal registrar cliente-------------------------------------------- -->
	<div class="modal fade" id="modalRegistrarProveedor" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form class="form-horizontal">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Registrar Proveedor</h4>
					</div>

					<input type="hidden" maxlength="8" id="txtIdProveedor"
						name="txtIdProveedor" onkeypress="return solonumeros(event)"
						data-required="1" class="form-control" required />

					<div class="form-group">
						<label class="control-label col-md-3">RUC: <span
							class="required"> * </span>
						</label>
						<div class="col-md-6">
							<input type="text" maxlength="8" id="txtRuc"
								onkeypress="return solonumeros(event)" name="txtRuc"
								data-required="1" class="form-control" required />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">NOMBRE O RAZÓN
							SOCIAL: <span class="required"> * </span>
						</label>
						<div class="col-md-6">
							<input name="txtNombres" id="txtNombres" type="text"
								onkeypress="return sololetras(event)" data-required="1"
								class="form-control" required />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3">CORREO: <span
							class="required"> * </span>
						</label>
						<div class="col-md-6">
							<input name="txtCorreo" id="txtCorreo" type="text"
								class="form-control" onkeypress="return sololetras(event)"
								data-required="1" required />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">APELLIDO MATERNO <span
							class="required"> * </span>
						</label>
						<div class="col-md-6">
							<input name="txtApeMat1" id="txtApeMat2" type="text"
								class="form-control" onkeypress="return sololetras(event)"
								data-required="1" required />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">CORREO <span
							class="required"> * </span>
						</label>
						<div class="col-md-6">
							<input name="txtCorreo1" id="txtCorreo2" type="text"
								class="form-control" data-required="1" required />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3">Tel&eacute;fono <span
							class="required"> * </span>
						</label>
						<div class="col-md-6">
							<input type="text" name="txtTelefono1" id="txtTelefono2"
								data-required="1" class="form-control" maxlength="7"
								onkeypress="return solonumeros(event)" required />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3">Celular <span
							class="required"> * </span>
						</label>
						<div class="col-md-6">
							<input type="text" id="txtCelular2" name="txtCelular1"
								data-required="1" class="form-control" maxlength="9"
								onkeypress="return solonumeros(event)" required />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3">Direcci&oacute;n <span
							class="required"> * </span>
						</label>
						<div class="col-md-6">
							<input type="text" name="txtDireccion1" id="txtDireccion2"
								class="form-control" data-required="1" required />
						</div>
					</div>
					<div id="registro" style="visibility: hidden;">
						<div class='alert alert-danger' style="margin-top: 15px;"
							role='alert'>
							<label id='mensajepequeno' name='ms'>El Cliente ya se
								encuentra Registrado</label>
						</div>
					</div>
					<div id="validar" style="visibility: hidden;">
						<div class='alert alert-danger' style="margin-top: 15px;"
							role='alert'>
							<label id='mensajepequeno' name='ms'> Por favor ingrese
								todos los campos</label>
						</div>
					</div>
					<div class="modal-footer">

						<button type="button" class="btn btn-default"
							onclick="limpiarRegistro();" data-dismiss="modal">Cerrar</button>
						<input type="button" class="btn btn-primary"
							onclick="registrarCliente();" value="Registrar Cliente">

					</div>

				</form>

			</div>
		</div>
	</div>

	<!--------------------------------------------------------------fin registrar cliente modal-------------------------------------->
<script type="text/javascript">
$(document).ready(function(){
    $('#myTable').DataTable();
});
</script>
</body>



</html>