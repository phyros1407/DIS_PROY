/*function enviarDatos(row){
		alert("entroooooo"+row)
		
		var tbl = document.getElementById("table-cliente");
		var numRows = tbl.rows.length;

		alert("lleggooooooo"+tbl+"asdasd"+numRows)
			//var ID = tbl.rows[row].id;
		//alert("asdasdsd"+ID)
		    var cells = tbl.rows[row].getElementsByTagName('td');
		   
			document.getElementById("txtDni1").value = cells[0].innerHTML;
			document.getElementById("txtNombres1").value = cells[1].innerHTML;
			document.getElementById("txtApePat1").value = cells[2].innerHTML;
			document.getElementById("txtApeMat1").value = cells[3].innerHTML;
			document.getElementById("txtCorreo1").value = cells[4].innerHTML;
			document.getElementById("txtTelefono1").value = cells[5].innerHTML;
			document.getElementById("txtDireccion1").value = cells[6].innerHTML;
		alert(document.getElementById("txtDni1").value = cells[0].innerHTML)
		$('#modalCliente').modal('hide');
		//$('#modalCliente').modal('')
		
		
	}*/
	

 function enviarDatos(cont){
		
		var id = cont;
		//alert("asdasdasdada: "+id);
		var accion ='seleccionId'
			// Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
			$.post('../ServletCliente', {
				id : id,
				accion : accion
			}, function(response) {
				if (response!=null) {
					$('#txtIdPersona').val(response['object']['id']);
					$('#txtDni1').val(response['object']['dni']);
					$('#txtNombres1').val(response['object']['nombre']); 
					$('#txtApePat1').val(response['object']['apePat']); 
					$('#txtApeMat1').val(response['object']['apeMat']); 
					$('#txtCorreo1').val(response['object']['correo']); 
					$('#txtTelefono1').val(response['object']['telefono']); 
					$('#txtCelular1').val(response['object']['celular']); 
					$('#txtDireccion1').val(response['object']['direccion']); 
						
					 
					 $('#modalCliente').modal('hide');
				}else {
					alert("no existe");
					
					 error.style.visibility = "visible";
					
				}
				 //$('#table-cliente').append("");
				//$(this).removeData('modalCliente');
				 //$("#table-cliente > tr").remove();
				 $('#txtDatoC').val("");
				 $('#selectCriterio').val("SELECCIONAR");
				$('#table-cliente td').remove();
		
			});
		
	}

 function enviarDatosProducto(cont){
		
		var id = cont;
		//alert("asdasdasdada: "+id);
		var accion ='seleccionProductoId'
			// Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
			$.post('../Gestionar_Producto', {
				id : id,
				accion : accion
			}, function(response) {
				if (response!=null) {
					$('#txtIdProducto').val(response['object']['idProducto']);
					$('#txtCodProducto').val(response['object']['codPro']);
					$('#txtNombresProd').val(response['object']['nombre']); 
					$('#txtDescripcion').val(response['object']['descripcion']); 
					$('#txtPrecio').val(response['object']['precio']); 
					$('#categoria').val(response['object']['idCategoria']); 
					
						
					 
					 $('#modalProducto').modal('hide');
				}else {
					alert("no existe");
					
					 error.style.visibility = "visible";
					
				}
				 //$('#table-cliente').append("");
				//$(this).removeData('modalCliente');
				 //$("#table-cliente > tr").remove();
				 $('#txtDatoP').val("");
				 $('#selectCriterioP').val("SELECCIONAR");
				$('#table-producto td').remove();
		
			});
		
	}


	/*function enviarDatosProducto(row){
		alert("entroooooo"+row)
		
		var tbl = document.getElementById("table-producto");
		var numRows = tbl.rows.length;

		alert("lleggooooooo"+tbl+"asdasd"+numRows)
			//var ID = tbl.rows[row].id;
		//alert("asdasdsd"+ID)
		    var cells = tbl.rows[row].getElementsByTagName('td');
		   
		document.getElementById("txtCodProducto").value = cells[0].innerHTML;
		document.getElementById("txtNombresProd").value = cells[1].innerHTML;
		document.getElementById("txtPrecio").value = cells[2].innerHTML;
		document.getElementById("txtDescripcion").value = cells[3].innerHTML;
		document.getElementById("categoria").value = cells[4].innerHTML;
		alert(document.getElementById("txtCodProducto").value = cells[0].innerHTML)
		 $('#modalProducto').modal('hide');
	}*/