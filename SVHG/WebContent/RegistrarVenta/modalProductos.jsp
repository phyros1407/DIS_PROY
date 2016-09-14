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
         	<div class="modal fade" id="modalProductoRegistrar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
                                                <label class="control-label col-md-3">DESCRIPCIÓN
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
                                                    <select class="form-control" name="selectCategoria" id="selectCategoria2">
                                                      
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
               
               					  </div></div></div>      
 <!----------------------------------------------------fin  Modal registrar producto---------------------------------->
       <!---------------------------------------------------- Modal buscar producto---------------------------------->
 <div class="modal fade" id="modalProducto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    <form >
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Buscar Producto</h4>
      </div>
       <div id ="error" style="visibility: hidden;">
    <div class='alert alert-danger' style="margin-top: 15px;" role='alert'><label id='mensajepequeno' name='ms' >El dni No existe</label>
    </div>
    </div>
     <div id ="validardni" style="visibility: hidden;">
    <div class='alert alert-danger' style="margin-top: 15px;" role='alert'><label id='mensajepequeno' name='ms' >Ingrese un Nro. de Dni</label>
    </div>
    </div>
     	<div class="form-group">
                                                <label class="control-label col-md-5">CRITERIO DE BÚSQUEDA
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <select class="form-control" id="selectCriterio" name="selectCriterio" >
                                                        <option>CODIGO</option>
                                                        <option>NOMBRE</option>
                                                        <option>CATEGORIA</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <br>    <br>    <br>    <br> 
                                            <div class="form-group">
                                                <label class="control-label col-md-5">DATO A BUSCAR
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="text" name="name"  id="txtdatoBuscar" data-required="1" class="form-control" /> </div>
                                            </div>
                                            <br><br>
                                                                    <div >
                      <p align="center">
                      <input  type="button" id="iddiv" class="btn btn-primary" data-dismiss=""  onclick="buscar1();" value="Buscar Producto">            
					  </p>
					  </div>
                                            <br>    <br>  
                                             <div>
                    
                    <table class="table table-striped table-hover table-bordered" id="table-cliente" name="table-cliente">
                                        <thead>
                                            <tr>
                                                <th> CODIGO </th>
                                                <th> NOMBRE </th>
                                                <th> PRECIO </th>
                                                <th> DESCRIPCION </th>
                                                <th> OPCION </th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                           
                                           
                                        </tbody>
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
      

      
      </form>
    </div>
  </div>
</div>         
  <!----------------------------------- fin del modal buscar producto---------------------------------------------------------->                  
       
</body>
</html>