<link href="./css/bootstrap.min.css" rel="stylesheet">
<head>
<style type="text/css">
div.container4 {
    height: 300px;
    width: 500px;
    position: relative }
div.container4 p {
    margin: 0;
    background: yellow;
    position: absolute;
    top: 50%;
    left: 50%;
    margin-right: -50%;
    transform: translate(-50%, -50%) }</style>

</head>
<body>
<div class="col-sm-12 col-md-6">

<br>					
				Categoria:	<select name="selCat" id="selCat">
				<option value="1">SUSPENSIÓN</option>
				<option value="2">FUERZA</option>
				<option value="3">AGILIDAD</option>
				<option value="4">COORDINACION</option>
				<option value="5">POTENCIA</option>
				<option value="6">OTROS</option>
				</select>
				
				Productos: 
				<table class="table" style="height: 250px;width:500px;;display:block;">
				
				<thead style="display: inline-block;width: 100%;">
				<tr>
				<th>Nombre</th>
				</tr></thead>
				<tbody style="overflow: auto;height: 200px;display: inline-block;width: 100%;">
				<tr><td><input type="radio" name="ofertas">Escaleras de coordinación</td></tr>
				<tr><td><input type="radio" name="ofertas">Escaleras de coordinación</td></tr>
				<tr><td><input type="radio" name="ofertas">Escaleras de coordinación</td></tr>
				<tr><td><input type="radio" name="ofertas">Escaleras de coordinación</td></tr>
				<tr><td><input type="radio" name="ofertas">Escaleras de coordinación</td></tr>
				<tr><td><input type="radio" name="ofertas">Escaleras de coordinación</td></tr>
				<tr><td><input type="radio" name="ofertas">Escaleras de coordinación</td></tr>
				<tr><td><input type="radio" name="ofertas">Escaleras de coordinación</td></tr>								
				</tbody>
				</table>
				<p align="center">
				<input type="button" value="Agregar" class="btn btn-primary">
				</p>
				<br>
				<br>
				<table id="myTable" class="table-bordered" style="height: 200px;width:500px;display:block;">
				
				<thead style="width:100%;">
				<tr style="width:100%;">
				<th style="width:200px;">Producto</th>
				<th style="width:20%;">Stock</th>
				<th style="width:20%;">Precio</th>
				<th style="width:20%;">Delete</th>
				</tr></thead>
				<tbody style="overflow: auto;height: 150px;display: inline-block;width: 100%;">
				<tr><td style="width:200px;">Bosu</td>
				<td style="width:20%;">100</td>
				<td style="width:20%;">50</td>
				<td style="width:20%;"><a href="#">Eliminar</a></td></tr>
				<tr><td style="width:200px;">Vallitas de coordinación</td>
				<td style="width:20%;">100</td>
				<td style="width:20%;">100</td>
				<td style="width:20%;"><a href="#">Eliminar</a></td></tr>
							
				</tbody>
				</table>
				<br>
				<p align="right" style="margin-right: 100px;"> Total : 150.00 S/.</p>
				
				<p align="right" style="margin-right: 100px;"> Asignar Oferta : <input type="text" name="oferta" maxlength="2" size="2"></p>
				
				<p align="right" style="margin-right: 100px;"> Precio Venta : 120.00 S/:</p>
				
</div>
<div class="col-sm-12 col-md-6">
<br>
<div class=container4 style="border:1px solid black;">
  <p>IMAGEN!
</div>
<br>
<input type="file" class="file">
<br>
<div class="form-group"  >						
<label class="control-label col-md-2">Del :	</label>
<div class="col-md-4"><input type="date" class="form-control"></div>
<br>
<br>
</div>

<div class="form-group"  >	
<label class="control-label col-md-2">Hasta :	</label>
<div class="col-md-4"><input type="date" class="form-control"></div>
<br>
<br>
</div>

<div class="form-group"  >	
<label class="control-label col-md-2">Hora Fin :	</label>
<div class="col-md-4">
<select name="horaOfer" class="form-control">
<% for(int i=1;i<=24;i++){ 
if(i<10){%>
<option value="<%=i%>">0<%=i %>:00</option>
<%}else{ %>
<option value="<%=i%>"><%=i %>:00</option>

<%} %>
<%} %>
</select> 
</div>
<br>
<br>
</div>
<div class="form-group"  >
<label class="control-label col-md-2">Ingrese la cantidad (Unid) :	</label>
<div class="col-md-4"><input type="text" class="form-control"></div>
<br>
<br>
<br></div>
<p align="center">
<input type="submit" value="Guardar Oferta" class="btn btn-primary">
</p>
</div>
</body>