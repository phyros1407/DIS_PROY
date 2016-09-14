  <%if(session.getAttribute("nombreApellidoPersonaAdmi")==null ) {
                  request.getRequestDispatcher("home.jsp").forward(request, response);
                  }
                  %>
<%@page import="beans.UsuarioBean"%>
<%@page import="beans.PersonaBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%	ArrayList<UsuarioBean> usuario = (ArrayList<UsuarioBean>) request.getAttribute("usuarios");%>
	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- ******************************* PARA MODAL ******************************* -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript" src="./js/jquery.js" charset="UTF-8"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link href="./css/bootstrap.min.css" rel="stylesheet">
<!-- *******************************PARA MODAL  ******************************* -->		
<%@ include file="include/head.jsp"%>
<script type="text/javascript" src="./js/validaciones.js" charset="UTF-8"></script>
<!-- END HEAD -->

<!-- inicio del Floro del menú -->
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

<!-- fin del Floro del menú -->

				<div>
					<table id="myTable">
						<thead>
							<tr>
								<th>DNI</th>
								<th>Nombre</th>
								<th>Apellidos</th>
								<th>Cargo</th>
								<th>Detalle</th>
								<th>Modificar</th>
								<th>Eliminar</th>
							</tr>
						</thead>
						<tbody>

							<%
								for (int i = 0; i < usuario.size(); i++) {
									int rol;
									if(usuario.get(i).getRol().equalsIgnoreCase("Proveedor")){
										rol=4;
									}else{
										rol=1;
									}
							%>
							<tr>
								<td><%=usuario.get(i).getDni()%></td>
								<td><%=usuario.get(i).getNombre()%></td>
								<td><%=usuario.get(i).getApePat()%> <%=usuario.get(i).getApeMat()%></td>
								<td><%=usuario.get(i).getRol()%></td>
								<td><a onclick="detalle(<%=usuario.get(i).getId_persona()%>,<%=rol%>);">Ver m�s</a></td>
								<td><a onclick="modificar(<%=usuario.get(i).getId_persona()%>,<%=rol%>);"> Modificar </a></td>
								<td><form action="Gestionar_Usuario" method="post">
								<input type="hidden" name="idU" value="<%=usuario.get(i).getId_usuario() %>">
								<input type="hidden" name="estado" value="<%=usuario.get(i).getEstado() %>">
								<input type="hidden" name="action" value="1">
								 <input type="submit" class="btn btn-default" value=
								<%
								if((usuario.get(i).getEstado()).equals("A")){
								%>	"Deshabilitar"
								<% 									
								}else{%>
									" Habilitar "
								<% }%>
								 style="width:120px;"></form></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				<p align="center"><button data-toggle="modal" data-target="#myModal" class="btn btn-primary">Agregar Usuario</button></p>
				</div>

				<div class="clearfix"></div>

			</div>
			<!-- END CONTENT -->
			<!-- BEGIN QUICK SIDEBAR -->

			<!-- END QUICK SIDEBAR -->
		</div>
	</div>
	<div class="modal fade" style="" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <jsp:include page="modal_registroUsuario.jsp"></jsp:include>
    </div>  
    <div class="modal fade" style="" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <jsp:include page="modal_detalleUsuario.jsp"></jsp:include>
    </div>  
    <div class="modal fade" style="" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <jsp:include page="modal_modificarUsuario.jsp"></jsp:include>
    </div>         
	<!-- END CONTAINER -->
	<%@ include file="include/footer.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
    $('#myTable').DataTable();
});
</script>

</body>



</html>
