<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@page import="java.util.List,com.crm.model.Salchance,com.crm.model.Plan" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="head_left_right.jsp" %>
<div class="content">
           <div class="content-header">
			<div class="leftside-content-header">
				<ul class="breadcrumbs">
					<li style="margin-top: 12px"><i class="fa fa-home"
						aria-hidden="true"></i><a href="index.html">主页</a>><span class="color-lighter-1">营销管理</span></li>
				</ul>
			</div>
			</div>
			 <div class="row animated fadeInRight">
                <div class="col-sm-12">
                   <div class="panel">
					<div class="panel-content">
						<div class="row">
							<div class="col-md-12">
								<form class="form-inline">
									<blockquote class="b-darker-1 bl-md">
										<p>
											客户开发计划><span class="color-darker-1">执行计划</span>
										</p>
									</blockquote>
									<div class="col-md-12 right-operate">
									<button type="submit" class="btn btn-default "><i class="fa fa-bars"></i>&nbsp;&nbsp;帮助</button>
									<a onclick="updatesaldefeat()" class="btn btn-default"><i class=" fa fa-times-circle-o"></i>&nbsp;&nbsp;终止开发</a>
									<a onclick="updatesalsuccess()" class="btn btn-default"><i class=" fa fa-check-circle-o"></i>&nbsp;&nbsp;开发成功</a>
									<a href="javascript:history.go(-1)" class="btn btn-default"><i class=" fa fa-edit"></i>&nbsp;&nbsp;制定计划</a>
									<a href="javascript:history.go(-1)" class="btn btn-default"><i class=" fa fa-arrow-left"></i>&nbsp;&nbsp;返回</a>
									</div>
									<div class="col-md-12" style="margin-top:20px">
										<table class="table   table-hover  table-bordered text-center" >
											<%
												@SuppressWarnings("unchecked")
												List<Salchance> list = (List<Salchance>) request.getAttribute("Salchance");
												if (list != null) {
													for (int i = 0; i < list.size(); i++) {
														Salchance sal = list.get(i);%>							
											<tr>
												<td>编号</td>
												<td><%= sal.getChcId()%>
												    <input type="hidden" name="chcid"id="chcid" value="<%= sal.getChcId()%>"/></td>
												<td>机会来源</td>
												<td><%= sal.getChcSource()%></td>
											</tr>
											<tr>
												<td> 客户名称</td>
												<td><%= sal.getChcCustName()%></td>
												<td>成功几率（%）</td>
												<td><%= sal.getChcRate()%></td>
											</tr>
											<tr>
												<td>概要</td>
												<td colspan="3"><%= sal.getChcTitle()%></td>
											</tr>
											<tr>
												<td> 联系人</td>
												<td><%= sal.getChcLinkman()%></td>
												<td>联系电话</td>
												<td><%= sal.getChcTel()%></td>
											</tr>
											<tr>
												<td>机会描述</td>
												<td colspan="3"><%= sal.getChcDesc()%></td>
											</tr>
											<tr>
												<td>创建人</td>
												<td><%= sal.getChcCreateName()%></td>
												<td>创建时间</td>
												<td><%= sal.getChcCreateDate() %></td>
											</tr>
											<tr>
												<td> 指派给</td>
												<td><%= sal.getChcDueName() %></td>
												<td>指派时间</td>
												<td><%= sal.getChcDueDate() %></td>
											</tr>
											<%}} %>	
										</table>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
                    <div class="panel">
                        <div class="panel-content">
                           <table class="table  table-bordered  text-center">
                           	
                           	<tr>
                           		<th> <i class="fa fa-calendar-plus-o"></i>&nbsp;日期</th>
                           		<th><i class="fa fa-list-alt"></i>&nbsp;计划</th>
                           		<th colspan="3"><i class="fa fa-history"></i>&nbsp;执行效果</th>
                           	</tr>
                           	<%
                           			@SuppressWarnings("unchecked")
	                           		List<Plan> list2 = (List<Plan>) request.getAttribute("Plan");
									if (list2 != null) {
										for (int i = 0; i < list2.size(); i++) {
											Plan plan = list2.get(i);%>	
                           	<tr>
                           		<td style="vertical-align: middle">                           			
                           			<div class="form-group">
										<span > <span  id="chccreatedate" ><i class="fa fa-info-circle mr-xs"></i>
											<%=plan.getPlaDate() %>
												</span>											
										</span>
									</div>                          		
                           		</td>
                           		<td>
                           			<%=plan.getPlaTodo()%>
                           		</td>
                           		<td colspan="2">
                           			<%if(plan.getPlaResult()==null) {%>
                           			<input type="text" class="form-control" value="" id="<%=plan.getPlaId()%>">
                           			<%}else{ %>
                           			<input type="text" class="form-control" value="<%=plan.getPlaResult()%>" id="<%=plan.getPlaId()%>">
                           			<%}%>   
                           			<input type="hidden" class="form-control" value="<%=plan.getPlaId()%>" name="planid">   
                           			                    		
                           		</td>
                           		<td>
                           			<button onclick='updateplanresult("<%=plan.getPlaId()%>")' class="btn btn-default" ><i class=" fa fa-floppy-o"></i>&nbsp;&nbsp;保存</button>
                           		</td>
                           	</tr>
                           	<%}} %>	
                           </table>
                        </div>
                    </div>
                </div>
            </div>         
        </div>
<div class="modal fade" id="msgmodal" tabindex="-1" role="dialog"
		aria-labelledby="modal-small-label" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">提醒</h4>
				</div>
				<div class="modal-body">
					 <span id="msg"></span>
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
	function updateplanresult(planid){ 
		var planid = planid;
		var planresult = document.getElementById(planid).value;
		if(planresult==""||planresult==null){
			$('#msg').text('保存失败，执行效果不能为空！');  
            $("#msgmodal").modal();
		}else{
			var url ="<%=request.getContextPath()%>/updateplanresult.pl?planid="+planid+"&planresult="+planresult;
			//设置同步（默认异步true）
				$.ajaxSetup({
			        async : false
			    });
				$.get(url,function(data){
					if (data == '2'||data == "") {  
		                 $('#msg').text('保存失败！');  
		                 $("#msgmodal").modal();
		            //提交失败的操作  
		             } else {  
		            	 $('#msg').text('保存成功！2秒后刷新'); 
		            	 $("#msgmodal").modal();
		            	 setTimeout("window.location.reload()",2000);
		            	 return;
		         	}  
				});		
			}		
		}
	function updatesaldefeat(){ 
		var chcid = document.getElementById("chcid").value;
		var url ="<%=request.getContextPath()%>/updatesaldefeat.do?chcid="+chcid;
		//设置同步（默认异步true）
			$.ajaxSetup({
		        async : true
		    });
			$.get(url,function(data){
				if (data == '2'||data == "") {  
	                 $('#msg').text('操作失败，2秒后刷新！');  
	                 $("#msgmodal").modal();
	            //提交失败的操作  
	             } else {  
	            	 $('#msg').text('操作成功，2秒后刷新！'); 
	            	 $("#msgmodal").modal();
	            	 setTimeout("window.location.reload()",1000);
	         	}  
			});				
		} 
	function updatesalsuccess(){ 
		var chcid = document.getElementById("chcid").value;
		var url ="<%=request.getContextPath()%>/updatesalsuccess.do?chcid="+chcid;
		//设置同步（默认异步true）
			$.ajaxSetup({
		        async : false
		    });
			$.get(url,function(data){
				if (data == '2'||data == "") {  
	                 $('#msg').text('操作失败，2秒后刷新！');  
	                 $("#msgmodal").modal();
	            //提交失败的操作  
	             } else {  
	            	 $('#msg').text('操作成功，2秒后刷新！'); 
	            	 $("#msgmodal").modal();
	            	 setTimeout("window.location.reload()",1000);
	         	}  
			});				
		} 
	function zdplan() {  
		var chcid = document.getElementById("chcid").value;
		window.location.href="<%=request.getContextPath()%>/queryplan.pl?flag=zdplan&chcid="+chcid;
	} 
</script>  
</body>
</html>