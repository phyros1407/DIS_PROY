  
  
  <head>
  	<style>
  		#search-icon {
  			background-color: transparent;
		}

		#search-icon input {
  			border-left: 0;
		}
  	</style>
  </head>
  
  <!-- MODAL TARJETA-->
  <div class="modal fade" id="modalTarjeta" role="dialog">
    <div class="modal-dialog modal-sm">
    
      <div class="modal-content" >
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Detalles de la Tarjeta</h4>
        </div>
        <div class="modal-body" style="height: 140px;" >
          <form class="form-horizontal">
			  <div class="form-group col-sm-12">
			  	<div class="input-group">
			  		<span class="input-group-addon" id="search-query"><span class="glyphicon glyphicon-credit-card"></span></span>
			  		<input class="form-control" type="text" placeholder="Numero de Tarjeta" onkeypress="return solonumeros(event);" aria-describedby="search-query">
			  	</div>
			  	<br>
			  	<div class="input-group">
			  		<span class="input-group-addon" id="search-query"><span class="glyphicon glyphicon-calendar"></span></span>
			  		<input class="form-control col-sm-6" type="month" placeholder="MM/YY" aria-describedby="search-query">
			  	</div>
			  	<div class="input-group">
			  		<span class="input-group-addon" id="search-query"><span class="glyphicon glyphicon-piggy-bank"></span></span>
			  		<input class="form-control col-sm-6" maxlength="3" onkeypress="return solonumeros(event);" placeholder="CVC" aria-describedby="search-query"> 
			  	</div>
			  </div>
		  </form>
        </div>
        <div class="modal-footer" style="text-align:center;">
          <button class="btn btn-default" >Pagar Monto S/170.00</button>
        </div>
      </div>
    </div>
  </div>