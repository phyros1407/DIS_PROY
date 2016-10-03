function registrarTabla(){
var txt_idProducto = $('#txtIdProducto').val(); 
alert(txt_idProducto);
var txt_NombresProd2 = $('#txtNombresProd').val();
var txt_Precio2 = $('#txtPrecio').val();
var txt_Cantidad2 = $('#txtCantidad').val();
var txt_importe = txt_Precio2*txt_Cantidad2;
var txt_descripcion=$('#txtDescripcion').val(); 
var txt_codproducto=$('#txtCodProducto').val();
/**/
alert(txt_NombresProd2+"||"+txt_Precio2+"||"+txt_Cantidad2+"||"+txt_importe);

if(txt_Precio2=="" ||txt_NombresProd2==""|| txt_descripcion==""|| txt_codproducto=="" ){
	alert("No hay Producto para agregar"); 
}else{
	if(txt_Cantidad2==""){
		alert("Cantidad no ingresada"); 
		}else if(txt_Cantidad2=="" ||txt_Cantidad2==0){
			alert("Ingresar un valor mayor a cero");
		}else{
	
		
$('#table-producto2').append("<tr><td style='display:none;'>"+txt_idProducto+"</td><td>"+txt_NombresProd2+"</td><td>"+txt_Precio2+"</td><td>"+txt_Cantidad2+"</td><td>"+txt_importe+"</td><td><input type='button'  onclick='deleteRow(this);' value='eliminar' ></td></tr>");

var importetotal=0;

$("#table-producto2 tr").find('td:eq(0)').each(function () {
trDelResultado=$(this).parent();
cantidad=trDelResultado.find("td:eq(4)").html();
importetotal=importetotal+parseFloat(cantidad);
// n= trDelResultado.find("td:eq(3)").html("");
$('#txtCodProducto').val("");
$('#txtNombresProd').val("");
$('#txtDescripcion').val("");
$('#txtPrecio').val("");
$('#txtCantidad').val("");
$('#categoria').val("");


});

var txt_IGV =importetotal*0.18 ;
var txt_Total = txt_IGV + importetotal;

$('#txtSubtotal').val(importetotal);	
//$('#temporalsubtotal').val(temp)
$('#txtIGV').val(txt_IGV);
$('#txtTotal').val(txt_Total);
}

}}
function deleteRow(r) {
var i = r.parentNode.parentNode.rowIndex;
document.getElementById("table-producto2").deleteRow(i);

}

function descuento(){
	console.log("descuento");
	var total=parseInt($('#txtTotal').text());
	console.log(total);
	var igv=$('#txtIGV').val();
	console.log(igv);
	var subtotal=total-igv;
	$('#txtSubtotal').text(subtotal);
	}