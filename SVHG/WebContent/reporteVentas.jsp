
<%@page import="beans.ProductoBean"%>
<%@page import="java.util.ArrayList"%>
<%if(session.getAttribute("nombreApellidoPersonaAdmi")==null ) {
                  request.getRequestDispatcher("home.jsp").forward(request, response);
                  }
                  %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>



<!-- *******************************PARA MODAL  ******************************* -->		
<%@ include file="include/head.jsp"%>
<script type="text/javascript" src="./js/validaciones.js" charset="UTF-8"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>

<!-- END HEAD -->
<%
	ArrayList<ProductoBean> productos = (ArrayList<ProductoBean>) request.getAttribute("productos");
%>
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
						<li><span>Reporte de Ventas</span></li>
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
<!----------------------------------------- BODY------------------------------------------------>
<form>
			<div class="row">
				<div class="col-sm-11">
					<h1>Reporte de Ventas</h1>
				</div>
			</div>
				<br>
			<div class="row">
				<div class="col-sm-3">
					<div class="form-group">
						<label for="sel1">Seleccione Categoria:</label>
						<select onchange="cambiarProducto()" name="categoria" class="form-control" id="categoria">
							<option value="0">Seleccione</option>
							<option value="1">SUSPENSI</option>
							<option value="2">FUERZA</option>
							<option value="3">AGILIDAD</option>
							<option value="4">COORDINACION</option>
							<option value="5">POTENCIA</option>
							<option value="6">OTROS</option>
						</select>
					</div>
				</div>
				
				
<!----------------------------INICIO select dependientes---------------------------------------->
<script>
	function cambiarProducto(){
		var x=document.getElementById("categoria").value;
		var p1 = document.getElementById('p1');
		var p2 = document.getElementById('p2');
		var p3 = document.getElementById('p3');
		var p4 = document.getElementById('p4');
		var p5 = document.getElementById('p5');
		var p6 = document.getElementById('p6');
	
		if(x==0){ 
			p1.style.display = 'none';
			p2.style.display = 'none';
			p3.style.display = 'none';
			p4.style.display = 'none';
			p5.style.display = 'none';
			p6.style.display = 'none';	
		}
		if(x==1){ 
			p1.style.display = 'block';
			p2.style.display = 'none';
			p3.style.display = 'none';
			p4.style.display = 'none';
			p5.style.display = 'none';
			p6.style.display = 'none';	
		}
		if(x==2){ 
			p1.style.display = 'none';
			p2.style.display = 'block';
			p3.style.display = 'none';
			p4.style.display = 'none';
			p5.style.display = 'none';
			p6.style.display = 'none';	
		}
		if(x==3){ 
			p1.style.display = 'none';
			p2.style.display = 'none';
			p3.style.display = 'block';
			p4.style.display = 'none';
			p5.style.display = 'none';
			p6.style.display = 'none';	
		}
		if(x==4){ 
			p1.style.display = 'none';
			p2.style.display = 'none';
			p3.style.display = 'none';
			p4.style.display = 'block';
			p5.style.display = 'none';
			p6.style.display = 'none';	
		}
		if(x==5){ 
			p1.style.display = 'none';
			p2.style.display = 'none';
			p3.style.display = 'none';
			p4.style.display = 'none';
			p5.style.display = 'block';
			p6.style.display = 'none';	
		}
		if(x==5){ 
			p1.style.display = 'none';
			p2.style.display = 'none';
			p3.style.display = 'none';
			p4.style.display = 'none';
			p5.style.display = 'none';
			p6.style.display = 'block';	
		}
		
	
		
	}

</script>

<!----------------------------FIN select dependientes---------------------------------------->
				
				<div class="col-sm-1"></div>
				<div class="col-sm-3">
					<div class="form-group">
						<label for="sel1">Seleccione a�o </label>
						<select class="form-control" id="sel1">
							<option>2011</option>
							<option>2012</option>
							<option>2013</option>
							<option>2014</option>
							<option>2015</option>
							<option>2016</option>
							<option>2017</option>
						</select>
					</div>
				</div>
			</div>
				<br>
			<div class="row">
				<div class="col-sm-3">
					<div class="form-group">
						<label for="sel1">Seleccione Producto:</label>
<!--------------------------------------- select producto--------------------------------------- -->
						<div id="p1" style="display:none">
							<select class="form-control" id="producto" name="producto">
							<option>Seleccione</option>
							<%for (int i = 0; i < productos.size(); i++) {%>
								<%if(productos.get(i).getIdCategoria()==1){%>
								<option><%=productos.get(i).getNombre()%></option>
								<%} %>
							<%}%>
							</select>
						</div>
<!--------------------------------------- select producto--------------------------------------- -->
						<div id="p2" style="display:none">
							<select  class="form-control"  id="sel1" id="producto" name="producto">
							<option>Seleccione</option>
							<%for(int i = 0; i < productos.size(); i++) {%>
								<%if(productos.get(i).getIdCategoria()==2){%>
								<option><%=productos.get(i).getNombre()%></option>
								<%} %>
							<%}%>
							</select>
						</div>
<!--------------------------------------- select producto--------------------------------------- -->
						<div id="p3" style="display:none">
							<select  class="form-control"  id="producto" name="producto">
							<option>Seleccione</option>
							<%for (int i = 0; i < productos.size(); i++) {%>
								<%if(productos.get(i).getIdCategoria()==3){%>
								<option><%=productos.get(i).getNombre()%></option>
								<%} %>
							<%}%>
							</select>
						</div>
<!--------------------------------------- select producto--------------------------------------- -->
						<div id="p4" style="display:none">
							<select class="form-control" id="producto" name="producto">
							<option>Seleccione</option>
							<%for (int i = 0; i < productos.size(); i++) {%>
								<%if(productos.get(i).getIdCategoria()==4){%>
								<option><%=productos.get(i).getNombre()%></option>
								<%} %>
							<%}%>
							</select>
						</div>
<!--------------------------------------- select producto--------------------------------------- -->
						<div id="p5" style="display:none">
							<select  class="form-control" id="producto" name="producto">
							<option>Seleccione</option>
							<%for (int i = 0; i < productos.size(); i++) {%>
								<%if(productos.get(i).getIdCategoria()==5){%>
								<option><%=productos.get(i).getNombre()%></option>
								<%} %>
							<%}%>
							</select>
						</div>
<!--------------------------------------- select producto--------------------------------------- -->
						<div id="p6" style="display:none">
							<select  class="form-control"  id="producto" name="producto">
							<option>Seleccione</option>
							<%for (int i = 0; i < productos.size(); i++) {%>
								<%if(productos.get(i).getIdCategoria()==6){%>
								<option><%=productos.get(i).getNombre()%></option>
								<%} %>
							<%}%>
							</select>
						</div>
<!--------------------------------------- select producto--------------------------------------- -->


					
					</div>
				</div>
				<div class="col-sm-1"></div>
				
			
			</div>
				<br>
			<div class="row">
				<div class="col-sm-3">
					<button type="button" class="btn btn-info">Ver Reporte</button>
				</div>
			</div>
</form>



<!-- ----------------------GRAFICOS 1------------------>
<div clas="row">
	
	<div class="col-sm-12">
		
	</div>
</div>


<!-- ---------------------FIN GRAFICOS 1------------------>

<!-- ---------------------INICIO GRAFICOS 2--------------->


<!-- ---------------------FIN GRAFICOS 2------------------>



<!-----------------------------------------FIN BODY---------------------------------------------->
				

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
