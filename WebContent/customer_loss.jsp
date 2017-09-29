<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.crm.model.Lost,com.crm.model.Customer" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
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
								<form class="form-inline" action="queryLost.ls" method="post">
									<blockquote class="b-darker-1 bl-md">
										<p>客户流失管理</p>
									</blockquote>
									<h5 class="mb-lg "></h5>
									<div class="col-md-12 right-operate">
										<button  class="btn btn-default">
											<i class="fa fa-bars"></i>&nbsp;&nbsp;帮助
										</button>										
										<button type="submit" class="btn btn-default">
											<i class="fa fa-search"></i>&nbsp;&nbsp;查询
										</button>
								</div>
								<div class="col-md-12" style="margin-top: 20px">							
									<table class="table  table-bordered text-center">									
										<tr>
											<th class="active">客户</th>
											<td class="text-left"><input type="text" name="custName"  class="form-control"style="width:100%"></td>
											<th class="active">客户经理</th>
											<td class="text-left"><input type="text" name="custManagerName"  class="form-control"style="width:100%"></td>
											<th class="active">状态</th>
											<td class="text-left">
												<select class="form-control" style="width:100%" name="lstStatus">
													<option value="">全部</option>
													<option value="暂缓流失">暂缓流失</option>
													<option value="确认流失">确认流失</option>
												</select></td>
										</tr>
									</table>
								</div>
								</form>
								<div class="col-md-12" style="margin-top: 20px">
									<table
										class="table  table-bordered  table-hover text-center">									
										<tr>
											<th>编号</th>
											<th>客户</th>
											<th>客户经理</th>
											<th>上次下单时间</th>
											<th>确认流失时间</th>
											<th>状态</th>
											<th>操作</th>
										</tr>
										<%
										 	@SuppressWarnings("unchecked")
											List<Lost> Lost = (List<Lost>) request.getAttribute("Lost");
											if (Lost != null) {
												for (int j = 0; j < Lost.size(); j++) {
													Lost lost = Lost.get(j);%>																	
										<tr>
											<td><%= lost.getCustomer().getCustNo() %></td>											
											<td><%= lost.getCustomer().getCustName() %></td>
											<td><%= lost.getCustomer().getCustManagerName() %></td>										
											<td><%= lost.getLstLastOrderDate() %></td>
											<td><%= lost.getLstLostDate() %></td>
											<td><%= lost.getLstStatus() %></td>
											<td>																						
												<div class="btn-group btn-group-xs">													
													<input type="hidden" value="<%= lost.getLstId() %>" name="lstId" id="lstId"/>
													<%if(lost.getLstStatus().equals("暂缓流失")) {%>
													<a class="btn btn-transparent" href="queryLostBylstId.ls?lstId=<%= lost.getLstId()%>&flag=reprie">
														<i class="fa fa-clock-o"></i>&nbsp;暂缓流失
													</a>													
													<%} else{%>
													<a class="btn btn-transparent" href="queryLostBylstId.ls?lstId=<%= lost.getLstId()%>&flag=info">
														<i class="fa fa-search"></i>&nbsp;查看详情
													</a>
													<%} %>
												</div>											
											</td>
										</tr>
											 <%} } %>
									</table>
									<!--分页-->
										<div class="fenye"  style="float:right">
											<font size="2">共 ${page.totalPageCount} 页</font> <font
												size="2">第 ${page.pageNow} 页</font> <a
												href="queryLost.ls?pageNow=1">首页</a>
											<c:choose>
												<c:when test="${page.pageNow - 1 > 0}">
													<a href="queryLost.ls?pageNow=${page.pageNow - 1}">上一页</a>
												</c:when>
												<c:when test="${page.pageNow - 1 < 0}">
													<a href="queryLost.ls?pageNow=1">上一页</a>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${page.pageNow + 1 <= page.totalPageCount}">
													<a href="queryLost.ls?pageNow=${page.pageNow + 1}">下一页</a>
												</c:when>
												<c:when test="${page.pageNow < page.totalPageCount}">
													<a href="queryLost.ls?pageNow=${page.totalPageCount}">下一页</a>
												</c:when>
											</c:choose>
											<a href="queryLost.ls?pageNow=${page.totalPageCount}">尾页</a>
										</div>	
									<!--分页结束-->
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
		  arr[1].classList.add("open-item");
		  arr[1].classList.add("active-item");
	})
	</script>
</body>
</html>