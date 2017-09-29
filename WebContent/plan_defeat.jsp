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
								<form class="form-inline">
									<blockquote class="b-darker-1 bl-md">
										<p>
											客户开发计划><span class="color-darker-1">执行计划</span>
										</p>
									</blockquote>
									<h5 class="mb-lg">
										<span class=""style="margin-left: 15px; font-size: 15px; color: #C66161"><img
											alt=""src="<%=request.getContextPath()%>/images/delete.png"
											width="32" height="32" />&nbsp;开发失败</span>
										<button type="submit" class="btn btn-default "
											style="margin-right: 15px; font-size: 14px; float: right">
											<i class="fa fa-bars"></i>&nbsp;&nbsp;帮助
										</button>
										<a href="javascript:history.go(-1)" class="btn btn-default"
											style="float: right; margin-right: 20px; font-size: 14px"><i
											class=" fa fa-arrow-left"></i>&nbsp;&nbsp;返回</a>
									</h5>
									<div class="col-md-12" style="margin-top: 20px">
										<table class="table   table-hover  table-bordered text-center">
											<%
												@SuppressWarnings("unchecked")
												List<Salchance> list = (List<Salchance>) request.getAttribute("Salchance");
												if (list != null) {
													for (int i = 0; i < list.size(); i++) {
														Salchance sal = list.get(i);%>
											<tr>
												<td>编号</td>
												<td><%= sal.getChcId()%> <input type="hidden"
													name="chcid" id="chcid" value="<%= sal.getChcId()%>" /></td>
												<td>机会来源</td>
												<td><%= sal.getChcSource()%></td>
											</tr>
											<tr>
												<td>客户名称</td>
												<td><%= sal.getChcCustName()%></td>
												<td>成功几率（%）</td>
												<td><%= sal.getChcRate()%></td>
											</tr>
											<tr>
												<td>概要</td>
												<td colspan="3"><%= sal.getChcTitle()%></td>
											</tr>
											<tr>
												<td>联系人</td>
												<td><%= sal.getChcLinkman()%></td>
												<td>联系电话</td>
												<td><%= sal.getChcTel()%></td>
											</tr>
											<tr>
												<td>机会描述</td>
												<td colspan="3"><%= sal.getChcDesc()%></td>
											</tr>
											<tr>
												<td>创建人</td>
												<td><%= sal.getChcCreateName()%></td>
												<td>创建时间</td>
												<td><%= sal.getChcCreateDate() %></td>
											</tr>
											<tr>
												<td>指派给</td>
												<td><%= sal.getChcDueName() %></td>
												<td>指派时间</td>
												<td><%= sal.getChcDueDate() %></td>
											</tr>
											<%}} %>
										</table>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="panel">
					<div class="panel-content">
						<table class="table  table-bordered  text-center">

							<tr>
								<th><i class="fa fa-calendar-plus-o"></i>&nbsp;日期</th>
								<th><i class="fa fa-list-alt"></i>&nbsp;计划</th>
								<th colspan="3"><i class="fa fa-history"></i>&nbsp;执行效果</th>
							</tr>
							<%
                   			@SuppressWarnings("unchecked")
                    		List<Plan> list2 = (List<Plan>) request.getAttribute("Plan");
							if (list2 != null) {
								for (int i = 0; i < list2.size(); i++) {
									Plan plan = list2.get(i);%>
							<tr>
								<td style="vertical-align: middle">
									<div class="form-group">
										<span> <span id="chccreatedate"><i
												class="fa fa-info-circle mr-xs"></i> <%=plan.getPlaDate() %>
										</span>
										</span>
									</div>
								</td>
								<td><%=plan.getPlaTodo()%></td>
								<td colspan="3"><%=plan.getPlaResult()%> <input
									type="hidden" class="form-control" value="<%=plan.getPlaId()%>"
									name="planid"></td>
							</tr>
							<%}} %>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="msgmodal" tabindex="-1" role="dialog"
		aria-labelledby="exitModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">提醒</h4>
				</div>
				<div class="modal-body">
					<span id="msg"></span>
				</div>
			</div>
		</div>
	</div>
	<script>
	$(document).ready(function(){  
		  var arr = document.getElementsByClassName("has-child-item");
		  arr[0].classList.add("open-item");
		  arr[0].classList.add("active-item");
	})
	</script>
</body>
</html>