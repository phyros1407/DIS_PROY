<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%> 
<style>
	#btn_aceptar_2:link, #btn_aceptar_2:visited {
	    background-color: #FE9A2E;
	    color: white;
	    padding: 14px 25px;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    border-radius: 4px;
	}
	
	
	#btn_aceptar_2:hover, #btn_aceptar_2:active {
	    background-color: #FE9A2E;
	}
</style>
 <!-- Modal -->
  <div class="modal fade" id="modalAgregar" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="background-color: #FE9A2E;">
          <button type="button" class="close" data-dismiss="modal" style="color:white;">&times;</button>
          <h4 class="modal-title" style="font-weight: bold; color:white;">Agregar Producto</h4>
        </div>
        <div class="modal-body">
          <p>¿Desea regresar al catálogo de Productos?</p>
        </div>
        <div class="modal-footer">
        	<a id="btn_aceptar_2" href="home.jsp">Aceptar</a>
          <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        </div>
      </div>
      
    </div>
  </div>
  