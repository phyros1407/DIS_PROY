<%@page pageEncoding="UTF-8"%> 
<div id="contra_entrega" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content" id="modal_con_ent">
      <div class="modal-header" style="background-color: #FE9A2E;">
        <button type="button" class="close" data-dismiss="modal" style="font-weight: bold; color:white;">&times;</button>
        <h4 class="modal-title" style="font-weight: bold; color:white;">Contra Entrega</h4>
      </div>
      <div class="modal-body">
      	<div class="cuerpo">
      		<div><h3><b>Facturación elegida</b></h3> <span class="glyphicon glyphicon-modal-window" style="font-size:20px;"></span> <label id="ce_facturacion" style="font-size:20px; text-transform: uppercase;"></label></div>
        	<p>Usted puede solicitar "Cancelar Pedido" en la opción Pedidos en un plazo de 2 horas, despúes la opción no se encontrará disponible.</p>
        	<p>Debe acercarse al establecimiento ubicado en JR. INDEPENDENCIA para realizar el pago correspondiente y retirar su pedido. </p>
      		<p>Los pedidos que superen los 4 días de inactividad seran anulados automaticamente.</p>
      	</div>
      </div>
      <div class="modal-footer">
      	<div class="foot">
      		<form id="form_generar_pedido" method="post" action="ServletGenerarPedido">
      		<input type="hidden" value="CE" name="tipo_pago">
	      	</form>
	      	<span></span><button type="button" onclick="ejecutarForm('#form_generar_pedido');" id="con_ent" style="border-radius:4px;margin-bottom:15px;"  class="btn btn-primary">Generar Pedido</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
      	</div>
      </div>
    </div>
  </div>
</div>