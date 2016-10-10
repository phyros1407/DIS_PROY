  
  
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
  

  <script>
  
  	function tip_tar(tarjeta){
  		
  		if(tarjeta=="credito"){
  			
  			$("#mybody").animate({
  				'height': '200px'
  			});
  			$("#cuotas").fadeIn(500);
  		}else{
  			
  			$("#mybody").animate({
  				'height': '150px'
  			});
  			$("#cuotas").fadeOut(500);
  		}
  		
  	}
  	
  </script>
  <!-- MODAL TARJETA-->
  <div class="modal fade" id="modalTarjeta" role="dialog">
    <div class="modal-dialog modal-md">
    
      <div class="modal-content" >
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Detalles de la Tarjeta</h4>
        </div>
        <div class="modal-body" style="height:150px;" id="mybody" >
            <form>
          	    <div class="form-group col-sm-6 col-xs-6">
          	  	  <select class="form-control" id="tipo_tarjeta" onchange="tip_tar(this.value)">
          	  		  <option value="debito">Debito</option>
          	  		  <option value="credito">Credito</option>
          	  	  </select>
          	    </div>
          	    <div class="form-group col-sm-6 col-xs-6">
          	  	  <select class="form-control" id="marca_tarjeta">
          	  		  <option value="visa"> Visa</option>
          	  		  <option value="mastercard">Mastercard</option>
          	  	   </select>
          	    </div>
			    <div class="form-group col-sm-12 col-xs-12">
			  	  <div class="input-group">
			  		  <span class="input-group-addon" id="search-query"><span class="glyphicon glyphicon-credit-card"></span></span>
			  		  <input class="form-control" type="text" maxlength="16" placeholder="Numero de Tarjeta" onkeypress="return solonumeros(event);" aria-describedby="search-query">
			  	  </div>
			    </div>
			  	<br>
			  	<div class="form-group col-sm-4 col-xs-4">
			  		<div class="input-group ">
				  		<span class="input-group-addon" id="search-query"><span class="glyphicon glyphicon-calendar"></span></span>
				  		<select class="form-control " name="mesCad" >
				  			<option value="">MM</option>
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
			  		</div>
			  	</div>
			  	<div class="form-group col-sm-4 col-xs-4">
				  	<div class="input-group">
				  		<span class="input-group-addon" id="search-query"><span class="glyphicon glyphicon-calendar"></span></span>
				  		<select class="form-control " name="anioCad" id="anioCad">
				  			<!-- SE LLENA CON AJAX -->
				  		</select>
				  	</div>
			  	</div>
			  	<div class="form-group col-sm-4 col-xs-4">
			  		<div class="input-group">
				  		<span class="input-group-addon" id="search-query"><span class="glyphicon glyphicon-lock"></span></span>
				  		<input class="form-control" maxlength="3" onkeypress="return solonumeros(event);" placeholder="CVC" aria-describedby="search-query"> 
			  		</div>
			  	</div>
			  	<div class="form-group col-sm-6 col-xs-6" style="display:none;"  id="cuotas"  >
			  		<div class="input-group" >
				  		<span class="input-group-addon" id="search-query"><span class="glyphicon glyphicon-piggy-bank"></span></span>
				  		<input class="form-control" maxlength="1" onkeypress="return solonumeros(event);" placeholder="Cuotas" id="cuota_tarjeta" aria-describedby="search-query"> 
			  		</div>
			  	</div>
		  </form>
        </div>
        <div class="modal-footer" >
          <button class="btn btn-primary" style="border-radius:4px;">Pagar Monto S/170.00</button>
          <button class="btn btn-default" data-dismiss="modal" style="border-radius:4px;margin-top:15px;">Cancelar</button>
        </div>
      </div>
    </div>
  </div>