  <%@page import="beans.ProductoBean"%>
<%if(session.getAttribute("nombreApellidoPersonaAdmi")==null ) {
                  request.getRequestDispatcher("home.jsp").forward(request, response);
                  }
                  %>
<%@page import="beans.UsuarioBean"%>
<%@page import="beans.PersonaBean"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%	ArrayList<UsuarioBean> usuario = (ArrayList<UsuarioBean>) request.getAttribute("usuarios");
ArrayList<ProductoBean> productos=(ArrayList<ProductoBean>) request.getAttribute("productos"); %>
	

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
<style type="text/css">
div.container4 {
    height: 250px;
    width: 450px;
    position: relative }
div.container4 p {
    margin: 0;
    background: yellow;
    position: absolute;
    top: 50%;
    left: 50%;
    margin-right: -50%;
    transform: translate(-50%, -50%) }
    
stock{
}   
    </style>

<!-- END HEAD -->

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
						<li><span></span></li>
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

				<form method="post" action="ServletOferta">
				<div class="col-sm-12 col-md-6"><input type="hidden" name="sizeP" value="<%=productos.size()%>"> 
<br>					
				Categoria:	<select name="selCat" id="selCat" onchange="categoria()">
				<option value="7">--Seleccionar--</option>
				<option value="1">SUSPENSIÓN</option>
				<option value="2">FUERZA</option>
				<option value="3">AGILIDAD</option>
				<option value="4">COORDINACION</option>
				<option value="5">POTENCIA</option>
				<option value="6">OTROS</option>
				</select>
				
				Productos: 
				<table class="table" style="height: 250px;width:500px;;display:block;">
				
				<thead style="display: inline-block;width: 100%;">
				<tr>
				<th>Nombre</th>
				</tr></thead>
				<tbody style="overflow: auto;height: 200px;display: inline-block;width: 100%;" id="tbody">					
				</tbody>
				</table>
				<p align="center">
				<input type="button" onclick="agregar()" value="Agregar" class="btn btn-primary">
				</p>
				<br>
				<br>
				<table id="proAgre" class="table-bordered" style="height: 200px;width:500px;display:block;">
				
				<thead style="width:100%;">
				<tr style="width:100%;">
				<th style="width:200px;">Producto</th>
				<th style="width:20%;">Stock</th>
				<th style="width:20%;">Precio</th>
				<th style="width:20%;">Delete</th>
				</tr></thead>
				<tbody style="overflow: auto;height: 150px;display: inline-block;width: 100%;">
				
				</tbody>
				</table>
				<br>
				<p align="right" style="margin-right: 50px;"> Total : S/.<label id="lblPrecio">0.00</label> </p>
				
				<p align="right" style="margin-right: 50px;"> Asignar Oferta : <input type="text" onchange="descuento()" onkeypress="return solonumeros(event)" id="oferta" name="oferta" maxlength="2" size="2" required> %</p>
			
				
				<p align="right" style="margin-right: 50px;"> Precio Venta : S/.<label id="lblVenta">0.00</label></p>
				
				</div>
<div class="col-sm-12 col-md-6">
<br>
<div class=container4 style="border:1px solid black;">
  <img alt="" src="images/default.jpg" style="height: 250px; width: 450px;" id="imgSel">
</div>
<br>
<input type="file" class="file" onchange="validarImg(this)" name="fotoOfer" id="fotoOfer" required>
<br>
<div class="form-group"  >						
<label class="control-label col-md-3">Del :	</label>
<div class="col-md-5"><input id="dateD" name="dateD" type="date" class="form-control" onchange="hasta()" max="2016-12-31" required></div>
<br>
<br>
</div>

<div class="form-group"  >	
<label class="control-label col-md-3">Hasta :	</label>
<div class="col-md-5"><input id="dateH" name="dateH" type="date" class="form-control" required></div>
<br>
<br>
</div>

<div class="form-group"  >	
<label class="control-label col-md-3">Hora Fin :	</label>
<div class="col-md-4">
<select name="horaOfer" class="form-control" required>
<% for(int i=1;i<=23;i++){ 
if(i<10){%>
<option value="<%=i%>">0<%=i %>:00</option>
<%}else{ %>
<option value="<%=i%>"><%=i %>:00</option>

<%} %>
<%} %>
</select> 
</div>
<br>
<br>
</div>
<div class="form-group"  >
<label class="control-label col-md-3">Ingrese la cantidad (Unid) :	</label>
<div class="col-md-4"><input onkeypress="return solonumeros(event)" id="txtCan" name="txtCan" type="number" class="form-control" max="99" min="1" required></div>
<br>
<br>
<br></div>


<div id="prueba"></div>

<% int prueba=0; %>

<p align="center">
<input type="submit" value="Guardar Oferta" class="btn btn-primary">
</p>
</div>
</form>

				<div class="clearfix"></div>

			</div>
			<!-- END CONTENT -->
			<!-- BEGIN QUICK SIDEBAR -->

			<!-- END QUICK SIDEBAR -->
		</div>
	</div>
	<!-- END CONTAINER -->
	<%@ include file="include/footer.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
    var f = new Date();
    var anioS=f.getFullYear();
    var mesS=f.getMonth()+1;
    var diaS=f.getDate();
    var diaH=diaS+1;
    console.log(mesS.toString().length);
    
    if(mesS.toString().length==1){
    mesS='0'+mesS+'';
    }
    if(diaS.toString().length==1){
        diaS='0'+diaS+'';
        diaH='0'+diaH+'';
        }
    document.getElementById("dateD").min=anioS+'-'+mesS+'-'+diaS;
    document.getElementById("dateH").min=anioS+'-'+mesS+'-'+diaH;
});

function categoria(){
	var cat=$('#selCat').val();
	console.log(cat);
	
	if(cat==7){
		$('#tbody').html("");
	}
	if(cat==1){		
		$('#tbody').html("<%for(int i=0;i<productos.size();i++){
		if(productos.get(i).getIdCategoria()==1){%><tr id=ofertasT<%=i%>><td><input type=checkbox value=<%=productos.get(i).getIdProducto()%> name=ofertas<%=i%> id=ofertas<%=i%>>&nbsp;<%=productos.get(i).getDescripcion()%></td></tr><%}}%>");
	}
	if(cat==2){		
		$('#tbody').html("<%for(int i=0;i<productos.size();i++){
		if(productos.get(i).getIdCategoria()==2){%><tr id=ofertasT<%=i%>><td><input type=checkbox value=<%=productos.get(i).getIdProducto()%> name=ofertas<%=i%> id=ofertas<%=i%>>&nbsp;<%=productos.get(i).getDescripcion()%></td></tr><%}}%>");
	}
	if(cat==3){		
		$('#tbody').html("<%for(int i=0;i<productos.size();i++){
		if(productos.get(i).getIdCategoria()==3){%><tr id=ofertasT<%=i%>><td><input type=checkbox value=<%=productos.get(i).getIdProducto()%> name=ofertas<%=i%> id=ofertas<%=i%>>&nbsp;<%=productos.get(i).getDescripcion()%></td></tr><%}}%>");
	}
	if(cat==4){		
		$('#tbody').html("<%for(int i=0;i<productos.size();i++){
		if(productos.get(i).getIdCategoria()==4){%><tr id=ofertasT<%=i%>><td><input type=checkbox value=<%=productos.get(i).getIdProducto()%> name=ofertas<%=i%> id=ofertas<%=i%>>&nbsp;<%=productos.get(i).getDescripcion()%></td></tr><%}}%>");
	}
	if(cat==5){		
		$('#tbody').html("<%for(int i=0;i<productos.size();i++){
		if(productos.get(i).getIdCategoria()==5){%><tr id=ofertasT<%=i%>><td><input type=checkbox value=<%=productos.get(i).getIdProducto()%> name=ofertas<%=i%> id=ofertas<%=i%>>&nbsp;<%=productos.get(i).getDescripcion()%></td></tr><%}}%>");
	}
	if(cat==6){		
		$('#tbody').html("<%for(int i=0;i<productos.size();i++){
		if(productos.get(i).getIdCategoria()==6){%><tr id=ofertasT<%=i%>><td><input type=checkbox value=<%=productos.get(i).getIdProducto()%> name=ofertas<%=i%> id=ofertas<%=i%>>&nbsp;<%=productos.get(i).getDescripcion()%></td></tr><%}}%>");
	}
	
}

function agregar(){
	console.log("agrega");
	
	<%for(int i=0;i<productos.size()-1;i++){%>
	if($('#ofertas'+<%=i%>+'').val()!=null){	
	if(document.getElementById('ofertas'+<%=i%>+'').checked){
			console.log(<%=productos.get(i).getIdProducto()%>);
			$('#ofertasT'+<%=i%>+'').remove();
			$('#proAgre').append("<tr id=ofertasA<%=i%>><td style=width:200px;><label id=nombreP<%=i%>><%=productos.get(i).getDescripcion()%></label></td><td style=width:20%; class=stock ><%=productos.get(i).getCantidad()%></td><td style=width:20%;><%=productos.get(i).getPrecio()%></td><td style=width:20%;>"+
			"<a href=# onclick=eliminar(<%=i%>,<%=productos.get(i).getIdProducto()%>,<%=productos.get(i).getPrecio()%>) >Eliminar</a><input type=hidden name=ofertasAID<%=i%> value=<%=productos.get(i).getIdProducto()%> ><input type=hidden name=ofertasAP<%=i%> value=<%=productos.get(i).getPrecio()%> ></td></tr>");
			var precio=parseInt($('#lblPrecio').text());
			console.log(precio);
			$('#lblPrecio').text(precio+<%=productos.get(i).getPrecio()%>);
		}}<%}%>
		
	descuento();
	compStock();
	}


function eliminar(id,valor,precio){
	
	console.log("eliminar");
	var nombre=$('#nombreP'+id).text();
	$('#ofertasA'+id).remove();
	$('#tbody').append("<tr id=ofertasT"+id+"><td><input type=checkbox value="+valor+" name=ofertas"+id+" id=ofertas"+id+">&nbsp;"+nombre+"</td></tr>");
	//input hidden cada uno para indicar en que div se encuentran al momento de ser eliminados
	var total=parseInt($('#lblPrecio').text());
	$('#lblPrecio').text(total-precio);
	descuento();
	compStock();
	
}		
	
function descuento(){
	console.log("descuento");
	var total=parseInt($('#lblPrecio').text());
	console.log(total);
	var descuento=$('#oferta').val();
	console.log(descuento);
	var precioV=total*((100-descuento)/100);
	$('#lblVenta').text(precioV);

}

function hasta(){
	var desde=$('#dateD').val();
	console.log(desde);
	var anio = parseInt(desde.substring(0, 4));
	anio=anio+1;
	console.log(anio);
	var max=anio+desde.substring(4,10);
	document.getElementById("dateH").min=desde;
	document.getElementById("dateH").max=max;
	
	$('#dateH').val(desde);
}

function compStock(){
	var stockM=10000;
	$('#proAgre .stock').each(function()
			{			  	
			  var stock=parseInt($(this).html());
			  console.log('Stock a comparar'+stock);
			  if(stockM>stock){
				  stockM=stock;
				  console.log(stockM)
			  }
			});
	document.getElementById("txtCan").max=stockM;
}

function mostrarImg(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#imgSel').attr('src', e.target.result);

        }

        reader.readAsDataURL(input.files[0]);
    }
}

function validarImg(f){
	var ext=['gif','jpg','jpeg','png'];
    var v=f.value.split('.').pop().toLowerCase();
    var cont=0;
    console.log(cont);
    for(var i=0,n;n=ext[i];i++){
        if(n.toLowerCase()==v){            
        cont=cont+1;
        console.log(cont);      
        }
        
    }    
    if(cont==0){

        $('#imgSel').attr('src','images/default.jpg');
        alert("¡ARCHIVO INVALIDO, SELECCIONE OTRO!");
        var t=f.cloneNode(true);
        t.value='';
        f.parentNode.replaceChild(t,f);
    }else{    
    	mostrarImg(f);
    }
}



</script>

</body>



</html>
