  
  
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
			  <div class="form-group col-sm-12 col-xs-12">
			  	<div class="input-group">
			  		<span class="input-group-addon" id="search-query"><span class="glyphicon glyphicon-credit-card"></span></span>
			  		<input class="form-control" type="text" maxlength="16" placeholder="Numero de Tarjeta" onkeypress="return solonumeros(event);" aria-describedby="search-query">
			  	</div>
			  	<br>
			  	<div class="input-group">
			  		<span class="input-group-addon" id="search-query"><span class="glyphicon glyphicon-calendar"></span></span>
			  		<select class="form-control  col-sm-6 col-xs-6" name="mesCad" >
			  			<option value="00">MM</option>
			  			<option value="01">01</option>
			  			<option value="02">02</option>
			  			<option value="03">03</option>
			  			<option value="04">04</option>
			  			<option value="05">05</option>
			  			<option value="06">06</option>
			  			<option value="07">07</option>
			  			<option value="08">08</option>
			  			<option value="09">09</option>
			  			<option value="10">10</option>
			  			<option value="11">11</option>
			  			<option value="12">12</option>
			  		</select>
			  		<select class="form-control col-sm-6 col-xs-6" name="mesCad" id="mesCad">
			  			
			  		</select>
			  	</div>
			  	<div class="input-group">
			  		<span class="input-group-addon" id="search-query"><span class="glyphicon glyphicon-piggy-bank"></span></span>
			  		<input class="form-control col-sm-6 col-xs-6" maxlength="3" onkeypress="return solonumeros(event);" placeholder="CVC" aria-describedby="search-query"> 
			  	</div>
			  </div>
		  </form>
        </div>
        <div class="modal-footer" style="text-align:center;">
          <button class="btn btn-primary" style="border-radius: 5px;">Pagar Monto S/170.00</button>
        </div>
      </div>
    </div>
  </div>