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
        
            var chartData = [];
            generateChartData();

            var chart = AmCharts.makeChart("chartdiv", {
                type: "serial",
                pathToImages: "amcharts/images/",
                dataProvider: chartData,
                categoryField: "date",
                categoryAxis: {
                    parseDates: true,
                    gridAlpha: 0.15,
                    minorGridEnabled: true,
                    axisColor: "#DADADA"
                },
                valueAxes: [{
                    axisAlpha: 0.2,
                    id: "v1"
                }],
                graphs: [{
                    title: "red line",
                    id: "g1",
                    valueAxis: "v1",
                    valueField: "visits",
                    bullet: "round",
                    bulletBorderColor: "#FFFFFF",
                    bulletBorderAlpha: 1,
                    lineThickness: 2,
                    lineColor: "#b5030d",
                    negativeLineColor: "#0352b5",
                    balloonText: "[[category]]<br><b><span style='font-size:14px;'>value: [[value]]</span></b>"
                }],
                chartCursor: {
                    cursorPosition: "mouse"
                },
                chartScrollbar: {
                    scrollbarHeight: 40,
                    color: "#FFFFFF",
                    autoGridCount: true,
                    graph: "g1"
                }
            });

            chart.addListener("dataUpdated", zoomChart);


            // generate some random data, quite different range
            function generateChartData() {
                var firstDate = new Date();
                firstDate.setDate(firstDate.getDate() - 500);

                for (var i = 0; i < 500; i++) {
                    // we create date objects here. In your data, you can have date strings 
                    // and then set format of your dates using chart.dataDateFormat property,
                    // however when possible, use date objects, as this will speed up chart rendering.                    
                    var newDate = new Date(firstDate);
                    newDate.setDate(newDate.getDate() + i);

                    var visits = Math.round(Math.random() * 40) - 20;

                    chartData.push({
                        date: newDate,
                        visits: visits
                    });
                }
            }

            // this method is called when chart is first inited as we listen for "dataUpdated" event
            function zoomChart() {
                // different zoom methods can be used - zoomToIndexes, zoomToDates, zoomToCategoryValues
                chart.zoomToIndexes(chartData.length - 40, chartData.length - 1);
            }

            // changes cursor mode from pan to select
            function setPanSelect() {
                var chartCursor = chart.chartCursor;

                if (document.getElementById("rb1").checked) {
                    chartCursor.pan = false;
                    chartCursor.zoomable = true;

                } else {
                    chartCursor.pan = true;
                }
                chart.validateNow();
            }           
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
										<p>统计报表>客户服务分析>TOP10</p>
									</blockquote>							
									选择形式:
							        <a href="#" onclick="makeCharts('light', '#ffffff');">表格</a> |
							        <a href="#" onclick="makeCharts('dark', '#282828')">折线图</a> |
							        <a href="#" onclick="makeCharts('patterns', '#ffffff')">秒表图</a> |
							        <a href="#" onclick="makeCharts('chalk', '#282828', 'images/board.jpg')">矩阵图</a>
						        
						        <div id="chartdiv" style="width: 100%; height: 400px;"></div>
						        <div style="margin-left:35px;">
						            <input type="radio" checked="true" name="group" id="rb1" onclick="setPanSelect()">Select
						            <input type="radio" name="group" id="rb2" onclick="setPanSelect()">Pan
								</div> 
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