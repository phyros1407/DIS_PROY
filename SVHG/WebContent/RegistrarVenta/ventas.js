var rowCount;
var txt_idProducto
function registrarTabla(){
var txt_idProducto = $('#txtIdProducto').val(); 
//alert(txt_idProducto);
var txt_NombresProd2 = $('#txtNombresProd').val();
var txt_Precio2 = $('#txtPrecio').val();
var txt_Cantidad2 = $('#txtCantidad').val();
var txt_importe = (txt_Precio2)*txt_Cantidad2;//agregado igv (18%)
var txt_descripcion=$('#txtDescripcion').val(); 
var txt_codproducto=$('#txtCodProducto').val();
var id=$('#txtidPro').val();
/**/
//alert(txt_NombresProd2+"||"+txt_Precio2+"||"+txt_Cantidad2+"||"+txt_importe);

if(txt_Precio2=="" ||txt_NombresProd2==""|| txt_descripcion==""|| txt_codproducto=="" ){
	alert("No hay Producto para agregar"); 
}else{
	if(txt_Cantidad2==""){
		alert("Cantidad no ingresada"); 
		}else if(txt_Cantidad2=="" ||txt_Cantidad2==0){
			alert("Ingresar un valor mayor a cero");
			
			
		/*}else if(id==txt_idProducto){
			alert("Elegir otro producto"+id+"asdsad "+txt_idProducto);
			$('#txtCodProducto').val("");
			$('#txtNombresProd').val("");
			$('#txtDescripcion').val("");
			$('#txtPrecio').val("");
			$('#txtCantidad').val("");
			$('#categoria').val("");*/
		}else{
var i=0;
rowCount = $('#table-producto2 tr').length-1;
$('#txtsize').val(rowCount);
console.log("dsffgslgsldkfjghsldkjghsd: "+rowCount)
;
$('#table-producto2').append("<tr><td style='display:none;'><input type='hidden' name='txtidPro"+rowCount+"' id='txtidPro' form='registrar' value='"+txt_idProducto+"' >"+txt_idProducto+"</td><td>"+txt_NombresProd2+"</td><td>"+txt_Precio2+"</td><td id='cantidadPro' name='cantidadPro'>"+txt_Cantidad2+"</td><td id='importePro' name='importePro'>"+txt_importe.toFixed(2)+"</td><td><input type='button'  onclick='deleteRow(this,"+txt_importe.toFixed(2)+");' value='eliminar' ></td><input type='hidden' name='cantidadPro"+rowCount+"' id='cantidadPro' form='registrar' value='"+txt_Cantidad2+"' ><input type='hidden' name='importePro"+rowCount+"' id='importePro' form='registrar' value='"+txt_importe.toFixed(2)+"' ></tr>");

var importetotal=0.0;

$("#table-producto2 tr").find('td:eq(0)').each(function () {
trDelResultado=$(this).parent();
cantidad=trDelResultado.find("td:eq(4)").html();
console.log("asdasdasdsad"+cantidad)
importetotal=importetotal+parseFloat(cantidad);

console.log("cantidadddddd: "+parseFloat(cantidad));
//importetotal.toFixed(2);
console.log("asdadasdasdadsadadsasdas"+importetotal)
// n= trDelResultado.find("td:eq(3)").html("");

$('#txtCodProducto').val("");
$('#txtNombresProd').val("");
$('#txtDescripcion').val("");
$('#txtPrecio').val("");
$('#txtCantidad').val("");
$('#categoria').val("");


});

var txt_IGV =importetotal*0.18 ;
//var txt_Total = txt_IGV + importetotal;

$('#txtSubtotal').val(importetotal.toFixed(2));	


rowCount = $('#table-producto2 tr').length-1;
$('#txtsize').val(rowCount);
console.log("dsffgslgsldkfjghsldkjghsd: "+rowCount)
;
//$('#temporalsubtotal').val(temp)
//$('#txtIGV').val(txt_IGV);
//$('#txtTotal').val(txt_Total);
}
	
	
}



}
function deleteRow(r,cantidad) {
var i = r.parentNode.parentNode.rowIndex;

var importetotal2= $('#txtSubtotal').val();

//importeTotal2.ToFixed(2);
console.log("importw1"+importetotal2);

importetotal2=importetotal2-parseFloat(cantidad);
console.log("importw2: "+importetotal2);

$('#txtSubtotal').val(importetotal2.toFixed(2));	
document.getElementById("table-producto2").deleteRow(i);

var rowCount = $('#table-producto2 tr').length-1;
$('#txtsize').val(rowCount);


}


function numero()	{
	
/*	String codigoAntiguo = pedidodao.generarNumeroTransaccion();
	System.out.println("CODIGO ANTIGUO -->"+codigoAntiguo);
	String premisa = codigoAntiguo.substring(0,5);
	int numero = Integer.parseInt(codigoAntiguo.substring(6));
	System.out.println("NUMERO A SUMAR --->"+numero);
	int nuevoNumero = numero+1;
	System.out.println("NUEVO NUMERO --->"+nuevoNumero);
	String cadena =(String.valueOf(nuevoNumero));
	for(int i = 0;i<11;i++){
		
		if(cadena.length()<12){
			
			cadena = "0"+cadena;
			
		}else{
			
			break;
			
		}
		
	}
	String codigoNuevo = premisa+cadena;*/
	
	 var accion='numeroTransaccion';
	 
	  $.post('../ServletVenta', {
		 
	
				accion : accion
			}, function(response) {		
				console.log("entasd"+response);
				
						
				if (response!=null) {
						
				$('#txt_numeroVenta').val(response['object']);
				var codigoAntiguo=$('#txt_numeroVenta').val();
				console.log("asdasdadaasd"+codigoAntiguo)
				var premisa = codigoAntiguo.substring(0,5);
				var numero = parseInt(codigoAntiguo.substring(6));
				var nuevoNumero = numero+1;	
				var cadena =nuevoNumero.valueOf()+"";
				console.log("cadena: "+cadena)
				var i;
				for( i = 0;i<11;i++){
					
					if(cadena.length<12){
						
						cadena = '0'+cadena;
						console.log("cadena3"+cadena)
					}else{
						
						break;
						
					}
					
				}
				console.log("cadena2: "+cadena)
				var codigoNuevo = premisa+cadena;
				console.log("codigonuevo: "+codigoNuevo)
				
				$('#txt_numeroVenta').val(codigoNuevo+"")
				
					//alert(""+$('#txt_numeroVenta').val(codigoNuevo))
				}else{
					
					alert("numero incorecot")
					
				}		
	  });

	
	
}
/*
function registrarVentas(){
/*	var total="";
   $("#table-producto tr").find('td:eq(0)').each(function () {
	   trDelResultado=$(this).parent();
	   var1=trDelResultado.find("td:eq(0)").html();
       //var2=trDelResultado.find("td:eq(1)").html();
       var3=trDelResultado.find("td:eq(3)").html();
       var4=trDelResultado.find("td:eq(4)").html();
       
	  total=total+var1+","+var3+","+var4+";";

   });
 */
//venta identificador
/*var txtusuario=$('#txtusuario').val();   
var txt_fechaactual = $('#txt_fechaactual').val();
var txt_numeroVenta = $('#txt_numeroVenta').val();	

//ventaXproducto
var txtidProducto = $('#txtidProducto').val();
var cantidadPro = $('#cantidadPro').val();
var importePro = $('#importePro').val();
var txtsize=$('#txtsize').val();

var as;
var a = new Array(rowCount);
for(var i =0; i<rowCount;i++){
	a[i]=txt_idProducto;
	console.log("asdasd"+txt_idProducto+" asdads"+rowCount+"asdasd"+i)
	a.push(txt_idProducto);
	as++;
	console.log("array: "+a[i]+"\n");
}



//comprobante idventa,fecha,estado,numerocomprobante,numeroserie
/*var select_tipo = $('#selectTipo').val();*/

/*	var accion='registrarVenta1';
  $.post('../ServletVenta', {
	  txtusuario : txtusuario,
	  txt_fechaactual : txt_fechaactual,
	  txt_numeroVenta : txt_numeroVenta,
	  txtsize : txtsize,
	  txtidProducto : txtidProducto,
	  cantidadPro : cantidadPro,
	  importePro : importePro,
	 
	  //	select_tipo : select_tipo,	
	  	accion:accion
		}, function(response) {
			
			if (response.success==true) {
				//location.reload();
			
					alert(" Registrado")
			
				}else{

					alert(" Venta Registrada Satisfactoriamente");
					
				}
			
  });




}*/




/*
function descuento(){
	console.log("descuento");
	var total=parseInt($('#txtTotal').text());
	console.log(total);
	var igv=$('#txtIGV').val();
	console.log(igv);
	var subtotal=total-igv;
	$('#txtSubtotal').text(subtotal);
	}*/