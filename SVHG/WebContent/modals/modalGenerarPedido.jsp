<div class="modal fade" id="ModalModDir" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
	         <div class="modal-header" style="background-color: #FE9A2E;">
	          <button type="button" class="close" data-dismiss="modal" style="font-weight: bold; color:white;">&times;</button>
	          <h4 class="modal-title" style="font-weight: bold; color:white;">Actualizar Dirección Envio</h4>
	        </div>
	        <div class="modal-body">
	          	<h3>Dirección de Envio:</h3>
				<form class="form-horizontal" id="form1">
					<div class="form-group">
						<div class="col-xs-2 col-sm-2">
							<label id="titulitos">Tipo de Dirección</label>
						</div>
						<div class="col-xs-4 col-sm-4">
							<select class="form-control" id="tipo_direccion_mod">
									<option>Avenida</option>
									<option>Jirón</option>
									<option>Calle</option>
								</select>
						</div>
						<div class="col-xs-2 col-sm-2">
							<label id="titulitos">Departamento</label>
						</div>
						<div class="col-xs-4 col-sm-4">
							<select class="form-control" id="departamento_mod" onchange="cargarPros(this.value,'#provincia_mod');">
								
							</select>
						</div>
						
					</div>
					<div class="form-group">
						<div class="col-xs-2 col-sm-2">
							<label id="titulitos">Dirección </label>
						</div>
						<div class="col-xs-4 col-sm-4">
							<input type="text"id="direccion_mod" class="form-control">
						</div>
						<div class="col-xs-2 col-sm-2">
							<label id="titulitos">Provincia</label>
						</div>
						<div class="col-xs-4 col-sm-4" >
							<select class="form-control" id="provincia_mod" onchange="cargarDist(this.value,'#distrito_mod');">
								
							</select>
						</div>
						
						
					</div>
					<div class="form-group">
						<div class="col-xs-2 col-sm-2">
							<label id="titulitos">Referencia </label>
						</div>
						<div class="col-xs-4 col-sm-4">
							<input class="form-control" type="text" id="referencia_mod">
						</div>
						<div class="col-xs-2 col-sm-2">
							<label id="titulitos">Distrito </label>
						</div>
						<div class="col-xs-4 col-sm-4">
							<select class="form-control" id="distrito_mod">
								
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-2 col-sm-2">
							<label id="titulitos">Teléfono Celular</label>
						</div>
						<div class="col-xs-4 col-sm-4">
							<input type="text" id="telefono1_mod" class="form-control" onkeyup="validarTelefono(this.value,deserror3.value);" onkeypress="return solonumeros(event);">
							<b id="error3" style="color:red;"></b><input type="hidden" id="deserror3" value="error3">
						</div>
						<div class="col-xs-2 col-sm-2">
							<label id="titulitos">Otro Teléfono </label>
						</div>
						<div class="col-xs-4 col-sm-4">
							<input class="form-control" type="text" id="telefono2_mod" onkeyup="validarTelefono(this.value,deserror4.value);" onkeypress="return solonumeros(event);">
							<b id="error4" style="color:red;"></b><input type="hidden" id="deserror4" value="error4">
						</div>
					</div>
					<br>
					<br>
				</form>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-primary" onclick="changeDir();">Actualizar Información</button>
	          <button style="border-radius:4px;margin-top:15px;" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
      	</div>
    </div>
</div>