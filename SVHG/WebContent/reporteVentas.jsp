
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
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
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
						<select class="form-control" id="sel1">
							<option>SUSPENSI</option>
							<option>FUERZA</option>
							<option>AGILIDAD</option>
							<option>COORDINACION</option>
							<option>POTENCIA</option>
							<option>OTROS</option>
						</select>
					</div>
				</div>
<!----------------------------INICIO select dependientes---------------------------------------->
<script>


</script>

<!----------------------------FIN select dependientes---------------------------------------->
				
				<div class="col-sm-1"></div>
				<div class="col-sm-3">
					<div class="form-group">
						<label for="sel1">Seleccione :</label>
						<select class="form-control" id="sel1">
							<option>A�os</option>
							<option>Meses</option>
						</select>
					</div>
				</div>
			</div>
				<br>
			<div class="row">
				<div class="col-sm-3">
					<div class="form-group">
						<label for="sel1">Seleccione Producto:</label>
						<!-- select producto -->
						<select class="form-control" id="sel1">
						<%for (int i = 0; i < productos.size(); i++) {%>
							<option><%=productos.get(i).getNombre() %></option>
						<%}%>
						</select>
					</div>
				</div>
				<div class="col-sm-1"></div>
				<div class="col-sm-3">
					<div class="form-group">
						<label for="sel1">Seleccione :</label>
						<select class="form-control" id="sel1">
							<option>99</option>
							<option>98</option>
							<option>97</option>
							<option>96</option>
							<option>95</option>
							
						</select>
					</div>
				</div>
			
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
	<div id="myfirstchart" style="height: 250px;"></div>
		<script>
		
		new Morris.Area({
			  // ID of the element in which to draw the chart.
			  element: 'myfirstchart',
			  // Chart data records -- each entry in this array corresponds to a point on
			  // the chart.
			  data: [
			    { year: '2008', value: 20 },
			    { year: '2009', value: 10 },
			    { year: '2010', value: 10 },
			    { year: '2011', value: 10 },
			    { year: '2012', value: 115 },
			    { year: '2013', value: 5 },
			    { year: '2014', value: 20 }
		
			  ],
			  // The name of the data record attribute that contains x-values.
			  xkey: 'year',
			  // A list of names of data record attributes that contain y-values.
			  ykeys: ['value'],
			  // Labels for the ykeys -- will be displayed when you hover over the
			  // chart.
			  labels: ['Value']
			});
		
		</script>
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
