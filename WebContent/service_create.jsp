<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date,java.text.SimpleDateFormat,com.crm.model.Customer"%>
<%@ page import="java.util.List,com.crm.model.User,com.crm.model.Basdict"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
td input{width:100%}
.table tr{border-top:0px solid #ddd}
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
								<form id="insertService">
									<h5 class="mb-lg ">客户服务管理>服务创建</h5>
									<div class="col-md-12 right-operate">									
										<button type="submit" class="btn btn-default">
											<i class="fa fa-bars"></i>&nbsp;&nbsp;帮助
										</button>
										<a onclick="insertService()" class="btn btn-default">
											<i class="fa fa-floppy-o"></i>&nbsp;&nbsp;保存
										</a>
									</div>
									<div class="col-md-12" style="margin-top: 20px">
										<div class="col-md-1">
											<label style="margin-top: 5px;" for="email4">编号<span
												class="required">*</span></label>
										</div>
										<%
												Date date = new Date();
												SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
											    String createdate = sdf.format(date);
										%>
										<div class="form-group col-md-5">
											<span> 
												 <span class="form-control">
													<%= createdate%>&nbsp;&nbsp;
													<a href="javascript:void(0)" onclick="location.reload()" ><i class="fa fa-refresh"></i>&nbsp;刷新</a>
													<input type="hidden" value="<%= createdate%>" name="svrId" id="svrId"/>
												</span>
											</span> 
											<span class="help-block">
											<i class="fa fa-info-circle mr-xs"></i>系统自动生成</span>
										</div>

										<div class="col-md-1 ">
											<label for="chance_source" style="margin-top: 5px;">服务类型<span
												class="required">*</span></label>
										</div>
										<div class="form-group col-md-5">
											<span class="input-with-icon"> 
											<select class="selectpicker" data-live-search="true" name="svrType" id="svrType" onblur="checksvrType()">
												<%
														@SuppressWarnings("unchecked")
														List<Basdict> list1 = (List<Basdict>) request.getAttribute("Basdict");
														if (list1 != null) {
															for (int i = 0; i < list1.size(); i++) {
																Basdict basdict = list1.get(i);%>
													<%if(basdict.getDictType().equals("服务类型")) {%>
													<option value="<%= basdict.getDictValue()%>"><%= basdict.getDictValue()%></option>
													<%} }  }%>
											</select>											
											</span> 
										</div>									
									</div>
									<div class="col-md-12">
										<div class="col-md-1">
											<label for="gaiyao" style="margin-top: 5px;">概要<span
												class="required">*</span></label>
										</div>
										<div class="form-group col-md-11">
											<span class="input-with-icon"> <input type="text" onblur="checksvrTitle()"
												class="form-control" name="svrTitle" id="svrTitle"
												placeholder="概要" style="width: 100%;"
												onblur="checkchctitle()"> <i
												class="fa fa-ellipsis-h"></i>
											</span>
										</div>										
									</div>
									<div class="col-md-12" style="margin-top: 20px">
										<div class="col-md-1">
											<label for="Contact_person" style="margin-top: 5px;">客户</label>
										</div>
										<div class="form-group col-md-5">
										<span class="input-with-icon"> 
											<select  class="selectpicker" data-live-search="true"  name="svrCustNo" id="svrCustNo">
												<%
														@SuppressWarnings("unchecked")
														List<Customer> list2 = (List<Customer>) request.getAttribute("Customer");
														if (list2 != null) {
															for (int i = 0; i < list2.size(); i++) {
																Customer customer = list2.get(i);%>												
													<option value="<%= customer.getCustNo()%>"><%= customer.getCustName()%></option>
													<%} }%>
											</select>
										</span>
										</div>
										<div class="col-md-1">
											<label for="tel" style="margin-top: 5px;">状态</label>
										</div>
										<div class="form-group col-md-5">
											<span class="input-with-icon">
											 <span class="form-control"  id="svrStatus">新创建</span></span>
											<span class="help-block"><i class="fa fa-info-circle mr-xs"></i>默认为新创建 </span>
										</div>
									</div>
									<div class="col-md-12" style="margin-top: 20px">
										<div class="col-md-1">
											<label for="chance_describe" style="margin-top: 5px;">服务请求<span
												class="required">*</span></label>
										</div>
										<div class="col-md-11">
											<textarea name="svrRequest" id="svrRequest" class="form-control" onblur="checksvrRequest()"
												rows="5" placeholder="服务请求" style="width: 100%;"
												onblur="checkchcdesc()"></textarea>
											<span class="help-block"><i
												class="fa fa-info-circle mr-xs"></i>最大长度为 <span class="code">200</span></span>
										</div>
									</div>
									<div class="col-md-12" style="margin-top: 20px">
										<div class="col-md-1">
											<label style="margin-top: 5px;" for="founder">创建人<span
												class="required">*</span></label>
										</div>
										<div class="form-group col-md-5">
											<span class="input-with-icon">
											 <span class="form-control"  id="svrCreateName"><%= session.getAttribute("username") %></span></span>
											 <input type="hidden" value="<%= request.getAttribute("UserId") %>" id="svrCreateId" name="svrCreateId">
											<span class="help-block"><i
												class="fa fa-info-circle mr-xs"></i>系统自动获取，不可修改 </span>
										</div>
										<div class="col-md-1">
											<label for="time" style="margin-top: 5px;">创建时间<span
												class="required">*</span></label>
										</div>
										<div class="form-group col-md-5">
											<span class="input-with-icon" > <span class="form-control" >												
												<fmt:formatDate value="<%=new java.util.Date() %>" pattern="yyyy-MM-dd HH:mm:ss"/>
												<input type="hidden" value="<fmt:formatDate value="<%=new java.util.Date() %>" pattern="yyyy-MM-dd HH:mm:ss"/>" name="svrCreateDate" id="svrCreateDate" >
											</span>											
											</span>
											<span class="help-block"><i
												class="fa fa-info-circle mr-xs"></i>系统自动获取，不可修改 </span>
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
			  arr[2].classList.add("open-item");
			  arr[2].classList.add("active-item");
		})
		 function checksvrType(){
			 var svrType=document.getElementById("svrType").value;  			 
			 if(svrType==""){
				 $(".msg").text("服务类型不能为空！");
				 $("#mymodal").modal();	
				 return false;
			 }
			 	 return true;
		 }		
		 function checksvrTitle(){
			 var svrTitle=document.getElementById("svrTitle").value;  			 
			 if(svrTitle==""){
				 $(".msg").text("概要不能为空！");
				 $("#mymodal").modal();			
				 return false;
			 }
			 	 return true;
		 }
		 function checksvrRequest(){
			 var svrRequest=document.getElementById("svrRequest").value;  			 
			 if(svrRequest==""){
				 $(".msg").text("服务请求不能为空！");
				 $("#mymodal").modal();			
				 return false;
			 }
			 	 return true;
		 } 
		 function insertService(){
			 if(checksvrType()&&checksvrTitle()&&checksvrRequest()){
				 $.ajax({  
					    type: "POST",  
					    url:"<%=request.getContextPath()%>/insertService.ss",  
					    data:$('#insertService').serialize(),  
					    async: false,  
					    error: function(request) {  
					    	$(".msg").text("保存失败");
							$("#mymodal").modal();
					    },  
					    success: function(data) { 
					    		$(".msg").text("保存成功！");
								$("#mymodal").modal();
								$(".msg").append("&nbsp\;<i class=\"fa fa-spinner\"></i>");
								setTimeout("window.location.href='<%=request.getContextPath()%>/createService.ss'",2000); 	
					    }  
					  });
			 }else{
				 $(".msg").text("保存失败，必填项不能为空！");
				 $("#mymodal").modal();
			 }		 
		 }		
</script>
</body>
</html>