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
							<form id="updatereprie">
								<div class="col-md-12">
									<blockquote class="b-darker-1 bl-md">
										<p>客户流失管理>暂缓流失</p>
									</blockquote>
									<h5 class="mb-lg "></h5>									
									<div class="col-md-12 right-operate">
										<button  class="btn btn-default">
											<i class="fa fa-bars"></i>&nbsp;&nbsp;帮助
										</button>	
										<a  onclick="queryLostconfirm()"class="btn btn-default">
											<i class="fa fa-check"></i>&nbsp;&nbsp;确认流失
										</a>										
										<a onclick="updatereprie()" class="btn btn-default">
											<i class="fa fa-save"></i>&nbsp;&nbsp;保存
										</a>									
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
												<th>追加暂缓措施</th>
												<td class="text-left" colspan="3"><textarea name="lstDelay" id="lstDelay" onblur="checklstDelay()"
														class="form-control" style="width: 100%;" rows="5"></textarea>
												</td>
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
		 function checklstDelay(){
			 var lstDelay=document.getElementById("lstDelay").value;  			 
			 if(lstDelay==""){
				 $(".msg").text("追加暂缓措施不能为空！");
				 $("#mymodal").modal();	
				 return false;
			 }
			 	 return true;
		 }		
		 
		 function updatereprie(){
			 if(checklstDelay()){			
				 $.ajax({  
					    type: "POST",  
					    url:"<%=request.getContextPath()%>/updatereprie.ls",  
					    data:$('#updatereprie').serialize(),  
					    async: false,  
					    error: function(request) {  
					    	$(".msg").text("保存失败");
							$("#mymodal").modal();
					    },  
					    success: function(data) { 
					    		$(".msg").text("保存成功！");
								$("#mymodal").modal();
								$(".msg").append("&nbsp\;<i class=\"fa fa-spinner\"></i>");
								setTimeout("queryLost()",2000); 	
					    }  
					  });
			 }else{
				 $(".msg").text("保存失败，必填项不能为空！");
				 $("#mymodal").modal();
			 }		 
		 }
		 function queryLost(){
			 var lstId = document.getElementById("lstId").value; 
			 window.location.href='<%=request.getContextPath()%>/queryLostBylstId.ls?lstId='+lstId+'&flag=reprie'; 	
		 }
		 function queryLostconfirm(){
			 var lstId = document.getElementById("lstId").value; 
			 window.location.href='<%=request.getContextPath()%>/queryLostBylstId.ls?lstId='+lstId+'&flag=confirm'; 	
		 }
</script>
</body>
</html>