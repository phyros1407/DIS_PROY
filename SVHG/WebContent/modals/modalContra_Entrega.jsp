
<div id="contra_entrega" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Contra_Entrega</h4>
      </div>
      <div class="modal-body">
        <h3><b>Facturacion elegida</b></h3>
        <label id="ce_facturacion"></label>
      </div>
      <div class="modal-footer">
      	<form id="form_generar_pedido" method="post" action="ServletGenerarPedido">
      		<input type="text" value="CE" name="tipo_pago">
      	</form>
      		<button type="button" onclick="ejecutarForm('#form_generar_pedido');" class="btn btn-default">Generar Pedido</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
      </div>
    </div>
  </div>
</div>