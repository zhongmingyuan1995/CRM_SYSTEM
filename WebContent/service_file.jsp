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
				<div class="panel">
					<div class="panel-content">
						<div class="row">
							<div class="col-md-12">
								<form class="form-inline" action="queryLikeService.ss?flag=file" method="post">
									<blockquote class="b-darker-1 bl-md">
										<p>
											服务管理>服务归档
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
											 <input type="text" 
												class="form-control" name="custName" id="custName"
												placeholder="客户" >
										</div>
										<div class="col-md-1 text-right" >
											<label for="gaiyao" style="margin-top: 5px;">概要<span
												class="required">*</span></label>
										</div>
										<div class="form-group col-md-2">
											<input type="text"
												class="form-control" name="svrTitle" id="svrTitle"
												placeholder="概要" >
										</div>	
										<div class="col-md-1 text-right" >
											<label for="gaiyao" style="margin-top: 5px;">类型<span
												class="required">*</span></label>
										</div>
										<div class="form-group col-md-2">
											<span class="input-with-icon"> <select class="selectpicker" data-live-search="true" name="svrType" id="svrType"style="width:100%" >
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
											<span class="input-with-icon"> <select class="selectpicker" data-live-search="true"name="svrStatus" id="svrStatus"  style="width:100%">
													<option value="已归档">已归档</option>
											</select>
											</span>
										</div>												
									</div>
									
								</form>
							</div>
						</div>

						<div class="table-responsive" style="margin-top:30px">
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
										<th>状态</th>
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
									<%if(service.getSvrStatus().equals("已归档")) {%>
									<tr>
										<td><%=service.getSvrId()%><input type="hidden" id="svrId" value="<%=service.getSvrId()%>"/></td>
										<td><%=service.getCustomer().getCustName()%></td>
										<td><%=service.getSvrTitle()%></td>
										<td><%=service.getSvrType()%></td>
										<td><%=service.getSvrCreateName()%></td>
										<td><%=service.getSvrCreateDate()%></td>
										<td><%=service.getSvrStatus()%></td>
										<td>
											<a  title="查看"href="fileService.ss?svrId=<%=service.getSvrId()%>">
											<i class="fa fa-eye color-primary"></i>&nbsp;查看
											</a>
										</td>										
									</tr>
									<%} }  }%>
								</tbody>
							</table>
							<!--分页-->
								<div class="fenye"  style="float:right">
									<font size="2">共 ${page.totalPageCount} 页</font> <font
										size="2">第 ${page.pageNow} 页</font> <a
										href="queryLikeService.ss?pageNow=1&flag=file">首页</a>
									<c:choose>
										<c:when test="${page.pageNow - 1 > 0}">
											<a href="queryLikeService.ss?pageNow=${page.pageNow - 1}&flag=file">上一页</a>
										</c:when>
										<c:when test="${page.pageNow - 1 < 0}">
											<a href="queryLikeService.ss?pageNow=1&flag=file">上一页</a>
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${page.pageNow + 1 <= page.totalPageCount}">
											<a href="queryLikeService.ss?pageNow=${page.pageNow + 1}&flag=file">下一页</a>
										</c:when>
										<c:when test="${page.pageNow < page.totalPageCount}">
											<a href="queryLikeService.ss?pageNow=${page.totalPageCount}&flag=file">下一页</a>
										</c:when>
									</c:choose>
									<a href="queryLikeService.ss?pageNow=${page.totalPageCount}&flag=file">尾页</a>
								</div>	
							<!--分页结束-->
						</div>
					</div>
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
	</script>
</body>
</html>
