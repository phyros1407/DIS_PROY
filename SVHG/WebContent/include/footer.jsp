<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <!-- BEGIN FOOTER -->
        <div class="page-footer" align="center">
            <div class="page-footer-inner"> 2016 &copy; software solution.
                 </div>
            <div class="scroll-to-top">
                <i class="icon-arrow-up"></i>
            </div>
        </div>
        <!-- END FOOTER -->
        <!--[if lt IE 9]>
<script src="../assets/global/plugins/respond.min.js"></script>
<script src="../assets/global/plugins/excanvas.min.js"></script> 
<![endif]-->
        <!-- BEGIN CORE PLUGINS -->
         <script src="<%=request.getContextPath() %>/global/validaciones.js" type="text/javascript"></script>
        
        <script src="<%=request.getContextPath() %>/global/plugins/jquery.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/js.cookie.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="<%=request.getContextPath() %>/global/plugins/moment.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/bootstrap-daterangepicker/daterangepicker.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/morris/morris.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/morris/raphael-min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/counterup/jquery.waypoints.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/counterup/jquery.counterup.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/amcharts/amcharts/amcharts.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/amcharts/amcharts/serial.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/amcharts/amcharts/pie.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/amcharts/amcharts/radar.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/amcharts/amcharts/themes/light.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/amcharts/amcharts/themes/patterns.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/amcharts/amcharts/themes/chalk.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/amcharts/ammap/ammap.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/amcharts/ammap/maps/js/worldLow.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/amcharts/amstockcharts/amstock.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/flot/jquery.flot.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/flot/jquery.flot.resize.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/flot/jquery.flot.categories.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/jquery-easypiechart/jquery.easypiechart.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/jquery.sparkline.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/jqvmap/jqvmap/jquery.vmap.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.russia.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.world.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.europe.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.germany.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.usa.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/global/plugins/jqvmap/jqvmap/data/jquery.vmap.sampledata.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="<%=request.getContextPath() %>/global/scripts/app.min.js" type="text/javascript"></script>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="<%=request.getContextPath() %>/pages/scripts/dashboard.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <script src="<%=request.getContextPath() %>/layouts/layout/scripts/layout.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/layouts/layout/scripts/demo.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath() %>/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
        <!-- END THEME LAYOUT SCRIPTS -->
        
        <!-- data table -->
        <script src="<%=request.getContextPath() %>/media/js/jquery.dataTables.min.js" type="text/javascript"></script>
       <link href="<%=request.getContextPath() %>/media/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
       
        
</body>
</html>