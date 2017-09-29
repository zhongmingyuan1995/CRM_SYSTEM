<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.crm.model.Customer"%>
<%@ page import="com.crm.model.Order"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="head_left_right.jsp"%>
	<div class="content">
		<div class="row animated fadeInRight">
			<div class="col-sm-12">
				<div class="panel">
					<div class="panel-content">
						<div class="row">
						<form class="form-inline">
							<div class="col-md-12">							
									<blockquote class="b-darker-1 bl-md">
										<p>客户信息管理>客户信息>历史订单</p>
									</blockquote>
									<h5 class="mb-lg "></h5>
									<div class="col-md-12 right-operate">
										<button  class="btn btn-default">
											<i class="fa fa-bars"></i>&nbsp;&nbsp;帮助
										</button>																			
										<a href="javascript:history.go(-1)" class="btn btn-default">
											<i class="fa fa-arrow-circle-left"></i>&nbsp;&nbsp;返回
										</a>
									</div>
							</div>
							<div class="col-md-12" style="margin-top: 20px">
								<table class="table  table-bordered text-center">
									<colgroup>
										<col class="col-md-2" />
										<col class="col-md-4" />
										<col class="col-md-2" />
										<col class="col-md-4" />
									</colgroup>
									<tr>
										<%
											@SuppressWarnings("unchecked")
											List<Customer> Customer = (List<Customer>) request.getAttribute("Customer");
											if (Customer != null) {
												for (int i = 0; i < Customer.size(); i++) {
													Customer customer = Customer.get(i);%>
												<th class="active">客户编号</th>
												<td><%= customer.getCustNo()%><input type="hidden" id="odrCustNo" name="odrCustNo" value="<%= customer.getCustNo()%>"/></td>
												<th class="active">名称</th>
												<td><%= customer.getCustName()%></td>
												<%}} %>
									</tr>
								</table>
							</div>
							<div class="col-md-12" style="margin-top: 20px">
								<table
									class="table  table-bordered  table-hover text-center">
									<tr>
										<th>订单编号</th>
										<th>日期</th>
										<th>送货地址</th>
										<th>状态</th>
										<th>操作</th>
									</tr>
									<%
											@SuppressWarnings("unchecked")
											List<Order> Order = (List<Order>) request.getAttribute("Order");
											if (Order != null) {
												for (int i = 0; i < Order.size(); i++) {
													Order order = Order.get(i);%>
											<tr>
												<td><%= order.getOdrId()%></td>
												<td><%= order.getOdrDate()%></td>
												<td><%= order.getOdrAddr()%></td>
												<td><%= order.getOdrStatus()%></td>											
												<td>
													<a  title="编辑" onclick="editAssort('<%=order.getOdrId()%>')">
													<i class="fa fa-file-text-o color-primary"></i>&nbsp;详情
													</a>											
												</td>
											</tr>
											<%}} %>						
								</table>
									<%
											@SuppressWarnings("unchecked")
											List<Customer> Customer2 = (List<Customer>) request.getAttribute("Customer");
											if (Customer2 != null) {
												for (int i = 0; i < Customer2.size(); i++) {
													Customer customer = Customer2.get(i);%>
								<!--分页-->
									<div class="fenye"  style="float:right">
										<font size="2">共 ${page.totalPageCount} 页</font> <font
											size="2">第 ${page.pageNow} 页</font> <a
											href="queryOrder.or?pageNow=1&odrCustNo=<%= customer.getCustNo()%>">首页</a>
										<c:choose>
											<c:when test="${page.pageNow - 1 > 0}">
												<a href="queryOrder.or?pageNow=${page.pageNow - 1}&odrCustNo=<%= customer.getCustNo()%>">上一页</a>
											</c:when>
											<c:when test="${page.pageNow - 1 < 0}">
												<a href="queryOrder.or?pageNow=1&odrCustNo=<%= customer.getCustNo()%>">上一页</a>
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${page.pageNow + 1 <= page.totalPageCount}">
												<a href="queryOrder.or?pageNow=${page.pageNow + 1}&odrCustNo=<%= customer.getCustNo()%>">下一页</a>
											</c:when>
											<c:when test="${page.pageNow < page.totalPageCount}">
												<a href="queryOrder.or?pageNow=${page.totalPageCount}&odrCustNo=<%= customer.getCustNo()%>">下一页</a>
											</c:when>
										</c:choose>
										<a href="queryOrder.or?pageNow=${page.totalPageCount}&odrCustNo=<%= customer.getCustNo()%>">尾页</a>
									</div>	
								<!--分页结束-->
								<%}} %>
							</div>
							</form>
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