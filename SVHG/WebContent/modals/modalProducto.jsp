<!-- MODAL PARA LA IMAGEN -->
<script src="js/ajax_producto.js"></script>
<script src="js/validaciones.js"></script>
<div id="myModalI" class="modal1">
  <span class="close" onclick="document.getElementById('myModalI').style.display='none'">&times;X</span>
  <img class="modal-content2" id="img01">
  <div id="caption" style="width:auto;height: auto;"></div>
</div>

<!-- MODAL AGREGAR PRODUCTO -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Registrar Nuevo Producto</h4>
      </div>
      <div class="modal-body">
        <form method="post" action="Gestionar_Producto" id="productoS" enctype="multipart/form-data" onsubmit="return validacionCompleta();" >
        	<input type="hidden" name="accion" form="productoS" value="grabar">
        	<div class="form-group col-xs-12 col-md-12">
        		<label>Categoria : <b style="color:red;">*</b></label>
        		<select class="form-control" id="cat" name="cate" required >
        			
        		</select>
        	</div>
        	<div class="form-group col-xs-12 col-md-12">
        		<label>Nombre del Producto : <b style="color:red;">*</b></label>
        		<input type="text" class="form-control" placeholder="Nombre" name="nompro" id="nompro" maxlength="35" required  pattern="^\S+$" title="Nombre Invalido">
        		<b id="errorC" style="color:red;"></b>
        	</div>
        	<div class="form-group col-xs-12 col-md-12">
        		<label>Foto del Producto : </label>
        		<input type="file"  name="foto" onchange="control(this)">
        	</div>
        	<div class="form-group col-xs-12 col-md-12">
        		<label>Descripcion : <b style="color:red;">*</b></label>
        		<textarea rows="12" cols="5" class="form-control" name="descripcion" id="descripcion" style="resize:vertical; max-height:150px; min-height:150px;" required maxlength="100"  ></textarea>
        		<b id="errorC1" style="color:red;"></b>
        	</div>
        	<div class="form-group col-xs-12 col-md-12">
        		<label>Medida del Producto : <b style="color:red;">*</b></label>
        		<select name="medida" class="form-control" required>
        			<option value="UNIDAD">UNIDAD</option>
        			<option value="PAR">PAR</option>
        		</select>
        	</div>
        	<div class="form-group col-xs-6 col-md-6">
        		<label>Precio del Producto : <b style="color:red;">*</b></label>
        		<input type="text" onpaste="return false"  class="form-control" placeholder="Precio" name="prepro" required onkeypress=" return NumCheck(event,this)" maxlength="8">
        	</div>
        	<div class="form-group col-xs-6 col-md-6">
        		<label>Peso del Producto : <b style="color:red;">*</b></label>
        		<input type="text" onpaste="return false"  class="form-control" placeholder="Peso" name="pespro" required onkeypress=" return NumCheck(event,this)" maxlength="8">
        	</div>
        </form>
      </div>
      <div class="modal-footer">
      	
      	<button type="submit" class="btn  btn-success" form="productoS">Agregar Producto</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="limpiar();">Cerrar</button>
      </div>
    </div>
  </div>
</div>



<!-- MODAL ACTUALIZAR PRODUCTO -->
<div id="myModal2" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Actualizar Producto</h4>
      </div>
      <div class="modal-body" style="height: 570px;">
        <form method="post" action="Gestionar_Producto" id="productoS1" enctype="multipart/form-data" onsubmit="return validacionCompleta2();">
        	<input type="hidden" name="accion" form="productoS1" value="actualizar">
        	<input type="hidden" name="AidPro" id="AidPro" >
        	<input type="hidden" name="AcodPro" id="AcodPro">
        	<div class="form-group col-xs-12 col-md-12">
        		<label>Categoria : </label>
        		<select class="form-control" id="Acat" name="Acate" required >
        			<option value="SUSPENSIÓN1">SUSPENSIÓN</option>
        			<option value="FUERZA2">FUERZA</option>
        			<option value="AGILIDAD3">AGILIDAD</option>
        			<option value="COORDINACION4">COORDINACION</option>
        			<option value="POTENCIA5">POTENCIA</option>
        			<option value="OTROS6">OTROS</option>
        		</select>
        	</div>
        	<div class="form-group col-xs-12 col-md-12">
        		<label>Nombre del Producto : </label>
        		<input type="text" class="form-control" placeholder="Nombre" id="Anompro" name="Anompro" required  maxlength="35">
        		<b id="errorC2" style="color:red;"></b>
        	</div>
        	<div class="form-group col-xs-12 col-md-12">
        		<label>Foto del Producto : </label>
        		<input type="file"  name="Afoto" onchange="control(this)">
        		<span id="al"></span>
        	</div>
        	<div class="form-group col-xs-12 col-md-12">
        		<label>Descripcion : </label>
        		<textarea rows="12" cols="5" class="form-control" id="Adescripcion" name="Adescripcion" style="resize:vertical; max-height:150px; min-height:150px;"   pattern="^\S+$" required maxlength="100"></textarea>
        		<b id="errorC3" style="color:red;"></b>
        	</div>
        	<div class="form-group col-xs-12 col-md-12">
        		<label>Medida del Producto : </label>
        		<select name="Amedida" id="Amedida" class="form-control" required>
        			<option value="UNIDAD">UNIDAD</option>
        			<option value="PAR">PAR</option>
        		</select>
        	</div>
        	<div class="form-group col-xs-6 col-md-6">
        		<label>Precio del Producto : </label>
        		<input type="text" class="form-control" onpaste="return false" placeholder="Precio" id="Aprepro" name="Aprepro" required onkeypress="return NumCheck(event,this)">
        		
        	</div>
        	<div class="form-group  col-xs-6 col-md-6">
        		<label>Peso del Producto : </label>
        		<input type="text" class="form-control" onpaste="return false" placeholder="Peso" id="Apespro" name="Apespro" required onkeypress="return NumCheck(event,this)">
        		
        	</div>
        </form>
      </div>
      <div class="modal-footer">
      	
      	<button type="submit" class="btn btn-success" form="productoS1">Actualizar Producto</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="limpiar();">Cerrar</button>
      </div>
    </div>
  </div>
</div>


<!-- MODAL DETALLE PRODUCTO -->
<div id="myModal3" class="modal fade" role="dialog">
  <div class="modal-dialog modal-md">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Detalle del Producto</h4>
      </div>
      <div class="modal-body" style="height: 350px;">
        <form method="post" action="Gestionar_Producto" id="productoS1" enctype="multipart/form-data" >
        	
        	<div class="form-group col-xs-12 col-md-12">
        		<br>
        		<label style="font-weight: bold;font-size:medium;">Categoria : </label>
        		<label id="Dcategoria" style="font-style: italic;;font-size:medium;"></label>
        	</div>
        	<div class="form-group col-xs-12 col-md-12">
        		<br>
        		<label style="font-weight: bold;font-size:medium;">Nombre del Producto : </label>
        		<label id="Dnombre" style="font-style: italic;;font-size:medium;"></label>
        	</div>
        	<div class="form-group col-xs-6 col-md-6">
        		<br>
        		<label style="font-weight: bold;font-size:medium;">Cantidad Actual : </label>
        		<label id="Dcantidad" style="font-style: italic;;font-size:medium;"></label>
        	</div>
        	<div class="form-group col-xs-6 col-md-6">
        		<br>
        		<label style="font-weight: bold;font-size:medium;">Medida : </label>
        		<label id="Dmedida" style="font-style: italic;;font-size:medium;"></label>
        	</div>
        	<div class="form-group col-xs-6 col-md-6">
        		<br>
        		<label style="font-weight: bold;font-size:medium;">Precio del Producto : </label>
        		<label>S/.</label><label id="Dprecio" style="font-style: italic;;font-size:medium;"></label>
        	</div>
        	<div class="form-group  col-xs-6 col-md-6">
        		<br>
        		<label style="font-weight: bold;font-size:medium;">Peso del Producto : </label>
        		<label id="Dpeso" style="font-style: italic;;font-size:medium;"></label>&nbsp;&nbsp;<label> Kg.</label>
        	</div>
        </form>
      </div>
      
    </div>
  </div>
</div>

