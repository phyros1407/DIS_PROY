
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<%@ include file="/include/head.jsp" %>
  <script type="text/javascript">

  

  function buscar1(){

							event.preventDefault();

  							var txt_dni = $('#form-txtDni').val();
  						
  						
  							if($('#form-txtDni').val()==""){
  								 var validardni = document.getElementById("validardni");
  								 validardni.style.visibility	=	"visible";

  								var encontroCliente = document.getElementById("encontroCliente");
  	  							encontroCliente.style.visibility = "hidden";
  								alert("ingresa nro un dni");
  								
  								  $('#txtDni').val("");
  								$('#txtNombres').val(""); 
  								$('#txtApePat').val(""); 
  								$('#txtApeMat').val(""); 
  								$('#txtCorreo').val(""); 
  								$('#txtTelefono').val(""); 
  								$('#txtCelular').val(""); 
  								$('#txtDireccion ').val(""); 
  								$('#txtApePat').val(""); 
  								
  							}else{
  							var accion ='buscarDni';
  							// Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
  							$.post('<%=request.getContextPath() %>/Mantener_Cliente', {
  								txt_dni : txt_dni,
  								accion : accion
  							}, function(response) {
  								var error = document.getElementById("error");
  							
  							
  								if (response!=null) {
  									$('#txtIdPersona').val(response['object']['idPersona']);
  									$('#txtDni1').val(response['object']['dni']);
  									$('#txtNombres1').val(response['object']['nombres']); 
  	  								$('#txtApePat1').val(response['object']['apePat']); 
  	  								$('#txtApeMat1').val(response['object']['apeMat']); 
  	  								$('#txtCorreo1').val(response['object']['correo']); 
  	  								$('#txtTelefono1').val(response['object']['telefono']); 
  	  								$('#txtCelular1').val(response['object']['celular']); 
  	  								$('#txtDireccion1').val(response['object']['direccion']); 

  	  							var encontroCliente = document.getElementById("encontroCliente");
  	  							encontroCliente.style.visibility = "visible";

  	  								
  	  								error.style.visibility = "hidden";
  	  							//$('#iddiv').attr("data-dismiss","modal");
  	  							var validardni = document.getElementById("validardni");
  	  								validardni.style.visibility = "hidden";
  	  						
  									
  								}else {
										alert("no existe");
										
  									 error.style.visibility = "visible";
  									
  								}
  								//var nrocontrato=response['object']['nroContrato'];
  								//var codigocliente=response['object']['codigoPersona'];
  								//var nombre=response['object']['nombre'];
  								//Aqui vamos a colocar todo los var que nos trae response
  								
  								//var conta="<option value='-1'>Seleccionar</option>";
  								
  								/////
  								
  						
  							});
  							}
  				

  }

  function registrarCliente(){
	  var txt_dni2 = $('#txtDni2').val();
	  var txt_nombre2 = $('#txtNombres2').val();
	  var txt_apepat2 = $('#txtApePat2').val();
	  var txt_apemat2 = $('#txtApeMat2').val();
	  var txt_correo2 = $('#txtCorreo2').val();
	  var txt_telefono2 = $('#txtTelefono2').val();
	  var txt_celular2 = $('#txtCelular2').val();
	  var txt_direccion2 = $('#txtDireccion2').val();
	 if(txt_dni2=="" || txt_nombre2=="" || txt_apepat2=="" || txt_apemat2=="" || txt_correo2=="" || txt_telefono2=="" || txt_celular2=="" || txt_direccion2==""){
		 var validar = document.getElementById("validar");
		 validar.style.visibility	=	"visible";
			alert("Por favor complete todos los campos");
		 }else{
	 var accion='agregar';
	  $.post('<%=request.getContextPath() %>/Mantener_Cliente', {
		  	txt_dni2 : txt_dni2,
		  	txt_nombre2 : txt_nombre2,
		  	txt_apemat2 : txt_apemat2,
		  	txt_apepat2 : txt_apepat2,
		  	txt_correo2 : txt_correo2,
		  	txt_telefono2 : txt_telefono2,
		  	txt_celular2 : txt_celular2,
		  	txt_direccion2 : txt_direccion2,
				accion : accion
			}, function(response) {
				var registro = document.getElementById("registro");
				if (response.success==true) {
					location.reload();
				
						alert("cliente Registrado")
					registro.style.visibility = "visible";
					}else{

						alert("Cliente existe");
						registro.style.visibility = "visible";
					}
				
	  });}
  }

function limpiarRegistro(){
	 var validar = document.getElementById("validar");
	 validar.style.visibility	=	"hidden";
	 var registro = document.getElementById("registro");
	 validar.style.visibility	=	"hidden";	
	 $('#txtDni2').val("");
		$('#txtNombres2').val(""); 
		$('#txtApePat2').val(""); 
		$('#txtApeMat2').val(""); 
		$('#txtCorreo2').val(""); 
		$('#txtTelefono2').val(""); 
		$('#txtCelular2').val(""); 
		$('#txtDireccion2').val(""); 
		$('#txtApePat2').val(""); 
		
}

function limpiarBuscar(){
	var error = document.getElementById("error");
	 error.style.visibility	= "hidden";
	 var validardni = document.getElementById("validardni");
	 validardni.style.visibility	= "hidden";
	 var encontroCliente = document.getElementById("encontroCliente");
	 encontroCliente.style.visibility="hidden";
	 
	 $('#form-txtDni').val("");
	
}
  
  </script>

<script type="text/javascript">

 

  function buscarProducto(){

							event.preventDefault();

  							var txt_txtCodProducto = $('#form-txtCodProducto').val();
  							
  						
  							if($('#form-txtCodProducto').val()==""){
  								 var validardni = document.getElementById("validardni");
  								 validardni.style.visibility	=	"visible";

  								var encontroCliente = document.getElementById("encontroCliente");
  	  							encontroCliente.style.visibility = "hidden";
  								alert("ingresa codigo del producto");
  								
  								  $('#txtCodProducto').val("");
  								$('#txtNombresProd').val(""); 
  								$('#txtDescripcion').val(""); 
  								$('#txtPrecio').val(""); 
  								$('#selectInventario').val(""); 
  								$('#selectCategoria').val(""); 
  								 
  								
  							}else{
  							var accion ='buscarProducto';
  							// Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
  							$.post('<%=request.getContextPath() %>/Mantener_Producto', {
  								txt_txtCodProducto : txt_txtCodProducto,
  								accion : accion
  							}, function(response) {
  								var error = document.getElementById("error");
  							
  							
  								if (response!=null) {
  									$('#txtIdProducto').val(response['object']['idProducto']);
  									$('#txtCodProducto').val(response['object']['codigo']);
  									$('#txtNombresProd').val(response['object']['nombre']); 
  	  								$('#txtDescripcion').val(response['object']['descripcion']); 
  	  								$('#txtPrecio').val(response['object']['precio']); 
  	  								$('#selectInventario').val(response['object']['idInventario']); 
  	  								$('#selectCategoria').val(response['object']['idCategoria']); 
  	  							

  	  							var encontroCliente = document.getElementById("encontroCliente");
  	  							encontroCliente.style.visibility = "visible";

  	  								
  	  								error.style.visibility = "hidden";
  	  							//$('#iddiv').attr("data-dismiss","modal");
  	  							var validardni = document.getElementById("validardni");
  	  								validardni.style.visibility = "hidden";
  	  						
  									
  								}else {
										alert("asdad");
										
  									 error.style.visibility = "visible";
  									
  								}
  								//var nrocontrato=response['object']['nroContrato'];
  								//var codigocliente=response['object']['codigoPersona'];
  								//var nombre=response['object']['nombre'];
  								//Aqui vamos a colocar todo los var que nos trae response
  								
  								//var conta="<option value='-1'>Seleccionar</option>";
  								
  								/////
  								
  						
  							});
  							}
  				

  }

  function registrarProducto(){
	  var txt_CodProducto2 = $('#txtCodProducto2').val();
	  var txt_NombresProd2 = $('#txtNombresProd2').val();
	  var txt_Descripcion2 = $('#txtDescripcion2').val();
	  var txt_Precio2 = $('#txtPrecio2').val();
	  var select_Categoria2 = $('#selectCategoria2').val();
	  var select_Inventario2 = $('#selectInventario2').val();
	  
	 if(txt_CodProducto2=="" || txt_NombresProd2=="" || txt_Descripcion2=="" || txt_Precio2=="" || select_Categoria2=="" || select_Inventario2=="" ){
		 var validar = document.getElementById("validar");
		 validar.style.visibility	=	"visible";
			alert("Por favor complete todos los campos");
		 }else{
	 var accion='agregar';
	  $.post('<%=request.getContextPath() %>/Mantener_Producto', {
		  txt_CodProducto2 : txt_CodProducto2,
		  txt_NombresProd2 : txt_NombresProd2,
		  txt_Descripcion2 : txt_Descripcion2,
		  txt_Precio2 : txt_Precio2,
		  select_Categoria2 : select_Categoria2,
		  select_Inventario2 : select_Inventario2,
		  	
				accion : accion
			}, function(response) {
				var registro = document.getElementById("registro");
				if (response.success==true) {
					location.reload();
				
						alert("Producto Registrado")
					registro.style.visibility = "visible";
					}else{

						alert("Producto existe");
						registro.style.visibility = "visible";
					}
				
	  });}
  }

  function registrarTabla(){
	  var txt_idProducto = $('#txtIdProducto').val(); 
	  alert(txt_idProducto);
	  var txt_NombresProd2 = $('#txtNombresProd').val();
	  var txt_Precio2 = $('#txtPrecio').val();
	  var txt_Cantidad2 = $('#txtCantidad2').val();
	  var txt_importe = txt_Precio2*txt_Cantidad2;
	  
	  
	  
		alert(txt_NombresProd2+"||"+txt_Precio2+"||"+txt_Cantidad2+"||"+txt_importe);
	 $('#table-producto').append("<tr><td style='display:none;'>"+txt_idProducto+"</td><td>"+txt_NombresProd2+"</td><td>"+txt_Precio2+"</td><td>"+txt_Cantidad2+"</td><td>"+txt_importe+"</td><td><input type='button'  onclick='deleteRow(this);' value='eliminar' ></td></tr>");

	 
 	 var importetotal=0;

   $("#table-producto tr").find('td:eq(0)').each(function () {
	   trDelResultado=$(this).parent();
       cantidad=trDelResultado.find("td:eq(4)").html();
	   importetotal=importetotal+parseFloat(cantidad);
      // n= trDelResultado.find("td:eq(3)").html("");
	   
        
        
   });
 
	  var txt_IGV =importetotal*0.18 ;
	  var txt_Total = txt_IGV + importetotal;
	  	
	  $('#txtSubtotal').val(importetotal);	
	  //$('#temporalsubtotal').val(temp)
	 $('#txtIGV').val(txt_IGV);
	 $('#txtTotal').val(txt_Total);

	
}
  function deleteRow(r) {
	    var i = r.parentNode.parentNode.rowIndex;
	    document.getElementById("table-producto").deleteRow(i);
	}

  
  </script>
  
	<script type="text/javascript">
	function registrarVenta(){
			var total="";
		   $("#table-producto tr").find('td:eq(0)').each(function () {
			   trDelResultado=$(this).parent();
			   var1=trDelResultado.find("td:eq(0)").html();
		       //var2=trDelResultado.find("td:eq(1)").html();
		       var3=trDelResultado.find("td:eq(3)").html();
		       var4=trDelResultado.find("td:eq(4)").html();
		       
			  total=total+var1+","+var3+","+var4+";";

		   });
		 
		//venta identificador
		var txt_fecha = $('#txt_fechaactual').val();
		var txt_nroVenta = $('#txt_numeroVenta').val();	
		var txt_subtotal= $('#txtSubtotal').val();
		var txt_igv= $('#txtIGV').val();
		var txt_total= $('#txtTotal').val();
	//ventaXproducto
		var txt_idProducto = $('#txtIdProducto2').val();
		var txt_idVenta = $('#txt_idVenta').val();
		var txt_importe = $('#txtImporte').val();
		var txt_cantidad = $('#txtCantidad2').val();
	//comprobante idventa,fecha,estado,numerocomprobante,numeroserie
		var select_tipo = $('#selectTipo').val();

		
		  $.post('<%=request.getContextPath() %>/Registrar_Venta', {
			  total : total,
			  	txt_fecha : txt_fecha,
			  	txt_nroVenta : txt_nroVenta,
			  	txt_subtotal : txt_subtotal,
			  	txt_igv : txt_igv,
			  	txt_total : txt_total,
			  	txt_idProducto : txt_idProducto,
			  	txt_idVenta : txt_idVenta,
			  	txt_importe : txt_importe,
			  	txt_cantidad : txt_cantidad,
			  	select_tipo : select_tipo,	
				}, function(response) {
					
					if (response.success==true) {
						location.reload();
					
							alert(" Registrado")
					
						}else{

							alert(" Venta Registrada Satisfactoriamente");
							
						}
					
		  });



		
		}

	</script>
	
	
	
	
	<script type="text/javascript">
	$( document ).ready(function() {
		
		var today = new Date();
	    var dd = today.getDate();
	    var mm = today.getMonth()+1; //January is 0!

	    var yyyy = today.getFullYear();
	    if(dd<10){
	        dd='0'+dd
	    } 
	    if(mm<10){
	        mm='0'+mm
	    } 
	
	    var today = dd+mm+yyyy;
	     
	     document.getElementById("txt_numeroVenta").value = today;
	     
	});
	</script>
	
	
	
	
	
		<script type="text/javascript">
	$( document ).ready(function() {
		
		var today = new Date();
	    var dd = today.getDate();
	    var mm = today.getMonth()+1; //January is 0!

	    var yyyy = today.getFullYear();
	    if(dd<10){
	        dd='0'+dd
	    } 
	    if(mm<10){
	        mm='0'+mm
	    } 
	
	    var today = dd+'-'+mm+'-'+yyyy;
	     
	     document.getElementById("txt_fechaactual").value = today;
	     
	  	  // set an element
	     //$("#date").val( moment().format('MMM D, YYYY') );
	
	     // set a variable
	     //var today = moment().format('D MMM, YYYY');
	     //$('#txt_fechaactual').val(today);
	
	});
	</script>
	
    <!-- END HEAD -->

    <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
        <!-- BEGIN HEADER -->
        <%@ include file="/include/headSideBar.jsp" %>
        <!-- END HEADER -->
        <!-- BEGIN HEADER & CONTENT DIVIDER -->
        <div class="clearfix"> </div>
        <!-- END HEADER & CONTENT DIVIDER -->
        <!-- BEGIN CONTAINER -->
        <div class="page-container">
            <!-- BEGIN SIDEBAR -->
           <%@ include file="/include/sidebar.jsp" %>
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
                            <li>
                                <a href="index.html">Inicio</a>
                                <i class="fa fa-circle"></i>
                            </li>
                            <li>
                                <span>Administrador</span>
                            </li>
                        </ul>
                        <div class="page-toolbar">
                            <div id="dashboard-report-range" class="pull-right tooltips btn btn-sm" data-container="body" data-placement="bottom" data-original-title="Change dashboard date range">
                                <i class="icon-calendar"></i>&nbsp;
                                <span class="thin uppercase hidden-xs"></span>&nbsp;
                                <i class="fa fa-angle-down"></i>
                            </div>
                        </div>
                    </div>
                    <!-- END PAGE BAR -->
                    <!-- BEGIN PAGE TITLE-->
                      <div class="portlet light portlet-fit bordered">
                                <div class="portlet-title" >
                                    <div class="caption" >
                                      
                                        <span class="caption-subject font-red sbold uppercase "  >REGISTRAR VENTA DE HERRAMIENTAS DE GIMNASIO</span>
                                    </div>
                                   
                                </div>
                                </div>
                     
                     <div class="row">
                        <div class="col-md-12">
                         <div class="col-md-6">
                         <div class="form-group">
                                                <label class="control-label col-md-2">fecha:
                                                    
                                                </label>
                                                <div class="col-md-4">
                                                    <input type="text"  id="txt_fechaactual"  name=""  class="form-control" disabled /> </div>
                                            </div>
                        </div>
                        <div class="col-md-6">
                        <input type="hidden"  id="txt_idVenta"  name=""  class="form-control" disabled /> 
                         <div class="form-group">
                                                <label class="control-label col-md-2">N° Venta:
                                                    
                                                </label>
                                                <div class="col-md-4">
                                                    <input type="text"  id="txt_numeroVenta"  name=""  class="form-control" disabled /> </div>
                                           		 </div>
                        </div>
                        
                        </div>
                        
                        </div>
                    </br>
                    
                   <!--inicio contenido -->
               <!-----------------------------Formulario Cliente---------------------------------------------------------------->
                         
                         
                         <div class="row">
                        <div class="col-md-12">
                            
                            
                            <div class="portlet light portlet-fit bordered">
                                <div class="portlet-title">
                                    <div class="caption">
                                      
                                        <span class="caption-subject font-red sbold uppercase">DATOS DEL CLIENTE</span>
                                    </div>
                                   
                                </div>
                                <div class="" >
                                
                                <!-- CREAR REGISTRAR PERSONA -->
                             
                                   	 
                                <div  id="form_sample_1" class="form-horizontal">
                                       <div class="col-md-6">
                                        <input type="hidden" maxlength="8" id="temporalsubtotal" class="form-control" value="0"  />
                                 <input type="hidden" maxlength="8" id="txtIdPersona"  name="txtIdPersona" onkeypress="return solonumeros(event)" name="txtDni1"  class="form-control"  />
                                       
                                            <div class="form-group">
                                                <label class="control-label col-md-3">DNI
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="text" maxlength="8" id="txtDni1" onkeypress="return solonumeros(event)" name="txtDni"  class="form-control" disabled /> </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">NOMBRES
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input name="txtNombres1" id="txtNombres1" type="text" onkeypress="return sololetras(event)"    class="form-control"  disabled/> </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label class="control-label col-md-3">APELLIDO PATERNO
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input name="txtApePat1" id="txtApePat1" type="text" class="form-control" onkeypress="return sololetras(event)"   disabled/> </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">APELLIDO MATERNO
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input name="txtApeMat1" id="txtApeMat1" type="text" class="form-control"onkeypress="return sololetras(event)"    disabled/> </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">CORREO
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input name="txtCorreo1" id="txtCorreo1" type="text" class="form-control"    disabled/> </div>
                                            </div>
                                            
                                             
                                            
                                            
                            		</div>
                            		
                            		  <div class="col-md-6">
                                          <div class="table-toolbar">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="btn-group">
                                                    <button id="" data-toggle="modal" data-target="#modalCliente" class="btn green" style="left: 160px;"> Buscar Cliente
                                                        
                                                    </button>
                                                </div>
                                            </div>
                                          
                                        </div>
                                   			 </div>  
                                   	    
                                      
                                         <div class="table-toolbar">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="btn-group">
                                                    <Button class="btn green"  data-toggle="modal" data-target="#modalClienteRegistrar" style="left: 160px;" > 
                                                    Agregar Cliente
                                                        
                                                    </Button>
                                                </div>
                                            </div>
                                          
                                        </div>
                                   			 </div> 
                                        
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Teléfono
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="text" name="txtTelefono1" id="txtTelefono1"  class="form-control" maxlength="7" onkeypress="return solonumeros(event)"  disabled/> </div>
                                            </div>
                                            
                                            
                                           
                                             <div class="form-group">
                                                <label class="control-label col-md-3">Dirección
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="text" name="txtDireccion1" id="txtDireccion1"  class="form-control"    disabled /> </div>
                                            </div>
                                            
                            				</div>
                            		  </div>
                            	</div>
                            </div>
                            </div>	
                            </div>
                            	 <!-- ----------------------fin del formulario cliente-------------------------------------------- -->
                      <%@ include file="/RegistrarVenta/modalClientes.jsp" %>
  <!--------------------------------------------------------------Formulario Producto-------------------------------------->           
             
              <div class="row">
                        <div class="col-md-12 col-s-12">
                            
                            
                            <div class="portlet light portlet-fit bordered">
                                <div class="portlet-title">
                                    <div class="caption">
                                      
                                        <span class="caption-subject font-red sbold uppercase">DATOS DEL PRODUCTO</span>
                                    </div>
                                   
                                </div>
                                <div class="">
                                
                                <!-- CREAR REGISTRAR PRODUCTO -->
                                
                                <div action="#" id="form_sample_1" class="form-horizontal">
                                       <div class="col-md-6">
                                            <input type="hidden" name="name"  id="txtIdProducto" data-required="1" class="form-control" />
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Código Producto
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="text" name="name"  id="txtCodProducto" data-required="1" class="form-control" disabled/> </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Nombre Producto
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="text" name="name" id="txtNombresProd" data-required="1" class="form-control" disabled/> </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Descripción
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input name="email" id="txtDescripcion" type="text" class="form-control" data-required="1"  required disabled/> </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Precio
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input name="number" id="txtPrecio" type="text" class="form-control" data-required="1"  required disabled/> </div>
                                            </div>
                                          <div class="table-toolbar">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="btn-group">
                                                    <a id=""  class="btn green" onclick="registrarTabla();"style="left: 160px;">Agregar Producto
                                                        
                                                    </a>
                                                </div>
                                            </div>
                                          
                                        </div>
                                    </div>
                                            
                                            
                            		</div>
                            		
                            		  <div class="col-md-6">
                                            
                                      <div class="table-toolbar">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="btn-group">
                                                    <a id="" data-toggle="modal" data-target="#modalProducto" class="btn green" style="left: 160px;"> Buscar Producto
                                                        
                                                    </a>
                                                </div>
                                            </div>
                                          
                                        </div>
                                    </div>
                                <!--       <div class="table-toolbar">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="btn-group">
                                                    <button id="" data-toggle="modal" data-target="#modalProductoRegistrar" class="btn green" style="left: 160px;"> Registrar Producto
                                                        
                                                    </button>
                                                </div>
                                            </div>
                                          
                                        </div>
                                    </div>-->  
                                          
                                            <div class="form-group">
                                                <label class="control-label col-md-3">CATEGORIA
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <select class="form-control" id="selectCategoria" name="select" disabled>
                                                        
                                                    </select>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label class="control-label col-md-3">TIPO
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <select class="form-control" id="selectTipo" name="select" >
                                                       
                                                        <option value="boleta">Boleta</option>
                                                        <option value="factura">Factura</option>
                                                        
                                                    </select>
                                                </div>
                                            </div>
                                        
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Cantidad
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="text" name="name" id="txtCantidad2" data-required="1" class="form-control" /> </div>
                                            </div>
                             
                                            
                            		</div>
                            		
                                 
                                    </div>
                                </div>
                                
                            </div>
                      
                        </div>
                    </div>
               <!-------------------------------------fin formulario  registro productos----------------------------->
  <%@ include file="modalProductos.jsp" %>             
                    <div>
                    
                    <table class="table table-striped table-hover table-bordered" id="table-producto" name="table-producto">
                                        <thead>
                                            <tr>
                                                <th> Arreglo Floral </th>
                                                <th> Precio </th>
                                                <th> Cantidad </th>
                                                <th> Importe </th>
                                                <th> Eliminar </th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                           
                                           
                                        </tbody>
                      </table> 
                <div action="#" id="form_sample_1" class="form-horizontal" >
                                       <div class="col-md-6" style="left:600px">
                                           
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Subtotal
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="text" name="name"  id="txtSubtotal" data-required="1" class="form-control" disabled/> </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">IGV
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="text" name="name" id="txtIGV" data-required="1" class="form-control" disabled/> </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Monto Total
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input name="text" id="txtTotal" type="text" class="form-control" data-required="1"  required disabled/> </div>
                                            </div>
                                           
                                         
                            				</div>
                   </div>
                   </div>   
       <!-------------------------------------inicio botones----------------------------->                  
                    
                    <div class="col-md-12 ">
                <div class="col-md-4 ">  
                  <div class="table-toolbar">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="btn-group">
                                                    <button id="" class="btn green" style="left: 160px;"> Cancelar
                                                        
                                                    </button>
                                                </div>
                                            </div>
                                          
                                        </div>
                                   			 </div> 
                  </div> 
                  <div class="col-md-4 ">  
                  <div class="table-toolbar">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="btn-group">
                                                    <button id="" class="btn green" onclick="registrarVenta()" style="left: 160px;"> Registrar Venta
                                                        
                                                    </button>
                                                </div>
                                            </div>
                                          
                                        </div>
                                   			 </div> 
                  </div> 
                  <div class="col-md-4 ">  
                  <div class="table-toolbar">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="btn-group">
                                                    <button id="" class="btn green" style="left: 160px;"> Salir
                                                        
                                                    </button>
                                                </div>
                                            </div>
                                          
                                        </div>
                                   			 </div> 
                  </div> 
                  </div> 
                
                  <!-------------------------------------fin de botones----------------------------->     
                  
                   <!--fin contenido -->
                    <div class="clearfix"></div>
                                     
                
                    <!-- END DASHBOARD STATS 1-->
                                   

                                            <!-- END: Actions -->
                                       
                <!-- END CONTENT BODY -->
            </div>
            
        </div>
         </div>
   
         
     
         
        <!-- END CONTAINER -->
        <%@ include file="/include/footer.jsp" %>
    
</body>
</html>