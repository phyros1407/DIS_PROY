



//JAVASCRIPT MODALPRODUCTO
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

//ZONA AJAX
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





//VALIDACION PROPRIA
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