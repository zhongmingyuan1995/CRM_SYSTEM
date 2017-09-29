<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.crm.model.Customer,com.crm.model.Basdict"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="fixed">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>客户关系管理系统</title> 
</head>
<body>
<%@include file="head_left_right.jsp" %>
	<div class="content">		
		<div class="row animated fadeInRight">
			<div class="col-sm-12">
				<div class="panel">
					<div class="panel-content">
						<div class="row">
							<div class="col-md-12">
								<form class="form-inline" action="querycustomerLike.cs" method="post">
									<blockquote class="b-darker-1 bl-md">
										<p>
											客户信息管理
										</p>
									</blockquote>
										<div class="col-md-12 right-operate">									
										<button type="submit" class="btn btn-default">
											<i class="fa fa-bars"></i>&nbsp;&nbsp;帮助
										</button>
										<a href="queryBasdict.cs" class="btn btn-default">
										<i class=" fa fa-plus"></i>&nbsp;&nbsp;新建</a>
										</div>								
									<div class="col-md-12" style="margin-top: 20px; margin-bottom: 20px">
										<div class="form-group">										
											 <input type="text" class="form-control" name="custno"
												id="custno" placeholder="客户编号">
										</div>
										<div class="form-group">											
											<input type="text" class="form-control" name="custname"
												id="custname" placeholder="客户名称">
										</div>
										<div class="form-group" >										
												<select class="form-control" style="width:100%" name="custregion">
													<option value="">---选择地区---</option>
													<%
															@SuppressWarnings("unchecked")
															List<Basdict> list1 = (List<Basdict>) request.getAttribute("Basdict");
															if (list1 != null) {
																for (int j = 0; j < list1.size(); j++) {
																	Basdict basdict = list1.get(j);%>
														<%if(basdict.getDictType().equals("地区")) {%>
														<option value="<%= basdict.getDictValue()%>"><%= basdict.getDictValue()%></option>
														<%} }  }%>
												</select>
										</div>
										<div class="form-group" style="margin-left: 20px;">
											<button type="submit" class="btn  btn-defalut">
												<i class="fa fa-search"></i>&nbsp;&nbsp;查询
											</button>
										</div>
									</div>
								</form>
							</div>
						</div>

						<div class="table-responsive">
							<table id="basic-table"
								class="table table-striped table-hover table-bordered text-center"
								cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>编号</th>
										<th>客户名称</th>
										<th>客户地区</th>
										<th>客户等级</th>
										<th>客户电话</th>
										<th>状态</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<%
										@SuppressWarnings("unchecked")
										List<Customer> list = (List<Customer>) request.getAttribute("Customer");
										if (list != null) {
											for (int i = 0; i < list.size(); i++) {
												Customer customer = list.get(i);%>
									<tr>
										<td><%=customer.getCustNo()%><input type="hidden" id="custNo" value="<%=customer.getCustNo()%>"/></td>
										<td><%=customer.getCustName()%></td>
										<td><%=customer.getCustRegion()%></td>
										<td><%=customer.getCustLevelLabel()%></td>
										<td><%=customer.getCustTel()%></td>
										<td><%=customer.getCustStatus()%></td>
										<td>
											<a  title="编辑"href="editcustomer.cs?custNo=<%=customer.getCustNo()%>">
											<i class="fa fa-pencil-square-o color-primary"></i>&nbsp;编辑
											</a>
										</td>										
									</tr>
									<%}   }%>
								</tbody>
							</table>
							<!--分页-->
								<div class="fenye"  style="float:right">
									<font size="2">共 ${page.totalPageCount} 页</font> <font
										size="2">第 ${page.pageNow} 页</font> <a
										href="querycustomerLike.cs?pageNow=1">首页</a>
									<c:choose>
										<c:when test="${page.pageNow - 1 > 0}">
											<a href="querycustomerLike.cs?pageNow=${page.pageNow - 1}">上一页</a>
										</c:when>
										<c:when test="${page.pageNow - 1 < 0}">
											<a href="querycustomerLike.cs?pageNow=1">上一页</a>
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${page.pageNow + 1 <= page.totalPageCount}">
											<a href="querycustomerLike.cs?pageNow=${page.pageNow + 1}">下一页</a>
										</c:when>
										<c:when test="${page.pageNow  < page.totalPageCount}">
											<a href="querycustomerLike.cs?pageNow=${page.totalPageCount}">下一页</a>
										</c:when>
									</c:choose>
									<a href="querycustomerLike.cs?pageNow=${page.totalPageCount}">尾页</a>
								</div>	
							<!--分页结束-->
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
