<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.crm.model.Customer"%>
<%@ page
	import="java.util.List,com.crm.model.Service,com.crm.model.Basdict,com.crm.model.User"%>
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
											服务管理>服务处理<span class="color-darker-1">反馈结果</span>
										</p>
									</blockquote>
									<div class="col-md-12 right-operate">
										<button type="submit" class="btn btn-default">
											<i class="fa fa-bars"></i>&nbsp;&nbsp;帮助
										</button>
										<a onclick="feedbackService()" class="btn btn-default">
											<i class=" fa fa-save"></i>&nbsp;&nbsp;保存
										</a>
										<a href="javascript:history.go(-1)" class="btn btn-default">
											<i class="fa fa-arrow-circle-left"></i>&nbsp;&nbsp;返回
										</a>
									</div>
									<div class="col-md-12" style="margin-top: 20px">
										<table class="table   table-hover  table-bordered text-left">
											<%
												@SuppressWarnings("unchecked")
												List<Service> list = (List<Service>) request.getAttribute("Service");
												if (list != null) {
													for (int i = 0; i < list.size(); i++) {
														Service service = list.get(i);
											%>
											<tr>
												<th>编号</th>
												<td><%=service.getSvrId()%> <input type="hidden"
													name="svrId" id="svrId" value="<%=service.getSvrId()%>" /></td>
												<th>服务类型</th>
												<td><%=service.getSvrType()%></td>
											</tr>
											<tr>
												<th>概要</th>
												<td colspan="3"><%=service.getSvrTitle()%></td>
											</tr>
											<tr>
												<th>客户</th>
												<td><%=service.getCustomer().getCustName()%></td>
												<th>状态</th>
												<td><%=service.getSvrTitle()%></td>
											</tr>
											<tr>
												<th>服务请求</th>
												<td colspan="3"><%=service.getSvrRequest()%></td>
											</tr>
											<tr>
												<th>创建人</th>
												<td><%=service.getSvrCreateName()%></td>
												<th>创建时间</th>
												<td><%=service.getSvrCreateDate()%></td>
											</tr>
											<tr>
												<th>分配给</th>
												<td><%=service.getSvrDueName()%></td>
												<th>分配时间</th>
												<td><%=service.getSvrDueDate()%></td>
											</tr>
											<tr>
												<th>服务处理</th>
												<td colspan="3"><%=service.getSvrDeal()%></td>
											</tr>
											<tr>
												<th>处理人</th>
												<td><%=service.getSvrDealName()%></td>
												<th>处理时间</th>
												<td><%=service.getSvrDealDate()%></td>
											</tr>
										</table>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>

				<div class="panel">
					<form id="feedbackService">
						<div class="panel-content">
							<table class="table  table-bordered  text-left">
								<tr>
									<th>处理结果<span class="must">*</span></th>
									<td class="text-left" ><input name="svrResult"id="svrResult" onblur="checksvrResult()" class="form-control"/>
											<input type="hidden" name="svrId" id="svrId" value="<%=service.getSvrId()%>" /></td>
									<th>客户满意度<span class="must">*</span></th>
									<td>
									<select class="form-control" name="svrSatisfy" id="svrSatisfy">													
											<option value="1">☆</option>
											<option value="2">☆☆</option>
											<option value="3">☆☆☆</option>
											<option value="4">☆☆☆☆</option>
											<option value="5">☆☆☆☆☆</option>
									</select></td>
								</tr>
							</table>
						</div>
					</form>
				</div>
				<%
					}
					}
				%>
			</div>
		</div>
	</div>
	<div class="modal fade" id="mymodal" tabindex="-1" role="dialog"
		aria-labelledby="modal-small-label">
		<div class="modal-dialog modal-sm" role="document"">
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
			  arr[2].classList.add("open-item");
			  arr[2].classList.add("active-item");
		})
		 function checksvrResult(){
			 var svrResult = document.getElementById("svrResult").value;
			 if(svrResult==""){
				 $(".msg").text("服务结果不能为空！");
				 $("#mymodal").modal();
				 return false;
			 }else{
				 return true;
			 }
		 } 
		 function feedbackService(){
			 if(checksvrResult()){
				 $.ajax({  
					    type: "POST",  
					    url:"<%=request.getContextPath()%>/savesvrResult.ss",
						data : $('#feedbackService').serialize(),
						async : false,
						error : function(request) {
							$(".msg").text("保存失败");
							$("#mymodal").modal();
						},
						success : function(data) {
							$(".msg").text("保存成功！");
							$("#mymodal").modal();
							$(".msg").append("&nbsp\;<i class=\"fa fa-spinner\"></i>");
							setTimeout("window.location.href='<%=request.getContextPath()%>/queryLikeService.ss?flag=feedback'", 2000);
						}
					});
			} else {
				$(".msg").text("必填项不能为空！");
				$("#mymodal").modal();
			}
		}
	</script>
</body>
</html>