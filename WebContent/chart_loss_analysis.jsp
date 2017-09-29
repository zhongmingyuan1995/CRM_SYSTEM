<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="java.util.List,com.crm.model.Salchance,com.crm.model.Plan"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>amCharts examples</title>
        <link rel="stylesheet" href="style.css" type="text/css">
        <script src="amcharts/amcharts.js" type="text/javascript"></script>
        <script src="amcharts/serial.js" type="text/javascript"></script>
        
        <script type="text/javascript">
            
            AmCharts.makeChart("chartdiv", {
            
                type: "serial",
                dataProvider: [{
                    "date": "2012-01-01",
                        "value": 8
                }, {
                    "date": "2012-01-01",
                        "value": 8
                }, {
                    "date": "2012-01-02",
                        "value": 10
                }, {
                    "date": "2012-01-03",
                        "value": 12
                }, {
                    "date": "2012-01-04",
                        "value": 14
                }, {
                    "date": "2012-01-05",
                        "value": 11
                }, {
                    "date": "2012-01-06",
                        "value": 6
                }, {
                    "date": "2012-01-07",
                        "value": 7
                }, {
                    "date": "2012-01-08",
                        "value": 9
                }, {
                    "date": "2012-01-09",
                        "value": 13
                }, {
                    "date": "2012-01-10",
                        "value": 15
                }, {
                    "date": "2012-01-11",
                        "value": 19
                }, {
                    "date": "2012-01-12",
                        "value": 21
                }, {
                    "date": "2012-01-13",
                        "value": 22
                }, {
                    "date": "2012-01-14",
                        "value": 20
                }, {
                    "date": "2012-01-15",
                        "value": 18
                }, {
                    "date": "2012-01-16",
                        "value": 14
                }, {
                    "date": "2012-01-17",
                        "value": 16
                }, {
                    "date": "2012-01-18",
                        "value": 18
                }, {
                    "date": "2012-01-19",
                        "value": 17
                }, {
                    "date": "2012-01-20",
                        "value": 15
                }, {
                    "date": "2012-01-21",
                        "value": 12
                }, {
                    "date": "2012-01-22",
                        "value": 10
                }, {
                    "date": "2012-01-23",
                        "value": 8
                }],
            
                pathToImages: "amcharts/images/",
            
                dataDateFormat: "YYYY-MM-DD",
                categoryField: "date",
            
            
                categoryAxis: {
                    parseDates: true,
                    minPeriod: "DD",
                    gridAlpha: 0.1,
                    minorGridAlpha: 0.1,
                    axisAlpha: 0,
                    minorGridEnabled: true,
                    inside: true
                },
            
                valueAxes: [{
            
                    tickLength: 0,
                    axisAlpha: 0,
                    showFirstLabel: false,
                    showLastLabel: false,
            
                    guides: [{
                        value: 10,
                        toValue: 20,
                        fillColor: "#00CC00",
                        inside: true,
                        fillAlpha: 0.2,
                        lineAlpha: 0
                    }]
            
                }],
            
            
                graphs: [{
                    lineColor: "#00CC00",
                    valueField: "value",
                    dashLength: 3,
                    bullet: "round",
                    balloonText: "[[category]]<br><b><span style='font-size:14px;'>value:[[value]]</span></b>"
                }],
            
                chartCursor: {},
                chartScrollbar: {},
            
                trendLines: [{
                    initialDate: new Date(2012, 0, 2, 12),
                    finalDate: new Date(2012, 0, 11, 12),
                    initialValue: 10,
                    finalValue: 19,
                    lineColor: "#CC0000"
                },
                {
                    initialDate: new Date(2012, 0, 17, 12),
                    finalDate: new Date(2012, 0, 22, 12),
                    initialValue: 16,
                    finalValue: 10,
                    lineColor: "#CC0000"
                }]
            });
        </script>
    </head>
<body>
	<%@include file="head_left_right.jsp"%>
	<div class="content">
		<div class="row animated fadeInRight">
			<div class="col-sm-12">
				<div class="panel">
					<div class="panel-content">
						<div class="row">
							<div class="col-md-12">	
									<blockquote class="b-darker-1 bl-md">
										<p>统计报表>客户流失分析>TOP10</p>
									</blockquote>							
									选择形式:
							        <a href="#" onclick="makeCharts('light', '#ffffff');">表格</a> |
							        <a href="#" onclick="makeCharts('dark', '#282828')">折线图</a> |
							        <a href="#" onclick="makeCharts('patterns', '#ffffff')">秒表图</a> |
							        <a href="#" onclick="makeCharts('chalk', '#282828', 'images/board.jpg')">矩阵图</a>
						        <div id="chartdiv" style="width: 100%; height: 400px;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$(document).ready(function(){  
		  var arr = document.getElementsByClassName("has-child-item");
		  arr[3].classList.add("open-item");
		  arr[3].classList.add("active-item");
	})
</script>
</body>
</html>