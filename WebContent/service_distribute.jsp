<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.crm.model.Customer"%>
<%@ page import="java.util.List,com.crm.model.Service,com.crm.model.Basdict,com.crm.model.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="head_left_right.jsp" %>
	<div class="content">		
		<div class="row animated fadeInRight">
			<div class="col-sm-12">
				<div class="panel" style="height:100vh">
					<div class="panel-content">
						<div class="row">
							<div class="col-md-12">
								<form class="form-inline" action="queryLikeService.ss?flag=distribute" method="post">
									<blockquote class="b-darker-1 bl-md">
										<p>
											服务管理>服务分配
										</p>
									</blockquote>
										<div class="col-md-12 right-operate">									
										<button type="submit" class="btn btn-default">
											<i class="fa fa-bars"></i>&nbsp;&nbsp;帮助
										</button>
										<button type="submit" class="btn btn-default">
										<i class=" fa fa-search"></i>&nbsp;&nbsp;查询</button>
										</div>								
									<div class="col-md-12">
										<div class="col-md-1">
											<label for="gaiyao" style="margin-top: 5px;">客户<span
												class="required">*</span></label>
										</div>
										<div class="form-group col-md-2">
											<input type="text" class="form-control" name="custName" id="custName"placeholder="客户" >
										</div>
										<div class="col-md-1 text-right" >
											<label for="gaiyao" style="margin-top: 5px;">概要<span
												class="required">*</span></label>
										</div>
										<div class="form-group col-md-2">
											 <input type="text"class="form-control" name="svrTitle" id="svrTitle"placeholder="概要" > 
										</div>	
										<div class="col-md-1 text-right" >
											<label for="gaiyao" style="margin-top: 5px;">类型<span
												class="required">*</span></label>
										</div>
										<div class="form-group col-md-2">
											<span class="input-with-icon"> <select class="selectpicker" data-live-search="true" name="svrType" id="svrType" >
												<option value="">全部</option>
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
									<div class="col-md-12" style="margin-top:20px">
										<div class="col-md-1">
											<label for="gaiyao" style="margin-top: 5px;">创建日期<span
												class="required">*</span></label>
										</div>
										<div class="form-group col-md-5">
											<span> <input type="date" class="form-control" name="svrCreateDate" id="svrCreateDate"> —
													<input type="date" class="form-control" name="svrendCreateDate" id="svrendCreateDate">
											</span>											
										</div>										
										<div class="col-md-1 text-right" >
											<label for="gaiyao" style="margin-top: 5px;">状态<span
												class="required">*</span></label>
										</div>
										<div class="form-group col-md-2">
											<span class="input-with-icon"> <select class="selectpicker" data-live-search="true"name="svrStatus" id="svrStatus" >
												<option value="新创建">新创建</option>
											</select>
											</span>
										</div>												
									</div>
									
								</form>
							</div>
						</div>

						<div class="table" style="margin-top:30px;">
							<table id="basic-table"
								class="table table-striped  table-bordered text-center"
								cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>编号</th>
										<th>客户</th>
										<th>概要</th>
										<th>服务类型</th>
										<th>创建人</th>
										<th>创建时间</th>
										<th>分配给</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<%
										@SuppressWarnings("unchecked")
										List<Service> list = (List<Service>) request.getAttribute("Service");
										if (list != null) {
											for (int i = 0; i < list.size(); i++) {
												Service service = list.get(i);%>
									<%if(service.getSvrStatus().equals("新创建")) {%>
									<tr>
										<td><%=service.getSvrId()%><input type="hidden"  value="<%=service.getSvrId()%>"/></td>
										<td><%=service.getCustomer().getCustName()%></td>
										<td><%=service.getSvrTitle()%></td>
										<td><%=service.getSvrType()%></td>
										<td><%=service.getSvrCreateName()%></td>
										<td><%=service.getSvrCreateDate()%></td>
										<td>
											
											<select class="selectpicker" data-live-search="true"name="svrCreateId" id="<%=service.getSvrId()%>" title="请选择...">
												<%
														@SuppressWarnings("unchecked")
														List<User> list3 = (List<User>) request.getAttribute("User");
														if (list3 != null) {
															for (int j = 0; j < list3.size(); j++) {
																User user = list3.get(j);%>
													<option value="<%= user.getUserId()%>"><%= user.getUserName()%></option>
													<%} }%>
											</select>&nbsp;&nbsp;											
											<a  title="分配" onclick="distributeService(<%=service.getSvrId()%>)">
											<i class="fa fa-send-o color-primary"></i>&nbsp;分配
											</a>
										</td>
										<td>
											<a  title="删除" onclick="deleteService('deleteService.ss?svrId=<%=service.getSvrId()%>')" >
											<i class="fa fa-trash-o color-primary"></i>&nbsp;删除
											</a>
											<input type="hidden" name="svrCreateName" id="svrCreateName"/>
										</td>										
									</tr>
									<%}  } }%>
								</tbody>
							</table>
							<!--分页-->
								<div class="fenye"  style="float:right">
									<font size="2">共 ${page.totalPageCount} 页</font> <font
										size="2">第 ${page.pageNow} 页</font> <a
										href="queryLikeService.ss?pageNow=1&flag=distribute">首页</a>
									<c:choose>
										<c:when test="${page.pageNow - 1 > 0}">
											<a href="queryLikeService.ss?pageNow=${page.pageNow - 1}&flag=distribute">上一页</a>
										</c:when>
										<c:when test="${page.pageNow - 1 < 0}">
											<a href="queryLikeService.ss?pageNow=1&flag=distribute">上一页</a>
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${page.pageNow + 1 <= page.totalPageCount}">
											<a href="queryLikeService.ss?pageNow=${page.pageNow + 1}&flag=distribute">下一页</a>
										</c:when>
										<c:when test="${page.pageNow < page.totalPageCount}">
											<a href="queryLikeService.ss?pageNow=${page.totalPageCount}&flag=distribute">下一页</a>
										</c:when>
									</c:choose>
									<a href="queryLikeService.ss?pageNow=${page.totalPageCount}&flag=distribute">尾页</a>
								</div>	
							<!--分页结束-->
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
<div class="modal fade" id="delmodal" tabindex="-1" role="dialog" aria-labelledby="modal-small-label">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header state modal-default">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="modal-small-label">提醒</h4>
            </div>
            <form id="delForm" method="POST" >
            <div class="modal-body">你确定要删除这条销售记录吗？</div>
            <div class="modal-footer">
            <input type="hidden" id="url"/>
                <button onclick="urlSubmit()" class="btn btn-default" data-dismiss="modal">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
		$(document).ready(function(){  
			  var arr = document.getElementsByClassName("has-child-item");
			  arr[2].classList.add("open-item");
			  arr[2].classList.add("active-item");
		})
		 function distributeService(svrId){
			 var svrCreateId =document.getElementById(svrId);
			 var svrCreateid =document.getElementById(svrId).value;
			 var svrCreateName = svrCreateId.options[svrCreateId.selectedIndex].text;
			 $("#svrCreateName").val(svrCreateName);	
			 if(svrCreateid!=""){
				 $.ajax({  
					    type: "POST",  
					    url:"<%=request.getContextPath()%>/distributeService.ss",  
					    data:"svrId=" + svrId + "&svrDueId=" + svrCreateid+ "&svrDueName=" + svrCreateName,  
					    async: false,  
					    error: function(request) {  
					    	$(".msg").text("分配失败");
							$("#mymodal").modal();
					    },  
					    success: function(data) { 
					    		$(".msg").text("分配成功！");
								$("#mymodal").modal();
								$(".msg").append("&nbsp\;<i class=\"fa fa-spinner\"></i>");
								setTimeout("window.location.reload()",2000); 	
					    }  
					  });	
			 }else{
				 $(".msg").text("分配对象不能为空！");
				 $("#mymodal").modal();
			 }
				 
		 }
		 
		 function deleteService(url) {   
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
					if (data == '2'||data == "") {  
		                 $('#msg').text('删除失败！');  
		                 $("#delresult").modal();
		            //提交失败的操作  
		             } else {  
		            	 $('#msg').text('删除成功！'); 
		            	 $("#delresult").modal();
		            	 setTimeout("window.location.reload()",1000);
		         	}  
				});
		} 
</script>
</body>
</html>
