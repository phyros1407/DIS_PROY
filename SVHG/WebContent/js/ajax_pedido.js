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
						$("#mosTel").text("Telefono : " + telefono1 + "\n \n"+ " Otro Telefono : " + telefono2);
					});
		});
		
		