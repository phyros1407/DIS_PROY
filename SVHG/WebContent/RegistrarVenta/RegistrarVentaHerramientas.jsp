
<%@page import="beans.CategoriaBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% String numero = request.getParameter("numero"); %>
 
<!DOCTYPE html >
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<%@ include file="/include/head.jsp" %>


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
	
	    var today = yyyy+'-'+mm+'-'+dd;
	     
	     document.getElementById("txt_fechaactual").value = today;
	     
	  	  // set an element
	     //$("#date").val( moment().format('MMM D, YYYY') );
	
	     // set a variable
	     //var today = moment().format('D MMM, YYYY');
	     //$('#txt_fechaactual').val(today);
	
	});
	</script>

    <!-- END HEAD -->

    <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white" onload="numero();">
     
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
	<form id="registrar" action="../ServletVenta?accion=registrarVenta1" method="post"></form>
                   

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
                                                    <input type="text"  id="txt_fechaactual"  name="txt_fechaactual"  form="registrar" class="form-control" readonly /> </div>
                                            </div>
                        </div>
                        <div class="col-md-6">
                        <input type="hidden"  id="txt_idVenta"  name=""  class="form-control" disabled /> 
                         <div class="form-group">
                                                <label class="control-label col-md-2">N° Venta:
                                                    
                                                </label>
                                                <div class="col-md-4">
                                                    <input type="text"  id="txt_numeroVenta"  name="txt_numeroVenta"  form="registrar" class="form-control"  readonly /> </div>
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
                                 <input type="hidden" maxlength="8" id="txtusuario" form="registrar" name="txtusuario" onkeypress="return solonumeros(event)"   class="form-control"  />
                                       <br>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">DNI
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="text" maxlength="8" id="txtDni1" onkeypress="return solonumeros(event)" name="txtDni"  class="form-control" disabled /> </div>
                                            </div><br>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">NOMBRES
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input name="txtNombres1" id="txtNombres1" type="text" onkeypress="return sololetras(event)"    class="form-control"  disabled/> </div>
                                            </div><br>
                                            
                                            <div class="form-group">
                                                <label class="control-label col-md-3">APELLIDO PATERNO
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input name="txtApePat1" id="txtApePat1" type="text" class="form-control" onkeypress="return sololetras(event)"   disabled/> </div>
                                            </div><br>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">APELLIDO MATERNO
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input name="txtApeMat1" id="txtApeMat1" type="text" class="form-control"onkeypress="return sololetras(event)"    disabled/> </div>
                                            </div><br>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">CORREO
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input name="txtCorreo1" id="txtCorreo1" type="text" class="form-control"    disabled/> </div>
                                            </div><br>
                                            
                                             
                                            
                                            
                            		</div>
                            		
                            		  <div class="col-md-6">
                            		  <br>
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
                            				<div class="col-md-12" id="empresa" Style="display:none;" >
                            				<div class="col-md-6">
                            				 <div class="form-group">
                                                <label class="control-label col-md-3">RUC
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="text" name="txtRuc1" id="txtRuc1"  onkeyup="buscarRuc()"class="form-control"     /> </div>
                                            </div></div>
                                            <div class="col-md-6">
                                             <div class="form-group">
                                                <label class="control-label col-md-3">Razon Social
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="text" name="txtrazonsocial1" id="txtrazonsocial1"  class="form-control"      /> 
                                                    </div>
                                                     <div class="col-md-3">
                                                    <input id="botoneditar" type=image src="../images/editar.png" onclick="sd();" width="30" height="30">
                                                    </div>
                                            </div></div>
                            				</div>
                            				<script>
function aparecer() {
	
	var selectBox = document.getElementById("selectBox");
    var selectedValue = selectBox.options[selectBox.selectedIndex].value;
    console.log(selectedValue);
    if(selectedValue==2){
        
	document.getElementById('empresa').style.display = 'block';
	txtRuc1.disabled=true;
	txtrazonsocial1.disabled = true;

	
	}else{
		document.getElementById('empresa').style.display = 'none';
		console.log("oculto"+document.getElementById('empresa').style.display);
		}
}
function sd(){
	
	txtRuc1.disabled=false;
	txtrazonsocial1.disabled = false;
	document.getElementById("txtrazonsocial1").readOnly = true;
	}
	
function buscarRuc(){
	  var ruc = $('#txtRuc1').val();
	 // console.log("asdasd"+dni);
	 var accion='buscarRuc';
	  $.get('http://env-3384797.jelasticlw.com.br/service/Gestionar_Empresa', {
		  
				accion : accion,
				ruc:ruc
			}, function(response) {		
				console.log("entasd"+response);
				if (response!=null) {
					console.log("entrooo");	
					console.log("ruc: "+ruc)
						$('#txtrazonsocial1').val(response['object']['razonSocial']); ; 
						//$( "#btnRegistro" ).prop( 'disabled', false );
				}else{
					$('#txtrazonsocial1').val("");
					//$( "#btnRegistro" ).prop( 'disabled', true );
					//document.getElementById("ruc").style.visibility = "visible";
					//jQuery("label[for='lblRUC']").html("El número de RUC es incorrecto o no está registrado");
				}		
	  });
}
</script>
                            				
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
                                            <input type="hidden" name="txtIdProducto"  id="txtIdProducto" form="registrar" data-required="1" class="form-control" /> 
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
                                                    <select class="form-control" id="categoria" name="categoria" disabled>
                                                        <option value="0">SELECCCIONAR</option>
                                                        <option value="1">SUSPENCION</option>
                                                        <option value="2">FUERZA</option>
                                                        <option value="3">AGILIDAD</option>
                                                        <option value="4">COORDINACION</option>
                                                        <option value="5">POTENCIA</option>
                                                        <option value="6">OTROS</option>
                                                    </select>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label class="control-label col-md-3">TIPO
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <select class="form-control" id="selectBox" onclick="aparecer();" name="select" >
                                                       
                                                        <option value="1">Boleta</option>
                                                        <option  value="2">Factura</option>
                                                        
                                                    </select>
                                                </div>
                                            </div>
                                        
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Cantidad
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6"> 
                                                
                                                    <input type="text" name="name" id="txtCantidad" data-required="1" class="form-control" maxlength="3" onkeypress="return solonumeros(event)"/> 
                                                    </div>
                                            		
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
                    
                    <table class="table table-striped table-hover table-bordered" id="table-producto2" name="table-producto2">
                                        <thead>
                                            <tr>
                                                <th> Producto</th>
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
                                       <div class="col-md-7" style="left:600px">
                                           
                                            <div class="form-group">
                                                <label class="control-label col-md-4">Monto Total<small>(Incl.IGV)</small>
                                                    <span class="required"> * </span>
                                                </label> 
                                                <div class="col-md-6">
                                                    <input type="text" name="name"  id="txtSubtotal" data-required="1"   class="form-control" disabled/> </div>
                                                                                     
                                            </div>
                                            <input type="hidden" id="txtsize" name="txtsize" form="registrar" >
                                    <!--         <div class="form-group">
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
                                            </div>--> 
                                           
                                         
                            				</div>
                   </div>
                   </div>  
                   <script type="text/javascript"> 
                   function decimal(event) {
    				this.value = parseFloat(this.value).toFixed(2);
						}
                   </script>
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
                                                   <!--  <button type="submit" class="btn green" onclick="registrarVentas();"  style="left: 160px;"> Registrar Venta
                                                        
                                                    </button> -->
                                                    <input type="submit" class="btn green" form="registrar" value="registrar Venta" style="left: 160px;">
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
       
   <script type="text/javascript">
   	</script>
          <script src="<%=request.getContextPath() %>/RegistrarVenta/ventas.js" type="text/javascript"></script>
     	  <script src="<%=request.getContextPath() %>/js/validaciones.js" type="text/javascript"></script>
          <script src="<%=request.getContextPath() %>/RegistrarVenta/modals.js" type="text/javascript"></script>
        <!-- END CONTAINER -->
        <%@ include file="/include/footer.jsp" %>
        
     
    
</body>
</html>