  

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
				<div>
					<table id="myTable">
						<thead>
							<tr>
								<th>CODIGO PEDIDO</th>
								<th>NOMBRE DEL CLIENTE</th>
								<th>FECHA PEDIDO</th>
								<th>ESTADO</th>
								<th>OPCION</th>
								
							</tr>
						</thead>
						<tbody>
									<tr>
										<td>12341</td>
										<td>rhonnald</td>
										<td>2016-09-09</td>
										<td>Pendiente</td>
										<td> <Button class="btn green"  data-toggle="modal" data-target="#modalCambiarEstado" style="left: 160px;" > 
                                                    Cambiar
                                                        
                                                    </Button></td>
									</tr>
									<tr>
										<td>1231</td>
										<td>rhonnald</td>
										<td>2016-09-09</td>
										<td>terminado</td>
										<td> <Button class="btn green"  data-toggle="modal" data-target="#modalCambiarEstado" style="left: 160px;" > 
                                                    Cambiar
                                                        
                                                    </Button></td>
									</tr>
							
						</tbody>
					</table>

				</div>

				<div class="clearfix"></div>

			</div>
			<!-- END CONTENT -->
			<!-- BEGIN QUICK SIDEBAR -->

			<!-- END QUICK SIDEBAR -->
		</div>
	</div>
	<!-- END CONTAINER -->
	<%@ include file="include/footer.jsp"%>

	             <!-- ----------------------modal cambiar estado-------------------------------------------- -->
                 			<div class="modal fade" id="modalCambiarEstado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  							 <div class="modal-dialog" role="document">
   							 <div class="modal-content">
                 				<form class="form-horizontal" >
                                      <div class="modal-header">
        						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       							 <h4 class="modal-title" id="myModalLabel">Cambiar Estado</h4>
    							  </div>
                                        
                                 		<input type="hidden" maxlength="8" id="txtIdPersona2"  name="txtIdPersona" onkeypress="return solonumeros(event)" name="txtDni1" data-required="1" class="form-control" required />
                                       
                                            <div class="form-group">
                                                <label class="control-label col-md-3">CODIGO PEDIDO
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input type="text" maxlength="8" id="txtPedido" onkeypress="return solonumeros(event)" name="txtPedido" data-required="1" class="form-control" disabled /> </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">NOMBRE
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input name="txtNombres1" id="txtNombres2" type="text" onkeypress="return sololetras(event)"   data-required="1" class="form-control" disabled/> </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label class="control-label col-md-3">APELLIDO PATERNO
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input name="txtApePat1" id="txtApePat2" type="text" class="form-control" onkeypress="return sololetras(event)" data-required="1"  disabled/> </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">APELLIDO MATERNO
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <input name="txtApeMat1" id="txtApeMat2" type="text" class="form-control"onkeypress="return sololetras(event)" data-required="1"  disabled/> </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">ESTADO
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-6">
                                                    <select class="form-control" id="selectCategoria" name="select" >
                                                        <option>Pendiente</option>
                                                        <option>Terminado</option>
                                                        <option>En proceso</option>
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
      			  						
                                         <button type="button" class="btn btn-default" onclick="limpiarRegistro();" data-dismiss="modal">Cerrar</button>
        									<input  type="button" class="btn btn-primary"   onclick="registrarCliente();" value="Modificar ">
       
      										</div>   
                            				
                            		  </form>
               
               					  </div></div></div>
               
 <!--------------------------------------------------------------fin cambiar estado-------------------------------------->
<script type="text/javascript">
$(document).ready(function(){
    $('#myTable').DataTable();
});
</script>
</body>



</html>