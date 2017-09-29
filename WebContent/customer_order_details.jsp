<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.crm.model.Customer"%>
<%@ page import="com.crm.model.Order"%>
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
										<p>客户信息管理>客户信息>订单明细</p>
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
												<td><%= customer.getCustNo()%><input type="hidden" id="assortCustNo" name="assortCustNo" value="<%= customer.getCustNo()%>"/></td>
												<th class="active">名称</th>
												<td><%= customer.getCustName()%></td>
												<%}} %>
											</tr>
											<tr>
												<th class="active">送货地址</th>
												<td></td>
												<th class="active">总金额（元）</th>
												<td></td>
											</tr>
											<tr>
												<th class="active">状态</th>
												<td></td>
												<th class="active"></th>
												<td></td>
											</tr>
										</table>
									</div>
									<div class="col-md-12" style="margin-top: 20px">
										<table
											class="table  table-bordered  table-hover text-center">
											<colgroup>
												<col class="col-md-4" />
												<col class="col-md-2" />
												<col class="col-md-2" />
												<col class="col-md-2" />
												<col class="col-md-2" />
											</colgroup>
											<tr>
												<th>商品</th>
												<th>数量</th>
												<th>单位</th>
												<th>单价</th>
												<th>金额（元）</th>
											</tr>
											<tr>
												<td>1</td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>											
										</table>
										<nav aria-label="..." style="float:right">
										<ul class="pagination">
											<li class="disabled"><a href="#" aria-label="Previous"><span
													aria-hidden="true">&laquo;</span></a></li>
											<li class="active"><a href="#">1 <span
													class="sr-only">(current)</span></a></li>
											<li class=""><a href="#">2 <span class="sr-only">(current)</span></a>
											</li>
											<li class=""><a href="#">3 <span class="sr-only">(current)</span></a>
											</li>
											<li class=""><a href="#">4 <span class="sr-only">(current)</span></a>
											</li>
											<li class=""><a href="#">5 <span class="sr-only">(current)</span></a>
											</li>
											<li class="disabled"><a href="#" aria-label="Previous"><span
													aria-hidden="true">&raquo;</span></a></li>
										</ul>
										</nav>
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