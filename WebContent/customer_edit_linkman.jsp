<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.crm.model.Linkman"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
td input{width:100%}
td select{width:100%;}
</style>
</head>
<body>
	<%@include file="head_left_right.jsp"%>
	<div class="content">
		<div class="row animated fadeInRight">
			<div class="col-sm-12">
				<div class="panel" style="height:100vh">
					<div class="panel-content">
						<div class="row">
							<div class="col-md-12">
								<form id="updateLinkman">
									<blockquote class="b-darker-1 bl-md">
										<p>客户信息管理>客户信息>编辑联系人</p>
									</blockquote>
									<h5 class="mb-lg "></h5>
									<div class="col-md-12 right-operate">
										<button  class="btn btn-default">
											<i class="fa fa-bars"></i>&nbsp;&nbsp;帮助
										</button>										
										<a onclick="updateLinkman()" class="btn btn-default">
											<i class="fa fa-save"></i>&nbsp;&nbsp;保存
										</a>
										<a href="javascript:history.go(-1)" class="btn btn-default">
											<i class="fa fa-arrow-circle-left"></i>&nbsp;&nbsp;返回
										</a>
									</div>
									<% String lkmCustNo=(String)request.getAttribute("lkmCustNo"); %>
									<input type="hidden" value="<%= lkmCustNo%>" class="form-control" name="lkmCustNo" id="lkmCustNo">									
									<div class="col-md-12" style="margin-top:50px">
										<table class="table  table-bordered text-center">
										<%
											@SuppressWarnings("unchecked")
											List<Linkman> Linkman = (List<Linkman>) request.getAttribute("Linkman");
											if (Linkman != null) {
												for (int i = 0; i < Linkman.size(); i++) {
													Linkman linkman = Linkman.get(i);%>											
											<tr>
												<td>姓名<span class="must">*</span></td>
												<td class="text-left"><input type="text"  value="<%= linkman.getLkmName()%>" class="form-control" name="lkmName" id="lkmName" onblur="checklkmName()" >
												<input type="hidden" value="<%= linkman.getLkmId()%>" class="form-control" name="lkmId" id="lkmId">	</td>
												<td>性别</td>
												<td class="text-left">
												<select class="form-control"  name="lkmSex" id="lkmSex">
														<option value="<%= linkman.getLkmSex()%>"><%= linkman.getLkmSex()%></option>
														<option value="">---请选择---</option>													
														<option value="男">男</option>
														<option value="女">女</option>
												</select></td>
											</tr>
											<tr>
												<td>职位<span class="must">*</span></td>
												<td class="text-left"><input type="text" value="<%= linkman.getLkmPostion()%>" name="lkmPostion" id="lkmPostion" onblur="checklkmPostion()"
													class="form-control"></td>
												<td>办公电话<span class="must">*</span></td>
												<td class="text-left"><input type="text" value="<%= linkman.getLkmTel()%>" name="lkmTel" id="lkmTel" onblur="checklkmTel()"
													class="form-control"></td>
											</tr>
											<tr>
												<td>手机</td>
												<td class="text-left"><input type="text" value="<%= linkman.getLkmMobile()%>" name="lkmMobile" id="lkmMobile" 
													class="form-control"></td>
												<td>备注</td>
												<td class="text-left"><input type="text" value="<%= linkman.getLkmMemo()%>" name="lkmMemo" id="lkmMemo"
													class="form-control"></td>
											</tr>
											<%}} %>
										</table>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<div class="modal fade" id="mymodal" tabindex="-1" role="dialog" aria-labelledby="modal-small-label">
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
			  arr[1].classList.add("open-item");
			  arr[1].classList.add("active-item");
		})
		 function checklkmName(){
			 var lkmName=document.getElementById("lkmName").value;  			 
			 if(lkmName==""){
				 $(".msg").text("姓名不能为空！");
				 $("#mymodal").modal();	
				 return false;
			 }
			 	 return true;
		 }		
		 function checklkmPostion(){
			 var lkmPostion=document.getElementById("lkmPostion").value;  			 
			 if(lkmPostion==""){
				 $(".msg").text("职位不能为空！");
				 $("#mymodal").modal();			
				 return false;
			 }
			 	 return true;
		 }
		 function checklkmTel(){
			 var lkmTel=document.getElementById("lkmTel").value;  			 
			 if(lkmTel==""){
				 $(".msg").text("办公电话不能为空！");
				 $("#mymodal").modal();			
				 return false;
			 }
			 	 return true;
		 }
		 function updateLinkman(){
			 if(checklkmName()&&checklkmPostion()&&checklkmTel()){			
				 $.ajax({  
					    type: "POST",  
					    url:"<%=request.getContextPath()%>/updateLinkman.lk",  
					    data:$('#updateLinkman').serialize(),  
					    async: false,  
					    error: function(request) {  
					    	$(".msg").text("保存失败");
							$("#mymodal").modal();
					    },  
					    success: function(data) { 
					    		$(".msg").text("保存成功！");
								$("#mymodal").modal();
								$(".msg").append("&nbsp\;<i class=\"fa fa-spinner\"></i>");
								setTimeout("queryLinkman()",2000); 	
					    }  
					  });
			 }else{
				 $(".msg").text("保存失败，必填项不能为空！");
				 $("#mymodal").modal();
			 }		 
		 }
		 function queryLinkman(){
			 var lkmCustNo = document.getElementById("lkmCustNo").value; 
			 window.location.href='<%=request.getContextPath()%>/queryLinkman.lk?lkmCustNo='+lkmCustNo; 	
		 }
</script>
</body>
</html>