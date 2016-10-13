function solonumeros(e){
	key=e.keyCode || e.which;
	teclado=String.fromCharCode(key);
	numeros="1234567890";
	especiales="8-37-38-46";
	teclado_especial=false;
	for (var i in especiales){
		if(key==especiales[i]){
			teclado_especial=true;
		}
	}
	if(numeros.indexOf(teclado)==-1 && !teclado_especial){
		return false;
	}
}

//VALIDACION SOLO NUMERO PERO PARA EL CARRITO ()
function solonumerosCarr(e){
	key=e.keyCode || e.which;
	teclado=String.fromCharCode(key);
	numeros="1234567890";
	especiales="8-37-38-46";
	teclado_especial=false;
	for (var i in especiales){
		if(key==especiales[i]){
			teclado_especial=true;
		}
	}
	if(numeros.indexOf(teclado)==-1 && !teclado_especial){
		return false;
	}
}


function sololetras(e){
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toLowerCase();
    letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
    especiales = "8-37-39-46";

    tecla_especial = false
    for(var i in especiales){
         if(key == especiales[i]){
             tecla_especial = true;
             break;
         }
     }

     if(letras.indexOf(tecla)==-1 && !tecla_especial){
         return false;
     }
 }

//VALIDAR ENTRADA DE ARCHIVOS A FILE 
function control(f){
    var ext=['gif','jpg','jpeg','png'];
    var v=f.value.split('.').pop().toLowerCase();
    for(var i=0,n;n=ext[i];i++){
        if(n.toLowerCase()==v)
            return
    }
    var t=f.cloneNode(true);
    t.value='';
    f.parentNode.replaceChild(t,f);
    
    alert("¡ARCHIVO INVALIDO, SELECCIONE OTRO!");;
}

//VALIDAR SOLO NUMEROS, 2 DECIMALES Y UN SOLO PUNTO DECIMAL
function NumCheck(e, field) {

	  key = e.keyCode ? e.keyCode : e.which

	  if (key == 8) return true

	  if (key > 47 && key < 58) {

	    if (field.value == "") return true

	    regexp = /.[0-9]{2}$/

	    return !(regexp.test(field.value))

	  }

	  // .

	  if (key == 46) {

	    if (field.value == "") return false

	    regexp = /^[0-9]+$/

	    return regexp.test(field.value)

	  }

	  return false

	}

//VALIDAR TELEFONO
function validarTelefono(txtCelular,error){
	
	  var longNum=txtCelular.length;
	  

	  if(longNum==7){
		  
		  var num = txtCelular.substring(0,1);
		   
		  if(num=='0'||num=='9'||num=='4'||num=='1'||num=='8'){
			  
			  $("#"+error).text("Telefono no valido");
			  $("#boton3").attr('disabled',true); 
		  } else{
			  
			  
			  $("#"+error).text("");
			  $("#boton3").attr('disabled',false);
			  
		  }
		  
	  }else if (longNum==9){
		  
		  var num = txtCelular.substring(0,1);
		  
		  if(num=='0'||num=='2'||num=='3'||num=='1'||num=='8'||num=='4'||num=='5'||num=='6'||num=='7'){
			  
			  $("#"+error).text("Telefono no valido");
			  $("#boton3").attr('disabled',true); 
		  } else{

			  $("#"+error).text("");
			  $("#boton3").attr('disabled',false);

		  }
		    
	  }else {
		  
		  $("#"+error).text("Telefono no valido");
		  $("#boton3").attr('disabled',true); 
		  
	  }
		
	
}



function validarn(e) { // 1
    tecla = (document.all) ? e.keyCode : e.which; // 2
    if (tecla==8) return true; // 3
	 if (tecla==9) return true; // 3
	 if (tecla==11) return true; // 3
    patron = /[0-9-A-Za-zñÑ'.áéíóúÁÉÍÓÚàèìòùÀÈÌÒÙâêîôûÂÊÎÔÛÑñäëïöüÄËÏÖÜ\s\t]/; // 4
 
    te = String.fromCharCode(tecla); // 5
    return patron.test(te); // 6
} 