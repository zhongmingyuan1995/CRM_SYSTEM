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
											服务管理>服务处理<span class="color-darker-1">处理操作</span>
										</p>
									</blockquote>
									<div class="col-md-12 right-operate">
										<button type="submit" class="btn btn-default">
											<i class="fa fa-bars"></i>&nbsp;&nbsp;帮助
										</button>
										<a onclick="dealService()" class="btn btn-default">
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
										</table>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>

				<div class="panel">
					<form id="dealService">
						<div class="panel-content">
							<table class="table  table-bordered  text-left">
								<tr>
									<th>服务处理<span class="must">*</span></th>
									<td class="text-left" colspan="3"><textarea name="svrDeal"
											id="svrDeal" onblur="checksvrDeal()" class="form-control"
											style="width: 100%;" rows="5"></textarea>
											<input type="hidden" name="svrId" id="svrId" value="<%=service.getSvrId()%>" /></td>
								</tr>
								<tr>
									<th class="active" style="vertical-align: middle"><i
										class="fa fa-hand-pointer-o"></i> <span>处理人<span
											class="must">*</span></span></th>
									<td>
										<div class="form-group text-center">
											<span class="input-with-icon"> <span
												class="form-control" id="svrDealName"><%=session.getAttribute("username")%></span></span>
											<input type="hidden"
												value="<%=request.getAttribute("UserId")%>" id="svrDealId"
												name="svrDealId"> <span class="help-block"><i
												class="fa fa-info-circle mr-xs"></i>系统自动获取，不可修改 </span>
										</div>
									</td>
									<th class="active " style="vertical-align: middle"><i
										class="fa fa-history"></i> <span>处理时间<span class="must">*</span></span></th>
									<td>
										<div class="form-group">
											<span class="input"> <span class="form-control"
												name="svrDealDate" id="svrDealDate"> <fmt:formatDate
														value="<%=new java.util.Date()%>"
														pattern="yyyy-MM-dd HH:mm:ss" /> <input type="hidden"
													value="<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd HH:mm:ss"/>"
													name="svrDealDate" id="svrDealDate">
											</span> <i class="fa fa-info-circle mr-xs"></i>系统自动获取，不可修改
											</span>
										</div>
									</td>
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
		 function checksvrDeal(){
			 var svrDeal = document.getElementById("svrDeal").value;
			 if(svrDeal==""){
				 $(".msg").text("服务处理不能为空！");
				 $("#mymodal").modal();
				 return false;
			 }else{
				 return true;
			 }
		 }
		 function dealService(){
			 if(checksvrDeal()){
				 $.ajax({  
					    type: "POST",  
					    url:"<%=request.getContextPath()%>/dealService.ss",
						data : $('#dealService').serialize(),
						async : false,
						error : function(request) {
							$(".msg").text("保存失败");
							$("#mymodal").modal();
						},
						success : function(data) {
							$(".msg").text("保存成功！");
							$("#mymodal").modal();
							$(".msg").append("&nbsp\;<i class=\"fa fa-spinner\"></i>");
							setTimeout("window.location.href='<%=request.getContextPath()%>/queryLikeService.ss?flag=handle'", 2000);
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