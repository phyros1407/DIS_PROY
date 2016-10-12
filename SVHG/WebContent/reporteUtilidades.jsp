<%@page import="beans.DetalleTransaccionBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reporte</title>

<!-- Resources -->
	<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
	<script src="https://www.amcharts.com/lib/3/serial.js"></script>
	<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
	<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
	<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
</head>
	<style>
	#chartdiv {
		width		: 100%;
		height		: 500px;
		font-size	: 11px;
	}					
	</style>
	<%	ArrayList<DetalleTransaccionBean> detalleTransaccion = (ArrayList<DetalleTransaccionBean>)request.getAttribute("listaDetalle");%>
<!--------------------------------body------------------------ -->
<body>
	<div class="row">
		<center><h1>Reporte de Ventas</h1></center>
	</div>
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<div id="chartdiv"></div>
		</div>
		<div class="col-sm-1"></div>
	</div><hr>
		
	<div class="row">
		<div class="col-sm-10"></div>
		<div class="col-sm-1"><a href="<%=request.getContextPath() %>/ServletReporteVentas" class="btn btn-warning" role="button">Regresar</a></div>
		<div class="col-sm-1"></div>
		
	</div>
</body>
<!--------------------------------SCRIPT REPORTE------------------------- -->
<%
double enero=0;
double febrero=0;
double marzo=0;
double abril=0;
double mayo=0;
double junio=0;
double julio=0;
double agosto=0;
double setiembre=0;
double octubre=0;
double noviembre=0;
double diciembre=0;

for(int i=0;i<detalleTransaccion.size();i++){
	String x=detalleTransaccion.get(i).getFc();
	x=x.substring(5,7);
	if(x.equals("01")){
		enero=detalleTransaccion.get(i).getImporte();
	}
	if(x.equals("02")){
		febrero=detalleTransaccion.get(i).getImporte();
	}
	if(x.equals("03")){
		marzo=detalleTransaccion.get(i).getImporte();
	}
	if(x.equals("04")){
		abril=detalleTransaccion.get(i).getImporte();
	}
	if(x.equals("05")){
		mayo=detalleTransaccion.get(i).getImporte();
	}
	if(x.equals("06")){
		junio=detalleTransaccion.get(i).getImporte();
	}
	if(x.equals("07")){
		julio=detalleTransaccion.get(i).getImporte();
	}
	if(x.equals("08")){
		agosto=detalleTransaccion.get(i).getImporte();
	}
	if(x.equals("09")){
		setiembre=detalleTransaccion.get(i).getImporte();
	}
	if(x.equals("10")){
		octubre=detalleTransaccion.get(i).getImporte();
	}
	if(x.equals("11")){
		noviembre=detalleTransaccion.get(i).getImporte();
	}
	if(x.equals("12")){
		diciembre=detalleTransaccion.get(i).getImporte();
	}
}%>

<script>
var chart = AmCharts.makeChart( "chartdiv", {
  "type": "serial",
  "theme": "light",
  "dataProvider": [ {
    "country": "Enero",
    "visits": <%=enero%>
  }, {
    "country": "Febrero",
    "visits": <%=febrero%>
  }, {
    "country": "Marzo",
    "visits": <%=marzo%>
  }, {
    "country": "Abril",
    "visits": <%=abril%>
  }, {
    "country": "Mayo",
    "visits": <%=mayo%>
  }, {
    "country": "Junio",
    "visits": <%=junio%>
  }, {
    "country": "Julio",
    "visits": <%=julio%>
  }, {
    "country": "Agosto",
    "visits": <%=agosto%>
  }, {
    "country": "Setiembre",
    "visits": <%=setiembre%>
  }, {
    "country": "Octubre",
    "visits": <%=octubre%>
  }, {
    "country": "Noviembre",
    "visits": <%=noviembre%>	
  }, {
    "country": "Diciembre",
    "visits": <%=diciembre%>
  }],
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