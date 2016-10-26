<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="beans.PedidoBean"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="imagesOut/ico/logo_gym.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="imagesOut/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="imagesOut/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="imagesOut/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="imagesOut/ico/apple-touch-icon-57-precomposed.png">
    
    <%
    ArrayList<PedidoBean> pedidos=(ArrayList) request.getAttribute("pedidos");
    ArrayList<PedidoBean> productos=(ArrayList) request.getAttribute("productos");
    %>
</head>
<body>
	<%@include file="../includeOut/header.jsp" %>
	
		<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="index.jsp">Inicio</a></li>
				  <li class="active">Pedidos</li>
				</ol>
			</div>
			<div style="width: 10%">
				<select onchange="listarPorEstado()" id="estadoPedido" name="estadoPedido">
					<option value="" disabled selected>ESTADO</option>
					<option value="PENDIENTE" >Pendientes</option>
					<option value="RECIBIDO">Entregados</option>
					<option value="ELIMINADO">Cancelados</option>		
				</select>
			</div>
			<script >
			function listarPorEstado() {
				if(document.getElementById("estadoPedido").value=="PENDIENTE"){
					location.href="ServletPedido?accion=listarPedidos&estado=P";
				}
				
				if(document.getElementById("estadoPedido").value=="RECIBIDO"){
					location.href="ServletPedido?accion=listarPedidos&estado=R";
				}
				if(document.getElementById("estadoPedido").value=="ELIMINADO"){
					location.href="ServletPedido?accion=listarPedidos&estado=C";
				}
			}
			</script>
			<br>
			<center><h3><%=request.getAttribute("estado") %></h3></center>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="description"><center>Nº de Pedido</center></td>
							<td class="description"><center>Tipo de Pago</center></td>
							<td class="description"><center>Fecha de Entrega</center></td>
							<td class="description"><center>Dirección</center></td>
							<td class="description"><center>Distrito</center></td>
							<td class="description"><center><a>Opción</a></center></td>
						</tr>
					</thead>
				
					<tbody>
					<%if(pedidos.size()==0){ %>
						<tr> <td colspan="6"><center><font color=blue >Usted no tiene Pedidos <%=request.getAttribute("estado") %></font></center></td></tr>
					<%}else{ %>
							<% for(int i=0; i<pedidos.size();i++){ %>
								<tr>
									<th><center><%=pedidos.get(i).getNumPedido() %></center><input type="hidden" name="idPedido" id="namePedido" value="<%=pedidos.get(i).getId() %>"></th>
									<th><center><%=pedidos.get(i).getTipoPago()%></center></th>
									<th><center><%=pedidos.get(i).getFechaEntrega()%></center></th>
									<th><center><%=pedidos.get(i).getDireccion() %></center></th>
									<th><center><%=pedidos.get(i).getDistrto() %></center></th>
									<th><a onclick="activarModal('<%=pedidos.get(i).getId() %>','<%=pedidos.get(i).getNumPedido() %>','<%=pedidos.get(i).getEstado() %>','<%=pedidos.get(i).getFechaEntrega() %>','<%=pedidos.get(i).getTipoPago()%>','<%=pedidos.get(i).getDireccion()%>','<%=pedidos.get(i).getDistrto()%>','<%=pedidos.get(i).getTipoEntrega()%>','<%=pedidos.get(i).getProvincia()%>','<%=pedidos.get(i).getDepartamento()%>','<%=pedidos.get(i).getFechaCreacion()%>')"><center>Ver más</center></a></th>
									</tr>
							<% } %>
					<%} %>
					
					</tbody>
				</table>
			</div>
		</div>
	</section> <!--/#cart_items-->
	<div id="divModalDetalle"></div>
	<script >
	function activarModal(idVenta,numPedido,estado,fechaEntrega,tipoPago,direccion,distrito,tipoEntrega,provincia,departamento,fecha){
		document.getElementById("divBotonCancelar").innerHTML="";
		if(tipoPago=="Contra-Entrega" || tipoPago=="Tarjeta"){
			if(estado!="Cancelado"){
				var dNow = new Date();
				var año = dNow.getFullYear();
				var mes = dNow.getMonth()+1;
				var dia = dNow.getDate();
				var fechaServidor= año+"-"+mes+"-"+dia;
				console.log("fechaSc=> "+fecha+" fechaServidor=> "+fechaServidor );
				var n = fecha.localeCompare(fechaServidor);
				console.log("n=>"+n);
				if(n==0){
					 document.getElementById("divBotonCancelar").innerHTML="<button type=button class='btn btn-default' onclick='cancelarPedido("+idVenta+")' style='background-color: red; color:white' >Cancelar Pedido</button>";	
				}
				  
			}
			
			document.getElementById("divFechaPago").innerHTML="";
		}else{
			document.getElementById("divFechaPago").innerHTML="<label>Fecha de Pago: </label><input disabled type=text name=fechaPagoModal id=fechaPagoModal style='border: none;background: white;' >";
			document.getElementById("fechaPagoModal").value="2016-06-05";
		}
		if(tipoEntrega=="Recojo Empresa"){
						
			document.getElementById("divUrbanizacion").innerHTML="";
			document.getElementById("divProvincia").innerHTML="";
			document.getElementById("divDireccion").innerHTML="";
			document.getElementById("divDepartamento").innerHTML="";
			document.getElementById("divDistrito").innerHTML="";
		}else{

			document.getElementById("divUrbanizacion").innerHTML="<label>Urbanización: </label><input disabled  type=text name=urbanizacionModal id=urbanizacionModal style='border: none;background: white;' >";
			document.getElementById("divProvincia").innerHTML="<label>Provincia: </label><input disabled  type=text name=provinciaModal id=provinciaModal style='border: none;background: white;' >";
			document.getElementById("divDireccion").innerHTML="<label>Dirección: </label><input  disabled type=text name=direccionModal id=direccionModal style='border: none;background: white;' >";
			document.getElementById("divDepartamento").innerHTML="	<label>Departamento: </label><input disabled  type=text name=departamentoModal id=departamentoModal style='border: none; width: 50%;background: white;' >";
			document.getElementById("divDistrito").innerHTML="<label>Distrito: </label><input disabled  type=text name=distritoModal id=distritoModal style='border: none;background: white;' >";
			
			document.getElementById("direccionModal").value=direccion;
			  document.getElementById("departamentoModal").value=departamento;
			  document.getElementById("distritoModal").value=distrito;
			  document.getElementById("provinciaModal").value=provincia;
			  document.getElementById("urbanizacionModal").value="-------";
		}
		 document.getElementById("idVenta").value=idVenta;
		  document.getElementById("numPedidoModal").value=numPedido;
		  document.getElementById("tipoPagoModal").value=tipoPago;
		  
		  document.getElementById("tipoEntregaModal").value=tipoEntrega;
		  document.getElementById("estadoModal").value=estado;
		  document.getElementById("fechaEntregaModal").value=fechaEntrega;
		
		  document.getElementById("telefonoModal").value="943652228";
		
		  
		
		  $("#productosVenta tbody tr").remove();
			<% for(int i=0; i<productos.size();i++){%>
			if(<%=productos.get(i).getId()%>==idVenta){
				
				$('#productosVenta')
				.append(
				'<tr ><td><center><%=productos.get(i).getProductoId() %></center></td><td><center><%=productos.get(i).getProductoNombre()%></center></td><td><center><%=productos.get(i).getCategoriaProducto()%></center></td><td><center><%=productos.get(i).getMedidaProducto() %></center></td><td><center><%=productos.get(i).getCantidad() %></center></td><td><center><%=productos.get(i).getPesoUnidad() %></center></td><td><center><%=Math.rint(productos.get(i).getCantidad()*productos.get(i).getPesoUnidad()*100)/100 %></center></td><td><center><%=productos.get(i).getPrecioUnidad() %></center></td><td><center><%=productos.get(i).getPrecioUnidad()*productos.get(i).getCantidad()%></center></td></tr>');
			}
			<% } %>
		  $('#modalDetalle').modal('show'); 
	}
	function cancelarPedido(idVenta) {
		
		 if (confirm("¿Esta seguro que desea cancelar el pedido?") == true) {
			 location.href="ServletPedido?accion=cancelarPedido&id="+idVenta;
		 }
		
	}
	</script>
	<!-- modal detalle pedido -->
	<div class=modal fade id=modalDetalle role=dialog style="padding-right:210px">
	
		<div class=modal-dialog >
		
			<div class=modal-content style="width: 130%">
				<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Pedido Nº<input disabled type="text" name="numPedidoModal" id="numPedidoModal" style="border: none;background: white;" ></h4>
			  	<input type="hidden" name="idVenta" id="idVenta">
			    </div>
				<div class=modal-body >
					<h5>Datos del Pedido</h5>
					<div class="row">
						<div class="col-sm-6" style="padding-left: 40px">
							<label>Estado: </label><input disabled type="text" name="estadoModal" id="estadoModal" style="border: none ; width: 50%;background: white;" >
						</div>
						<div class="col-sm-6" id="divFechaPago">
							
							<label>Fecha de Pago: </label><input disabled type="text" name="fechaPagoModal" id="fechaPagoModal" style="border: none;background: white;" >
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6" style="padding-left: 40px">
							<label>Tipo de Pago: </label><input  disabled type="text" name="tipoPagoModal" id="tipoPagoModal" style="border: none; width: 50%;background: white;" >
						</div>
						<div class="col-sm-6" id="divUrbanizacion">
							<label>Urbanización: </label><input disabled  type="text" name="urbanizacionModal" id="urbanizacionModal" style="border: none;background: white;" >
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-6" style="padding-left: 40px">
							<label>Tipo de Entrega: </label><input  disabled type="text" name="tipoEntregaModal" id="tipoEntregaModal" style="border: none; width: 50%;background: white;" >
						</div>
						<div class="col-sm-6" id="divProvincia">
							<label>Provincia: </label><input disabled  type="text" name="provinciaModal" id="provinciaModal" style="border: none;background: white;" >
						</div>
					</div>
					<div class="row">
					<div class="col-sm-6" style="padding-left: 40px">
						<label>Fecha de Entrega: </label><input disabled  type="text" name="fechaEntregaModal" id="fechaEntregaModal" style="border: none; width: 50%;background: white;" >
						</div>
					<div class="col-sm-6">
							<label>Teléfono: </label><input  disabled type="text" name="telefonoModal" id="telefonoModal" style="border: none;background: white;" >					
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6" id="divDireccion" style="padding-left: 40px">
							<label>Dirección: </label><input  disabled type="text" name="direccionModal" id="direccionModal" style="border: none;background: white;" >
						</div>
						<div class="col-sm-6" id="divDepartamento">
								<label>Departamento: </label><input disabled  type="text" name="departamentoModal" id="departamentoModal" style="border: none; width: 50%;background: white;" >
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6" id="divDistrito" style="padding-left: 40px">
							<label>Distrito: </label><input disabled  type="text" name="distritoModal" id="distritoModal" style="border: none;background: white;" >
						</div>
						<div class="col-sm-6" id="divBotonCancelar">
						
							
						</div>
					</div>
					<br><br>
					<table id="productosVenta" class="table table-condensed">
					<thead>
						<tr class="cart_menu" style="background-color: orange">
							<td class="description"><center>ID</center></td>
							
							<td class="description"><center>Producto</center></td>
							<td class="description"><center>Categoria</center></td>
							<td class="description"><center>Medida</center></td>
							<td class="description"><center>Cantidad</center></td>
							<td class="description"><center>Peso Und.(KG)</center></td>
							<td class="description"><center>Peso Total(kG)</center></td>
							<td class="description"><center>Precio Und.</center></td>
							<td class="description"><center><a>Total</a></center></td>
						</tr>
					</thead>
				
					<tbody>
					
					</tbody>
				</table>
					
				</div>
				
				<div class=modal-footer>
					<button type=button class=btn btn-default data-dismiss=modal>Cerrar</button>
				</div>
			</div>
		
		</div>
			
	</div>
	<!-- Fin modal detalle pedido -->
	
 
	
	<%@include file="../includeOut/footer.jsp" %>
</body>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</html>
