<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="java.util.List,com.crm.model.Salchance,com.crm.model.Plan"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" type="text/css">
        <script src="amcharts/amcharts.js" type="text/javascript"></script>
        <script src="amcharts/serial.js" type="text/javascript"></script>
        <script src="amcharts/pie.js" type="text/javascript"></script>
        <script src="amcharts/themes/light.js" type="text/javascript"></script>
        <script src="amcharts/themes/dark.js" type="text/javascript"></script>
        <script src="amcharts/themes/chalk.js" type="text/javascript"></script>
        <script src="amcharts/themes/patterns.js" type="text/javascript"></script>
        <script type="text/javascript">

        // in order to set theme for a chart, all you need to include theme file
        // located in amcharts/themes folder and set theme property for the chart.

        var chart1;
        var chart2;

        makeCharts("light", "#FFFFFF","");

        // Theme can only be applied when creating chart instance - this means
        // that if you need to change theme at run time, youhave to create whole
        // chart object once again.

        function makeCharts(theme, bgColor, bgImage){

            if(chart1){
                chart1.clear();
            }
            if(chart2){
                chart2.clear();
            }

            // background
            if(document.body){
                document.body.style.backgroundColor = bgColor;
                document.body.style.backgroundImage = "url(" + bgImage + ")";
            }

            // column chart
            chart1 = AmCharts.makeChart("chartdiv1", {
                type: "serial",
                theme:theme,
                dataProvider: [{
                    "year": '中科创达',
                        "income": 750.5,
                        "expenses": 218.1
                }, {
                    "year": '工商银行',
                        "income": 620.2,
                        "expenses": 222.8
                }, {
                    "year": '阿里巴巴',
                        "income": 560.1,
                        "expenses": 230.9
                }, {
                    "year": '腾讯',
                        "income": 490.5,
                        "expenses": 205.1
                }, {
                    "year": '网易',
                        "income": 345.6,
                        "expenses": 250
                }, {
                    "year": '丁香园',
                        "income": 266.6,
                        "expenses": 115
                }, {
                    "year": '苏宁云商',
                        "income": 246.6,
                        "expenses": 102
                }, {
                    "year": '京东',
                        "income": 134.6,
                        "expenses": 85
                }, {
                    "year": '顺风',
                        "income": 121.6,
                        "expenses": 71
                }, {
                    "year": '百度',
                        "income": 89.6,
                        "expenses": 65
                }],
                categoryField: "year",
                startDuration: 1,

                categoryAxis: {
                    gridPosition: "start"
                },
                valueAxes: [{
                    title: "订单金额（万元）"
                }],
                graphs: [{
                    type: "column",
                    title: "订单金额",
                    valueField: "income",
                    lineAlpha: 0,
                    fillAlphas: 0.8,
                    balloonText: "[[title]] in [[category]]:<b>[[value]]</b>"
                }, {
                    type: "line",
                    title: "盈利",
                    valueField: "expenses",
                    lineThickness: 2,
                    fillAlphas: 0,
                    bullet: "round",
                    balloonText: "[[title]] in [[category]]:<b>[[value]]</b>"
                }],
                legend: {
                    useGraphSettings: true
                }

            });

            // pie chart
            chart2 = AmCharts.makeChart("chartdiv2", {
                type: "pie",
                theme: theme,
                dataProvider: [{
                    "country": "中科创达",
                        "litres": 156.9
                }, {
                    "country": "阿里巴巴",
                        "litres": 131.1
                }, {
                    "country": "腾讯",
                        "litres": 115.8
                }, {
                    "country": "网易",
                        "litres": 109.9
                }, {
                    "country": "百度",
                        "litres": 108.3
                }, {
                    "country": "京东",
                        "litres": 65
                }, {
                    "country": "苏宁",
                        "litres": 50
                }],
                titleField: "country",
                valueField: "litres",
                balloonText: "[[title]]<br><b>[[value]]</b> ([[percents]]%)",
                legend: {
                    align: "center",
                    markerType: "circle"
                }
            });

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
										<p>统计报表>客户贡献分析>TOP10&nbsp;&nbsp;<i class="fa fa-sort-amount-desc"></i></p>
									</blockquote>							
								选择主题:
						        <a href="#" onclick="makeCharts('light', '#ffffff');">默认</a> |
						        <a href="#" onclick="makeCharts('dark', '#282828')">淡紫</a> |
						        <a href="#" onclick="makeCharts('patterns', '#ffffff')">雅黑</a> |
						        <span style="float:right">选择形式:
						        <a href="#" onclick="makeCharts('light', '#ffffff');">表格</a> |
						        <a href="#" onclick="makeCharts('dark', '#282828')">折线图</a> |
						        <a href="#" onclick="makeCharts('patterns', '#ffffff')">秒表图</a> |
						        <a href="#" onclick="makeCharts('chalk', '#282828', 'images/board.jpg')">矩阵图</a></span>
						        <div id="chartdiv1" style="width: 100%; height:500px;"></div>
						        <!-- <div id="chartdiv2" style="width: 100%; height: 400px;"></div> -->
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