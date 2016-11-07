<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="shortcut icon" href="imagesOut/ico/logo_gym.ico">
<title>Cargando ...</title>


<%
	  
      String ids[] = request.getParameterValues("Ids");
	  String importes[] = request.getParameterValues("importes");
	  String cantidades[] = request.getParameterValues("cantidades");
	  String tipo_entrega = request.getParameter("tipo_entrega_pedido");
	  String fecha = request.getParameter("fecha_generar_pedido");
	  int id_usuario = Integer.parseInt(request.getParameter("usuario_generar_pedido"));
	  String rs = request.getParameter("rs_entrega_pedido");
	  String ruc = request.getParameter("ruc_entrega_pedido");
	  String facturacion = request.getParameter("facturacion_generar_pedido");
	  String departamento = request.getParameter("departamento_entrega_pedido");
	  String provincia = request.getParameter("provincia_entrega_pedido");
	  String distrito = request.getParameter("distrito_entrega_pedido");
	  String referencia = request.getParameter("referencia_entrega_pedido");
	  String direccion = request.getParameter("direccion_entrega_pedido");
	  String tele1 = request.getParameter("telefono_entrega_pedido");
	  String tele2 = request.getParameter("telefono_entrega_pedido2");
	  int cuotas = Integer.parseInt(request.getParameter("cuotas_entrega_pedido"));
	  double rec_ent = Double.parseDouble(request.getParameter("cargo_entrega_pedido"));
	  
	  String tipo_direccion = request.getParameter("tipo_direccion_pedido");
	  
%>


<style>

	body {
    background-image: url("imagesOut/cart/cargando.gif");
    background-repeat: no-repeat;
    background-position:  top;
}
</style>

</head>


<body >


<form action="ServletGenerarPedido" method="post" id="formularioPaypal" style="display:none;">

	<%for(int i=0;i<importes.length;i++){%>
	
		<input type="hidden" name="productosIds" value="<%=ids[i]%>">
		<input type="hidden" name="productosImporte" value="<%=Double.parseDouble(importes[i]+"")%>">
		<input type="hidden" name="productosCantidad" value="<%=Integer.parseInt(cantidades[i])%>">
		
	<%} %>

		<input type="hidden" name="tipo_entrega_pedido" value="<%=tipo_entrega%>">
		<input type="hidden" name="fecha_generar_pedido" value="<%=fecha%>">
		<input type="hidden" name="usuario_generar_pedido" value="<%=id_usuario%>">
		<input type="hidden" name="rs_entrega_pedido" value="<%=rs%>">	
		<input type="hidden" name="ruc_entrega_pedido" value="<%=ruc %>">		
		<input type="hidden" name="facturacion_generar_pedido" value="<%=facturacion%>">
		
		<input type="hidden" name="departamento_entrega_pedido" value="<%=departamento%>">
		<input type="hidden" name="provincia_entrega_pedido" value="<%=provincia%>">
		<input type="hidden" name="distrito_entrega_pedido" value="<%=distrito%>">
		<input type="hidden" name="referencia_entrega_pedido" value="<%=referencia%>">
		<input type="hidden" name="direccion_entrega_pedido" value="<%=direccion%>">
		<input type="hidden" name="telefono_entrega_pedido" value="<%=tele1%>">	
		<input type="hidden" name="telefono_entrega_pedido2" value="<%=tele2%>">
		<input type="hidden" name="cuotas_entrega_pedido" value="<%=cuotas%>">	
		<input type="hidden" name="cargo_entrega_pedido" value="<%=rec_ent%>">
		<input type="hidden" name="tipo_direccion_pedido" value="<%=tipo_direccion%>">
		
		<input type="hidden" name="tipo_pago" value="PP">	


</form>
<script type="text/javascript">
	
$( document ).ready(function() {
	
	$("#formularioPaypal").submit();
	
});
			


		
		
</script>

</body>
</html>