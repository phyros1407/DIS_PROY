<!-- Modal -->
	<script type="text/javascript">
		var cates= [];
		
		function categorias(){
			
			var accion = "listarCat";
			
			$.get('Gestionar_Producto',{	
				accion : accion
			},function(response){
				
				cates = new Array(response['object'].length);
				
				var conta="";
				for( var i=0;i<response['object'].length;i++){
					cates[i]=response['object'][i]['tipo'];
					conta=conta+("<option value="+response['object'][i]['tipo']+response['object'][i]['idCategoria']+">"+response['object'][i]['tipo']+"</option>");
				}
				$('#cat').html(conta);
			});
			
		}
		function buscarProducto(id){
				
				var accion = "buscar";
				var id = id;
				
				$.post('Gestionar_Producto',{	
					accion : accion,
					id : id
				},function(response){
					
					var id = response['object']['idProducto'];
					var idcategoria = response ['object']['idCategoria'];
					var tipocategoria = response ['object']['categoria'];
					var codpro = response ['object']['codPro'];
					var nombre = response['object']['nombre'];
					var descripcion = response['object']['descripcion'];
					var medida = response['object']['medida'];
					var precio = response['object']['precio'];
					var peso = response['object']['peso'];
					
					
					$('#AidPro').val(id);
					$('#AcodPro').val(codpro);
					$('#Acat').val(tipocategoria+idcategoria);
					$('#Anompro').val(nombre);
					$('#Adescripcion').val(descripcion);
					$('#Amedida').val(medida);
					$('#Aprepro').val(precio);
					$('#Apespro').val(peso);
				});	
		 }
		
		
		function buscarDProducto(id){
			
			var accion = "buscar";
			var id = id;
			
			$.post('Gestionar_Producto',{	
				accion : accion,
				id : id
			},function(response){
				
				var nombre = response['object']['nombre'];
				var categoria = response ['object']['categoria'];
				var cantidad = response ['object']['cantidad'];
				var descuento = response['object']['descuento'];
				var medida = response['object']['medida'];
				var precio = response['object']['precio'];
				var peso = response['object']['peso'];
				var estado = response['object']['estado'];
				
				
				$('#Dnombre').text(nombre);
				$('#Dcategoria').text(categoria);
				$('#Dcantidad').text(cantidad);
				$('#Ddescuento').text(descuento);
				$('#Dmedida').text(medida);
				$('#Dprecio').text(precio);
				$('#Dpeso').text(peso);
				$('#Destado').text(estado);
				
			});	
	 }
	
		
		
		function habilitar(id){
			
			var accion = "habi";
			var id = id;
			
			$.post('Gestionar_Producto',{
				accion : accion,
				idA : id
			},function(response){
				
				alert("habilito");


				$('#boton2').hide();
				$('#boton1').show();
				
			});
		}
		
		
		function desabilitar(id){
			
			
			
			var accion = "desa";
			var id = id;
			
			$.post('Gestionar_Producto',{
				accion : accion,
				idI : id
			},function(response){
				
				alert("desabilito");
				
				$('#boton1').hide();
				$('#boton2').show();
				
				
				
			});
		}
		
		
		
		
		function NumCheck(e, field) {

			  key = e.keyCode ? e.keyCode : e.which

			  // backspace

			  if (key == 8) return true

			  // 0-9

			  if (key > 47 && key < 58) {

			    if (field.value == "") return true

			    regexp = /.[0-9]{2}$/

			    return !(regexp.test(field.value))

			  }

			  // .

			  if (key == 46) {

			    if (field.value == "") return false

			    regexp = /^[0-9]+$/

			    return regexp.test(field.value)

			  }

			  // other key

			  return false

			 

			}
		
		function validacionCompleta(){

			var pass=document.getElementById("nompro").value;
			var pass2=document.getElementById("descripcion").value;
				
			if(pass.trim()==""){
				document.getElementById("errorC").innerHTML="El nombre ingresado es invalido";
				return false;
			}
			if(pass2.trim()==""){
				document.getElementById("errorC1").innerHTML="La descripcion ingresada es invalida";
				return false;
			}	
				
			return true;
			
			
			
		}
		
		
		function validacionCompleta2(){

			var pass=document.getElementById("Anompro").value;
			var pass2=document.getElementById("Adescripcion").value;
				
			if(pass.trim()==""){
				document.getElementById("errorC2").innerHTML="El nombre ingresado es invalido";
				return false;
			}
			if(pass2.trim()==""){
				document.getElementById("errorC3").innerHTML="La descripcion ingresada es invalida";
				return false;
			}	
				
			return true;
			
			
			
		}
		
		
		function limpiar(){
			document.getElementById("errorC").innerHTML="";
			document.getElementById("errorC1").innerHTML="";
			document.getElementById("errorC2").innerHTML="";
			document.getElementById("errorC3").innerHTML="";
		}
	</script>


    <script type="text/javascript">
	    function control(f){
	        var ext=['gif','jpg','jpeg','png'];
	        var v=f.value.split('.').pop().toLowerCase();
	        for(var i=0,n;n=ext[i];i++){
	            if(n.toLowerCase()==v)
	                return
	        }
	        var t=f.cloneNode(true);
	        t.value='';
	        f.parentNode.replaceChild(t,f);
	        alert("¡ARCHIVO INVALIDO, SELECCIONE OTRO!");;
	    }
	    
	    function expRegular(e)
	    {
		    var tecla;
		    tecla = (document.all) ? e.keyCode : e.which;
		    if(tecla == 8)
		    {return true;}
		    var patron;
		    patron = /[0-9.]/
		    var te;
		    te = String.fromCharCode(tecla);
		    return patron.test(te);
	    }
	    
    </script>

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

