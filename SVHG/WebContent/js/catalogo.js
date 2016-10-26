
   
    
    $(document).ready(function(){
    	 var accion='catalogo';
		  $.get('Gestionar_Producto', {
			  
					accion : accion
				}, function(response) {	
					 var productos= [];
					productos = new Array(response['object'].length);
		    		
		    		var conta="";
		    
		    		var col="col-sm-4";
		    		for( var i=0;i<response['object'].length;i++){
		    			
		    			var id=response['object'][i]['idProducto'];
		    			if(response['object'][i]['cantidad']==0){
		    				conta=conta+("<div style=' height: 350px; ' id="+response['object'][i]['categoriaBean']['tipo']+" class='"+response['object'][i]['categoriaBean']['tipo']+" col-sm-4' ><div class='product-image-wrapper'><div class='single-products'><div class='productinfo text-center'><img src="+response['object'][i]['foto']+"  /><p>NOMBRE : "+response['object'][i]['nombre']+"</p><h2>S/"+(parseFloat(response['object'][i]['precio'])*1.19).toFixed(2)+"</h2></div><div style='opacity:0.9;' class="+'product-overlay'+"><div class='overlay-content'><div><h4>"+response['object'][i]['descripcion']+"</h4></div><h2>S/"+(parseFloat(response['object'][i]['precio'])*1.19).toFixed(2)+"</h2><p>Nombre: "+response['object'][i]['nombre']+"</p><p>Medida: "+response['object'][i]['medida']+"</p><p>Categoria : "+response['object'][i]['categoriaBean']['tipo']+"</p><a href="+"javascript:void(0)"+" id='comprar' onclick='alert('sin stock')' class='btn btn-default add-to-cart'><i class='fa fa-shopping-cart'></i>Sin stock</a></div></div></div></div></div>");
			    			
		    					
		    			}else{
		    				conta=conta+("<div style=' height: 350px; ' id="+response['object'][i]['categoriaBean']['tipo']+" class='"+response['object'][i]['categoriaBean']['tipo']+" col-sm-4' ><div class='product-image-wrapper'><div class='single-products'><div class='productinfo text-center'><img src="+response['object'][i]['foto']+"  /><p>NOMBRE : "+response['object'][i]['nombre']+"</p><h2>S/"+(parseFloat(response['object'][i]['precio'])*1.19).toFixed(2)+"</h2></div><div style='opacity:0.9;' class="+'product-overlay'+"><div class='overlay-content'><div><h4>"+response['object'][i]['descripcion']+"</h4></div><h2>S/"+(parseFloat(response['object'][i]['precio'])*1.19).toFixed(2)+"</h2><p>Nombre: "+response['object'][i]['nombre']+"</p><p>Medida: "+response['object'][i]['medida']+"</p><p>Categoria : "+response['object'][i]['categoriaBean']['tipo']+"</p><a href="+"javascript:void(0)"+" id='comprar' onclick='addProducto("+id+")' class='btn btn-default add-to-cart'><i class='fa fa-shopping-cart'></i>Agregar al carrito</a></div></div></div></div></div>");
		    			}
		    		}
		    		$('#productoscatalogados').html(conta);	 
		    		
		  });   
		          
		  
    });
  
    
   
    
   
	$(document).ready(function(){
		
	
		$('ul.listado li a').click(function() {
			
			
			var textoFiltro = $(this).text();
			
			//si el texto es igual a 'todos' mostramos todos los elementos que contengan la clase hidden
			//y a dicho elemento le removemos la clase hidden
			//la clase hidden es opcional, en éste caso la usamos solo como referencia
			//puedes llamarla como quieras o incluso no utilizarla
			if(textoFiltro == 'TODOS'){
				$("div.paginationlist div#FUERZA").fadeIn("slow").removeClass('hide');
				$("div.paginationlist div#SUSPENSION").fadeIn("slow").removeClass('hide');
				$("div.paginationlist div#COORDINACION").fadeIn("slow").removeClass('hide');
				$("div.paginationlist div#AGILIDAD").fadeIn("slow").removeClass('hide');
				$("div.paginationlist div#POTENCIA").fadeIn("slow").removeClass('hide');
				$("div.paginationlist div#OTROS").fadeIn("slow").removeClass('hide');
			
			}else if(textoFiltro == 'OTROS'){
				
				$("div.paginationlist div#FUERZA").addClass('hide');
				$("div.paginationlist div#SUSPENSION").addClass('hide');
				$("div.paginationlist div#COORDINACION").addClass('hide');
				$("div.paginationlist div#AGILIDAD").addClass('hide');
				$("div.paginationlist div#POTENCIA").addClass('hide');
				$("div.paginationlist div#OTROS").fadeIn("slow").removeClass('hide');
			}else if(textoFiltro == 'FUERZA'){
				
				
				$("div.paginationlist div#SUSPENSION").addClass('hide');
				$("div.paginationlist div#COORDINACION").addClass('hide');
				$("div.paginationlist div#AGILIDAD").addClass('hide');
				$("div.paginationlist div#POTENCIA").addClass('hide');
				$("div.paginationlist div#OTROS").addClass('hide');
				$("div.paginationlist div#FUERZA").fadeIn("slow").removeClass('hide');
			}else if(textoFiltro == 'SUSPENSION'){
				
				$("div.paginationlist div#FUERZA").addClass('hide');
				$("div.paginationlist div#COORDINACION").addClass('hide');
				$("div.paginationlist div#AGILIDAD").addClass('hide');
				$("div.paginationlist div#POTENCIA").addClass('hide');
				$("div.paginationlist div#OTROS").addClass('hide');
				$("div.paginationlist div#SUSPENSION").fadeIn("slow").removeClass('hide');
			}else if(textoFiltro == 'AGILIDAD'){
				
				$("div.paginationlist div#FUERZA").addClass('hide');
				$("div.paginationlist div#COORDINACION").addClass('hide');
				$("div.paginationlist div#AGILIDAD").fadeIn('slow').removeClass('hide');
				$("div.paginationlist div#POTENCIA").addClass('hide');
				$("div.paginationlist div#OTROS").addClass('hide');
				$("div.paginationlist div#SUSPENSION").addClass('hide');
			}else if(textoFiltro == 'POTENCIA'){
				
				$("div.paginationlist div#FUERZA").addClass('hide');
				$("div.paginationlist div#COORDINACION").addClass('hide');
				$("div.paginationlist div#AGILIDAD").addClass('hide');
				$("div.paginationlist div#POTENCIA").fadeIn('slow').removeClass('hide');
				$("div.paginationlist div#OTROS").addClass('hide');
				$("div.paginationlist div#SUSPENSION").addClass('hide');
			}else if(textoFiltro == 'COORDINACION'){
				
				$("div.paginationlist div#FUERZA").addClass('hide');
				$("div.paginationlist div#COORDINACION").fadeIn('slow').removeClass('hide');
				$("div.paginationlist div#AGILIDAD").addClass('hide');
				$("div.paginationlist div#POTENCIA").addClass('hide');
				$("div.paginationlist div#OTROS").addClass('hide');
				$("div.paginationlist div#SUSPENSION").addClass('hide');
			}
			
			
		});
	});

	
 