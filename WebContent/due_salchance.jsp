<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="java.util.List,com.crm.model.Salchance,com.crm.model.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="fixed">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>客户关系管理系统</title>
</head>
<style>
table td .active {
	background: #004E90
}

table td span {
	color: #004E90;
}
</style>
<body>
	<%@include file="head_left_right.jsp"%>
	<div class="content">
		<div class="row animated fadeInRight">
			<div class="col-sm-12">
				<div class="panel" style="height: 100vh">
					<div class="panel-content">
						<div class="row">
							<div class="col-md-12">
								<form class="form-inline" id="salchanceform">
									<blockquote class="b-darker-1 bl-md">
										<p>
											销售机会管理><span class="color-darker-1">指派销售机会</span>
										</p>
									</blockquote>
									<div class="col-md-12 right-operate">
										<button id="pnotify-basic-success" class="btn btn-default">
											<i class="fa fa-bars"></i>&nbsp;&nbsp;帮助
										</button>
										<button type="button" class="btn btn-default"
											onclick="duesalchance()">
											<i class=" fa fa-floppy-o"></i>&nbsp;&nbsp;保存
										</button>
										<a href="<%=request.getContextPath()%>/querysalchance.do"
											class="btn btn-default"> <i class=" fa fa-arrow-left"></i>&nbsp;&nbsp;返回
										</a>
									</div>
									<div class="col-md-12" style="margin-top: 20px">
										<div class="table-responsive">
											<table id="basic-table"class="table  table-bordered " cellspacing="0"width="100%">
												<tbody>
													<%
														List<Salchance> list = (List<Salchance>) request.getAttribute("Salchance");
														if (list != null) {
															for (int i = 0; i < list.size(); i++) {
																Salchance sal = list.get(i);
													%>
													<tr>
														<td><span>编号</span></td>
														<td><%=sal.getChcId()%> <input type="hidden"
															name="chcid" id="chcid" value="<%=sal.getChcId()%>" /></td>
														<td class="active"><span>机会来源</span></td>
														<td><%=sal.getChcSource()%></td>
													</tr>
													<tr>
														<td><span>客户名称</span></td>
														<td><%=sal.getChcCustName()%></td>
														<td class="active"><span>成功几率（%）</span></td>
														<td><%=sal.getChcRate()%></td>
													</tr>
													<tr>
														<td><span>概要</span></td>
														<td colspan="3" ><%=sal.getChcTitle()%></td>
													</tr>
													<tr>
														<td><span>联系人</span></td>
														<td><%=sal.getChcLinkman()%></td>
														<td class="active"><span>联系人电话</span></td>
														<td><%=sal.getChcTel()%></td>
													</tr>
													<tr>
														<td><span>机会描述</span></td>
														<td colspan="3"><%=sal.getChcDesc()%></td>
													</tr>
													<tr>
														<td><span>创建人</span></td>
														<td><%=sal.getChcCreateName()%></td>
														<td><span>创建时间</span></td>
														<td><%=sal.getChcCreateDate()%></td>
													</tr>
													<%
														}
														}
													%>
												</tbody>
											</table>
										</div>
									</div>

									<div class="col-md-12" style="margin-top: 20px;">
										<div class="">
											<table id="basic-table"
												class="table  table-bordered text-center" cellspacing="0"
												width="100%">
												<tbody>
													<tr>
														<td class="active" style="vertical-align: middle"><i
															class="fa fa-hand-pointer-o"></i> <span>指派给<span
																class="must">*</span></span></td>
														<td>
															<div class="form-group text-center">
																<select class="selectpicker" data-live-search="true" name="chcduename" title="请选择"id="chcduename">
																	<%
																		List<User> list2 = (List<User>) request.getAttribute("UserRole");
																		if (list2 != null) {
																			for (int i = 0; i < list2.size(); i++) {
																				User user = list2.get(i);
																	%>
																	<option value="<%=user.getUserId()%>"><%=user.getUserName()%></option>
																	<%
																		}
																		}
																	%>
																</select>
															</div>
														</td>
														<td class="active " style="vertical-align: middle"><i
															class="fa fa-history"></i> <span>指派时间<span
																class="must">*</span></span></td>
														<td>
															<div class="form-group">
																<span class="input"> <span class="form-control"
																	name="chccreatedate" id="chccreatedate"> <fmt:formatDate
																			value="<%=new java.util.Date()%>"
																			pattern="yyyy-MM-dd HH:mm:ss" />
																</span> <i class="fa fa-info-circle mr-xs"></i>系统自动获取，不可修改
																</span>
															</div>
														</td>
													</tr>
												</tbody>
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
	</div>

	<div class="modal fade" id="mymodal" tabindex="-1" role="dialog"
		aria-labelledby="modal-small-label" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">提醒</h4>
				</div>
				<div class="modal-body">
					 <span class="msg"></span>
				</div>
			</div>			
		</div>		
	</div>
	<script type="text/javascript"> 
	$(document).ready(function(){  
		  var arr = document.getElementsByClassName("has-child-item");
		  arr[0].classList.add("open-item");
		  arr[0].classList.add("active-item");
	})
	function duesalchance(){  
	//var chcduename =$('#chcduename option:selected').text();
	//var chcid =$('#chcid').text();
	var sel =document.getElementById("chcduename");
	var chcdueid = sel.options[sel.selectedIndex].value;
	var chcduename = sel.options[sel.selectedIndex].text;
	var chcid =document.getElementById("chcid").value;
	var url ="<%=request.getContextPath()%>/duesalchance.do?chcdueid="+chcdueid+"&chcduename="+chcduename+"&chcid="+chcid;
		//设置同步（默认异步true）
			$.ajaxSetup({
		        async : false
		    });
			$.get(url,function(data){
				if (data == '2'||data == "") {  
	                 $('.msg').text('指派失败！');  
	                 $("#mymodal").modal();
	            //提交失败的操作  
	             } else {  
	            	 $('.msg').text('指派成功！'); 
	            	 $("#mymodal").modal();
	            	 setTimeout("window.location.href='<%=request.getContextPath()%>/querysalchance.do'",1000);
					}
				});
		}
	</script>
</body>
</html>