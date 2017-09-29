<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List,com.crm.model.Salchance" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="fixed">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>客户关系管理系统</title>
</head>
<style>
</style>
<body>
<%@include file="head_left_right.jsp" %>
	<div class="content">		
		<div class="row animated fadeInRight">
			<div class="col-sm-12">
				<div class="panel" style="height:100vh">
					<div class="panel-content">
						<div class="row">
							<div class="col-md-12">
								<form class="form-inline" id="updatesalchance">
									<%
										List<Salchance> list = (List<Salchance>) request.getAttribute("Salchance");
										if (list != null) {
											for (int i = 0; i < list.size(); i++) {
												Salchance sal = list.get(i);%>
									<blockquote class="b-darker-1 bl-md">
										<p>
											销售机会管理><span class="color-darker-1">编辑销售机会</span>
										</p>
									</blockquote>
									<div class="col-md-12 right-operate">
									<button id="pnotify-basic-success"class="btn btn-default">
										<i class="fa fa-bars"></i>&nbsp;&nbsp;帮助
									</button>
									<button type="button" class="btn btn-default"onclick="updatesalchance()">
										<i class=" fa fa-floppy-o"></i>&nbsp;&nbsp;保存
									</button>
									<a href="<%=request.getContextPath()%>/querysalchance.do" class="btn btn-default">
									<i class=" fa fa-arrow-left"></i>&nbsp;&nbsp;返回</a>
									</div>
									<div class="col-md-12" style="margin-top: 20px">
										<div class="col-md-1">
											<label style="margin-top: 5px;" for="email4">编号<span
												class="required">*</span></label>
										</div>
										<div class="form-group col-md-3">
											<span class="input-with-icon"> <input type="text" value="<%= sal.getChcId()%>"
												class="form-control" name="chcid" id="chcid"
												placeholder="编号" maxlength="20" readonly> <i
												class="fa fa-book"></i>
											</span> <span class="help-block"><i
												class="fa fa-info-circle mr-xs"></i>系统自动生成</span>
										</div>

										<div class="col-md-1 ">
											<label for="chance_source" style="margin-top: 5px;">客户名称<span
												class="required">*</span></label>
										</div>
										<div class="form-group col-md-3">
											<span class="input-with-icon"> <input type="text"
												class="form-control" name="chccustname" id="chccustname"
												placeholder="客户名称" value="<%= sal.getChcCustName()%>" /> <i
												class="fa fa-user"></i>
											</span> <span class="help-block"><i
												class="fa fa-info-circle mr-xs"></i>字母加数字的组合，最大长度为 <span
												class="code">20</span></span>
										</div>

										<div class="col-md-1 ">
											<label for="chance_source" style="margin-top: 5px;">机会来源</label>
										</div>
										<div class="form-group col-md-3">
											<span class="input-with-icon"> <input type="text"
												class="form-control" name="chcsource" id="chcsource"
												placeholder="机会来源" value="<%= sal.getChcSource()%>"/> <i class="fa fa-code-fork"></i>
											</span>
										</div>
									</div>
									<div class="col-md-12" style="margin-top: 20px">
										<div class="col-md-1">
											<label for="gaiyao" style="margin-top: 5px;">概要<span
												class="required">*</span></label>
										</div>
										<div class="form-group col-md-7">
											<span class="input-with-icon"> <input type="text" class="form-control" name="chctitle" id="chctitle"
												placeholder="概要"  value="<%= sal.getChcTitle()%>"
												onblur="checkchctitle()"> <i
												class="fa fa-ellipsis-h"></i>
											</span>
										</div>
										<div class="col-md-1">
											<label for="chenggongjilu" style="margin-top: 5px;">成功几率<span
												class="required">*</span></label>
										</div>
										<div class="form-group col-md-3">
											<span class="input-with-icon"> <select class="form-control" name="chcrate" id="chcrate"onblur="checkchcrate()" style="width: 58%;">
													<optgroup label="选择几率">
														<option value="<%= sal.getChcRate()%>"><%= sal.getChcRate()%></option>
														<option value="0">请选择几率</option>
														<option value="0">0</option>
														<option value="10">10%</option>
														<option value="20">20%</option>
														<option value="30">30%</option>
														<option value="40">40%</option>
														<option value="50">50%</option>
														<option value="60">60%</option>
														<option value="70">70%</option>
														<option value="80">80%</option>
														<option value="90">90%</option>
														<option value="100">100%</option>
													</optgroup>
											</select>
											</span>
										</div>
									</div>
									<div class="col-md-12" style="margin-top: 20px">
										<div class="col-md-1">
											<label for="Contact_person" style="margin-top: 5px;">联系人</label>
										</div>
										<div class="form-group col-md-3">
											<span class="input-with-icon"> <input type="text" value="<%= sal.getChcLinkman()%>"
												class="form-control" name="chclinkman" id="chclinkman"
												placeholder="联系人"> <i class="fa fa-user"></i>
											</span>
										</div>
										<div class="col-md-1">
											<label for="tel" style="margin-top: 5px;">联系电话</label>
										</div>
										<div class="form-group col-md-4">
											<span class="input-with-icon"> <input type="text" value="<%= sal.getChcTel()%>"
												class="form-control" name="chctel" id="chctel"
												placeholder="联系电话"> <i class="fa fa-phone"></i>
											</span>
										</div>
									</div>
									<div class="col-md-12" style="margin-top: 20px">
										<div class="col-md-1">
											<label for="chance_describe" style="margin-top: 5px;">机会描述<span
												class="required">*</span></label>
										</div>
										<div class="col-md-7">
											<textarea name="chcdesc" id="chcdesc" class="form-control" rows="5" placeholder="机会描述" style="width: 83%;"
												onblur="checkchcdesc()"><%= sal.getChcDesc()%></textarea>
											<span class="help-block"><i
												class="fa fa-info-circle mr-xs"></i>最大长度为 <span class="code">200</span></span>
										</div>
									</div>
									<div class="col-md-12" style="margin-top: 20px">
										<div class="col-md-1">
											<label style="margin-top: 5px;" for="founder">创建人<span
												class="required">*</span></label>
										</div>
										<div class="form-group col-md-3">
											<span class="input-with-icon"> <span style="width: 58%;"  
												class="form-control"  id="chccreatename"><%= session.getAttribute("username") %></span>										
											</span>
											<span class="help-block"><i
												class="fa fa-info-circle mr-xs"></i>系统自动获取，不可修改 </span>
										</div>
										<div class="col-md-1">
											<label for="time" style="margin-top: 5px;">创建时间<span
												class="required">*</span></label>
										</div>
										<div class="form-group col-md-3">
											<span class="input-with-icon" > <input type="text" class="form-control" name="chccreatedate" id="chccreatedate" style="width: 58%;"
												value="<fmt:formatDate value="<%=new java.util.Date() %>" pattern="yyyy-MM-dd HH:mm:ss"/>" disabled>
											</span>											
											<span class="help-block"><i
												class="fa fa-info-circle mr-xs"></i>系统自动获取，不可修改 </span>
										</div>
									</div>
									<div class="col-md-12"
										style="margin-top: 20px; margin-bottom: 50px;">
										<div class="col-md-1">
											<label for="zhipai" style="margin-top: 5px;">指派给</label>
										</div>
										<div class="form-group col-md-3">
											<select class="form-control" disabled style="width: 58%;">
												<option value=""></option>
												<option value=""></option>
												<option value=""></option>
												<option value=""></option>
												<option value=""></option>
												<option value=""></option>
											</select>
										</div>
										<div class="col-md-1">
											<label for="zhipai_time" style="margin-top: 5px;">指派时间</label>
										</div>
										<div class="form-group col-md-3">
											<input type="text" class="form-control" id="zhipai_time" style="width: 58%;"
												placeholder="指派时间" disabled>
										</div>
									</div>
									<%}} %>
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
		 function checkchccustname(){
			 var chccustname=document.getElementById("chccustname").value;  			 
			 if(chccustname==""){
				 $(".msg").text("用户名称不能为空！");
				 $("#mymodal").modal();			
			 }
		 }		
		 function checkchctitle(){
			 var chctitle=document.getElementById("chctitle").value;  			 
			 if(chctitle==""){
				 $(".msg").text("概要不能为空！");
				 $("#mymodal").modal();			
			 }
		 }
		 function checkchcrate(){
			 var chcrate=document.getElementById("chcrate").value;  			 
			 if(chcrate==""){
				 $(".msg").text("成功几率不能为空！");
				 $("#mymodal").modal();			
			 }
		 }
		 function checkchcdesc(){
			 var chcdesc=document.getElementById("chcdesc").value;  			 
			 if(chcdesc==""){
				 $(".msg").text("机会描述不能为空！");
				 $("#mymodal").modal();			
			 }
		 }		
		 function updatesalchance(){
			 $.ajax({  
				    type: "POST",  
				    url:"<%=request.getContextPath()%>/updatesalchance.do",  
				    data:$('#updatesalchance').serialize(),  
				    async: false,  
				    error: function(request) {  
				    	 $(".msg").text("保存失败");
						 $("#mymodal").modal();  
				    },  
				    success: function(data) {  
				    	$(".msg").text("保存成功！3秒后跳转");
						$("#mymodal").modal();
						$(".msg").append("&nbsp\;<i class=\"fa fa-spinner\"></i>");
						setTimeout("window.location.href='<%=request.getContextPath()%>/querysalchance.do'",3000);
				    }  
				  });
		 }
	</script>
</body>
</html>