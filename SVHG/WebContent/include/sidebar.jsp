<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <div class="page-sidebar-wrapper">
                <!-- BEGIN SIDEBAR -->
                <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
                <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
                <div class="page-sidebar navbar-collapse collapse">
                    <!-- BEGIN SIDEBAR MENU -->
                    <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
                    <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
                    <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
                    <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
                    <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
                    <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
                    <ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 20px">
                        <!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
                        <li class="sidebar-toggler-wrapper hide">
                            <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                            <div class="sidebar-toggler"> </div>
                            <!-- END SIDEBAR TOGGLER BUTTON -->
                        </li>
                        <!-- DOC: To remove the search box from the sidebar you just need to completely remove the below "sidebar-search-wrapper" LI element -->
                        <li class="nav-item start active open">
                            <a href="<%=request.getContextPath() %>/inicio.jsp" class="nav-link nav-toggle">
                                <i class="icon-home"></i>
                                <span class="title">Inicio</span>
                                <span class="selected"></span>
                                
                            </a>
                      	</li>
                        <li class="heading">
                            <h3 class="uppercase">ADMINISTRADOR</h3>
                        </li>
                        
                       
                        <li class="nav-item  ">
                            <a href="Gestionar_Usuario" class="nav-link nav-toggle">
                                <i class="icon-puzzle"></i>
                                <span class="title">Gestionar Usuario</span>
                                
                            </a>
                        </li>
                        <li class="nav-item  ">
	                         <a href="<%=request.getContextPath() %>/Gestionar_Producto" class="nav-link nav-toggle">
	                                <i class="icon-diamond"></i>
	                                <span class="title" href="" >Gestionar Producto</span>
	                        </a>
                        </li>
                        <li class="nav-item  ">
	                         <a href="<%=request.getContextPath() %>/GestionarEstadoPedido.jsp" class="nav-link nav-toggle">
	                                <i class="icon-diamond"></i>
	                                <span class="title" href="" >Gestionar Estado Pedido</span>
	                        </a>
                        </li>
                       
                         <li class="nav-item  ">
	                         <a href="<%=request.getContextPath() %>/RegistrarVenta/RegistrarVentaHerramientas.jsp" class="nav-link nav-toggle">
	                                <i class="icon-puzzle"></i>
	                                <span class="title" href="" >Registrar Venta</span>
	                        </a>
                        </li>
                         <li class="nav-item">
	                         <a href="<%=request.getContextPath() %>/ServletReporteVentas" class="nav-link nav-toggle">
	                                <i class="icon-puzzle"></i>
	                                <span class="title" href="" >Reporte de Ventas</span>
	                        </a>
                        </li>
                        <li class="nav-item  ">
	                         <a href="<%=request.getContextPath() %>/ServletOferta" class="nav-link nav-toggle">
	                                <i class="icon-diamond"></i>
	                                <span class="title" href="" >Registrar ofertas</span>
	                        </a>
                        </li>
                  
                               
                      
                    </ul>
                    <!-- END SIDEBAR MENU -->
                    <!-- END SIDEBAR MENU -->
                </div>
                <!-- END SIDEBAR -->
            </div>
</body>
</html>