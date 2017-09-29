<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date,java.text.SimpleDateFormat,com.crm.model.Customer"%>
<%@ page import="java.util.List,com.crm.model.User,com.crm.model.Basdict"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户关系管理系统-客户信息管理</title>
<style type="text/css">
td input{width:100%}
td select{width:100%;}
</style>
</head>
<body>
<%@include file="head_left_right.jsp" %>
	<div class="content">
		<div class="row animated fadeInRight" >
			<div class="col-sm-12">
				<div class="panel">
					<div class="panel-content">
						<div class="row">
							<div class="col-md-12">
								<form  id="insertcustomer">
									<blockquote class="b-darker-1 bl-md">
										<p>
											客户信息管理>客户信息
										</p>
									</blockquote>
									<h5 class="mb-lg "></h5>
									<div class="col-md-12 right-operate">
										<a href="system_help.jsp"class="btn  btn-default">
											<i class="fa fa-bars"></i>&nbsp;&nbsp;帮助
										</a>																				
										<a onclick="checkinsertcustomer()" class="btn btn-default">
											<i class="fa fa-floppy-o"></i>&nbsp;&nbsp;保存
										</a>
										<a href="javascript:history.go(-1)" class="btn btn-default">
											<i class="fa fa-arrow-circle-left"></i>&nbsp;&nbsp;返回
										</a>
									</div>
									<div class="col-md-12" style="margin-top: 20px">
										<table class="table  table-bordered text-center">											
											<tr>
												<td>客户编号</td>
												<%
												Date date = new Date();
												SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
											    String createdate = sdf.format(date);
											    String custno = "KH";
											    custno = custno + createdate;
												%>
												<td class="text-left">
													 <span>
														<%= custno%>&nbsp;&nbsp;
														<a href="javascript:void(0)" onclick="location.reload()" 
														><i class="fa fa-refresh"></i>&nbsp;刷新</a>
														<input type="hidden" value="<%= custno%>" name="custNo" id="custNo"/></span>											
												</td>
												<td>名称<span class="must">*</span></td>
												<td><input  type="text" class="form-control" placeholder="名称" name="custName" id="custName" onblur="checkcustName()"></td>
											</tr>
											<tr>
												<td>地区<span class="must">*</span></td>
												<td>
												<select class="form-control" name="custRegion" id="custRegion" >														
														<%
															@SuppressWarnings("unchecked")
															List<Basdict> list1 = (List<Basdict>) request.getAttribute("Basdict");
															if (list1 != null) {
																for (int i = 0; i < list1.size(); i++) {
																	Basdict basdict = list1.get(i);%>
														<%if(basdict.getDictType().equals("地区")) {%>
														<option value="<%= basdict.getDictValue()%>"><%= basdict.getDictValue()%></option>
														<%} }  }%>
												</select></td>
												<td>客户经理<span class="must">*</span></td>
												<td>
												<select class="form-control" name="custManagerId" id="custManagerId">														
														<%
															@SuppressWarnings("unchecked")
															List<User> list2 = (List<User>) request.getAttribute("User");
															if (list2 != null) {
																for (int i = 0; i < list2.size(); i++) {
																	User user = list2.get(i);%>													
														<option value="<%= user.getUserId()%>"><%= user.getUserName()%></option>
														<%} }%>
												</select></td>
											</tr>
											<tr>
												<td>客户等级<span class="must">*</span></td>
												<td>
												<select class="form-control" name="custLevel" id="custLevel">														
														<%
															@SuppressWarnings("unchecked")
															List<Basdict> list3 = (List<Basdict>) request.getAttribute("Basdict");
															if (list3 != null) {
																for (int i = 0; i < list3.size(); i++) {
																	Basdict basdict = list3.get(i);%>
														<%if(basdict.getDictType().equals("客户等级")) {%>
														<option value="<%= basdict.getDictId()%>"><%= basdict.getDictValue()%></option>
														<%} }  }%>
												</select></td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td>客户满意度<span class="must">*</span></td>
												<td>
												<select class="form-control" name="custSatisfy" id="custSatisfy">													
														<option value="1">☆</option>
														<option value="2">☆☆</option>
														<option value="3">☆☆☆</option>
														<option value="4">☆☆☆☆</option>
														<option value="5">☆☆☆☆☆</option>
												</select></td>
												<td>客户信用度<span class="must">*</span></td>
												<td  >
												<select class="form-control" name="custCredit" id="custCredit">														
														<option value="1">☆</option>
														<option value="2">☆☆</option>
														<option value="3">☆☆☆</option>
														<option value="4">☆☆☆☆</option>
														<option value="5">☆☆☆☆☆</option>
												</select></td>
											</tr>
											<tr>
												<td>地址<span class="must">*</span></td>
												<td><input type="text" class="form-control" placeholder="地址" name="custAddr" id="custAddr" onblur="checkcustAddr()"></td>
												<td>邮政编码<span class="must">*</span></td>
												<td><input type="text" class="form-control" placeholder="邮政编码" name="custZip" id="custZip" onblur="checkcustZip()"></td>
											</tr>
											<tr>
												<td>电话<span class="must">*</span></td>
												<td><input type="text" class="form-control" placeholder="电话" name="custTel" id="custTel" onblur="checkcustTel()"></td>
												<td>传真<span class="must">*</span></td>
												<td><input type="text" class="form-control" placeholder="传真" name="custFax" id="custFax" onblur="checkcustFax()"></td>
											</tr>
											<tr>
												<td>网址<span class="must">*</span></td>
												<td><input type="text" class="form-control" placeholder="网址" name="custWebsite" id="custWebsite" onblur="checkcustWebsite()"></td>
												<td><input type="hidden"   name="custManagerName" id="custManagerName" ></td>
												<td><input type="hidden"   name="custLevelLabel" id="custLevelLabel" ></td>
											</tr>
											<tr>
												<td>营业执照注册号</td>
												<td><input type="text" class="form-control" placeholder="营业执照注册号" name="custLicenceNo" id="custLicenceNo"></td>
												<td>法人<span class="must">*</span></td>
												<td><input type="text" class="form-control" placeholder="法人" name="custChieftain" id="custChieftain" onblur="checkcustChieftain()"></td>
											</tr>
											<tr>
												<td>注册资金（万元）</td>
												<td><input type="text" class="form-control" placeholder="注册资金" name="custBankroll" id="custBankroll"></td>
												<td>年营业额</td>
												<td><input type="text" class="form-control" placeholder="年营业额" name="custTurnover" id="custTurnover"></td>
											</tr>
											<tr>
												<td>开户银行<span class="must">*</span></td>
												<td><input type="text" class="form-control" placeholder="开户银行" name="custBank" id="custBank" onblur="checkcustBank()"></td>
												<td>银行账号<span class="must">*</span></td>
												<td><input type="text" class="form-control" placeholder="银行账号" name="custBankAccount" id="custBankAccount" onblur="checkcustBankAccount()"></td>
											</tr>
											<tr>
												<td>地税登记号</td>
												<td><input type="text" class="form-control" placeholder="地税登记号" name="custLocalTaxNo" id="custLocalTaxNo"></td>
												<td>国税等登记号</td>
												<td><input type="text" class="form-control" placeholder="国税等登记号" name="custNationalTaxNo" id="custNationalTaxNo"></td>
											</tr>
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
		 function checkcustName(){
			 var custName=document.getElementById("custName").value;  			 
			 if(custName==""){
				 $(".msg").text("客户名称不能为空！");
				 $("#mymodal").modal();	
				 return false;
			 }
			 	 return true;
		 }		
		 function checkcustAddr(){
			 var custAddr=document.getElementById("custAddr").value;  			 
			 if(custAddr==""){
				 $(".msg").text("地址不能为空！");
				 $("#mymodal").modal();			
				 return false;
			 }
			 	 return true;
		 }
		 function checkcustZip(){
			 var custZip=document.getElementById("custZip").value;  			 
			 if(custZip==""){
				 $(".msg").text("邮政编码不能为空！");
				 $("#mymodal").modal();			
				 return false;
			 }
			 	 return true;
		 }
		 function checkcustTel(){
			 var custTel=document.getElementById("custTel").value;  			 
			 if(custTel==""){
				 $(".msg").text("电话不能为空！");
				 $("#mymodal").modal();			
				 return false;
			 }
			 	 return true;
		 }
		 function checkcustFax(){
			 var custFax=document.getElementById("custFax").value;  			 
			 if(custFax==""){
				 $(".msg").text("传真不能为空！");
				 $("#mymodal").modal();	
				 return false;
			 }
			 	 return true;
		 }		
		 function checkcustWebsite(){
			 var custWebsite=document.getElementById("custWebsite").value;  			 
			 if(custWebsite==""){
				 $(".msg").text("网址不能为空！");
				 $("#mymodal").modal();			
				 return false;
			 }
			 	 return true;
		 }
		 function checkcustChieftain(){
			 var custChieftain=document.getElementById("custChieftain").value;  			 
			 if(custChieftain==""){
				 $(".msg").text("法人不能为空！");
				 $("#mymodal").modal();			
				 return false;
			 }
			 	 return true;
		 }
		 function checkcustBank(){
			 var custBank=document.getElementById("custBank").value;  			 
			 if(custBank==""){
				 $(".msg").text("开户银行不能为空！");
				 $("#mymodal").modal();			
				 return false;
			 }
			 	 return true;
		 }
		 function checkcustBankAccount(){
			 var custBankAccount=document.getElementById("custBankAccount").value;  			 
			 if(custBankAccount==""){
				 $(".msg").text("银行帐号不能为空！");
				 $("#mymodal").modal();			
				 return false;
			 }
			 	 return true;
		 }	
		 function checkinsertcustomer(){
			 var custManagerId =document.getElementById("custManagerId");
			 var custManagerName = custManagerId.options[custManagerId.selectedIndex].text;
			 $("#custManagerName").val(custManagerName);
			 var custLevel =document.getElementById("custLevel");
			 var custLevelLabel = custLevel.options[custLevel.selectedIndex].text;
			 $("#custLevelLabel").val(custLevelLabel);
			 if(checkcustName()&&checkcustAddr()&&checkcustZip()&&checkcustTel()&&checkcustFax()&&checkcustWebsite()&&checkcustChieftain()
					 &&checkcustBank()&&checkcustBankAccount()){
				 $.ajax({  
					    type: "POST",  
					    url:"<%=request.getContextPath()%>/insertcustomer.cs",  
					    data:$('#insertcustomer').serialize(),  
					    async: false,  
					    error: function(request) {  
					    	$(".msg").text("保存失败");
							$("#mymodal").modal();
					    },  
					    success: function(data) { 
					    		$(".msg").text("保存成功！");
								$("#mymodal").modal();
								$(".msg").append("&nbsp\;<i class=\"fa fa-spinner\"></i>");
								setTimeout("window.location.href='<%=request.getContextPath()%>/querycustomerLike.cs'",2000); 	
					    }  
					  });
			 }else{
				 $(".msg").text("保存失败，必填项不能为空！");
				 $("#mymodal").modal();
			 }		 
		 }
		 function queryLinkman(){
			 var lkmCustNo=document.getElementById("custNo").value;  			 
			 window.location.href='<%=request.getContextPath()%>/queryLinkman.lk?lkmCustNo='+lkmCustNo;
		 }	
</script>
</body>
</html>