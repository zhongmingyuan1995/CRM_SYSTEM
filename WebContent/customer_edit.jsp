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
								<form  id="updatecustomer">
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
										<a onclick="queryOrder()" class="btn btn-default">
											<i class="fa fa-history"></i>&nbsp;&nbsp;历史订单
										</a>
										<a onclick="queryAssort()" class="btn btn-default ">
											<i class="fa fa-clock-o"></i>&nbsp;&nbsp;交往记录
										</a>
										<a onclick="queryLinkman()" class="btn btn-default">
											<i class="fa  fa fa-user"></i>&nbsp;&nbsp;联系人
										</a>
										<a href="queryBasdict.cs" class="btn btn-default">
											<i class="fa fa-edit"></i>&nbsp;&nbsp;新建
										</a>
										<a onclick="checkupdatecustomer()" class="btn btn-default">
											<i class="fa fa-floppy-o"></i>&nbsp;&nbsp;保存
										</a>
										<a href="javascript:history.go(-1)" class="btn btn-default">
											<i class="fa fa-arrow-circle-left"></i>&nbsp;&nbsp;返回
										</a>
									</div>
									<div class="col-md-12" style="margin-top: 20px">
									<%
											@SuppressWarnings("unchecked")
											List<Customer> Customer = (List<Customer>) request.getAttribute("Customer");
											if (Customer != null) {
												for (int i = 0; i < Customer.size(); i++) {
													Customer customer = Customer.get(i);%>																												
										<table class="table  table-bordered text-center">											
											<tr>
												<td>客户编号</td>												
												<td class="text-left">
													 <span>														
														<%= customer.getCustNo()%><input type="hidden" value="<%= customer.getCustNo()%>" name="custNo" id="custNo"/></span>											
												</td>
												<td>名称<span class="must">*</span></td>
												<td><input  type="text" class="form-control" placeholder="名称" name="custName" id="custName" onblur="checkcustName()" value="<%= customer.getCustName()%>"></td>
											</tr>
											<tr>
												<td>地区<span class="must">*</span></td>
												<td>
												<select class="form-control" name="custRegion" id="custRegion" >														
														<option value="<%= customer.getCustRegion()%>"><%= customer.getCustRegion()%></option>
														<option value="">---请选择---</option>
														<%
															@SuppressWarnings("unchecked")
															List<Basdict> list1 = (List<Basdict>) request.getAttribute("Basdict");
															if (list1 != null) {
																for (int j = 0; j < list1.size(); j++) {
																	Basdict basdict = list1.get(j);%>
														<%if(basdict.getDictType().equals("地区")) {%>
														<option value="<%= basdict.getDictValue()%>"><%= basdict.getDictValue()%></option>
														<%} }  }%>
												</select></td>
												<td>客户经理<span class="must">*</span></td>
												<td>
												<select class="form-control" name="custManagerId" id="custManagerId">														
														<option value="<%= customer.getCustManagerId()%>"><%= customer.getCustManagerName()%></option>
														<option value="">---请选择---</option>
														<%
															@SuppressWarnings("unchecked")
															List<User> list2 = (List<User>) request.getAttribute("User");
															if (list2 != null) {
																for (int k = 0; k < list2.size(); k++) {
																	User user = list2.get(k);%>													
														<option value="<%= user.getUserId()%>"><%= user.getUserName()%></option>
														<%} }%>
												</select></td>
											</tr>
											<tr>
												<td>客户等级<span class="must">*</span></td>
												<td>
												<select class="form-control" name="custLevel" id="custLevel">														
														<option value="<%= customer.getCustLevel()%>"><%= customer.getCustLevelLabel()%></option>
														<option value="">---请选择---</option>
														<%
															@SuppressWarnings("unchecked")
															List<Basdict> list3 = (List<Basdict>) request.getAttribute("Basdict");
															if (list3 != null) {
																for (int a = 0; a < list3.size(); a++) {
																	Basdict basdict = list3.get(a);%>
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
														<option value="<%= customer.getCustSatisfy()%>"><%= customer.getCustSatisfy()%></option>
														<option value="">---请选择---</option>													
														<option value="1">☆</option>
														<option value="2">☆☆</option>
														<option value="3">☆☆☆</option>
														<option value="4">☆☆☆☆</option>
														<option value="5">☆☆☆☆☆</option>
												</select></td>
												<td>客户信用度<span class="must">*</span></td>
												<td  >
												<select class="form-control" name="custCredit" id="custCredit">
														<option value="<%= customer.getCustCredit()%>"><%= customer.getCustCredit()%></option>
														<option value="">---请选择---</option>															
														<option value="1">☆</option>
														<option value="2">☆☆</option>
														<option value="3">☆☆☆</option>
														<option value="4">☆☆☆☆</option>
														<option value="5">☆☆☆☆☆</option>
												</select></td>
											</tr>
											<tr>
												<td>地址<span class="must">*</span></td>
												<td><input type="text" class="form-control" placeholder="地址" name="custAddr" id="custAddr" value="<%= customer.getCustAddr()%>" onblur="checkcustAddr()"></td>
												<td>邮政编码<span class="must">*</span></td>
												<td><input type="text" class="form-control" placeholder="邮政编码" name="custZip" id="custZip" value="<%= customer.getCustZip()%>" onblur="checkcustZip()"></td>
											</tr>
											<tr>
												<td>电话<span class="must">*</span></td>
												<td><input type="text" class="form-control" placeholder="电话" name="custTel" id="custTel" value="<%= customer.getCustTel()%>" onblur="checkcustTel()"></td>
												<td>传真<span class="must">*</span></td>
												<td><input type="text" class="form-control" placeholder="传真" name="custFax" id="custFax" value="<%= customer.getCustFax()%>" onblur="checkcustFax()"></td>
											</tr>
											<tr>
												<td>网址<span class="must">*</span></td>
												<td><input type="text" class="form-control" placeholder="网址" name="custWebsite" id="custWebsite" value="<%= customer.getCustWebsite()%>" onblur="checkcustWebsite()"></td>
												<td><input type="hidden"   name="custManagerName" id="custManagerName" value=""></td>
												<td><input type="hidden"   name="custLevelLabel" id="custLevelLabel" value=""></td>
											</tr>
											<tr>
												<td>营业执照注册号</td>
												<td><input type="text" class="form-control" placeholder="营业执照注册号" name="custLicenceNo" id="custLicenceNo" value="<%= customer.getCustLicenceNo()%>"></td>
												<td>法人<span class="must">*</span></td>
												<td><input type="text" class="form-control" placeholder="法人" name="custChieftain" id="custChieftain" value="<%= customer.getCustChieftain()%>" onblur="checkcustChieftain()"></td>
											</tr>
											<tr>
												<td>注册资金（万元）</td>
												<td><input type="text" class="form-control" placeholder="注册资金" name="custBankroll" id="custBankroll" value="<%= customer.getCustBankroll()%>"></td>
												<td>年营业额</td>
												<td><input type="text" class="form-control" placeholder="年营业额" name="custTurnover" id="custTurnover" value="<%= customer.getCustTurnover()%>"></td>
											</tr>
											<tr>
												<td>开户银行<span class="must">*</span></td>
												<td><input type="text" class="form-control" placeholder="开户银行" name="custBank" id="custBank" onblur="checkcustBank()" value="<%= customer.getCustBank()%>"></td>
												<td>银行账号<span class="must">*</span></td>
												<td><input type="text" class="form-control" placeholder="银行账号" name="custBankAccount" id="custBankAccount" onblur="checkcustBankAccount()" value="<%= customer.getCustBankAccount()%>"></td>
											</tr>
											<tr>
												<td>地税登记号</td>
												<td><input type="text" class="form-control" placeholder="地税登记号" name="custLocalTaxNo" id="custLocalTaxNo" value="<%= customer.getCustLocalTaxNo()%>"></td>
												<td>国税等登记号</td>
												<td><input type="text" class="form-control" placeholder="国税等登记号" name="custNationalTaxNo" id="custNationalTaxNo" value="<%= customer.getCustNationalTaxNo()%>"></td>
											</tr>
										</table>
										<%} }%>
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
			 if(custBankAccount==""||custBankAccount==null){
				 $(".msg").text("银行帐号不能为空！");
				 $("#mymodal").modal();			
				 return false;
			 }
			 	 return true;
		 }	
		 function checkupdatecustomer(){
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
					    url:"<%=request.getContextPath()%>/updatecustomer.cs",  
					    data:$('#updatecustomer').serialize(),  
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
		 function queryAssort(){
			 var assortCustNo=document.getElementById("custNo").value;  			 
			 window.location.href='<%=request.getContextPath()%>/queryAssort.as?assortCustNo='+assortCustNo;
		 }
		 function queryOrder(){
			 var odrCustNo=document.getElementById("custNo").value;  			 
			 window.location.href='<%=request.getContextPath()%>/queryOrder.or?odrCustNo='+odrCustNo;
		 }
</script>
</body>
</html>