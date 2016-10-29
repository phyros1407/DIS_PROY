
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

<!-- END HEAD -->
<%
	ArrayList<ProductoBean> productos = (ArrayList<ProductoBean>) request.getAttribute("productos");
%>
<!-- inicio del Floro del menÃº -->
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

<!-- fin del Floro del menÃº -->
<!----------------------------------------- script------------------------------------------------>
<script type="text/javascript">

	function cambiarProducto(){
		var x=document.getElementById("categoria").value;
		var a;


		if(x=='SUSPENSI'){ 
			a=1;
		}
		if(x=='FUERZA'){ 
			a=2;
		}
		if(x=='AGILIDAD'){ 
			a=3;
		}
		if(x=='COORDINACION'){ 
			a=4;
		}
		if(x=='POTENCIA'){ 
			a=5;
		}
		
		if(x=='OTROS'){ 
			a=6
		}

		if(a==1){
		document.getElementById("demo").innerHTML = "<label for=sel1>Seleccione Producto:</label><br><select name=producto id=producto class=form-control><%for (int i = 0; i < productos.size(); i++) {%><%if(productos.get(i).getIdCategoria()==1){%><option value=<%=productos.get(i).getIdProducto()%>><%=productos.get(i).getNombre()%></option><%} %><%}%></select>";
		}
		if(a==2){
			document.getElementById("demo").innerHTML = "<label for=sel1>Seleccione Producto:</label><br><select name=producto id=producto class=form-control><%for (int i = 0; i < productos.size(); i++) {%><%if(productos.get(i).getIdCategoria()==2){%><option value=<%=productos.get(i).getIdProducto()%>><%=productos.get(i).getNombre()%></option><%} %><%}%></select>";
			}
		if(a==3){
			document.getElementById("demo").innerHTML = "<label for=sel1>Seleccione Producto:</label><br><select name=producto id=producto class=form-control><%for (int i = 0; i < productos.size(); i++) {%><%if(productos.get(i).getIdCategoria()==3){%><option value=<%=productos.get(i).getIdProducto()%>><%=productos.get(i).getNombre()%></option><%} %><%}%></select>";
			}
		if(a==4){
			document.getElementById("demo").innerHTML = "<label for=sel1>Seleccione Producto:</label><br><select name=producto id=producto class=form-control><%for (int i = 0; i < productos.size(); i++) {%><%if(productos.get(i).getIdCategoria()==4){%><option value=<%=productos.get(i).getIdProducto()%>><%=productos.get(i).getNombre()%></option><%} %><%}%></select>";
			}
		if(a==5){
			document.getElementById("demo").innerHTML = "<label for=sel1>Seleccione Producto:</label><br><select name=producto id=producto class=form-control><%for (int i = 0; i < productos.size(); i++) {%><%if(productos.get(i).getIdCategoria()==5){%><option value=<%=productos.get(i).getIdProducto()%>><%=productos.get(i).getNombre()%></option><%} %><%}%></select>";
			}
		if(a==6){
			document.getElementById("demo").innerHTML = "<label for=sel1>Seleccione Producto:</label><br><select name=producto id=producto class=form-control><%for (int i = 0; i < productos.size(); i++) {%><%if(productos.get(i).getIdCategoria()==6){%><option value=<%=productos.get(i).getIdProducto()%>><%=productos.get(i).getNombre()%></option><%} %><%}%></select>";
			}
	}
	</script>
<!----------------------------------------- script------------------------------------------------>

<!----------------------------------------- BODY------------------------------------------------>
<form action="<%=getServletContext().getContextPath() %>/ServletReporteVentas" method="post" role="form">
			<div class="row">
				<div class="col-sm-11">
					<h1>Reporte de Productos</h1>
				</div>
			</div>
				<br>
			<div class="row">
				<div class="col-sm-3">
					<div class="form-group">
					<!-- onchange="cambiarProducto()" -->
						<label for="sel1">Seleccione Categoría:</label>
						<select required onchange="cambiarProducto()"  name="categoria" class="form-control" id="categoria">
							<option value="">Seleccione</option>
							<option value="SUSPENSI">SUSPENSIÓN</option>
							<option value="FUERZA">FUERZA</option>
							<option value="AGILIDAD">AGILIDAD</option>
							<option value="COORDINACION">COORDINACIÓN</option>
							<option value="POTENCIA">POTENCIA</option>
							<option value="OTROS">OTROS</option>
						</select>
					</div>
				</div>
				<input type="text" hidden name="accion" value="reporte1">
				<div class="col-sm-1"></div>
				<div class="col-sm-3">
					<div class="form-group">
						<label for="sel1">Seleccione año </label>
						<select required class="form-control" id="anio" name="anio">
							<option value="">Seleccione</option>
							<option value="2011">2011</option>
							<option value="2012">2012</option>
							<option value="2013">2013</option>
							<option value="2014">2014</option>
							<option value="2015">2015</option>
							<option value="2016">2016</option>
							<option value="2017">2017</option>
						</select>
					</div>
				</div>
				<div class="col-sm-1"></div>
				<div class="col-sm-3">
					<div class="form-group">
						<label for="sel1">Seleccione Tipo Gráfico </label>
						<select required class="form-control" id="tipoGrafico" name="tipoGrafico">
							<option value="">Seleccione</option>
							<option value="grafico1">G. Barras</option>
							<option value="grafico2">G. Lineal</option>
						</select>
					</div>
				</div>
			</div>
				<br>
			<div class="row">
				<div class="col-sm-3">
					<div class="form-group">
						
<!--------------------------------------- select producto--------------------------------------- -->
						<div id="demo"></div>
<!--------------------------------------- select producto--------------------------------------- -->
					</div>
				</div>
				<div class="col-sm-1"></div>
			</div>
				<br>
			<div class="row">
				<div class="col-sm-3">
					<button  type="submit" id="botonSubmit"  class="btn btn-warning" >Ver Reporte</button>
				</div>
			</div>
		
</form>



<!-----------------------------------------FIN BODY---------------------------------------------->
				

				<div class="clearfix"></div>

			</div>
			<!-- END CONTENT -->
			<!-- BEGIN QUICK SIDEBAR -->

			<!-- END QUICK SIDEBAR -->
		</div>
	</div>
 
	<!-- END CONTAINER -->
	<%@ include file="include/footer.jsp"%>

</body>

</html>
