<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="java.util.List,com.crm.model.Salchance,com.crm.model.Plan"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
</style>
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
											客户开发计划><span class="color-darker-1">制定计划</span>
										</p>
									</blockquote>
									<div class="col-md-12 right-operate">
										<button type="submit" class="btn btn-default ">
											<i class="fa fa-bars"></i>&nbsp;&nbsp;帮助
										</button>
										<a onclick="zxplan()" class="btn btn-default">
											<i class=" fa fa-hand-lizard-o"></i>&nbsp;&nbsp;执行计划
										</a> 
										<a href="javascript:history.go(-1)" class="btn btn-default">
											<i class=" fa fa-arrow-left"></i>&nbsp;&nbsp;返回
										</a>
									</div>
									<div class="col-md-12" style="margin-top: 20px">
										<table class="table   table-hover  table-bordered text-center">
											<%
										@SuppressWarnings("unchecked")
										List<Salchance> list = (List<Salchance>) request.getAttribute("Salchance");
										if (list != null) {
											for (int i = 0; i < list.size(); i++) {
												Salchance sal = list.get(i);%>
											<tr>
												<td>编号</td>
												<td><%= sal.getChcId()%> <input type="hidden"
													name="chcid" id="chcid" value="<%= sal.getChcId()%>" /></td>
												<td>机会来源</td>
												<td><%= sal.getChcSource()%></td>
											</tr>
											<tr>
												<td>客户名称</td>
												<td><%= sal.getChcCustName()%></td>
												<td>成功几率（%）</td>
												<td><%= sal.getChcRate()%></td>
											</tr>
											<tr>
												<td>概要</td>
												<td colspan="3"><%= sal.getChcTitle()%></td>
											</tr>
											<tr>
												<td>联系人</td>
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
												<td>指派给</td>
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
							<colgroup>
								<col class="col-md-3" />
								<col class="col-md-6" />
								<col class="col-md-3" />
							</colgroup>
							<tr>
								<th><i class="fa fa-calendar-plus-o"></i>&nbsp;日期</th>
								<th colspan="2"><i class="fa fa-list-alt"></i>&nbsp;计划</th>
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
										<span> <span id="chccreatedate"><i
												class="fa fa-info-circle mr-xs"></i> <%=plan.getPlaDate() %>
										</span>
										</span>
									</div>
								</td>
								<td><input type="text" class="form-control"
									value="<%=plan.getPlaTodo()%>" name="plantodo"
									id="<%=plan.getPlaId()%>"> <input type="hidden"
									class="form-control" value="<%=plan.getPlaId()%>" name="planid">
								</td>
								<td><span><button
											onclick='updateplan("<%=plan.getPlaId()%>")'
											class="btn btn-defalut">
											<i class=" fa fa-floppy-o"></i>&nbsp;&nbsp;保存
										</button></span> <span><button
											onclick="deleteplan('deleteplan.pl?planid=<%=plan.getPlaId()%>')"
											class="btn btn-defalut">
											<i class=" fa fa-trash-o"></i>&nbsp;&nbsp;删除
										</button></span></td>
							</tr>
							<%}} %>
						</table>
						<table class="table  table-bordered text-center">
							<tr>
								<th style="vertical-align: middle"><i
									class="fa fa-calendar-plus-o"></i>&nbsp;日期</th>
								<td><input type="date" class="form-control" name="plandate"
									id="plandate"></td>
								<th style="vertical-align: middle"><i
									class="fa fa-list-alt"></i>&nbsp; 计划</th>
								<td><input type="text" class="form-control" name="plantodo"
									id="plantodo"></td>
							</tr>
							<tr>
								<td colspan="4">
									<button onclick="insertplan()" class="btn btn-defalut"
										style="float: right; margin-right: 20px; font-size: 14px">
										<i class=" fa fa-floppy-o"></i>&nbsp;&nbsp;保存
									</button>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="delmodal" tabindex="-1" role="dialog"
		aria-labelledby="modal-small-label">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="modal-small-label">提醒</h4>
				</div>
				<form id="delForm" method="POST">
					<div class="modal-body">你确定要删除这条计划吗？</div>
					<div class="modal-footer">
						<input type="hidden" id="url" />
						<button onclick="urlSubmit()" class="btn btn-default"
							data-dismiss="modal">确定</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</form>
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
	function insertplan(){  
	var chcid = document.getElementById("chcid").value;
	var plandate = document.getElementById("plandate").value;
	var plantodo = document.getElementById("plantodo").value;
	if(plandate==""||plandate==null){
		 $('#msg').text('保存失败，日期不能为空！');  
         $("#msgmodal").modal();
	}else if(plantodo==""||plantodo==null){
		 $('#msg').text('保存失败，计划不能为空！');  
         $("#msgmodal").modal();
	}else{
		var url ="<%=request.getContextPath()%>/saveplan.pl?chcid="+chcid+"&plandate="+plandate+"&plantodo="+plantodo;
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
	function updateplan(planid){ 
		var planid = planid;
		var plantodo = document.getElementById(planid).value;
		if(plantodo==""||plantodo==null){
			 $('#msg').text('保存失败，计划不能为空！'); 
        	 $("#msgmodal").modal();
		}else{
			var url ="<%=request.getContextPath()%>/updateplan.pl?planid="+planid+"&plantodo="+plantodo;
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
	function deleteplan(url) {  
	    $('#url').val(url);//给会话中的隐藏属性URL赋值  
	    $('#delmodal').modal();  
	}  
	function urlSubmit(){  
	 var url=$.trim($("#url").val());//获取会话中的隐藏属性URL  
		//设置同步（默认异步true）
			$.ajaxSetup({
		        async : false
		    });
			$.get(url,function(data){
				if (data == '2') {  
	                 $('#msg').text('删除失败！');  
	                 $("#msgmodal").modal();
	            //提交失败的操作  
	             } else {  
	            	 $('#msg').text('删除成功！2秒后刷新'); 
	            	 $("#msgmodal").modal();
	            	 setTimeout("window.location.reload()",2000);
	         	}  
			});
	}
	function zxplan() {  
		var chcid = document.getElementById("chcid").value;
		window.location.href="queryplan.pl?flag=zxplan&chcid="+chcid;
	} 
</script>
</body>
</html>