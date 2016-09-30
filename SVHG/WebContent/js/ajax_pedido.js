		var depas = [];
		var pros = [];
		var dist = [];
		
		function cargarDep(){
			
			var action = "deps";
			
			$.get('http://servicios-ubigeo.azurewebsites.net/SERVICIOS_SVHG/servicios',{
				
				
				action : action
				
			},function(response){
				
				depas = new Array(response['object'].length);
				
				var cadena = "";
				for(var i=0;i<response['object'].length;i++){
					depas[i] = response['object'][i]['departamento'];
					cadena = cadena+("<option value="+response['object'][i]['id']+">"+response['object'][i]['departamento']+"</option>");
				}
				
				console.log(depas[i]);
				var pre = "<option value='0'> -- SELECCIONAR -- </option>"
				$('#departamento').html(pre+cadena);
				
			});
			
		}
	
		function cargarPros(id){
			
			//LIMPIAR SELECTS
			if(id==0){
				
				$('#provincia').html("<option> -- SELECCIONAR -- </option>");
				$('#distrito').html("<option> -- SELECCIONAR -- </option>");
				
			}
			
			
			var action = "pros";
			
			$.get('http://servicios-ubigeo.azurewebsites.net/SERVICIOS_SVHG/servicios',{
				
				
				action : action,
				id : id
				
			},function(response){
				
				pros = new Array(response['object'].length);
				
				var cadena = "";
				for(var i=0;i<response['object'].length;i++){
					pros[i] = response['object'][i]['provincia'];
					cadena = cadena+("<option value="+response['object'][i]['id']+">"+response['object'][i]['provincia']+"</option>");
				}
				
				console.log(depas[i]);
				var pre = "<option value='0'> -- SELECCIONAR -- </option>"
				$('#provincia').html(pre+cadena);
				
			});
		}
	
		function cargarDist(id){
			
			var action = "dist";
			
			$.get('http://servicios-ubigeo.azurewebsites.net/SERVICIOS_SVHG/servicios',{
				
				
				action : action,
				id : id
				
			},function(response){
				
				dist = new Array(response['object'].length);
				
				var cadena = "";
				for(var i=0;i<response['object'].length;i++){
					dist[i] = response['object'][i]['distrito'];
					cadena = cadena+("<option value="+response['object'][i]['id']+">"+response['object'][i]['distrito']+"</option>");
				}
				
				console.log(depas[i]);
				var pre = "<option value='0'> -- SELECCIONAR -- </option>"
				$('#distrito').html(pre+cadena);
				
			});
			
		}
		
		
		
		function cambiar(cantidad,desc){
			
			alert("Entro a cambiar");
			
			var direccion = "#"+desc;
			
			if(isNaN(cantidad)||cantidad == null||cantidad.trim()==""){
				$(direccion).val(1);
			}
			
		}
	
		function agregar(cantidad, desc) {
	
			event.preventDefault();
			
			var canti = parseInt(cantidad) + 1;
	
			var direccion = "#"+desc;
			
			$(direccion).val(canti);
		}
	
		function disminuir(cantidad, desc) {
			
			event.preventDefault();
			
			var canti = parseInt(cantidad) - 1;
			var direccion = "#"+desc;
	
			if (canti <= 0) {
				$(direccion).val(1);
			} else {
				$(direccion).val(canti);
			}
		}
	

		$(document).ready(
				function() {
					
					$('input[name="tipoPago"]').click(function(){
						
						if($(this).attr("value") == "tarjeta"){
							
							  $("#modalTarjeta").modal();
							  
							
							    var hoy = new Date();
								
								var anoActual = hoy.getFullYear();
								
								var valor  = parseInt(anoActual);
								
								var cadena = "<option value=00>AAAA</option><option value='"+valor+"'>"+valor+"</option>";
								
								
								for(var i=0;i<29;i++){
									
									valor = valor + 1;
									
									cadena = cadena + ("<option value='"+valor+"'>"+valor+"</option>");
									
								}
								
								
								$("#mesCad").html(cadena);
							  
						}
					});
	
					$('input[name="entrega"]').click(function() {
						
						if ($(this).attr("value") == "casa") {
	
							$(".step1").hide();
							$(".step2").hide(1000);
							$(".step3").hide(1000);
							$("#formuCasa").show(1000);
							$("#boton3").show(1000);

						}else
						if ($(this).attr("value") == "local") {
	
							$("#boton1").show();
							$(".step1").show(1000);
							$("#titInDir").hide(1000);
							$("#infoDirEnv").hide(1000);
							$("#botonCambDir").hide(1000);
							$("#formuCasa").hide(1000);
							$(".step2").hide();
							$(".step3").show();
							
						}
					});
	
					$('#boton1').click(function() {
						$(this).hide(1000);
						$(".step1").hide(1000);
						$(".step2").show(1000);
						$(".pagenv").hide(1000);
						$("#valEnv").text("$/.0.00");
					});
	
					
					$('#boton3').click(function() {
						
						
						$("#botonCambDir").show();
						$(".step3").show(1000);
						$("#boton1").show(1000);
						$(this).hide(1000);
						$("#formuCasa").hide(1000);
						$(".step1").hide(1000);
						$(".step2").show(1000);
						$("#infoDirEnv").show(1000);
						$(".pagenv").show(1000);
						$("#valEnv").text("$/.20.00");
	
						//DATOS DEL RECEPTOR
						//OBTENER VAL
						//var nombre = $("#").val();
						var direccion = $("#direccion").val();
						var distrito = $("#distrito  option:selected").text();
						var provincia = $("#provincia  option:selected").text();
						var departamento = $("#departamento option:selected").text();
						var telefono1 = $("#telefono1").val();
						var telefono2 = $("#telefono2").val();
	
						//SETEAR VAL
						$("#mosNom").text("Jean Pier Barbieri");
						$("#mosDir").text(direccion);
						$("#mosDis").text(distrito + " - " + provincia + " - "+ departamento);
						$("#mosTel").text("Telefono : " + telefono1 + "\n"+ " Otro Telefono : " + telefono2);
					});
		});
		
		
		
		$(document).ready(function(){
	    	 var accion='addCarrito';
	    	 var arreglo = new Array();
	    	 for(var i=0;i<localStorage.length;i++){
					//alert(localStorage.key(i));
					var ide=localStorage.key(i);
					arreglo.push(ide);
					alert(arreglo);
	             console.log(localStorage.length+"  tamñao ->  "+ide+"  orden   "+i+"  ARREGLOO  "+arreglo[i]);
	             }
	    	 
			  $.post('Carrito', {
				  
						accion:accion,
						ide:JSON.stringify(arreglo),
					}, function(response) {	
						 
			    		var conta="";
			    		var col="col-sm-4";
			    		
			    		for( var i=0;i<response['object'].length;i++){
			    					    			
			    			conta=conta+("<tr><td class='cart_product'><a href='#'><img src="+response['object'][i][0]['foto']+" alt='' width='100px' height='100px'></a></td><td class='cart_description' style='vertical-align: middle; text-align: center;'><h4><a>"+response['object'][i][0]['nombre']+"</a></h4></td><td class='cart_price'	style='vertical-align: middle; text-align: center;'><p>"+response['object'][i][0]['precio']+"</p></td><td class='cart_quantity' style='vertical-align: middle; text-align: center;'><div class='cart_quantity_button'><a class='cart_quantity_up' href='#'  onclick='agregar(cantidad"+i+".value,desc"+i+".value);'> + </a><input type='hidden' value='cantidad"+i+"' id='desc"+i+"'><input  onchange='cambiar(cantidad"+i+".value,desc"+i+".value);' onkeypress='return solonumerosCarr(event)' name='quantity' maxlength='2' class='cart_quantity_input' type='text' value='1' size='2' id='cantidad"+i+"'><a class='cart_quantity_down' href='#' onclick='disminuir(cantidad"+i+".value,desc"+i+".value);'> - </a></div></td><td class='cart_total' style='vertical-align: middle;text-align: center;'><p class='cart_total_price'>"+response['object'][i][0]['precio']+"</p></td><td class='cart_delete' style='vertical-align: middle; text-align: center;'><a class='cart_quantity_delete' href=''><i class='fa fa-times'></i></a></td></tr>");
			    		}
			    	
			    		$('#productosCarrito').html(conta);	 
			    		
			  });   
			          
			  
	    });