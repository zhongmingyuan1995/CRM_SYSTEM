<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.crm.model.Customer"%>
<%@ page import="com.crm.model.Assort"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
				<div class="panel">
					<div class="panel-content">
						<div class="row">
							<div class="col-md-12">
								<form class="form-inline">
									<blockquote class="b-darker-1 bl-md">
										<p>客户信息管理>客户信息>交往记录</p>
									</blockquote>
									<h5 class="mb-lg "></h5>
									<div class="col-md-12 right-operate">
										<button  class="btn btn-default">
											<i class="fa fa-bars"></i>&nbsp;&nbsp;帮助
										</button>										
										<a onclick="createoreditAssort()" class="btn btn-default">
											<i class="fa fa-plus"></i>&nbsp;&nbsp;新建
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
											<tr>
												<%
											@SuppressWarnings("unchecked")
											List<Customer> Customer = (List<Customer>) request.getAttribute("Customer");
											if (Customer != null) {
												for (int i = 0; i < Customer.size(); i++) {
													Customer customer = Customer.get(i);%>
												<th class="active">客户编号</th>
												<td><%= customer.getCustNo()%><input type="hidden" id="assortCustNo" name="assortCustNo" value="<%= customer.getCustNo()%>"/></td>
												<th class="active">名称</th>
												<td><%= customer.getCustName()%></td>
												<%}} %>
											</tr>	
										</table>
									</div>
									<div class="col-md-12" style="margin-top: 20px">
										<table class="table  table-bordered  table-hover text-center">										
											<tr>
												<th>时间</th>
												<th>地点</th>
												<th>概要</th>
												<th>详细信息</th>												
												<th>操作</th>
											</tr>										
											<%
											@SuppressWarnings("unchecked")
											List<Assort> Assort = (List<Assort>) request.getAttribute("Assort");
											if (Assort != null) {
												for (int i = 0; i < Assort.size(); i++) {
													Assort assort = Assort.get(i);%>
											<tr>
												<td><%= assort.getAtvDate()%></td>
												<td><%= assort.getAtvPlace()%></td>
												<td><%= assort.getAtvTitle()%></td>
												<td><%= assort.getAtvDesc()%></td>											
												<td>
													<a  title="编辑" onclick="editAssort('<%=assort.getAtvId()%>')">
													<i class="fa fa-pencil-square-o color-primary"></i>&nbsp;编辑
													</a>
													<a id="<%=assort.getAtvId()%>"  title="删除" style="margin-left:10px;"
													onclick="delAssort('delAssort.as?atvId=<%=assort.getAtvId()%>')" >
														<i class="fa fa-trash-o color-primary"></i>&nbsp;删除
													</a>
												</td>
											</tr>
											<%}} %>
										</table>
										<%
											@SuppressWarnings("unchecked")
											List<Customer> Customer2 = (List<Customer>) request.getAttribute("Customer");
											if (Customer2 != null) {
												for (int i = 0; i < Customer2.size(); i++) {
													Customer customer = Customer2.get(i);%>
										<!--分页-->
											<div class="fenye"  style="float:right">
												<font size="2">共 ${page.totalPageCount} 页</font> <font
													size="2">第 ${page.pageNow} 页</font> <a
													href="queryAssort.as?pageNow=1&assortCustNo=<%= customer.getCustNo()%>">首页</a>
												<c:choose>
													<c:when test="${page.pageNow - 1 > 0}">
														<a href="queryAssort.as?pageNow=${page.pageNow - 1}&assortCustNo=<%= customer.getCustNo()%>">上一页</a>
													</c:when>
													<c:when test="${page.pageNow - 1 < 0}">
														<a href="queryAssort.as?pageNow=1&assortCustNo=<%= customer.getCustNo()%>">上一页</a>
													</c:when>
												</c:choose>
												<c:choose>
													<c:when test="${page.pageNow + 1 <= page.totalPageCount}">
														<a href="queryAssort.as?pageNow=${page.pageNow + 1}&assortCustNo=<%= customer.getCustNo()%>">下一页</a>
													</c:when>
													<c:when test="${page.pageNow  < page.totalPageCount}">
														<a href="queryAssort.as?pageNow=${page.totalPageCount}&assortCustNo=<%= customer.getCustNo()%>">下一页</a>
													</c:when>
												</c:choose>
												<a href="queryAssort.as?pageNow=${page.totalPageCount}&assortCustNo=<%= customer.getCustNo()%>">尾页</a>
											</div>	
										<!--分页结束-->
										<%}} %>
									</div>
								</form>
							</div>
						</div>
					</div>
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
<div class="modal fade" id="delresult" tabindex="-1" role="dialog" aria-labelledby="modal-small-label">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header state modal-default">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="modal-small-label">提醒</h4>
            </div>
            <div class="modal-body" id="msg"></div>
        </div>
    </div>
</div>
<script type="text/javascript">  
	$(document).ready(function(){  
		  var arr = document.getElementsByClassName("has-child-item");
		  arr[1].classList.add("open-item");
		  arr[1].classList.add("active-item");
	})
	function createoreditAssort(){
		 var assortCustNo = document.getElementById("assortCustNo").value;  			 
		 window.location.href='<%=request.getContextPath()%>/createoreditAssort.as?flag=create&assortCustNo='+assortCustNo;
	 }
	function editAssort(assortId){
		 var assortCustNo = document.getElementById("assortCustNo").value; 
		 var assortId = assortId;  
		 window.location.href='<%=request.getContextPath()%>/createoreditAssort.as?flag=edit&assortCustNo='+assortCustNo+'&assortId='+assortId;
	 }
	function delAssort(url) {  
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
	            	 setTimeout("queryAssort()",1000);
	         	}  
			});
	}
	function queryAssort(){
		 var assortCustNo = document.getElementById("assortCustNo").value; 
		 window.location.href='<%=request.getContextPath()%>/queryAssort.as?assortCustNo='+assortCustNo; 	
	 }
</script>
</body>
</html>