  
  
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
  

  function actualizarCuota(cuota){
		
		$("#cuota_form").val(cuota);
		
	}
  
  	function tip_tar(tarjeta){
  		
  		
  		if(tarjeta=="credito"){
  			$("#cuota_form").val("0");
  			$("#cuota_tarjeta").val("0");
  			$("#mybody").animate({
  				'height': '200px'
  			});
  			
  			$("#cuotas").fadeIn(500);
  		}else{
  			$("#cuota_form").val("0");
  			$("#cuota_tarjeta").val("0");
  			$("#mybody").animate({
  				'height': '150px'
  			});
  			
  			$("#cuotas").fadeOut(500);
  		}
  		
  	}
  	
  </script>
 
  <!-- MODAL TARJETA-->
  <div class="modal fade" id="modalTarjeta" role="dialog" data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog modal-md">
    
      <div class="modal-content" >
        <div class="modal-header" style="background-color: #FE9A2E;">
          <button type="button" class="close" data-dismiss="modal" style="font-weight: bold; color:white;">&times;</button>
          <h4 class="modal-title" style="font-weight: bold; color:white;">Detalles de la Tarjeta</h4>
        </div>
        <div class="modal-body" style="height:150px;" id="mybody" >
        	<div class="cuerpo">
        		<form>
	          	    <div class="form-group col-sm-6 col-xs-6">
	          	  	  <select class="form-control" id="tipo_tarjeta" onchange="tip_tar(this.value);">
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
				  		  <input id="num_tar" class="form-control" type="text" maxlength="16" placeholder="Numero de Tarjeta" onkeypress="return solonumeros(event);" aria-describedby="search-query">
				  	  </div>
				    </div>
				  	<br>
				  	<div class="form-group col-sm-4 col-xs-4">
				  		<div class="input-group ">
					  		<span class="input-group-addon" id="search-query"><span class="glyphicon glyphicon-calendar"></span></span>
					  		<select class="form-control " name="mesCad" id="mesCad">
					  			<option value="1">01</option>
					  			<option value="2">02</option>
					  			<option value="3">03</option>
					  			<option value="4">04</option>
					  			<option value="5">05</option>
					  			<option value="6">06</option>
					  			<option value="7">07</option>
					  			<option value="8">08</option>
					  			<option value="9">09</option>
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
					  		<input class="form-control" maxlength="3" onkeypress="return solonumeros(event);" placeholder="CVC" id="cvc" aria-describedby="search-query"> 
				  		</div>
				  	</div>
				  	<div class="form-group col-sm-6 col-xs-6" style="display:none;"  id="cuotas"  >
				  		<div class="input-group" >
					  		<span class="input-group-addon" id="search-query"><span class="glyphicon glyphicon-piggy-bank"></span></span>
					  		<input id="cvc" value="0" class="form-control" maxlength="1" onkeypress="return solonumeros(event);" onkeyup="actualizarCuota(this.value);" placeholder="Cuotas" id="cuota_tarjeta" aria-describedby="search-query"> 
				  		</div>
				  	</div>
			  </form>
        	</div>
        </div>
        <div class="modal-footer" >
          <form method="post" action="ServletGenerarPedido" id="generar_pedido_tarjeta">
          	<input type="hidden" value="TA" name="tipo_pago">
          </form>
          <span id="precargatar" style="margin-right:10px;"></span><button class="btn btn-primary" id="pagar_tarjeta" onclick="pagar();" style="border-radius:4px;">Pagar Monto</button>
          <button class="btn btn-default" data-dismiss="modal" style="border-radius:4px;margin-top:15px;" id="closer">Cancelar</button>
        </div>
      </div>
    </div>
  </div>