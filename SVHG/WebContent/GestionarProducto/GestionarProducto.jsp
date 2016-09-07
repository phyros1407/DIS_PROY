  <%if(session.getAttribute("nombreApellidoPersonaAdmi")==null ) {
                  request.getRequestDispatcher("home.jsp").forward(request, response);
                  }
                  %>
<%@page import="beans.ProductoBean"%>
<%@page import="beans.ProveedorBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	ArrayList<ProductoBean> productos = (ArrayList<ProductoBean>) request.getAttribute("productos");
%>
<!DOCTYPE html>
<html>
<jsp:include page="/include/head.jsp"></jsp:include>
<!-- END HEAD -->
<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
	<!-- BEGIN HEADER -->
	<div id="desap">
		<jsp:include page="/include/headSideBar.jsp"></jsp:include>
	</div>
	<!-- END HEADER -->
	<!-- BEGIN HEADER & CONTENT DIVIDER -->
	<div class="clearfix"></div>
	<!-- END HEADER & CONTENT DIVIDER -->
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
		<%@ include file="/include/sidebar.jsp"%>
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
				<br>
				<button data-target="#myModal" data-toggle="modal" onclick="categorias();" class="btn  btn-primary">Registrar Producto</button>
				<br>
				<br>
				<div>
					<table id="myTable">
						<thead>
							<tr>
								<th>CODIGO PRODUCTO</th>
								<th>NOMBRE</th>
								<th>DESCRIPCION</th>
								<th>FOTO</th>
								<th>VER MÁS</th>
								<th>MODIFICAR</th>
								<th>ELIMINAR</th>
							</tr>
						</thead>
						<tbody>
							<%
								for (int i = 0; i < productos.size(); i++) {
							%>
							<tr>
								<td><%=productos.get(i).getCodPro() %></td>
								<td><%=productos.get(i).getNombre() %></td>
								<td ><%=productos.get(i).getDescripcion() %></td>
								<!--  <td align="center"><img src="<%=productos.get(i).getFoto() %>" onmouseover="this.width=500;this.height=400;" onmouseout="this.width=100;this.height=80;" width="100" height="80" alt=""></td>-->
								<td align="center"> 
									<!--  <img  onclick="javascript:this.width=500;this.height=400;" ondblclick="javascript:this.width=80;this.height=80;" src="<%=productos.get(i).getFoto() %>" width="80" height="80"/> --> 
									<img id="myImg" src="<%=productos.get(i).getFoto() %>" alt="<%=productos.get(i).getNombre() %>" width="80" height="80" onclick="modalI(this);"/>
								</td>
								<td align="center">
									<button class="btn btn-link" onclick="buscarDProducto(<%=productos.get(i).getIdProducto()%>)" data-target="#myModal3" data-toggle="modal" > Ver más</button>
								</td>
								<td align="center">
									<button class="btn btn-default" data-target="#myModal2" data-toggle="modal" onclick="buscarProducto(<%=productos.get(i).getIdProducto()%>);">MODIFICA</button>
								</td>
								<%if(productos.get(i).getEstado().equalsIgnoreCase("A")) {%>
									<td align="center">
										<form action="Gestionar_Producto" method="post">
											<input type="hidden" name="idI" value="<%=productos.get(i).getIdProducto()%>">
											<input type="hidden" name="accion" value="desa"><button  type="submit"  class="btn btn-default" >Deshabilitar</button>
										</form>
									</td>  
								<%}else{ %>
									<td align="center">
										<form action="Gestionar_Producto" method="post">
											<input type="hidden" name="idA" value="<%=productos.get(i).getIdProducto()%>">
											<input type="hidden" name="accion" value="habi"><button  type="submit"  class="btn btn-default" >Habilitar</button>
										</form>
									</td> 
								<%} %>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>

				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- END CONTAINER -->
	<jsp:include page="/modals/modalProducto.jsp"></jsp:include>
	<%@ include file="/include/footer.jsp"%>	
	<script type="text/javascript">
		$(document).ready(function(){
		    $('#myTable').DataTable();
		});
	
		//ENVIAR IMAGEN AL MODAL
		//CAPTURANDO MODAL IMAGEN
		var modalImagen = document.getElementById("myModalI");
		function modalI(Img){
			//INSERTA LA IMAGEN EN EL MODAL
			var modalImg = document.getElementById("img01");
			var captionText = document.getElementById("caption");
			
			modalImagen.style.display = "block";
			modalImg.src = Img.src;
			captionText.innerHTML = Img.alt;
			
			
			
		}
	
		//CERRAR MODAL CON UN CLICK
		window.onclick = function(event) {
			  if (event.target == modalImagen) {
				  modalImagen.style.display = "none";
			  }
		}
		
	</script>
</body>
</html>