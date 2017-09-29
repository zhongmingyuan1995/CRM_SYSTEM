<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.crm.model.Lost,com.crm.model.Customer" %>
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
				<div class="panel" style="height:100vh">
					<div class="panel-content">
						<div class="row">
							<form class="form-inline" id="updateconfig">
								<div class="col-md-12">
									<blockquote class="b-darker-1 bl-md">
										<p>客户流失管理>流失详情</p>
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
									<div class="col-md-12" style="margin-top: 20px">
										<table class="table  table-bordered text-center">
											<colgroup>
												<col class="col-md-2" />
												<col class="col-md-4" />
												<col class="col-md-2" />
												<col class="col-md-4" />
											</colgroup>
											<%
										 	@SuppressWarnings("unchecked")
											List<Lost> Lost = (List<Lost>) request.getAttribute("Lost");
											if (Lost != null) {
												for (int j = 0; j < Lost.size(); j++) {
													Lost lost = Lost.get(j);%>
											<tr>
												<th>编号</th>
												<td><%= lost.getCustomer().getCustNo() %>
												<input type="hidden" value="<%= lost.getLstId() %>" name="lstId" id="lstId"/></td>
												<th>客户</th>
												<td><%= lost.getCustomer().getCustName() %></td>
											</tr>
											<tr>
												<th>客户经理</th>
												<td><%= lost.getCustomer().getCustManagerName() %></td>
												<th>上次下单时间</th>
												<td><%= lost.getLstLastOrderDate() %></td>
											</tr>
											<tr>
												<th>暂缓措施</th>
												<td colspan="3" style="text-align:left"><%= lost.getLstDelay() %></td>
											</tr>
											<tr>
												<th>流失原因</th>
												<td style="text-align:left" colspan="3"><%= lost.getLstReason() %></td>
											</tr>
											<%} } %>
										</table>
									</div>
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