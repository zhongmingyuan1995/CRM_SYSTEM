<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="fixed">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>客户关系管理系统</title>
    <link rel="apple-touch-icon" sizes="120x120" href="<%=request.getContextPath()%>/favicon/apple-icon-120x120.png">   
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/stylesheets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/stylesheets/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/animate.css/animate.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/toastr/toastr.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/magnific-popup/magnific-popup.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/stylesheets/css/style2.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/stylesheets/css/bootstrap-select.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/stylesheets/css/bootstrap-dialog.min.css">
</head>
<style>
 nav i{width:18px;height:18px;}
</style>
<body>
<div class="wrap">
    
    <div class="page-body" >
        <div class="left-sidebar" >
            <div id="left-nav" class="nano" >
                <div class="nano-content">
                    <nav>
                        <ul class="nav" id="main-nav">                    	
                            <li id="index"><a href="querysalchance.do"><i class="fa fa-home"></i><span>欢迎登录</span></a></li>
                            <li class="has-child-item close-item">
                                <a><i class="fa fa-sliders"></i><span>营销管理</span></a>
                                <ul class="nav child-nav level-1">
                                    <li class=""><a href="querysalchance.do">销售机会管理</a></li>
                                    <li><a href="querysalchanceNodue.do">客户开发计划</a></li>
                                </ul>
                            </li>
                            <li class="has-child-item close-item">
                                <a><i class="fa fa-users"></i><span>客户管理</span></a>
                                <ul class="nav child-nav level-1">
                                    <li><a href="querycustomerLike.cs">客户信息管理</a></li>
                                    <li><a href="queryLost.ls">客户流失管理</a></li>
                                </ul>
                            </li>
                            <li class="has-child-item close-item">
                                <a><i class="fa fa-paper-plane"></i><span>服务管理</span></a>
                                <ul class="nav child-nav level-1">
                                    <li><a href="createService.ss">服务创建</a></li>
                                    <li><a href="queryLikeService.ss?flag=distribute">服务分配</a></li>
                                    <li><a href="queryLikeService.ss?flag=handle">服务处理</a></li>
                                    <li><a href="queryLikeService.ss?flag=feedback">服务反馈</a></li>
									<li><a href="queryLikeService.ss?flag=file">服务归档</a></li>
                                </ul>
                            </li>
                            <li class="has-child-item close-item">
                                <a><i class="fa fa-bar-chart"></i><span>统计报表</span></a>
                                <ul class="nav child-nav level-1">
                                    <li><a href="chart_contribute_analysis.jsp">客户贡献分析</a></li>
                                    <li><a href="chart_constitute_analysis.jsp">客户构成分析</a></li>
                                    <li><a href="chart_service_analysis.jsp">客户服务分析</a></li>
									<li><a href="chart_loss_analysis.jsp">客户流失分析</a></li>
                                </ul>
                            </li>
                            <li class="has-child-item close-item">
                                <a><i class="fa fa-codepen"></i><span>基础数据</span></a>
                                <ul class="nav child-nav level-1">
                                    <li><a href="queryLikeBasdict.bs">数据字典管理</a></li>
                                    <li><a href="queryLikeBasdict.bs">查询产品信息</a></li>    
                                    <li><a href="queryLikeBasdict.bs">查询库存</a></li>                                      
                                </ul>                               
                            </li>
                            <li class="has-child-item close-item">
                                <a><i class="fa fa-cog"></i><span>权限管理</span></a>  
                                 <ul class="nav child-nav level-1">
                                    <li><a href="tables_basic.html">修改密码</a></li>                                  
                                </ul>                             
                            </li>
                            <li class="">
                                <a><i class="fa fa-navicon"></i><span>系统帮助</span></a>                              
                            </li>
                            <li class="">
                                <a>
                                    <i class="fa fa-weixin"></i><span>联系我们</span>
                                </a>                               
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
      	<div class="content">
        <div class="content-header">
			<div class="leftside-content-header">
				<ul class="breadcrumbs">
					<li style="margin-top: 12px;margin-left:10px;"><a href="querysalchance.do"><i class="fa fa-gg"></i><span>客户关系管理系统</span></a></li>
				</ul>
			</div>
			<div class="rightside-content-header">
				<ul class="breadcrumbs">
					<li style="margin-top: 12px"><a href="#" data-toggle="modal" data-target="#sm-modal"><i class="fa fa-power-off log-out" aria-hidden="true"></i></a></li>
				</ul>
			</div>
			<div class="rightside-content-header">				             
                <div class="dropdown" style="margin-top: 8px">
				  <a class="dropdown-toggle"  id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
				   <i class="fa fa-github-alt"aria-hidden="true"></i>&nbsp;
				   	<%if(session.getAttribute("username")==null) {%>
				   	<a href="login.jsp">登录</a>
				   	<%}else {%>当前登录：<%= session.getAttribute("username") %><%} %>
				   <input type="hidden" value="<%= session.getAttribute("username") %>" id="username">
				    <span class="caret"></span>
				  </a>
				  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
				    <li><a href="#">个人信息</a></li>
				    <li><a href="pages_lock-screen.html">锁定屏幕</a></li>
				    <li><a href="#">设置</a></li>
				    <li role="separator" class="divider"></li>
				    <li><a href="#">操作记录</a></li>
				  </ul>
				</div>                 
			</div>
			<div class="rightside-content-header">				               
                <div class="dropdown" style="margin-top: 8px">
				  <a class="dropdown-toggle"  id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
				   <i class="fa fa-envelope-o" aria-hidden="true"></i>&nbsp;消息
				    <span class="caret"></span>
				  </a>
				  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
				    <li><a href="#">未读消息</a></li>
				    <li><a href="#">已读消息</a></li>
				    <li role="separator" class="divider"></li>
				    <li><a href="#">查看消息记录</a></li>
				  </ul>
				</div>    
			</div>
		 </div>
		 </div>
        <div class="right-sidebar">
            <div class="right-sidebar-toggle" data-toggle-class="right-sidebar-opened" data-target="html">
                <i class="fa fa-cog fa-spin" style="width:30px;height:30px"aria-hidden="true"></i>
            </div>
            <div id="right-nav" class="nano">
                <div class="nano-content">
                    <div class="template-settings">
                        <h4 class="text-center">系统设置</h4>
                        <ul class="toggle-settings pv-xlg">
                            <li>
                                <h6 class="text">顶部固定</h6>
                                <label class="switch">
                                    <input id="header-fixed" type="checkbox" checked>
                                    <span class="slider round"></span>
                                </label>
                            </li>
                            <li>
                                <h6 class="text">左侧边栏固定</h6>
                                <label class="switch">
                                    <input id="left-sidebar-fixed" type="checkbox" checked>
                                    <span class="slider round"></span>
                                </label>
                            </li>
                            <li>
                                <h6 class="text">左侧边栏折叠</h6>
                                <label class="switch">
                                    <input id="left-sidebar-collapsed" type="checkbox">
                                    <span class="slider round"></span>
                                </label>
                            </li>
                            <li>
                                <h6 class="text">内容顶部固定</h6>
                                <label class="switch">
                                    <input id="content-header-fixed" type="checkbox" checked>
                                    <span class="slider round"></span>
                                </label>
                            </li>
                        </ul>
                        <h4 class="text-center">更多功能</h4>  
                    </div>
                </div>
            </div>
        </div>
        <a href="#" class="scroll-to-top"><i class="fa fa-angle-double-up"></i></a>
    </div>
</div>
<div class="modal fade" id="sm-modal" tabindex="-1" role="dialog" aria-labelledby="modal-small-label">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header state modal-default">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="modal-small-label">提醒</h4>
            </div>
            <div class="modal-body">你确定要退出系统吗？</div>
            <div class="modal-footer">
                <a href="exit.do" class="btn btn-default">确定</a>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
<script src="<%=request.getContextPath()%>/javascripts/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/template-script.min.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/bootstrap-select.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/bootstrap-dialog.min.js"></script>
<script type="text/javascript">  		
		/* $(document).ready(function () {
			var username = document.getElementById("username").value;  
			if(username==null||username==""){
				$('#loginmodal').modal();
			}	
	    }); */
	    /* $(document).ready(function(){  
	        $(".nav li").each(function(){  
	            $this = $(this);  
	            if($this[0].href==String(window.location)){  
	                $this.addClass("open-item");  
	            }  
	        });  
	    });   */
</script>
</body>
</html>