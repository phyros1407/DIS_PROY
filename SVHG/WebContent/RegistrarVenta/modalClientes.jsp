<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
               <!-- ----------------------modal registrar cliente-------------------------------------------- -->
                 			<div class="modal fade" id="modalClienteRegistrar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  							 <div class="modal-dialog modal-lg" role="document">
   							 <div class="modal-content">
                 				<div class="form-horizontal" >
                                      <div class="modal-header">
        						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       							 <h4 class="modal-title" id="myModalLabel">Registrar Cliente</h4>
    							  </div>
    							<div class="modal-body col-md-12">
    								<div class="col-md-12 portlet light portlet-fit bordered" >
    								<br> <br>
    								<div class="col-md-6">
                                                <label class="control-label col-md-6">Persona
                                                   
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="radio" id="rdnpersona"  name="rdn" onclick="aparecer3();" value="1" data-required="1" class="form-control"  /> </div>
                                            	
                                     </div>
                                     <div class="col-md-6">
                                                <label class="control-label col-md-6">Empresa
                                                   
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="radio" id="rdnempresa"  name="rdn"  onclick="aparecer2();" value="1" data-required="1" class="form-control"  /> </div>
                                            	
                                     </div>
                                       
                                       
    								</div>
    							
                                         <div class="col-md-6">
                                           <br>
                                 		<input type="hidden" maxlength="8" id="txtIdPersona2"  name="txtIdPersona" onkeypress="return solonumeros(event)" name="txtDni1" data-required="1" class="form-control" required />
                                       
                                            <div class="form-group">
                                                <label class="control-label col-md-4">DNI
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="text"  maxlength="8"  id="txtDni5" onkeyup="buscardni()" onkeypress="return solonumeros(event)" name="txtDni1" data-required="1" class="form-control"  /> </div>
                                            	<input id="botonbuscar" type="image" src="../images/buscarP.png" onclick="buscarReniec();" width="30" height="30">
                                            </div>
                                             
                                            <div class="form-group">
                                                <label class="control-label col-md-4">NOMBRES
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input name="txtNombres2" id="txtNombres2" type="text"  onkeypress="return sololetras(event)"   data-required="1" class="form-control"  disabled/> </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label class="control-label col-md-4">APELLIDO PATERNO
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input name="txtApePat2" id="txtApePat2" type="text" class="form-control" onkeypress="return sololetras(event)" data-required="1"   disabled/> </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-4">APELLIDO MATERNO
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input name="txtApeMat2" id="txtApeMat2" type="text" class="form-control"onkeypress="return sololetras(event)" data-required="1"   disabled/> </div>
                                            </div>
                                            </div>
                                            
                                               <div class="col-md-6">
                                               <br>
                                            <div class="form-group">
                                                <label class="control-label col-md-4">CORREO
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input name="txtCorreo2" id="txtCorreo2" onkeyup="buscarCorreo()" type="text" class="form-control" data-required="1"  /> </div>
                                            </div>
                                            
                                         <div class="form-group">
                                                <label class="control-label col-md-4">TELÉFONO <br>(Fijo o Celular)
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="text" name="txtTelefono2" id="txtTelefono2" data-required="1" class="form-control" maxlength="9" onkeypress="return solonumeros(event)" /> </div>
                                            </div>
                                            
                            
    									</div>
    										<div class="col-md-12 portlet light portlet-fit bordered" id="empresa2" Style="visibility: hidden;">
    										<br>
    										 <div class="col-md-6">
    										  <div class="form-group">
                                                <label class="control-label col-md-4">RUC
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input name="txtruc2" id="txtruc2" type="text" onkeypress="return solonumeros(event)"    class="form-control" /> </div>
                                          			<input id="botonbuscarEmp" type="image" src="../images/buscarE.png" onclick="buscarRuc3();" width="35" height="35">
                                            </div>
                                             </div>
                                             <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-4"> RAZON SOCIAL
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input name="txtrazon2" id="txtrazon2" type="text" class="form-control" onkeypress="return sololetras(event)"    disabled/> </div>
                                            </div>
    										 </div>
    										 </div>
    									 </div>
                                         <div class="modal-footer">
      			  						
                                         <button type="button" class="btn btn-default" onclick="limpiarRegistro();" data-dismiss="modal">Cerrar</button>
        									<input  type="button" class="btn btn-primary"   onclick="registrarCliente();" value="Registrar Cliente">
       
      										</div>   
                            				 	
                            		  </div>
               
               					  </div></div></div>
               
 <!--------------------------------------------------------------fin registrar cliente modal-------------------------------------->
 <!-------------------------------------------------------------------------- modal buscar cliente--------------------------------->      
   <div class="modal fade" id="modalCliente" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    <form >
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Buscar Cliente</h4>
      </div>
      
     <div id ="validardni" style="visibility: hidden;">
    <div class='alert alert-danger' style="margin-top: 15px;" role='alert'><label id='mensajepequeno' name='ms' >Cliente Encontrado</label>
    </div>
    </div>
      <div class="modal-body">
	      
	        							<div class="form-group">
                                                <label class="control-label col-md-5">CRITERIO DE BÚSQUEDA
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <select class="form-control" id="selectCriterio" name="selectCriterio" >
                                                        <option value="0">SELECCIONAR</option> 
                                                        <option value="1">DNI</option>
                                                        <option value="2">NOMBRE</option>
                                                        <option value="3">APELLIDOS</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <br>    <br>    <br>    <br> 
                                            <div class="form-group">
                                                <label class="control-label col-md-5">DATO A BUSCAR
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="text" name="name"  id="txtDatoC" data-required="1" class="form-control" /> </div>
                                            </div>
                                             <br>    <br>
                                             <div >
                      <p align="center">
                      <input  type="button" id="iddiv" class="btn btn-primary" data-dismiss=""  onclick="buscarCriterioCliente();" value="Buscar Cliente">            
					  </p>
					  </div>
                                            <br>    <br>  
                                            
                                             <div>
                    
                    <table class="table table-striped table-hover table-bordered" id="table-cliente" name="table-cliente">
                                        <thead>
                                            <tr>
                                                <th> DNI </th>
                                                <th> NOMBRES </th>
                                                <th> APELLIDO PATERNO </th>
                                                <th> APELLIDO MATERNO </th>
                                                <th> OPCION </th>
                                                
                                            </tr>
                                        </thead>
                                        
                      </table> 
                      <br><br><br>
                       </div>             
                     
     </div>
	
		  	<br/>
			<br/>
      <div id ="encontroCliente" style="visibility: hidden;">
    <div class='alert alert-danger' style="margin-top: 15px;" role='alert'><label id='mensajepequeno' name='ms' >El Cliente se Encontro</label>
    </div>
    </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" onclick="limpiarBuscar();" data-dismiss="modal">Cerrar</button>
        
      </div>
      

      
      </form>
    </div>
  </div>
</div>
<!--------------------------------------------------------------fin del modal buscarCliente-------------------------------------->  


<script>
function buscarCriterioCliente(){
var flag = $('#selectCriterio').val();
//alert("flag: "+flag);
var dato = $('#txtDatoC').val();
if(document.getElementById("selectCriterio").value==0){
alert("seleccione opcion");



var  contador=0;
//alert("flag: "+dato);

}else{
	if( $('#txtDatoC').val()==""){
		alert("llene el campo")
	}else{	
	$("#table-cliente").html("<thead><tr><th>DNI</th><th>NOMBRES</th><th>APELLIDO PATERNO</th><th>APELLIDO MATERNO</th><th>OPCION</th></tr></thead>");		
var accion='buscarCriterio'

$.post('<%=request.getContextPath() %>/ServletCliente', {
	
	dato:dato,
			flag: flag,
			accion : accion
		}, function(response) {
			
			
			if (response['object'].length!=0) {
				var co=0;
				var i=0;
				 var conta="<tbody>";
			
			    	for( i=0;i<response['object'].length;i++){
			    		contador++;
			    		//<input id='jalar' type='hidden' value='"+response['object'][i]['id']+"'>
			    		conta=conta+("<tr><td>"+response['object'][i]['dni']+
								"</td><td>"+response['object'][i]['nombre']+
								"</td><td>"+response['object'][i]['apePat']+
								"</td><td>"+response['object'][i]['apeMat']+
								"</td><td style='display:none;'>"+response['object'][i]['idusuario']+
								"</td><td style='display:none;'>"+response['object'][i]['correo']+
								"</td><td style='display:none;'>"+response['object'][i]['telefono']+
								"</td><td style='display:none;'>"+response['object'][i]['direccion']+
								"</td><td style='display:none;'><input id=jalar"+i+" type='text' value='"+response['object'][i]['id']+"'>"+response['object'][i]['id']+
								"</td><td><input type='button' class='btn btn-primary btn-circle'   onclick='enviarDatos("+response['object'][i]['id']+");' value='seleccionar'>"+
								"</td><tr>");
					
						
			    	}
			    
			    	//$("#nombreApe").html(name);
					conta=conta+("</tbody>");
					
					//$("#boton").html("<input type='submit' id='btnAsignar' name='btnAsignar'  class='btn btn-primary'  style='margin-left: 224px;'   value='Asignar' >");
					$("#table-cliente").append(conta);
					
					
					//alert(co)
					console.log (conta)
					var validardni = document.getElementById("validardni");
  	  								validardni.style.visibility = "visible";
  	  								
			}else {
				var validardni = document.getElementById("validardni");
				validardni.style.visibility = "hidden";
				 $("#table-cliente td").remove();
			$("#table-cliente ").append('<tr id="result_tr"> <td colspan="5"><center><font color=red>Cliente no Encontrado</font></center></td></tr>').show();
			 
					//$('#table-cliente').find('.black').hide();
			 
			}
	
		});
		}
}

}




function buscardni(){
	 var txtDni = $('#txtDni5').val();
	 
	 var accion='buscardni';
	  $.post('<%=request.getContextPath() %>/ServletCliente', {
		  txtDni : txtDni,
				accion : accion
			}, function(response) {
				
				if (response.success==true) {
						//document.getElementById("divClave").innerHTML="<input type=email class=form-control onchange=buscarCorreo() autofocus name=txtCorreo id=txtCorreo>";
						alert("El dni esta en uso. Vuelva a intentar con otro dni.")
						$('#txtDni5').val("");
					}else{
		
				//alert("Correo valido");
					}	
	  });
  }

</script>
  <script src="<%=request.getContextPath() %>/RegistrarVenta/busquedasServicios.js" type="text/javascript"></script>
</body>
</html>