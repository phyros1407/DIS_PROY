/*-----------------------servicios-------------------------------------------*/
		function buscarReniec(){
			
			var dni = $('#txtDni5').val();
		 
			 var accion='buscarDni';
			  $.get('http://servicios.jelasticlw.com.br/service/Gestionar_Persona', {
				 
						accion : accion,
						dni:dni
					}, function(response) {		
						console.log("entasd"+response);
						if (response!=null) {
							 if(document.getElementById("rdnempresa").checked==true ||
									 document.getElementById("rdnpersona").checked==true  ){
							console.log("entrooo");	
								$('#txtNombres2').val(response['object']['nombres']); 
								$('#txtApePat2').val(response['object']['apePat']); 
								$('#txtApeMat2').val(response['object']['apeMat']); 
							 }else{
									alert("debe seleccionar un el modo de registro")
							 }	
						}else{
							
							alert("El numero de DNI es incorrecto o no esta registrado en la RENIEC")
							
						}		
			  });
		 
		 
	}
		
		function buscarRuc3(){
			
				 var ruc = $('#txtruc2').val();
				
				 var accion='buscarRuc';
				  $.get('http://servicios.jelasticlw.com.br/service/Gestionar_Empresa', {
					  
							accion : accion,
							ruc:ruc
						}, function(response) {		
							if (response!=null) { 
							if(document.getElementById("rdnempresa").checked==true){
							
								//console.log("entrooo");	
									$('#txtrazon2').val(response['object']['razonSocial']);  
								}else{
									alert("debe seleccionar un el modo de registro")
								}
							}else{
								
								alert("El numero de RUC es incorrecto o no esta registrado en la SUNAT");
								$('#txtrazon2').val("");
							}			
				  });
				
			
			
			 
		}
		
		/*-----------------------fin de servicios-------------------------------------------*/	
		
		
		/*---------------div empresa---------------*/
		var xx="persona";
		  function aparecer2(){
			  xx="empresa";
		   if(document.getElementById("rdnempresa").checked==true){
			  console.log(document.getElementById("rdnempresa").checked)
		    document.getElementById('empresa2').style.visibility="visible";
		    document.getElementById("rdnpersona").checked = false;
		   }
		  
		  }
		  
		  function aparecer32(){
			  xx="persona";
			   if(document.getElementById("rdnpersona").checked==true){
				   console.log(document.getElementById("rdnempresa").checked)
				   document.getElementById('empresa2').style.visibility="hidden";
				   document.getElementById("rdnempresa").checked = false;
				
			   	 
			   	 
			    }
			     
			  }
		     
		  /*---------------fin div empresa---------------*/
		  
		  
		  
		  
		  function buscarCorreo(){
				 var txtCorreo = $('#txtCorreo2').val();
				 console.log(txtCorreo)
				 var accion='buscarCorreo';
				  $.post('../ServletCliente', {
					  	txtCorreo : txtCorreo,
							accion : accion
						}, function(response) {
							console.log("entro")
							if (response.success==true) {
									//document.getElementById("divClave").innerHTML="<input type=email class=form-control onchange=buscarCorreo() autofocus name=txtCorreo id=txtCorreo>";
									alert("El correo esta en uso. Vuelva a intentar con otro correo.")
									var txtCorreo = $('#txtCorreo2').val("");
								}else{
					
//									alert("Correo valido");
								}	
				  });
			  }
		  
		  
		  /*------------------------------------------------------------------*/
		 
		  function registrarCliente(){
			  var txt_dni = $('#txtDni5').val();
			  var txt_nombre = $('#txtNombres2').val();
			  var txt_apepat = $('#txtApePat2').val();
			  var txt_apemat = $('#txtApeMat2').val();
			  var txtCorreo = $('#txtCorreo2').val();
			  var txtCelular = $('#txtTelefono2').val();
			  var txtRuc=$('#txtruc2').val();
			  var txtRazon=$('#txtrazon2').val();

			  var optradio=xx;
			
			 
			  var usuario=(txt_nombre.charAt(0)+txt_apepat+txt_apemat.charAt(0)).toUpperCase();
			  var password=(txt_nombre.charAt(0)+txt_apepat+txt_apemat.charAt(0)).toUpperCase();
			  var txtClave=password;
			  console.log("clave"+txtClave)
			 
			  var longNum=txtCelular.length;
			  var  num=txtCelular.charAt(0);
			  var y=0;
			  if((num!='9' && longNum=='9') || ((num=='1' || num=='8' || num=='9'  ) && longNum=='7' ) || longNum<7) {
				  y=1;
			  }
			  var x;
			  emailRegex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
			 	if(emailRegex.test(txtCorreo)){
					x=1;
				}else{
					x=2;
				}
			 	
			if(txt_dni==''){
				alert("Debe llenar los campos obligatorios.");
			 /* }else if(txtRuc==''){
				  alert("Debe llenar los campos obligatorios asdaas.");*/
			  }else if(txtCorreo==''){
				  alert("Debe llenar los campos obligatorios.");
			  }else if(x==2){
				  alert("Correo no valido. Utilize el sgt. Formato:\ncorreo@domain");
			 
			  }else if(txtCelular==''){
				  alert("Debe llenar los campos obligatorios.");
			  }else if(y=='1'){
				  if(longNum=='9'){
					    alert("Numero de celular incorrecto. Debe iniciar con 9");
					   
				  }
				  if(longNum=='7'){
					  alert("Numero fijo incorrecto")
				  }
					  alert("Ingrese numero de celular o fijo.");
					  $('#txtTelefono2').val("");
				  
			  }else if(optradio==''){
				  alert("Debe llenar los campos obligatorios.");
			  }else{ 
				  if((txtRuc=='' || txtRazon=='') && document.getElementById("rdnempresa").checked==true){
						alert("Debe llenar los campos obligatorios.")
						console.log("complete los campos"+txtRuc)
					}else{
						console.log("complete los campos2"+txtRuc)
				  var accion='registrarClientes';
				  $.post('../ServletVenta', {
					  	txt_dni : txt_dni,
					  	txt_nombre : txt_nombre,
					  	txt_apemat : txt_apemat,
					  	txt_apepat : txt_apepat,
					  	
					  	txtCorreo : txtCorreo,
					  	txtCelular : txtCelular,
					  	txtRuc : txtRuc,
					  	txtRazon : txtRazon,
					  	optradio : optradio,
					  	
							accion : accion
						}, function(response) {
							
							if (response.success==true) {
								//location.reload();
									
									alert("Cliente Registrado. Su usuario es: "+usuario)
									//document.location.href="home.jsp";
									$('#modalClienteRegistrar').modal('hide');
									 $('#txtDni5').val("");
									 $('#txtNombres2').val("");
									 $('#txtApePat2').val("");
									 $('#txtApeMat2').val("");
									 $('#txtCorreo2').val("");
									 $('#txtTelefono2').val("");
									 $('#txtruc2').val("");
									 $('#txtrazon2').val("");
								}else{

									alert("Error en Registrar Cliente");
									
								}	
				  });
			  }
			  }
		  }
		  
		  
		  
		  
	/*		function registrarCliente(){
				  var txt_dni = $('#txtDni2').val();
				  var txt_nombre = $('#txtNombres2').val();
				  var txt_apepat = $('#txtApePat2').val();
				  var txt_apemat = $('#txtApeMat2').val();
				  var txtCorreo = $('#txtCorreo2').val();
				  var txtCelular = $('#txtTelefono2').val();
				  var txtRuc=$('#txtruc2').val();
				  var txtRazon=$('#txtrazon2').val();
				  var optradio=xx;
				  console.log("option"+optradio)
				 
				  var usuario=(txt_nombre.charAt(0)+txt_apepat+txt_apemat.charAt(0)).toUpperCase();
				  var password=(txt_nombre.charAt(0)+txt_apepat+txt_apemat.charAt(0)).toUpperCase();
				  var txtClave=password;
				  console.log("clave"+txtClave)
				  var longNum=txtCelular.length;
				  var  num=txtCelular.charAt(0);
				  var y=0;
				  
				  if((num!='9' && longNum=='9') || ((num=='1' || num=='8' || num=='9'  ) && longNum=='7' ) || longNum<7) {
					  y=1;
				  }
				  var x;
				  emailRegex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
				 	if(emailRegex.test(txtCorreo)){
						x=1;
					}else{
						x=2;
					}
				 
						
					  
					  var accion='registrarClientes';
					  $.post('../ServletVenta', {
						  	txt_dni : txt_dni,
						  	txt_nombre : txt_nombre,
						  	txt_apemat : txt_apemat,
						  	txt_apepat : txt_apepat,
						  	txtClave : txtClave,
						  	txtCorreo : txtCorreo,
						  	txtCelular : txtCelular,
						  	txtRuc : txtRuc,
						  	txtRazon : txtRazon,
						  	optradio : optradio,
						  	
								accion : accion
							}, function(response) {
								
								if (response.success==true) {
									if(xx="persona" && document.getElementById("rdnempresa").checked==false)  {	
										if(txt_dni==''){
											alert("Debe llenar los campos obligatorios.");
										  }else if(txtCorreo==''){
											  alert("Debe llenar los campos obligatorios.");
										  }else if(x==2){
											  alert("Correo no valido. Utilize el sgt. Formato:\ncorreo@domain");
										  }else if(txtCelular==''){
											  alert("Debe llenar los campos obligatorios.");
										  }else if(y=='1'){
											  if(longNum=='9'){
												    alert("Numero de celular incorrecto. Debe iniciar con 9");
											  }
											  if(longNum=='7'){
												  alert("Numero fijo incorrecto")
											  }
												  alert("Ingrese numero de celular o fijo.");
										  
										 
										  }else{ 
											  if(xx="empresa" && document.getElementById("rdnpersona").checked==false){
											 		if(txtRuc=='' && txtRazon==''){
														 alert("debe llenar campo csmsrrrr")
											 		}else{	
									
											 			console.log("entroooooooooooo empresa")
											 			alert("Cliente Registrado. Su usuario es: "+usuario+"asdas"+txtClave)
											 			location.reload();
									
											 		}
											 		console.log("entroooooooooooo empresa2")
											  }
									
										  alert("cliente registrado")
										  location.reload();
										  }}
										
									}else{

										alert("	 existe");
										
									}	
					  });
				  
				
				 	
			
			
}*/
				
				  
				
				
			