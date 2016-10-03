<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
               <!-- ----------------------modal registrar cliente-------------------------------------------- -->
                 			<div class="modal fade" id="modalClienteRegistrar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  							 <div class="modal-dialog" role="document">
   							 <div class="modal-content">
                 				<form class="form-horizontal" >
                                      <div class="modal-header">
        						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       							 <h4 class="modal-title" id="myModalLabel">Registrar Cliente</h4>
    							  </div>
                                        
                                 		<input type="hidden" maxlength="8" id="txtIdPersona2"  name="txtIdPersona" onkeypress="return solonumeros(event)" name="txtDni1" data-required="1" class="form-control" required />
                                       
                                            <div class="form-group">
                                                <label class="control-label col-md-3">DNI
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="text" maxlength="8" id="txtDni2" onkeypress="return solonumeros(event)" name="txtDni1" data-required="1" class="form-control" required /> </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">NOMBRES
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input name="txtNombres1" id="txtNombres2" type="text" onkeypress="return sololetras(event)"   data-required="1" class="form-control" required/> </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label class="control-label col-md-3">APELLIDO PATERNO
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input name="txtApePat1" id="txtApePat2" type="text" class="form-control" onkeypress="return sololetras(event)" data-required="1"  required/> </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">APELLIDO MATERNO
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input name="txtApeMat1" id="txtApeMat2" type="text" class="form-control"onkeypress="return sololetras(event)" data-required="1"  required/> </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">CORREO
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input name="txtCorreo1" id="txtCorreo2" type="text" class="form-control" data-required="1"  required/> </div>
                                            </div>
                                            
                                         <div class="form-group">
                                                <label class="control-label col-md-3">Teléfono
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="text" name="txtTelefono1" id="txtTelefono2" data-required="1" class="form-control" maxlength="7" onkeypress="return solonumeros(event)" required/> </div>
                                            </div>
                                            
                                            
                                             <div class="form-group">
                                                <label class="control-label col-md-3">Direccion
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="text" name="txtDireccion1" id="txtDireccion2"  class="form-control" data-required="1"  required /> </div>
                                            </div>
                                          <div id ="registro" style="visibility: hidden;">
    										<div class='alert alert-danger' style="margin-top: 15px;" role='alert'><label id='mensajepequeno' name='ms' >El Cliente ya se encuentra Registrado</label>
   											 </div>
    											</div>
    											<div id ="validar" style="visibility: hidden;">
    										<div class='alert alert-danger' style="margin-top: 15px;" role='alert'><label id='mensajepequeno' name='ms' > Por favor ingrese todos los campos</label>
   											 </div>
    											</div>
                                         <div class="modal-footer">
      			  						
                                         <button type="button" class="btn btn-default" onclick="limpiarRegistro();" data-dismiss="modal">Cerrar</button>
        									<input  type="button" class="btn btn-primary"   onclick="registrarCliente();" value="Registrar Cliente">
       
      										</div>   
                            				
                            		  </form>
               
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
       <div id ="error" style="visibility: hidden;">
    <div class='alert alert-danger' style="margin-top: 15px;" role='alert'><label id='mensajepequeno' name='ms' >El dni No existe</label>
    </div>
    </div>
     <div id ="validardni" style="visibility: hidden;">
    <div class='alert alert-danger' style="margin-top: 15px;" role='alert'><label id='mensajepequeno' name='ms' >Ingrese un Nro. de Dni</label>
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
$("#table-cliente").html("<thead><tr><th>DNI</th><th>NOMBRES</th><th>APELLIDO PATERNO</th><th>APELLIDO MATERNO</th><th>OPCION</th></tr></thead>");
var  contador=0;
//alert("flag: "+dato);
var accion='buscarCriterio'

$.post('<%=request.getContextPath() %>/ServletCliente', {
	
	dato:dato,
			flag: flag,
			accion : accion
		}, function(response) {
			if (response!=null) {
				var i=0;
				 var conta="<tbody>";
			    	for( i=0;i<response['object'].length;i++){
			    		contador++;
			    		//<input id='jalar' type='hidden' value='"+response['object'][i]['id']+"'>
			    		conta=conta+("<tr><td>"+response['object'][i]['dni']+
								"</td><td>"+response['object'][i]['nombre']+
								"</td><td>"+response['object'][i]['apePat']+
								"</td><td>"+response['object'][i]['apeMat']+
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
					console.log(contador)
					//alert(contador)
					console.log (conta)

			}else {
				alert("no existe");
				
				 error.style.visibility = "visible";		
			}
	
		});

}
</script>
</body>
</html>