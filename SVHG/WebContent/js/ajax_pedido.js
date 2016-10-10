		
		var depas = [];
		var pros = [];
		var dist = [];
		
		var  igvS = 1.19; //THE REAL IGV NO FAKE 100%
		
		function cargarDep(){
			
			var action = "deps";
			
			$.get('http://servicios.j.facilcloud.com/SERVICIOS_SVHG/servicios',{
				
				action:action
				
			},function(response){
				
				depas = new Array(response['object'].length);
				console.log(response['object'].length);	
				var cadena = "";
				for(var i=0;i<response['object'].length;i++){
					depas[i] = response['object'][i]['departamento'];
					cadena = cadena+("<option value="+response['object'][i]['id']+">"+response['object'][i]['departamento']+"</option>");
				}
				
				console.log(depas.length);
				var pre = "<option value='0'> -- SELECCIONAR -- </option>";
					
				$("#departamento").html(pre+cadena);
				

				
			});
			
		}
	
		function cargarPros(id){
			
			//LIMPIAR SELECTS
			if(id==0){
				
				$('#provincia').html("<option> -- SELECCIONAR -- </option>");
				$('#distrito').html("<option> -- SELECCIONAR -- </option>");
				
			}
			
			
			var action = "pros";
			
			$.get('http://servicios.j.facilcloud.com/SERVICIOS_SVHG/servicios',{
				
				
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
			
			$.get('http://servicios.j.facilcloud.com/SERVICIOS_SVHG/servicios',{
				
				
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
		
		
		
		function cambiar(cantidad,desc,descImp,precio){
			
			
			
			var direccion = "#"+desc;
			
			if(isNaN(cantidad)||cantidad == null||cantidad.trim()==""){
				$(direccion).val(1);
				
				var subtotal = parseInt($("#subTotalV").val());
				
				
				
				var importeA = $("#valorImp"+descImp.substring(descImp.length-1)).val();
				
				
				
				subtotal = parseInt(subtotal) - parseInt(importeA) ;
				
				
				
				subtotal = subtotal + (1*parseInt(precio))
				
				var igv = subtotal*0.19;
				
				
				
				$("#"+descImp).val(1*parseInt(precio));
				$("#subTotal").text("S/. "+subtotal);
				$("#subTotalV").val(subtotal);
				$("#importeM"+descImp.substring(descImp.length-1)).text(1*parseInt(precio));
				
				$("#igv").text("S/. "+igv);
				$("#total").text("S/. "+(igv+subtotal));
				$("#amount").val(igv+subtotal);
			}
			else{
				
				var canti = cantidad;
				
				var subtotal = parseInt($("#subTotalV").val());
				
				
				
				var importeA = $("#valorImp"+descImp.substring(descImp.length-1)).val();
				
				
				
				subtotal = parseInt(subtotal) - parseInt(importeA) ;
				
				
				
				subtotal = subtotal + (canti*parseInt(precio))
				
				var igv = subtotal*0.19;
				
			
				
				$("#"+descImp).val(canti*parseInt(precio));
				$("#subTotal").text("S/. "+subtotal);
				$("#subTotalV").val(subtotal);
				$("#importeM"+descImp.substring(descImp.length-1)).text(canti*parseInt(precio));
				
				$("#igv").text("S/. "+igv);
				$("#total").text("S/. "+(igv+subtotal));
				$("#amount").val(igv+subtotal);
			}
			
		}
	
		function agregar(cantidad, desc,descImp,precio) {
	
			event.preventDefault();
			
			var canti = parseInt(cantidad) + 1;
	
			var direccion = "#"+desc;
			
			$(direccion).val(canti);
			

			var subtotal = parseInt($("#subTotalV").val());
			
			
			
			var importeA = $("#valorImp"+descImp.substring(descImp.length-1)).val();
			
			
			
			subtotal = parseInt(subtotal) - parseInt(importeA) ;
			
			
			
			subtotal = subtotal + (canti*parseInt(precio))
			
			var igv = subtotal*0.19;
				
		
			
			$("#"+descImp).val(canti*parseInt(precio));
			$("#subTotal").text("S/. "+subtotal);
			$("#subTotalV").val(subtotal);
			$("#importeM"+descImp.substring(descImp.length-1)).text(canti*parseInt(precio));
			
			$("#igv").text("S/. "+igv);
			$("#total").text("S/. "+(igv+subtotal));
			$("#amount").val(igv+subtotal);
		}
	
		function disminuir(cantidad, desc,descImp,precio) {
			
			event.preventDefault();
			
			var canti = parseInt(cantidad) - 1;
			var direccion = "#"+desc;
	
			if (canti <= 0) {
				$(direccion).val(1);
				$("#"+descImp).val(1*parseInt(precio));
				
				$("#importeM"+descImp.substring(descImp.length-1)).text(1*parseInt(precio));
				
				
				
			} else {
				
				$(direccion).val(canti);

				var subtotal = parseInt($("#subTotalV").val());
				
				
				
				var importeA = $("#valorImp"+descImp.substring(descImp.length-1)).val();
				
			
				
				subtotal = parseInt(subtotal) - parseInt(importeA) ;
				
				
				
				subtotal = subtotal + (canti*parseInt(precio))
				
				var igv = subtotal*0.19;
				
				
				
				$("#"+descImp).val(canti*parseInt(precio));
				$("#subTotal").text("S/. "+subtotal);
				$("#subTotalV").val(subtotal);
				$("#importeM"+descImp.substring(descImp.length-1)).text(canti*parseInt(precio));
				
				
				$("#igv").text("S/. "+igv);
				$("#total").text("S/. "+(igv+subtotal));
				$("#amount").val(igv+subtotal);
				
				
			}
		}
	

		$(document).ready(
				function() {
					
					$("#btnTarjeta").click(function(){
						
							    var hoy = new Date();
								
								var anoActual = hoy.getFullYear();
								
								var valor  = parseInt(anoActual);
								
								var cadena = "<option value=00>AAAA</option><option value='"+valor+"'>"+valor+"</option>";
								
								
								for(var i=0;i<29;i++){
									
									valor = valor + 1;
									
									cadena = cadena + ("<option value='"+valor+"'>"+valor+"</option>");
									
								}
								
								
								$("#anioCad").html(cadena);
				
					});
	
					
					
					$('input[name="entrega"]').click(function() {
						
						if ($(this).attr("value") == "casa") {
	
							if($("#validacion").val()=="napc"){
								
								if(confirm("Debe iniciar Sesion para continuar! Desea iniciar sesion?") == true){
									
									$('#modalLogin').modal();   
									
								}
								
							}else{
								
								
								cargarDep();
								$(".step1").hide();
								$(".step2").hide(1000);
								$(".step3").hide(1000);
								$("#formuCasa").show(1000);
								$("#boton3").show(1000);
								
								
								
							}
							
							
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
						
						if($("#validacion").val()=="napc"){
							
							
							if(confirm("Debe iniciar Sesion para continuar! Desea iniciar sesion?") == true){
								
								$('#modalLogin').modal();   
								
							}
							
						}else{
							
							$(this).hide(1000);
							$(".step1").hide(1000);
							$(".step2").show(1000);
							$(".pagenv").hide(1000);
							$("#valEnv").text("$/.0.00");
							
						}
						
						
					});
	
					
					$('#boton3').click(function() {
						
						if($("#validacion").val()=="napc"){
							
							
							if(confirm("Debe iniciar Sesion para continuar! Desea iniciar sesion?") == true){
								
								$('#modalLogin').modal();   
								
							}
						}else{
						

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
						
						}
						
					});
		});
		
		
		
		$(document).ready(function(){
	    	 var accion='addCarrito';
	    	 var arreglo = new Array();
	    	if(localStorage.length){
	    	 for(var i=0;i<localStorage.length;i++){
					//alert(localStorage.key(i));
					var ide=localStorage.key(i);
					arreglo.push(ide);
					//alert(arreglo);
	             console.log(localStorage.length+"  tamñao ->  "+ide+"  orden   "+i+"  ARREGLOO  "+arreglo[i]);
	             }
			  $.post('Carrito', {
				  
						accion:accion,
						ide:JSON.stringify(arreglo),
					}, function(response) {	
						 
			    		var conta="";
			    		var col="col-sm-4";
			    		
			    		var subtotal = 0;
			    		var subCantidad = 0;
			    		
			    		for( var i=0;i<response['object'].length;i++){
			    			
			    			subtotal = subtotal + response['object'][i][0]['precio']*parseFloat(igvS);
			    			subCantidad = subCantidad + parseFloat(response['object'][i][0]['peso']);
			    			conta=conta+("<tr><td class='cart_product'><input type='hidden' value='"+response['object'][i][0]['idProducto']+"' name='ids'><a href='#'><img src="+response['object'][i][0]['foto']+" alt='' width='100px' height='100px'></a></td><td class='cart_description' style='vertical-align: middle; text-align: center;'><h4><a>"+response['object'][i][0]['nombre']+"</a></h4></td><td class='cart_price' style='vertical-align: middle; text-align: center;'><p>S/. "+(response['object'][i][0]['precio']*parseFloat(igvS)).toFixed(2)+"<input type='hidden' value='"+(response['object'][i][0]['precio']*parseFloat(igvS)).toFixed(2)+"' id='precios"+i+"' ></p></td><td class='cart_quantity' style='vertical-align: middle; text-align: center;'><div class='cart_quantity_button' style='margin-left:150px;'><a class='cart_quantity_up' href='#' onclick='agregar(cantidad"+i+".value,desc"+i+".value,nomImp"+i+".value,precios"+i+".value);'> + </a><input type='hidden' value='cantidad"+i+"' id='desc"+i+"'><input  onchange='cambiar(cantidad"+i+".value,desc"+i+".value,nomImp"+i+".value,precios"+i+".value);' onkeypress='return solonumerosCarr(event)' name='cantidades' maxlength='2' class='cart_quantity_input' type='text' value='1' size='2' id='cantidad"+i+"'><a class='cart_quantity_down' href='#' onclick='disminuir(cantidad"+i+".value,desc"+i+".value,nomImp"+i+".value,precios"+i+".value);'> - </a></div></td><td class='cart_total' style='vertical-align: middle;text-align: center;'><p class='cart_total_price'>S/. <label id='importeM"+i+"'>"+(response['object'][i][0]['precio']*parseFloat(igvS)).toFixed(2)+"</label><input type='hidden' id='nomImp"+i+"' value='valorImp"+i+"' ><input type='hidden' id='valorImp"+i+"' value='"+(response['object'][i][0]['precio']*parseFloat(igvS)).toFixed(2)+"' name='importes' ></p></td><td class='cart_delete' style='vertical-align: middle; text-align: center;'><a class='cart_quantity_delete' href='' onClick='quitardelcarrito("+response['object'][i][0]['idProducto']+")'><i class='fa fa-times'></i></a></td></tr>");
			    		}
			    			
			    			$('#productosCarrito').html(conta);
			    			$('#subTotalV').val(subtotal.toFixed(2));
			    			$('#subTotal').text("S/. "+subtotal.toFixed(2));
			    			
			    			
			    			
			    			//$("#igv").text("S/. "+igv.toFixed(2));
			    			
							$("#total").text("S/. "+subtotal.toFixed(2));
							$("#amount").val(subtotal.toFixed(2));
							
							$("#totaldelpeso").val(subCantidad.toFixed(2));
							
							//MODIFICAR FECHA
								
							var cadenafechas = "";
							var daysI = 0;
							
							if(subCantidad<=15.00){
									daysI = 1;
									milisegundos=parseInt(daysI*24*60*60*1000);
									
							}else{
									daysI = 2;
									milisegundos=parseInt(daysI*24*60*60*1000);
									
							}
							
							
							//FECHA EN RELACION AL PESO
							fecha=new Date();

							tiempo=fecha.getTime();

							total=fecha.setTime(tiempo+milisegundos);

							day=fecha.getDate();

							month=fecha.getMonth()+1;

							year=fecha.getFullYear();
							
							cadena = "<div class='radio'> <input type='radio' name='fecha' value='"+year+"-"+month+"-"+day+"' checked>"+day+"/"+month+"/"+year+"</div>";
							
							for(var i = 0;i<2;i++){
							    				
								daysI = daysI +1;
								milisegundos=parseInt(daysI*24*60*60*1000);
								
								
								fecha=new Date();

								tiempo=fecha.getTime();

								total=fecha.setTime(tiempo+milisegundos);

								day=fecha.getDate();

								month=fecha.getMonth()+1;

								year=fecha.getFullYear();	
								
							  cadenafechas = cadenafechas + ("<div class='radio'> <input type='radio' name='fecha' value='"+year+"-"+month+"-"+day+"' >"+day+"/"+month+"/"+year+"</div>");
							    	
							}
							
							$("#radios_fechas").html(cadena+cadenafechas);
							
							//
							
			  });   
			  
	    	}else{
	    		$('#mensaje').html("<h3>Usted no cuenta con productos agregados en su carrito de compras.</h3>");
	    		
	    								
					$('#opcionesPrincipales').hide();
					$('#do_action').hide();
					
	    	}
	    	 
	    });
		
		
		function quitardelcarrito(id) {
					
			 for(var i=0;i<localStorage.length;i++){
					if(localStorage.key(i)==id){
						localStorage.removeItem(id);
						alert("El producto ha sido removido del carrito.");
						$("#cantidadProductos").text(localStorage.length);
					};
		      }
		}
		
		function facturacion(comprobante){
			
			if(comprobante=="recibo"){
				$("#ruc_fac").slideToggle();
				$("#rs_fac").slideToggle();
				$("#icono").slideToggle();
			}else{
				$("#ruc_fac").slideToggle();
				$("#rs_fac").slideToggle();
				$("#icono").slideToggle();
			}
			
		}
		
		
		function datosAlForm(){
			
			var tipoI = "text";
			
			//LIMPIANDO FORM
			
			//DETALLES DEL USUARIO
			$('input[name="usuario_generar_pedido"]').remove();
			
			//DETALLES DE LOS PRODUCTOS
			$('input[name="productosIds"]').remove();
			$('input[name="productosCantidad"]').remove();
			$('input[name="productosImporte"]').remove();
			
			//DETALLES DE LA ENTREGA
			$('input[name="tipo_entrega_pedido"]').remove();
			$('input[name="departamento_entrega_pedido"]').remove();
			$('input[name="provincia_entrega_pedido"]').remove();
			$('input[name="direccion_entrega_pedido"]').remove();
			$('input[name="distrito_entrega_pedido"]').remove();
			$('input[name="referencia_entrega_pedido"]').remove();
			$('input[name="telefono_entrega_pedido"]').remove();
			$('input[name="telefono_entrega_pedido2"]').remove();
			$('input[name="cuotas_entrega_pedido"]').remove();
			
			//DETALLES FACTURACION
			$('input[name="facturacion_generar_pedido"]').remove();
			$('input[name="rs_entrega_pedido"]').remove();
			$('input[name="ruc_entrega_pedido"]').remove();
			
			//DETALLE DE LAS FECHAS
			$('input[name="fecha_generar_pedido"]').remove();
			
			var cantidades = [];
			var importes = [];
			var productos = [];
		
			$('input[name="importes"]').each(function() {
				
				importes.push($(this).val());
					
			});
			
			$('input[name="cantidades"]').each(function() {
				
				cantidades.push($(this).val());
				
			});
			
			$('input[name="ids"]').each(function() {
				
				productos.push($(this).val());
				
			});
			
			
			
			for(var i=0;i<importes.length;i++){
				
				//AGREGAR IDS AL FORM 
				$("<input type='text'/>")
			     .attr("id", "producto"+i)
			     .attr("value", productos[i])
			     .attr("name", "productosIds")
			     .appendTo("#form_generar_pedido");
				
				//AGREGAR CANTIDADES AL FORM 
				$("<input type='text'/>")
			     .attr("id", "cantidad"+i)
			     .attr("value", cantidades[i])
			     .attr("name", "productosCantidad")
			     .appendTo("#form_generar_pedido");
				
				
				//AGREGAR IMPORTES AL FORM 
				$("<input type='text'/>")
			     .attr("id", "importe"+i)
			     .attr("value", importes[i])
			     .attr("name", "productosImporte")
			     .appendTo("#form_generar_pedido");
				
			}
			
			
			$("<input type='text'/>")
		     .attr("id", "lugar_entrega")
		     .attr("value",$('input:radio[name=entrega]:checked').val())
		     .attr("name", "tipo_entrega_pedido")
		     .appendTo("#form_generar_pedido");
			
			
			$("<input type='text'/>")
		     .attr("value",$("input:radio[name=fecha]:checked").val())
		     .attr("name", "fecha_generar_pedido")
		     .appendTo("#form_generar_pedido");
			
			$("<input type='"+tipoI+"'/>")
		     .attr("value",$("#diu").val())
		     .attr("name", "usuario_generar_pedido")
		     .appendTo("#form_generar_pedido");
			
			
			
			
			if($('input:radio[name=entrega]:checked').val()=="local"){
				
				if($("#facturacion").val()=="boleta"){
					
					$("<input type='text'/>")
				     .attr("value","")
				     .attr("name", "ruc_entrega_pedido")
				     .appendTo("#form_generar_pedido");
					
					$("<input type='text'/>")
				     .attr("value","")
				     .attr("name", "rs_entrega_pedido")
				     .appendTo("#form_generar_pedido");
					
				}else{
					
					$("<input type='text'/>")
				     .attr("value",$("#ruc_fac").val())
				     .attr("name", "ruc_entrega_pedido")
				     .appendTo("#form_generar_pedido");
					
					$("<input type='text'/>")
				     .attr("value",$("#").val())
				     .attr("name", "rs_entrega_pedido")
				     .appendTo("#form_generar_pedido");
					
				}
				
				$("#ce_facturacion").text($("#facturacion").val());
				
				$("<input type='text'/>")
			     .attr("value",$("#facturacion").val())
			     .attr("name", "facturacion_generar_pedido")
			     .appendTo("#form_generar_pedido");
				
				$("<input type='text'/>")
			     .attr("value","LIMA")
			     .attr("name", "departamento_entrega_pedido")
			     .appendTo("#form_generar_pedido");
				
				$("<input type='text'/>")
			     .attr("value","LIMA")
			     .attr("name", "provincia_entrega_pedido")
			     .appendTo("#form_generar_pedido");
				
				$("<input type='text'/>")
			     .attr("value","BREÑA")
			     .attr("name", "distrito_entrega_pedido")
			     .appendTo("#form_generar_pedido");
				
				$("<input type='text'/>")
			     .attr("value","LIMA")
			     .attr("name", "referencia_entrega_pedido")
			     .appendTo("#form_generar_pedido");
				
				$("<input type='text'/>")
			     .attr("value","JR. INDEPENDENCIA")
			     .attr("name", "direccion_entrega_pedido")
			     .appendTo("#form_generar_pedido");
				
				$("<input type='text'/>")
			     .attr("value","999999999")
			     .attr("name", "telefono_entrega_pedido")
			     .appendTo("#form_generar_pedido");
				
				$("<input type='text'/>")
			     .attr("value","5555555")
			     .attr("name", "telefono_entrega_pedido2")
			     .appendTo("#form_generar_pedido");
				
				$("<input type='text'/>")
			     .attr("value","0")
			     .attr("name", "cuotas_entrega_pedido")
			     .appendTo("#form_generar_pedido");
		
			}
			
			if($('input:radio[name=entrega]:checked').val()=="casa"){
					
				if($("#facturacion").val()=="boleta"){
					
					$("<input type='text'/>")
				     .attr("value","")
				     .attr("name", "ruc_entrega_pedido")
				     .appendTo("#form_generar_pedido");
					
					$("<input type='text'/>")
				     .attr("value","")
				     .attr("name", "rs_entrega_pedido")
				     .appendTo("#form_generar_pedido");
					
				}else{
					
					$("<input type='text'/>")
				     .attr("value",$("#ruc_fac").val())
				     .attr("name", "ruc_entrega_pedido")
				     .appendTo("#form_generar_pedido");
					
					$("<input type='text'/>")
				     .attr("value",$("#rs_fac").val())
				     .attr("name", "rs_entrega_pedido")
				     .appendTo("#form_generar_pedido");
					
				}
				
				
				$("#ce_facturacion").text($("#facturacion").val());
				
				$("<input type='text'/>")
			     .attr("value",$("#facturacion").val())
			     .attr("name", "facturacion_generar_pedido")
			     .appendTo("#form_generar_pedido");
				
				$("<input type='text'/>")
			     .attr("value",$("#departamento option:selected").text())
			     .attr("name", "departamento_entrega_pedido")
			     .appendTo("#form_generar_pedido");
				
				$("<input type='text'/>")
			     .attr("value",$("#provincia option:selected").text())
			     .attr("name", "provincia_entrega_pedido")
			     .appendTo("#form_generar_pedido");
				
				$("<input type='text'/>")
			     .attr("value",$("#distrito option:selected").text())
			     .attr("name", "distrito_entrega_pedido")
			     .appendTo("#form_generar_pedido");
				
				$("<input type='text'/>")
			     .attr("value",$("#direccion").val())
			     .attr("name", "direccion_entrega_pedido")
			     .appendTo("#form_generar_pedido");
				
				$("<input type='text'/>")
			     .attr("value",$("#referencia").val())
			     .attr("name", "referencia_entrega_pedido")
			     .appendTo("#form_generar_pedido");
				
				$("<input type='text'/>")
			     .attr("value",$("#telefono1").val())
			     .attr("name", "telefono_entrega_pedido")
			     .appendTo("#form_generar_pedido");
				
				$("<input type='text'/>")
			     .attr("value",$("#telefono2").val())
			     .attr("name", "telefono_entrega_pedido2")
			     .appendTo("#form_generar_pedido");
				
				$("<input type='text'/>")
			     .attr("value",$("#cuota_tarjeta").val())
			     .attr("name", "cuotas_entrega_pedido")
			     .appendTo("#form_generar_pedido");
				
			}
		     

		}
		
		
		function ejecutarForm(){
			
			$("#form_generar_pedido").submit();
			
		}
		
		
		
		
		
		
		