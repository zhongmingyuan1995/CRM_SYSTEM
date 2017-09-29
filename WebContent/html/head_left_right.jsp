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
</head>
<style>
</style>
<body>
<div class="wrap">
    <%-- <div class="page-header">
        <div class="leftside-header">
            <div class="logo">
                <div class="logo" style="margin:10px 20px;width:180px">
					<span style="font-size:18px;color:#fff"><img src="<%=request.getContextPath()%>/images/timg.jpg" alt="Jane Doe" style="width:30px"/>&nbsp;&nbsp;客户关系管理系统</span>
			    </div>
            </div>
            <div id="menu-toggle" class="visible-xs toggle-left-sidebar" data-toggle-class="left-sidebar-open" data-target="html">
                <i class="fa fa-bars" aria-label="Toggle sidebar"></i>
            </div>
        </div>
        <div class="rightside-header">
            <div class="header-middle"></div>
            
            <div class="header-section hidden-xs" id="notice-headerbox">
               
                <div class="notice" id="alerts-notice">
                    <i class="fa fa-envelope-o" aria-hidden="true"></i> 消息
                    <div class="dropdown-box basic">
                        <div class="drop-header">
                            <h3><i class="fa fa-bell-o" aria-hidden="true"></i> 未读消息</h3>
                            <span class="number">4</span>
                        </div>
                        <div class="drop-content">
                            <div class="widget-list list-left-element list-sm">
                                <ul>
                                    <li>
                                        <a href="#">
                                            <div class="left-element"><i class="fa fa-warning color-warning"></i></div>
                                            <div class="text">
                                                <span class="title">更新最近的客户信息</span>
                                                <span class="subtitle">来自HR</span>
                                            </div>
                                        </a>
                                    </li>                                                                
                                    <li>
                                        <a href="#">
                                            <div class="left-element"><i class="fa fa-envelope color-primary"></i></div>
                                            <div class="text">
                                                <span class="title">欢迎登录</span>
                                                <span class="subtitle"> 已读消息</span>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="drop-footer">
                            <a>查看所有消息</a>
                        </div>
                    </div>
                </div>
                <div class="header-separator"></div>
            </div>
            <div class="header-section" id="user-headerbox">
                <div class="user-header-wrap">
                    <div class="user-photo">
                        <img src="<%=request.getContextPath()%>/images/doctor1.png"/>
                    </div>
                    <div class="user-info">
                        <span ><%= session.getAttribute("username") %></span>                      
                    </div>
                    <i class="fa fa-plus icon-open" aria-hidden="true"></i>
                    <i class="fa fa-minus icon-close" aria-hidden="true"></i>
                </div>
                <div class="user-options dropdown-box">
                    <div class="drop-content basic">
                        <ul>
                            <li> <a href="pages_user-profile.html"><i class="fa fa-user" aria-hidden="true"></i> 个人信息</a></li>
                            <li> <a href="pages_lock-screen.html"><i class="fa fa-lock" aria-hidden="true"></i> 锁定屏幕</a></li>
                            <li><a href="#"><i class="fa fa-cog" aria-hidden="true"></i> 设置</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="header-separator"></div>
            <div class="header-section">
                <a href="#" data-toggle="modal" data-target="#sm-modal"><i class="fa fa-power-off log-out" aria-hidden="true"></i></a>
            </div>
        </div>
    </div> --%>
    <div class="page-body" >
        <div class="left-sidebar" >
            <div id="left-nav" class="nano" >
                <div class="nano-content">
                    <nav>
                        <ul class="nav" id="main-nav">
                        	
                            <li class=""><a href="querysalchance.do"><i class="fa fa-github-alt"></i><span>欢迎登录</span></a></li>
                            <li class="has-child-item close-item">
                                <a><i class="fa fa-tasks" aria-hidden="true"></i><span>营销管理</span></a>
                                <ul class="nav child-nav level-1">
                                    <li><a href="querysalchance.do">销售机会管理</a></li>
                                    <li><a href="querysalchanceNodue.do">客户开发计划</a></li>
                                </ul>
                            </li>
                            <li class="has-child-item close-item">
                                <a><i class="fa fa-users" aria-hidden="true"></i><span>客户管理</span></a>
                                <ul class="nav child-nav level-1">
                                    <li><a href="customer_info.jsp">客户信息管理</a></li>
                                    <li><a href="client_liushi.html">客户流失管理</a></li>
                                </ul>
                            </li>
                            <li class="has-child-item close-item">
                                <a><i class="fa fa-paper-plane" aria-hidden="true"></i><span>服务管理</span></a>
                                <ul class="nav child-nav level-1">
                                    <li><a href="srevice_create.html">服务创建</a></li>
                                    <li><a href="service_allotment.html">服务分配</a></li>
                                    <li><a href="service_handling.html">服务处理</a></li>
                                    <li><a href="service_feedback.html">服务反馈</a></li>
									<li><a href="service_guidang.html">服务归档</a></li>
                                </ul>
                            </li>
                            <li class="has-child-item close-item">
                                <a><i class="fa fa-bar-chart" aria-hidden="true"></i><span>统计报表</span></a>
                                <ul class="nav child-nav level-1">
                                    <li><a href="tables_basic.html">客户贡献分析</a></li>
                                    <li><a href="tables_data-tables.html">客户构成分析</a></li>
                                    <li><a href="tables_responsive.html">客户服务分析</a></li>
									 <li><a href="tables_responsive.html">客户流失分析</a></li>
                                </ul>
                            </li>
                            <li class="has-child-item close-item">
                                <a><i class="fa fa-globe" aria-hidden="true"></i><span>基础数据</span></a>
                                <ul class="nav child-nav level-1">
                                    <li><a href="tables_basic.html">数据字典</a></li>                                  
                                </ul>                               
                            </li>
                            <li class="has-child-item close-item">
                                <a><i class="fa fa-cog" aria-hidden="true"></i><span>权限管理</span></a>  
                                 <ul class="nav child-nav level-1">
                                    <li><a href="tables_basic.html">修改密码</a></li>                                  
                                </ul>                             
                            </li>
                            <li class="">
                                <a><i class="fa fa-street-view" aria-hidden="true"></i><span>系统帮助</span></a>                              
                            </li>
                            <li class="">
                                <a>
                                    <i class="fa fa-commenting-o" aria-hidden="true"></i><span>联系我们</span>
                                </a>                               
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
      
        <div class="right-sidebar">
            <div class="right-sidebar-toggle" data-toggle-class="right-sidebar-opened" data-target="html">
                <i class="fa fa-cog fa-spin" aria-hidden="true"></i>
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
            <div class="modal-header state modal-primary">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="modal-small-label">提醒</h4>
            </div>
            <div class="modal-body">你确定要退出系统吗？</div>
            <div class="modal-footer">
                <a href="exit.do" class="btn btn-primary">确定</a>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
<script src="<%=request.getContextPath()%>/javascripts/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/template-script.min.js"></script>
</body>
</html>