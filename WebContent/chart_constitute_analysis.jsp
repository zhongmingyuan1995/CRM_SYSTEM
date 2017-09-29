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
        <link rel="stylesheet" href="amcharts/samples/style.css" type="text/css">
        <script src="amcharts/amcharts.js" type="text/javascript"></script>
        <script src="amcharts/serial.js" type="text/javascript"></script>
        <script src="amcharts/themes/dark.js" type="text/javascript"></script>

        <script type="text/javascript">
            var chart = AmCharts.makeChart("chartdiv", {
                "type": "serial",
                "theme": "dark",
                "dataDateFormat": "YYYY-MM-DD",
                "pathToImages": "../amcharts/images/",
                "dataProvider": [{
                    "date": "2013-11-30",
                    "value": 104
                }, {
                    "date": "2013-12-01",
                    "value": 108
                }, {
                    "date": "2013-12-02",
                    "value": 103
                }, {
                    "date": "2013-12-03",
                    "value": 105
                }, {
                    "date": "2013-12-04",
                    "value": 136
                }, {
                    "date": "2013-12-05",
                    "value": 138
                }, {
                    "date": "2013-12-06",
                    "value": 113
                }, {
                    "date": "2013-12-07",
                    "value": 131
                }, {
                    "date": "2013-12-08",
                    "value": 114
                }, {
                    "date": "2013-12-09",
                    "value": 124
                }],
                "valueAxes": [{
                    "maximum": 140,
                    "minimum": 100,
                    "axisAlpha": 0,
                    "guides": [{
                        "fillAlpha": 0.1,
                        "fillColor": "#CC0000",
                        "lineAlpha": 0,
                        "toValue": 120,
                        "value": 0
                    }, {
                        "fillAlpha": 0.1,
                        "fillColor": "#0000cc",
                        "lineAlpha": 0,
                        "toValue": 200,
                        "value": 120
                    }]
                }],
                "graphs": [{
                    "bullet": "round",
                    "dashLength": 4,
                    "valueField": "value"
                }],
                "chartCursor": {
                    "cursorAlpha": 0
                },
                "categoryField": "date",
                "categoryAxis": {
                    "parseDates": true
                }
            });
        </script>
    </head>

    <body>
    <%@include file="head_left_right.jsp"%>
	<div class="content">
		<div class="row animated fadeInRight">
			<div class="col-sm-12">
				<div class="panel" >
					<div class="panel-content">
						<div class="row">
							<div class="col-md-12">	
									<blockquote class="b-darker-1 bl-md">
										<p>统计报表>客户构成分析>TOP10</p>
									</blockquote>
									选择形式:
							        <a href="#" onclick="makeCharts('light', '#ffffff');">表格</a> |
							        <a href="#" onclick="makeCharts('dark', '#282828')">折线图</a> |
							        <a href="#" onclick="makeCharts('patterns', '#ffffff')">秒表图</a> |
							        <a href="#" onclick="makeCharts('chalk', '#282828', 'images/board.jpg')">矩阵图</a>
							  <div class="col-md-12" style="background-color:#3f3f4f;">								
								<div id="chartdiv" style="width: 100%; height: 400px;"></div>
							  </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>        
    </body>
<script type="text/javascript">
$(document).ready(function(){  
	  var arr = document.getElementsByClassName("has-child-item");
	  arr[3].classList.add("open-item");
	  arr[3].classList.add("active-item");
})
</script>
</html>