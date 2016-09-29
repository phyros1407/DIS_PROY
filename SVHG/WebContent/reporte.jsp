<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<!-- Resources -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>

<style>
#chartdiv {
	width		: 100%;
	height		: 500px;
	font-size	: 11px;
}					
</style>
<body>

</body>
<!--------------------------------SCRIPT REPORTE------------------------- -->
	<div class="row">
		<center><h1>Reporte de Ventas</h1></center>
	</div>
	
	
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<div id="chartdiv"></div>
		</div>
		<div class="col-sm-1"></div>
		
	</div>
	<hr>
	<div class="row">
		<div class="col-sm-10"></div>
		<div class="col-sm-1"><a href="<%=request.getContextPath() %>/ServletReporteVentas" class="btn btn-warning" role="button">Regresar</a></div>
		<div class="col-sm-1"></div>
		
	</div>

<script>
var chart = AmCharts.makeChart( "chartdiv", {
  "type": "serial",
  "theme": "light",
  "dataProvider": [ {
    "country": "Enero",
    "visits": 1025
  }, {
    "country": "Febrero",
    "visits": 882
  }, {
    "country": "Marzo",
    "visits": 809
  }, {
    "country": "Abril",
    "visits": 322
  }, {
    "country": "Mayo",
    "visits": 1122
  }, {
    "country": "Junio",
    "visits": 1114
  }, {
    "country": "Julio",
    "visits": 984
  }, {
    "country": "Agosto",
    "visits": 711
  }, {
    "country": "Setiembre",
    "visits": 665
  }, {
    "country": "Octubre",
    "visits": 580
  }, {
    "country": "Noviembre",
    "visits": 443
  }, {
    "country": "Diciembre",
    "visits": 395
  } ],
  "valueAxes": [ {
    "gridColor": "#FFFFFF",
    "gridAlpha": 0.2,
    "dashLength": 0
  } ],
  "gridAboveGraphs": true,
  "startDuration": 1,
  "graphs": [ {
    "balloonText": "[[category]]: <b>[[value]]</b>",
    "fillAlphas": 0.8,
    "lineAlpha": 0.2,
    "type": "column",
    "valueField": "visits"
  } ],
  "chartCursor": {
    "categoryBalloonEnabled": false,
    "cursorAlpha": 0,
    "zoomable": false
  },
  "categoryField": "country",
  "categoryAxis": {
    "gridPosition": "start",
    "gridAlpha": 0,
    "tickPosition": "start",
    "tickLength": 20
  },
  "export": {
    "enabled": true
  }

} );
</script>



<!--------------------------------SCRIPT REPORTE------------------------- -->


</html>