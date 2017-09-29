<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.crm.model.Assort"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table ta input{width:100%}
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
								<form id="updateAssort">
									<blockquote class="b-darker-1 bl-md">
										<p>客户信息管理>客户信息>编辑交往记录</p>
									</blockquote>
									<h5 class="mb-lg "></h5>
									<div class="col-md-12 right-operate">
										<button  class="btn btn-default">
											<i class="fa fa-bars"></i>&nbsp;&nbsp;帮助
										</button>										
										<a onclick="updateAssort()" class="btn btn-default">
											<i class="fa fa-save"></i>&nbsp;&nbsp;保存
										</a>
										<a href="javascript:history.go(-1)" class="btn btn-default">
											<i class="fa fa-arrow-circle-left"></i>&nbsp;&nbsp;返回
										</a>
									</div>
									<% String assortCustNo=(String)request.getAttribute("assortCustNo"); %>
									<input type="hidden" value="<%= assortCustNo%>" class="form-control" name="assortCustNo" id="assortCustNo">
									<div class="col-md-12" style="margin-top: 20px">
										<table class="table  table-bordered text-center">											
											<%
											@SuppressWarnings("unchecked")
											List<Assort> Assort = (List<Assort>) request.getAttribute("Assort");
											if (Assort != null) {
												for (int i = 0; i < Assort.size(); i++) {
													Assort assort = Assort.get(i);%>	
											<tr>
												<th>时间<span class="must">*</span></th>
												<td class="text-left">									
												<input type="date"  value = "<%= assort.getAtvDate() %>" name="atvDate" id="atvDate" onblur="checkatvDate()"class="form-control">
												<input type="hidden" value="<%= assort.getAtvId()%>" class="form-control" name="atvId" id="atvId">	</td></td>
												<th>地点<span class="must">*</span></th>
												<td class="text-left"><input type="text"  value = "<%= assort.getAtvPlace() %>" name="atvPlace" id="atvPlace" onblur="checkatvPlace()"
													class="form-control"></td>
											</tr>
											<tr>
												<th>概要<span class="must">*</span></th>
												<td class="text-left"><input type="text"  value = "<%= assort.getAtvTitle() %>" name="atvTitle" id="atvTitle" onblur="checkatvTitle()"
													class="form-control"></td>
												<th></th>
												<td class="text-left"></td>
											</tr>
											<tr>
												<th>详细信息</th>
												<td class="text-left" colspan="3" ><textarea name="atvDesc" id="atvDesc" 
														class="form-control" rows="5" style="width:100%"><%= assort.getAtvDesc() %></textarea>
												</td>
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
		 function checkatvDate(){
			 var atvDate=document.getElementById("atvDate").value;  			 
			 if(atvDate==""){
				 $(".msg").text("时间不能为空！");
				 $("#mymodal").modal();	
				 return false;
			 }
			 	 return true;
		 }		
		 function checkatvPlace(){
			 var atvPlace=document.getElementById("atvPlace").value;  			 
			 if(atvPlace==""){
				 $(".msg").text("地点不能为空！");
				 $("#mymodal").modal();			
				 return false;
			 }
			 	 return true;
		 }
		 function checkatvTitle(){
			 var atvTitle=document.getElementById("atvTitle").value;  			 
			 if(atvTitle==""){
				 $(".msg").text("概要不能为空！");
				 $("#mymodal").modal();			
				 return false;
			 }
			 	 return true;
		 }
		 function updateAssort(){
			 if(checkatvDate()&&checkatvPlace()&&checkatvTitle()){			
				 $.ajax({  
					    type: "POST",  
					    url:"<%=request.getContextPath()%>/updateAssort.as",  
					    data:$('#updateAssort').serialize(),  
					    async: false,  
					    error: function(request) {  
					    	$(".msg").text("保存失败");
							$("#mymodal").modal();
					    },  
					    success: function(data) { 
					    		$(".msg").text("保存成功！");
								$("#mymodal").modal();
								$(".msg").append("&nbsp\;<i class=\"fa fa-spinner\"></i>");
								setTimeout("queryAssort()",2000); 	
					    }  
					  });
			 }else{
				 $(".msg").text("保存失败，必填项不能为空！");
				 $("#mymodal").modal();
			 }		 
		 }
		 function queryAssort(){
			 var assortCustNo = document.getElementById("assortCustNo").value; 
			 window.location.href='<%=request.getContextPath()%>/queryAssort.as?assortCustNo='+assortCustNo; 	
		 }
</script>
</body>
</html>