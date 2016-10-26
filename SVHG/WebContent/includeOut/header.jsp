
<script type="text/javascript">
	
	
		window.onload = function() {

				$("#cantidadProductos").text(localStorage.length);
		};

		
		
</script>

<div class="header_top"><!--header_top-->
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div class="contactinfo">
					<ul class="nav nav-pills">
					<li><a href="#"><i class="fa fa-phone"></i> 997 274 277</a></li>
					<li><a href="#"><i class="fa fa-envelope"></i> informes@nanosports.com.pe</a></li>
					</ul>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="social-icons pull-right">
					<ul class="nav navbar-nav">
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
						<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
						<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div><!--/header_top-->
		
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
								<a href="home.jsp"><img src="imagesOut/inicio/logo.png" alt="" /></a>
						</div>
						
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
							<%if(session.getAttribute("mostrarLogin")=="no"){ %>
							<li><a><font color=blue>Bienvenido <%=session.getAttribute("nombreApellidoPersona") %></font></a><input type="hidden" id="nombre_cliente" value="<%=session.getAttribute("nombreApellidoPersona") %>"></li>

							<li><a href="ServletCliente?accion=actualizarDatos"><i class="fa fa-user"></i> Cuenta</a></li>

						
							<li><a href="ServletPedido?accion=listarPedidos&estado=P"><i class="fa fa-shopping-cart"></i>Pedidos</a></li>

							<%} %>
							<%if(request.getAttribute("msjError")!=null){ %>
								<li><a><font color=red><%=request.getAttribute("msjError") %></font></a></li>
							<%} %>	
								<li><a href="carritoCompra.jsp"><i
								class="fa fa-shopping-cart"></i> Carrito <span id="cantidadProductos" class="badge">0</span></a></li>
								
								<%if(session.getAttribute("mostrarLogin")=="no"){ %>
								 
							
								<li><a href="ServletLogin?accion=cerrarSesion"><i class="fa fa-lock"></i> Cerrar Sesión</a><input type="hidden" id="validacion" value="apc"><input type="hidden" id="diu" value="<%=session.getAttribute("usuId") %>"></li>
								
								<%}else{ %>
								<li><a  data-toggle="modal" data-target="#modalLogin"><i class="fa fa-lock"></i> Iniciar Sesión</a><input type="hidden" id="validacion" value="napc"></li>
								
								
								<li><a href="registrarCliente.jsp"><i class="fa fa-pencil"></i> Registrarse</a></li>
								<%} %>
								
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
					<ul class="nav navbar-nav collapse navbar-collapse">
						<!-- Ahref pag inicio -->
						<li><a href="home.jsp" class="active">Inicio</a></li>
						<li class="dropdown"><a href="home.jsp">Shop<i
								class="fa fa-angle-down"></i></a>
							<ul role="menu" class="sub-menu">
								<li><a href="home.jsp">Productos</a></li>
							</ul></li>
						<!-- <li><a href="contact-us.html">Contacto</a></li> -->
					</ul>
				</div>
					</div>
					<div class="col-sm-3">
						<div class="search_box pull-right">
							<input type="text" placeholder="Search"/>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
	</header><!--/header-->
	<!-- modal!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	
	<div class="modal fade" id="modalLogin" role="dialog">
		<div class=modal-dialog>
			<div class=modal-content>
				<div class=modal-body >
					<div >
						<!-- BEGIN LOGIN FORM -->
		<form class="form-vertical login-form"  method="post" action="<%=getServletContext().getContextPath() %>/ServletLogin" >
			 <input type="hidden" name="accion" id="accion" value="validarDato">
		
				<h3>Ingresa a tu cuenta:</h3><br>
			<div class="alert alert-error hide">
				<button class="close" data-dismiss="alert"></button>
				<span>Ingresa usuario y/o contraseña.</span>
			</div>
			
			<div class="row">
				
									<div class="form-group">
										  <label class="col-sm-2 control-label">Usuario:</label>
										  <div class="col-sm-6">
										    	<input id="usuario"class="form-control" onchange="validarUsu()" type="text" autocomplete="off" placeholder="Usuario" name="usuario" required/>
												<input disabled id="astUsu" name="astUsu" style="border: none;color: red;background-color: #fff;" value="*" >
												
										   </div>
									</div>		
				</div>	
								
				<div class="row">	
									<div class="form-group">
										     <label class="col-sm-2 control-label">Clave:</label>
										     <div class="col-sm-6">
										   		 <input id="contraseña" class="form-control" onchange="validarClave()" type="password" autocomplete="on" placeholder="Contraseña" name="contraseña" required>
												<input disabled id="astClave" name="astClave" style="border: none; color: red; background-color: #fff;" value="*" >
										     </div>
									 </div> 
									
					
					
			</div>
			
			 <script >
									 function validarUsu(){
										 if(document.getElementById("usuario").value!=''){
											 document.getElementById("astUsu").value="";
										 }else{
											 document.getElementById("astUsu").value="*";
										 }
									 }
									 function validarClave(){
										 if(document.getElementById("contraseña").value!=''){
											 document.getElementById("astClave").value="";
										 }else{
											 document.getElementById("astClave").value="*";
										 }
									 }
				 </script>
			<center><button type="submit" class="btn btn-default" style="background-color: #008CBA;color: white;" >Ingresar</button></center>  
			<div class="form-actions">
				
			
			</div>
			
			<hr>
		</form>
		<!-- END LOGIN FORM -->        
		<!-- BEGIN FORGOT PASSWORD FORM -->
		<form class="form-vertical forget-form" action="ServletLogin" method="post">
		<input type="hidden" name="accion" id="accion" value="recuperarCorreo">
		<center>
			<h4>¿Olvidaste tu Contraseña?</h4>
			<p>Ingresa tu correo para restablecer tu contraseña</p>
			<div class="control-group">
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-envelope"></i>
						<input onchange="validarCorreo()" required class="form-control" style="width: 40%"type="text" placeholder="Email" autocomplete="off" id="correo" name="correo" />
						 <font color="red"><span id="emailOK"></span></font>
					</div>
					
				</div>
				
			</div>
			<script >
		
			function validarCorreo(){
				  campo = event.target;
				    valido = document.getElementById('emailOK');
				        
				    emailRegex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
				    //Se muestra un texto a modo de ejemplo, luego va a ser un icono
				    if (emailRegex.test(campo.value)) {
				    	 document.getElementById("botonRecuperar").disabled = false;
				    	 valido.innerText = "";
				    } else {
				      document.getElementById("botonRecuperar").disabled = true;
				      valido.innerText = "Correo Inválido, correo@domai.";
				    }
			
			}	
			  
			
			</script>
			<div class="form-actions">
				<br>
				    <button type="submit" id="botonRecuperar"  class="btn blue ">
				Recuperar 
				</button>        
			</div>
			</center>
		</form>
					</div>
					</div>
					<div class=modal-footer>
						<button type=button class=btn btn-default data-dismiss=modal>Cerrar</button>
					</div>
			</div>
		</div>
	</div>
  