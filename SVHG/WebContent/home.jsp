<%@page import="beans.ProductoBean"%>
<%@page import="beans.ProveedorBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	ArrayList<ProductoBean> productos = (ArrayList<ProductoBean>) request.getAttribute("productos");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nano-Sports</title>
 
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="css/prettyPhoto.css" rel="stylesheet">
	<link href="css/price-range.css" rel="stylesheet">
	<link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="css/simplePagination.css"/>
	
	<link rel="shortcut icon" href="imagesOut/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="imagesOut/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="imagesOut/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="imagesOut/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="imagesOut/ico/apple-touch-icon-57-precomposed.png">
	
	<script type="text/javascript">
	
	
	  function addProducto(id){
							var idef=id;
		  					var iden="iden";
							localStorage.setItem(idef,iden);
							alert("Producto agregado al carrito.");
		  }
	  
	  function limpiar(){
								localStorage.clear();
								alert("El carrito ha sido limpiado.");
		  }
	  
	
	</script>
	
</head>

<body>
	<%@include file="../includeOut/header.jsp" %>

	
	<section id="slider"><!--slider-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>
						
						<div class="carousel-inner">
							<div class="item active">
								<div class="col-sm-6">
									<h1>Nano Sports</h1>
									<h2>Peru</h2>
									<p>Estamos especializados en brindar servicios y proyectos de 
									asesoría y consultoria en la rama del fitness y del entrenamiento
									 deportivo integral. </p>
									<button type="button" class="btn btn-default get">Consiguelo Ahora</button>
								</div>
								<div class="col-sm-6">
									<img src="imagesOut/inicio/speed.png" class="girl img-responsive" alt="" />
								</div>
							</div>
							<div class="item">
								<div class="col-sm-6">
									<h1>Nano Sports sadfsafsf</h1>
									<h2>Peru</h2>
									<p>Hemos investigado y trabajado para brindar un servicio que realmente llegue a los atletas y entrenadores,</p>
									<button type="button" class="btn btn-default get">Consiguelo Ahora</button>
								</div>
								<div class="col-sm-6">
									<img src="imagesOut/inicio/weightlifting.png" class="girl img-responsive" alt="" />
									
								</div>
								
							</div>
							
							<div class="item">
								<div class="col-sm-6">
									<h1>Nano Sports</h1>
									<h2>Peru</h2>
									<p>Realizamos diversos tipos de evaluaciones para diagnosticar el
									estado actual del atleta y recomendamos los pasos a seguir de acuerdo
									 a los objetivos que se estén 
									buscando</p>
									<button type="button" class="btn btn-default get">Consiguelo Ahora</button>
								</div>
								<div class="col-sm-6">
									<img src="imagesOut/inicio/dumbbell.png" class="girl img-responsive" alt="" />
								</div>
							</div>
							
						</div>
						
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
					
				</div>
			</div>
		</div>
	</section><!--/slider-->
	
	<section>
		<div class="container">
			<div class="row">
				<%@include file="../includeOut/sidebar.jsp" %>
				<input type="button" onclick="limpiar()" value="Vaciar Carritoooo">
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Productos</h2>
						<div id="productoscatalogados" class="paginationlist" align="center">
						</div>
						
						
					</div><!--features_items-->
					
					
					
				
				</div>
			</div>
		</div>
	</section>
	
	
	<%@include file="../includeOut/footer.jsp" %>

</body>
	<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.scrollUp.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/price-range.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.prettyPhoto.js"></script>
	<script src="<%=request.getContextPath()%>/js/main.js"></script>
	<script src="<%=request.getContextPath()%>/js/catalogo.js"></script>


</html>