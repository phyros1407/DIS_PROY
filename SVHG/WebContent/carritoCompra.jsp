<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Carrito</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="css/prettyPhoto.css" rel="stylesheet">
	<link href="css/price-range.css" rel="stylesheet">
	<link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
	<link rel="shortcut icon" href="imagesOut/ico/logo_gym.ico">
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="imagesOut/ico/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="imagesOut/ico/apple-touch-icon-114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="imagesOut/ico/apple-touch-icon-72-precomposed.png">
	<link rel="apple-touch-icon-precomposed" href="imagesOut/ico/apple-touch-icon-57-precomposed.png">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="js/validaciones.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script	
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
	</script>
	<!-- LLAMA A LOS METODOS QUE SE UTILIZAN PARA LA INTERFAZ Y LOS SERVICIOS DE UBIGEO -->
	<script src="js/ajax_pedido.js"></script>
	<script src="https://js.braintreegateway.com/web/3.3.0/js/client.min.js"></script>
	<script src="https://js.braintreegateway.com/web/3.3.0/js/paypal.min.js"></script>
	<style>
	
		#link_pri:hover {
		    text-decoration: none;
		}
		
	
	</style>
	<script type="text/javascript">
	
	 $( document ).ready(function() {
		cargarDep("#departamento");
		});
	
	</script>
</head>
<body  id="test" >
	<jsp:include page="includeOut/header.jsp"></jsp:include>
	
	<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
					<li><a href="index.jsp">Inicio</a></li>
					<li class="active">Carrito de Compra </li>
				</ol>
			</div>
			<div id="mensaje" style="color:red;"></div>
			<div style="margin-bottom:20px;text-align:right;">
				<a href="#" data-toggle="modal" data-target="#modalAgregar" id="link_pri">
	          		<span style="color:#FE9A2E;font-size:15px;" class="glyphicon glyphicon-plus"></span>
	          		<span style="color:#FE9A2E;font-size:15px;text-decoration: none;"> AGREGAR PRODUCTO</span>
	        	</a>
	        </div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu" style="vertical-align: middle; text-align: center;">
							<td class="image">Producto</td>
							<td class="description"></td>
							<td class="price">Precio</td>
							<td class="quantity">Cantidad</td>
							<td class="total">Total</td>
							<td></td>
						</tr>
					</thead>
					<tbody id="productosCarrito">
						
 						<!-- AQUI LLEGARAN LOS PRODUCTOS AGREGADOS DEL CARRITO -->						
					</tbody>
				</table>
			</div>
			<div class="row" id="opcionesPrincipales">
				<div class="col-sm-6" >
					<div class="heading">
						<h3>Seleccione su tipo de Entrega del Pedido</h3>
					</div>
					<br>
					<div class="chose_area">
						<ul class="user_option">
							<li>
								<div class="radio">
									<label><input type="radio"  name="entrega" value="local" checked>Recoger en el Local de la Empresa</label>
								</div>
							</li>
							<li>
								<div class="radio">
									<label> <input type="radio"  name="entrega" value="casa">Envio a domicilio</label>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-sm-6" >
					<div class="total_area">
						<ul>
							<li>Sub Total <span id="subTotal"></span><input type="hidden" id="subTotalV" value="" ></li>
							<li>IGV (19%)<span id="igv"> </span></li>
							<li id="lista_cargo_entrega" style="display:none;">Cargo por Envio<span id="cargo_entrega"></span></li>
							<li style="background-color: #ff8000; color: white;">Total <span id="total"> </span><input type="hidden" id="totalV" value=""></li>
							
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br>
	
	<br>
	<section id="do_action">
		<div class="container">
			<!-- FORMULARIO 1-->
			<div id="formuCasa" style="display: none;">
				<div class="col-sm-12 col-xs-12">
					<h3><b>Dirección de Envio:</b></h3>
					<br>
					<form class="form-horizontal"  id="form1">
						<div class="form-group">
							<div class="col-xs-2 col-sm-2">
								<label id="titulitos">Tipo de Dirección</label>
							</div>
							<div class="col-xs-4 col-sm-4">
								<select class="form-control" id="tipo_direccion">
									<option value="Av.">Avenida</option>
									<option value="Jr.">Jirón</option>
									<option value="Cl.">Calle</option>
								</select>
							</div>
							<div class="col-xs-2 col-sm-2">
								<label id="titulitos">Departamento</label>
							</div>
							<div class="col-xs-4 col-sm-4">
								<select class="form-control" id="departamento" onchange="cargarPros(this.value,'#provincia');">
									
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-2 col-sm-2">
								<label id="titulitos">Dirección </label>
							</div>
							<div class="col-xs-4 col-sm-4">
								<input type="text"  id="direccion" maxlength="95" class="form-control" onkeypress=" return validarn(event)">
							</div>
							
							
							<div class="col-xs-2 col-sm-2">
								<label id="titulitos">Provincia</label>
							</div>
							<div class="col-xs-4 col-sm-4">
								<select class="form-control"  id="provincia" onchange="cargarDist(this.value,'#distrito');">
									<option value="0"> -- SELECCIONAR -- </option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-2 col-sm-2">
								<label id="titulitos">Referencia </label>
							</div>
							<div class="col-xs-4 col-sm-4">
								<input class="form-control" maxlength="95" id="referencia" onkeypress=" return validarn(event)">
							</div>
							<div class="col-xs-2 col-sm-2">
								<label id="titulitos">Distrito </label>
							</div>
							<div class="col-xs-4 col-sm-4">
								<select class="form-control" id="distrito"  >
									<option value="0"> -- SELECCIONAR -- </option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-2 col-sm-2">
								<label id="titulitos">Teléfono Celular</label>
							</div>
							<div class="col-xs-4 col-sm-4">
								<input type="text" id="telefono1" maxlength="9" class="form-control"  onkeyup="validarTelefono(this.value,deserror1.value);" onkeypress="return solonumeros(event);">
								<b id="error1" style="color:red;"></b><input type="hidden" id="deserror1" value="error1">
							</div>
							<div class="col-xs-2 col-sm-2">
								<label id="titulitos"  >Otro Teléfono </label>
							</div>
							<div class="col-xs-4 col-sm-4">
								<input class="form-control" maxlength="9" id="telefono2"  onkeyup="validarTelefono(this.value,deserror2.value);" onkeypress="return solonumeros(event);">
								<b id="error2" style="color:red;"></b><input type="hidden" id="deserror2" value="error2">
							</div>
						</div>
					</form>
					<div class="form-group">
						<div class="col-xs-3 col-sm-3 col-xs-offset-8 col-sm-offset-8">
							<button id="boton3" class="btn btn-primary btn-md">Continuar</button>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group step1">
				<div class="col-xs-3 col-sm-3 col-xs-offset-8 col-sm-offset-8">
					<button id="boton1" class="btn btn-primary btn-md">Continuar</button>
				</div>
			</div>
			<div class="step2 col-xs-12 col-sm-12" style="display: none;">
				<!-- TITULOS -->
				<div class="col-xs-6 col-sm-6">
					<h3><b>Fechas disponibles</b></h3>
					<input type="hidden" id="totaldelpeso">
					<form id="radios_fechas">
						
					</form>
				</div>
				<div class="col-xs-6 col-sm-6">
					<div class="col-xs-12 col-sm-12">
							<h3><b>Paga Aqui!</b></h3>
					</div>
					<div class="col-xs-12 col-sm-12" style="margin-top:30px;">
						<div class="col-xs-6 col-sm-6">
						<select class="form-control" id="facturacion"  onchange="facturacion(this.value);">
								<option value="boleta">Boleta</option>
								<option value="factura">Factura</option>
							</select>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12" style="margin-top:15px;">
						<div class="col-xs-5 col-sm-5">
							<label id="ruc_fac_lab" style="display:none;"> R.U.C.</label>
							<input id="ruc_fac" style="display:none;" type="text"class="form-control" placeholder="RUC" name="ruc_fac" onkeypress="return solonumeros(event);"   onkeyup="buscarRuc3();"  maxlength="11">
						</div>
						<div class="col-xs-6 col-sm-6">
							<label id="rs_fac_lab" style="display:none;"> RAZÓN SOCIAL</label>
							<input id="rs_fac" disabled style="display:none;" type="text"class="form-control" name="rs_fac"   placeholder="Razon Social">
						</div>
						<div class="col-xs-1 col-sm-1" id="precarga" >
							<!-- <a  href="#"  style="display:none;" id="icono"></a> -->
						</div>
						<br>
					</div>
					<div class="col-xs-12 col-sm-12" style="margin-top:15px;">
						<div id="para_casa" style="display:none;">
							<div class="col-xs-6 col-sm-6">
								<!-- PAYPAL BOTON -->
								<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" id="fomr2" method="get" target="_top">
									<input type="hidden" name="cmd" value="_s-xclick">
									<input type="hidden" name="currency_code" value="US">
									<input type="hidden" name="business" value="nano_sport_test@hotmail.com">
									
									<input type="hidden" name="item_name" value=" Total de Importe Neto(IGV incluido) - Nano Sport Shop">
									<input type="hidden" name="amount" id="amount2" >
									
									<input type="hidden" name="hosted_button_id" value="NDTB7REJQZUHN">
									<input type="hidden" name="return" id="return2" value="http://localhost:8080/SVHG/carritoCompra.jsp?action=prueba">
									<input type="hidden" name="rm" value="2">
									<input type="image" onclick="generarUrl('form2')" style="border-radius:4px;vertical-align: middle; text-align: center;" src="https://www.paypalobjects.com/webstatic/en_US/i/btn/png/gold-rect-paypal-44px.png"  name="submit" alt="PayPal - The safer, easier way to pay online!">
									
								</form>	
								<script src="http://www.paypalobjects.com/api/checkout.js" async></script>
							</div>
							<div class="col-xs-6 col-sm-6">
								<img   onclick="anios();validarFacturacion('#generar_pedido_tarjeta','#modalTarjeta');" id="btnTarjeta"  style="height:44px;cursor: pointer;border-radius:4px;vertical-align: middle; text-align: center;"alt="Visa y Mastercard" src="imagesOut/cart/visa_mastercard.png">
							</div>
							
						</div>
						<div id="para_local" style="display:none;">
							<div class="col-xs-4 col-sm-4">
								<!-- PAYPAL BOTON -->
								<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" id="form1" method="get" target="_top">
									<input type="hidden" name="cmd" value="_s-xclick">
									<input type="hidden" name="currency_code" value="US">
									<input type="hidden" name="business" value="nano_sport_test@hotmail.com">
									
									<input type="hidden" name="item_name" value=" Total de Importe Neto(IGV incluido) - Nano Sport Shop">
									<input type="hidden" name="amount" id="amount1" >
									
									<input type="hidden" name="hosted_button_id" value="NDTB7REJQZUHN">
									<input type="hidden" name="return" id="return1" value="http://localhost:8080/SVHG/carritoCompra.jsp?action=prueba">
									<input type="hidden" name="rm" value="2">
									<input  type="image" onclick="validarFacturacion2('form1');" style="border-radius:4px;vertical-align: middle; text-align: center;" src="https://www.paypalobjects.com/webstatic/en_US/i/btn/png/gold-rect-paypal-44px.png"  name="submit" alt="PayPal - The safer, easier way to pay online!">
									
								</form>	
								<script src="http://www.paypalobjects.com/api/checkout.js" async></script>
							</div>
							<div class="col-xs-4 col-sm-4">
								<img  id="btnTarjeta" onclick="anios();validarFacturacion('#generar_pedido_tarjeta','#modalTarjeta');" style="height:44px;cursor: pointer;border-radius:4px;vertical-align: middle; text-align: center;"alt="Visa y Mastercard" src="imagesOut/cart/visa_mastercard.png">
							</div>
							<div class="col-xs-4 col-sm-4">
								<img  onclick = "validarFacturacion('#form_generar_pedido','#contra_entrega');"  style="height:44px;cursor: pointer;border-radius:4px;border: 2px solid ;vertical-align: middle; text-align: center;" alt="Visa y Mastercard" src="imagesOut/cart/contra_entrega.png">
							</div>
						</div>
					</div>
				</div>
				
			</div>
			<!-- DIRECCION DE ENVIO -->
			<div class="step3" style="display:none;">
				<div class="col-xs-12 col-sm-12 " style="margin-top: 25px;"
					id="infoDirEnv">
					<h3 id="titInDir">Direccion de Envio</h3>
					<div class="col-xs-8 col-sm-8">
						<label id="mosNom"></label><br> <label id="mosDir"></label><br>
						<label id="mosDis"></label><br> <label id="mosTel"></label><br>
						<button type="button" class="btn btn-default" id="botonCambDir" onclick="cargandoModalModDir();">Cambiar direccion</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	
	<!--/#do_action-->
	<jsp:include page="includeOut/footer.jsp"></jsp:include>
	<jsp:include page="modals/modalGenerarPedido.jsp"></jsp:include>
	<jsp:include page="modals/modalRegistroTarjeta.jsp"></jsp:include>
	<jsp:include page="modals/modalContra_Entrega.jsp"></jsp:include>
	<jsp:include page="modals/modalAgregarProducto.jsp"></jsp:include>
</body>

<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>



</html>