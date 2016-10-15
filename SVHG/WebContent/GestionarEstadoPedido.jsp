  

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<%@ include file="include/head.jsp"%>

<!-- END HEAD -->

<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
	<!-- BEGIN HEADER -->

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


				<br><br>
				
				
				
				
				
				
				
				
				
				
				
				
				<div class="col-sm-12 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Actualizar Estado del Pedido</h2>
						
						
							<br><br>
						
							<div class="row" id="formBusqueda">
								<div class="col-sm-4">
						       		<label >Ingrese Número de Orden Pedido:</label>
						        	  <input required  id="txtNumPedido"  type="number" min="100" max="999" class="form-control">
								</div>	
								<div class="col-sm-4">
								<br>
							
						        	   <input type="button" value="Continuar" onclick="buscarPedido()" class="btn btn-success">
									<label id="mensaje" style="color:red"></label>
								</div>			
							</div>
							
								<br><br>
				<br><br>
					</div><!--features_items-->
					</div>
							
			
				
				<div class="hide" id="datos">
				
				<div class="row">
							<hr><hr>
								<div><label><h3>Datos de la Orden</h3></div>
								<div class="col-md-4">
						       		<label >N° Orden  de Pedido :</label><input id="idpedido"  class="form-control" readonly="readonly">
								</div>	
								<div class="col-md-4">
								<label >Estado :</label><input id="estado"  class="form-control" readonly="readonly">
								</div>
								<div class="col-md-4">
								<label >Fecha :</label><input id="fechaCreacion"  class="form-control" readonly="readonly">
								</div>
								<div class="col-md-4">
								<label >Tipo de Pago:</label><input id="tipoPago"  class="form-control" readonly="readonly">
								</div>				
							</div>
							<br>
					<div class="row">
								<div><label><h3>Datos del Cliente</h3></label></div>
								<div class="col-md-4">
						       		<label >DNI :</label><input id="dni"  class="form-control" readonly="readonly">
								</div>	
								<div class="col-md-4">
								<label >Nombre :</label><input id="nombrePersona"  class="form-control" readonly="readonly">
								</div>
								<div class="col-md-4">
								<label >Direccion:</label><input id="direccion"  class="form-control" readonly="readonly">
								</div>
					</div>
									
											
							
				
					
					<hr>
					<hr>
					<br>
					<div><label><h3>Detalle del Pedido</h3></label></div>
					<br>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>CODIGO PRODUCTO</th>
								<th>NOMBRE DEL PRODUCTO</th>
								<th>PESO</th>
								<th>CANTIDAD</th>
								<th>PRECIO UNITARIO</th>
								<th>PRECIO TOTAL</th>
							</tr>
						</thead>
						<tbody id="detalleProd">
									
									
						</tbody>
					</table>

				</div>
				<br>
				<br>
				<hr>
				<div class="clearfix"></div>
				
			</div>
			<!-- END CONTENT -->
			<!-- BEGIN QUICK SIDEBAR -->

			<!-- END QUICK SIDEBAR -->
		</div>
	</div>
	<!-- END CONTAINER -->
	<%@ include file="include/footer.jsp"%>

	        
               
 <!--------------------------------------------------------------fin cambiar estado-------------------------------------->
<script type="text/javascript">
$(document).ready(function(){
    $('#myTable').DataTable();
});


//AJAX BUSCARPEEDIDO
function buscarPedido(){
		
		var id=document.getElementById("txtNumPedido").value;
		var accion = "buscarPedido";
		
		$.post('ServletPedido',{

			accion:accion,
			id:id
			
		},function(response){
			if(response['object'].length<1){
				
				$('#mensaje').html(' El Nº de Orden de pedido no existe. ');
			}else if(response['object'][0]['estado']=='E'){
				$('#mensaje').html(' El N° de Orden de pedido ya ha sido actualizada ');
			}else{
				var impTotal=0;			
				
				var cadena = "";
				var cadena2="";
				var cadena3="";
				var dni=response['object'][0]['dni'];
				var estado=response['object'][0]['estado'];
				var tipoPedido=response['object'][0]['tipoPedido'];
				var fechaCreacion=response['object'][0]['fechaCreacion'];
				var direccion=response['object'][0]['direccion'];
				var nombrePersona=response['object'][0]['nombrePersona'];
				
				
				
				$('#formBusqueda').addClass('hide');
				$('#idpedido').val(id);
				$('#dni').val(dni);
				if(estado=='P'){
					$('#estado').val('PENDIENTE');
				}else if(estado=='C'){
					$('#estado').val('CANCELADO');
				}
				
				$('#fechaCreacion').val(fechaCreacion);
				$('#direccion').val(direccion);
				$('#nombrePersona').val(nombrePersona);
				if(tipoPedido=="CE"){
					
					$('#tipoPago').val('CONTRA ENTREGA');
				}else if(tipoPedido=='TA'){
					$('#tipoPago').val('TARJETA DE CREDITO');
				}else if(tipoPedido=='PP'){
					$('#tipoPago').val('PAYPAL');
				}
				
				for(var i=0;i<response['object'].length;i++){
					impTotal+=response['object'][i]['impProd'];
					
					cadena = cadena+("<tr><td>"+response['object'][i]['ProductoId']+"</td><td>"+response['object'][i]['productoNombre']+"</td><td>"+response['object'][i]['pesoUnidad']+" Kg</td><td>"+response['object'][i]['cantidad']+"</td><td>"+response['object'][i]['precioUnidad']+"</td><td>S/"+response['object'][i]['impProd']+".00</td></tr>");
				}
				cadena2="<tr><td colspan='4'></td><td class='danger'>TOTAL A PAGAR </td><td class='warning'>S/"+impTotal+".00</td></tr>";
				cadena3="<tr><td colspan='4'><label id='mensaje2' style='color:red'></label><td><input type='button' id='actualizar' class='btn btn-success' onclick='actualizarPedido("+id+")' value='Actualizar'></td><td><input type='button' class='btn btn-danger' onClick='location.reload()' value='Regresar'></td></tr>";
				$('#datos').fadeIn().removeClass('hide');
				$('#detalleProd').html(cadena+cadena2+cadena3);
			}
			
		});
 }
 
function actualizarPedido(id){
	
	var accion = "actualizarPedido";
	
	$.post('ServletPedido',{

		accion:accion,
		id:id
		
	},function(response){
		
			$("#actualizar").addClass("disabled");
			alert("Estado actualizado");
			var tipPag=document.getElementById("tipoPago").value;
			if(tipPag=='CONTRA ENTREGA'){
			$('#mensaje2').html('Se ha enviado la boleta o factura, al correo registrado.');
			}
	});
}
 
</script>
</body>



</html>