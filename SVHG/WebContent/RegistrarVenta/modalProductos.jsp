<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <!----------------------------------------------------inicio  Modal registrar producto---------------------------------->            
<!--          	<div class="modal fade" id="modalProductoRegistrar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  							 <div class="modal-dialog" role="document">
   							 <div class="modal-content">
                 				<form class="form-horizontal" >
                                      <div class="modal-header">
        						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       							 <h4 class="modal-title" id="myModalLabel">Registrar Producto</h4>
    							  </div>
                                        
                                 		<input type="hidden" maxlength="8" id="txtIdProducto2"  name="txtIdProducto" onkeypress="return solonumeros(event)" data-required="1" class="form-control" required />
                                       
                                            <div class="form-group">
                                                <label class="control-label col-md-3">COD. PRODUCTO
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="text"  id="txtCodProducto2" name="txtCodProducto" data-required="1" class="form-control" required /> </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">NOMBRE PRODUCTO
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input name="txtNombresProd" id="txtNombresProd2" type="text"    data-required="1" class="form-control" required/> </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label class="control-label col-md-3">DESCRIPCI�N
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input name="txtDescripcion" id="txtDescripcion2" type="text" class="form-control"  data-required="1"  required/> </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">PRECIO
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input name="txtPrecio" id="txtPrecio2" type="text" class="form-control"  data-required="1"  required/> </div>
                                            </div>
                                           
                                            <div class="form-group">
                                                <label class="control-label col-md-3">CATEGORIA
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <select class="form-control" name="selecCategoria2" id="selecCategoria2">
                                                      
                                                    </select>
                                                </div>
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
      			  						
                                         <button type="button" class="btn btn-default" onclick="" data-dismiss="modal">Cerrar</button>
        									<input  type="button" class="btn btn-primary"   onclick="registrarProducto()" value="Registrar Producto">
       
      										</div>   
                            				
                            		  </form>
               
               					  </div></div></div>       -->
 <!----------------------------------------------------fin  Modal registrar producto---------------------------------->
       <!---------------------------------------------------- Modal buscar producto---------------------------------->
 <div class="modal fade" id="modalProducto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="weight: 1000px;">
   
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Buscar Producto</h4>
      </div>
     
     <div id ="validarProducto" style="visibility: hidden;">
    <div class='alert alert-danger' style="margin-top: 15px;" role='alert'><label id='mensajepequeno' name='ms' >Producto Encontrado</label>
    </div>
    </div>
    
     
     									<div class="form-group">
                                                <label class="control-label col-md-2">CRITERIO DE B�SQUEDA
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-4">
                                                    <select class="form-control" id="selectCriterioP" onclick="aparecer4();"  name="selectCriterioP" >
                                                      <option value="0">SELECCIONAR</option>
                                                        <option value="1">CODIGO</option>
                                                        <option value="2">NOMBRE</option>
                                                        
                                                    </select>
                                                </div>
                                            </div>
                                            
                                           <div class="form-group">
                                                <label class="control-label col-md-2">CATEGORIA
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-4">
                                                    <select class="form-control" id="selecCategoria" onclick="aparecer3();" name="selecCategoria" >
                                                         <option value="0">SELECCIONAR</option>
                                                        <option value="1">SUSPENSION</option>
                                                        <option value="2">FUERZA</option>
                                                        <option value="3">AGILIDAD</option>
                                                         <option value="4">COORDINACION</option>
                                                          <option value="5">POTENCIA</option>
                                                           <option value="6">OTROS</option>
                                                    </select>
                                                </div>
                                            </div>
    
                                            <br>    <br>    <br>    <br>  <br>    <br>
                                            <div class="form-group">
                                                <label class="control-label col-md-2">DATO A BUSCAR
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-4">
                                                    <input type="text" name="txtDatoP"  id="txtDatoP"  class="form-control" /> </div>
                                            </div>
                                            <br><br>
                                                                    <div >
                      <p align="center">
                      <input  type="button" id="iddiv" class="btn btn-primary" data-dismiss=""  onclick="buscarCriterio();" value="Buscar Producto">            
					  </p>
					  </div>
                                            <br>    <br>  
                                             <div>
                    
                    <table class="table table-striped table-hover table-bordered"   id="table-producto" >
                                        <thead>
                                            <tr>
                                                <th> CODIGO </th>
                                                <th> NOMBRE </th>
                                                <th> PRECIO </th>
                                                <th> DESCRIPCION </th>
                                                <th> OPCION </th>
                                                
                                            </tr>
                                        </thead>
                                      
                      </table> 
                      <br><br><br>
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
      

     
    </div>
  </div>
</div>         
  <!----------------------------------- fin del modal buscar producto---------------------------------------------------------->                  
       <script>
       
       function aparecer3() {
    		
    	   var selectBox1 = document.getElementById("selecCategoria");
   	    var selectedValue = selectBox1.options[selectBox1.selectedIndex].value;
    	    console.log(selectedValue);
    	    if( selectedValue==1 || selectedValue==2 || selectedValue==3 || selectedValue==4 || selectedValue==5 || selectedValue==6){
    	        
    	    	txtDatoP.disabled = true;
    	    	document.getElementById("selectCriterioP").value = 0;
    	    	$('#txtDatoP').val("");
    	    	
    		}else{
    			txtDatoP.disabled = false;
    			}
    	}
       
       function aparecer4() {
    	   var selectBox4 = document.getElementById("selecCategoria");
      	    var selectedValue3 = selectBox4.options[selectBox4.selectedIndex].value;
    	   
   		var selectBox2 = document.getElementById("selectCriterioP");
   	    var selectedValue2 = selectBox2.options[selectBox2.selectedIndex].value;
   	    console.log(selectedValue2);
   	    if( selectedValue3==0 && selectedValue2!=0){
   	        
   	    	txtDatoP.disabled = false;
   	    	
   		}else{
   			txtDatoP.disabled = true;
   			}
   	}
      
       
       
function buscarCriterio(){

	var flagC = $('#selecCategoria').val();
var flag = $('#selectCriterioP').val();
$("#table-producto").html("<thead><tr><th>CODIGO</th><th>NOMBRE</th><th>PRECIO</th><th>DESCRIPCION</th><th>OPCION</th></tr></thead>");
console.log(flagC)
//alert("flagCategoria: "+flagC);
//alert("flag: "+flag);

var dato = $('#txtDatoP').val();
var  contador=0;
//alert("dato: "+dato);
var accion='buscarCriterio'

$.post('<%=request.getContextPath() %>/Gestionar_Producto', {
			dato:dato,
			flag: flag,
			flagC: flagC,
			accion : accion
		}, function(response) {
			if (response['object'].length!=0) {
				var i=0;
				 var conta="<tbody>";
				 if(document.getElementById("selecCategoria").value!=0){
					
					
				 for( i=0;i<response['object'].length;i++){
			    		contador++;
			    		
			    		conta=conta+("<tr><td>"+response['object'][i]['codPro']+
								"</td><td>"+response['object'][i]['nombre']+
								"</td><td>"+response['object'][i]['precio']+
								"</td><td>"+response['object'][i]['descripcion']+
								"</td><td style='display:none;'>"+response['object'][i]['categoria']+
								"</td><td style='display:none;'>"+response['object'][i]['idProducto']+
								"</td><td><input type='button'  class='btn btn-primary btn-circle' onclick='enviarDatosProducto("+response['object'][i]['idProducto']+");' value='seleccionar'>"+
								"</td><tr>");
						
					
			    	}
			    	//$("#nombreApe").html(name);
					conta=conta+("</tbody>");
					//$("#boton").html("<input type='submit' id='btnAsignar' name='btnAsignar'  class='btn btn-primary'  style='margin-left: 224px;'   value='Asignar' >");
					$("#table-producto").append(conta);

					var validarProducto = document.getElementById("validarProducto");
					validarProducto.style.visibility = "visible";
					}else{
						
							if($('#txtDatoP').val()==""){
								alert("llene campo")
							}else{
								for( i=0;i<response['object'].length;i++){
						    		contador++;
						    		
						    		conta=conta+("<tr><td>"+response['object'][i]['codPro']+
											"</td><td>"+response['object'][i]['nombre']+
											"</td><td>"+response['object'][i]['precio']+
											"</td><td>"+response['object'][i]['descripcion']+
											"</td><td style='display:none;'>"+response['object'][i]['categoria']+
											"</td><td style='display:none;'>"+response['object'][i]['idProducto']+
											"</td><td><input type='button'  class='btn btn-primary btn-circle' onclick='enviarDatosProducto("+response['object'][i]['idProducto']+");' value='seleccionar'>"+
											"</td><tr>");
									
								
						    	}
						    	//$("#nombreApe").html(name);
								conta=conta+("</tbody>");
							$("#table-producto").append(conta);
							
							var validarProducto = document.getElementById("validarProducto");
							validarProducto.style.visibility = "visible";
							$('#txtDatoP').val("");
							}
							
					
					
					}
					
					
					console.log(contador)
					//alert(contador)
					console.log ("conta:"+conta)
					
				
			}else {
				
				 $("#table-producto td").remove();
					$("#table-producto").append('<tr id="result_tr"> <td colspan="5"><center><font color=red>Producto no Encontrado</font></center></td></tr>').show();
					var validarProducto2 = document.getElementById("validarProducto");
					validarProducto2.style.visibility = "hidden";
					
					
				
			}
	
		});

}



</script>
</body>
</html>