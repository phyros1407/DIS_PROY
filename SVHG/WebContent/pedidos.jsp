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
    <link rel="shortcut icon" href="imagesOut/ico/favicon.ico">
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
					<option value="ENTREGADO">Entregados</option>	
				</select>
			</div>
			<script >
			function listarPorEstado() {
				if(document.getElementById("estadoPedido").value=="PENDIENTE"){
					location.href="ServletPedido?accion=listarPedidosPendientes";
				}
				if(document.getElementById("estadoPedido").value=="ENTREGADO"){
					location.href="ServletPedido?accion=listarPedidosEntregados";
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
							<td class="description"><center>Fecha de Entrega</center></td>
							<td class="description"><center>Dirección</center></td>
							<td class="description"><center>Distrito</center></td>
							<td class="description"><center><a>Opción</a></center></td>
						</tr>
					</thead>
				
					<tbody>
					<% for(int i=0; i<pedidos.size();i++){ %>
						<tr>
							<th><center><%=pedidos.get(i).getNumPedido() %></center><input type="hidden" name="idPedido" id="namePedido" value="<%=pedidos.get(i).getId() %>"></th>
							<th><center><%=pedidos.get(i).getFechaEntrega()%></center></th>
							<th><center><%=pedidos.get(i).getDireccion() %></center></th>
							<th><center><%=pedidos.get(i).getDistrto() %></center></th>
							<th><a onclick="activarModal('<%=pedidos.get(i).getId() %>','<%=pedidos.get(i).getNumPedido() %>','<%=pedidos.get(i).getEstado() %>','<%=pedidos.get(i).getFechaEntrega() %>','<%=pedidos.get(i).getTipoPago()%>')"><center>Ver Detalle</center></a></th>
							</tr>
					<% } %>
					</tbody>
				</table>
			</div>
		</div>
	</section> <!--/#cart_items-->
	<div id="divModalDetalle"></div>
	<script >
	function activarModal(idVenta,numPedido,estado,fechaEntrega,tipoPago){
		
		 document.getElementById("idVenta").value=idVenta;
		  document.getElementById("numPedidoModal").value=numPedido;
		  document.getElementById("estadoModal").value=estado;
		  document.getElementById("fechaEntregaModal").value=fechaEntrega;
		  if(tipoPago=="T"){
			  document.getElementById("tipoPagoModal").value="Tarjeta de Crédito";
		  }
		  $("#productosVenta tbody tr").remove();
			<% for(int i=0; i<productos.size();i++){%>
			if(<%=productos.get(i).getId()%>==idVenta){
								
				$('#productosVenta')
				.append(
				'<tr ><td><center><center><%=productos.get(i).getProductoId() %></center></td><td><center><%=productos.get(i).getProductoNombre()%></center></td><td><center><%=productos.get(i).getCategoriaProducto()%></center></td><td><center><%=productos.get(i).getMedidaProducto() %></center></td><td><center><%=productos.get(i).getCantidad() %></center></td><td><center><%=productos.get(i).getPesoUnidad() %></center></td><td><center><%=productos.get(i).getCantidad()*productos.get(i).getPesoUnidad() %></center></td><td><center><%=productos.get(i).getPrecioUnidad() %></center></td><td><center><%=productos.get(i).getPrecioUnidad()*productos.get(i).getCantidad()%></center></td></tr>');
			}
			<% } %>
		  $('#modalDetalle').modal('show'); 
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
						<div class="col-sm-6">
							
							<label>Fecha de Pago: </label><input disabled type="text" name="fechaPagoModal" id="fechaPagoModal" style="border: none;background: white;" >
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6" style="padding-left: 40px">
							<label>Tipo de Pago: </label><input  disabled type="text" name="tipoPagoModal" id="tipoPagoModal" style="border: none; width: 50%;background: white;" >
						</div>
						<div class="col-sm-6">
							<label>Urbanización: </label><input disabled  type="text" name="urbanizacionModal" id="urbanizacionModal" style="border: none;background: white;" >
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-6" style="padding-left: 40px">
							<label>Fecha de Entrega: </label><input disabled  type="text" name="fechaEntregaModal" id="fechaEntregaModal" style="border: none; width: 50%;background: white;" >
						</div>
						<div class="col-sm-6">
							<label>Provincia: </label><input disabled  type="text" name="provinciaModal" id="provinciaModal" style="border: none;background: white;" >
						</div>
					</div>
					<div class="row">
					<div class="col-sm-6" style="padding-left: 40px">
						<label>Dirección: </label><input  disabled type="text" name="direccionModal" id="direccionModal" style="border: none;background: white;" >
						</div>
					<div class="col-sm-6">
							<label>Teléfono: </label><input  disabled type="text" name="telefonoModal" id="telefonoModal" style="border: none;background: white;" >					
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6" style="padding-left: 40px">
							<label>Departamento: </label><input disabled  type="text" name="departamentoModal" id="departamentoModal" style="border: none; width: 50%;background: white;" >
						</div>
						<div class="col-sm-6">
							
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6" style="padding-left: 40px">
							<label>Distrito: </label><input disabled  type="text" name="distritoModal" id="distritoModal" style="border: none;background: white;" >
						</div>
						<div class="col-sm-6">
							
						</div>
					</div>
					
					<table id="productosVenta" class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="description"><center>ID</center></td>
							
							<td class="description"><center>Producto</center></td>
							<td class="description"><center>Categoria</center></td>
							<td class="description"><center>Medida</center></td>
							<td class="description"><center>Cantidad</center></td>
							<td class="description"><center>Peso Und.</center></td>
							<td class="description"><center>Peso Total</center></td>
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
	
	<section id="do_action">
		<div class="container">
			<div class="heading">
				<h3>What would you like to do next?</h3>
				<p>Choose if you have a discount code or reward points you want to use or would like to estimate your delivery cost.</p>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="chose_area">
						<ul class="user_option">
							<li>
								<input type="checkbox">
								<label>Use Coupon Code</label>
							</li>
							<li>
								<input type="checkbox">
								<label>Use Gift Voucher</label>
							</li>
							<li>
								<input type="checkbox">
								<label>Estimate Shipping & Taxes</label>
							</li>
						</ul>
						<ul class="user_info">
							<li class="single_field">
								<label>Country:</label>
								<select>
									<option>United States</option>
									<option>Bangladesh</option>
									<option>UK</option>
									<option>India</option>
									<option>Pakistan</option>
									<option>Ucrane</option>
									<option>Canada</option>
									<option>Dubai</option>
								</select>
								
							</li>
							<li class="single_field">
								<label>Region / State:</label>
								<select>
									<option>Select</option>
									<option>Dhaka</option>
									<option>London</option>
									<option>Dillih</option>
									<option>Lahore</option>
									<option>Alaska</option>
									<option>Canada</option>
									<option>Dubai</option>
								</select>
							
							</li>
							<li class="single_field zip-field">
								<label>Zip Code:</label>
								<input type="text">
							</li>
						</ul>
						<a class="btn btn-default update" href="">Get Quotes</a>
						<a class="btn btn-default check_out" href="">Continue</a>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="total_area">
						<ul>
							<li>Cart Sub Total <span>$59</span></li>
							<li>Eco Tax <span>$2</span></li>
							<li>Shipping Cost <span>Free</span></li>
							<li>Total <span>$61</span></li>
						</ul>
							<a class="btn btn-default update" href="">Update</a>
							<a class="btn btn-default check_out" href="">Check Out</a>
					</div>
				</div>
			</div>
		</div>
	</section><!--/#do_action-->
	
	<%@include file="../includeOut/footer.jsp" %>
</body>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</html>
