<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.crm.model.Basdict"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="fixed">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>客户关系管理系统</title> 
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
								<form class="form-inline" action="queryLikeBasdict.bs"
									method="post">
									<blockquote class="b-darker-1 bl-md">
										<p>
											数据字典
										</p>
									</blockquote>
									<div class="col-md-12 right-operate">						
										<button type="submit" class="btn btn-default">
											<i class="fa fa-bars"></i>&nbsp;&nbsp;帮助
										</button>
										<a onclick="showAddBox()"class="btn btn-default">
											<i class=" fa fa-plus"></i>&nbsp;&nbsp;新建
										</a>
									</div>
									<div class="col-md-12"
										style="margin-top: 20px; margin-bottom: 20px">
										<div class="form-group">
											<label class="sr-only" for="chcCustName">编号</label> <input
												type="text" class="form-control" name="dictItem"
												id="dictItem" placeholder="编号">
											 <input type="hidden" value="sal_chance" name="sal_plan"/>
										</div>
										<div class="form-group">
											<label class="sr-only" for="chcTitle">类型</label> <input
												type="text" class="form-control" name="dictType"
												id="dictType" placeholder="类型">
										</div>
										<div class="form-group">
											<label class="sr-only" for="chcLinkman">字典值</label> <input
												type="text" class="form-control" name="dictValue"
												id="dictValue" placeholder="字典值">
										</div>
										<div class="form-group" style="margin-left: 20px;">
											<button type="submit" class="btn  btn-defalut">
												<i class="fa fa-search"></i>&nbsp;&nbsp;查询
											</button>
										</div>
									</div>
								</form>
							</div>
						</div>

						<div class="table-responsive">
							<table id="basic-table"
								class="table table-striped  table-condensed table-bordered text-center"
								cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>编号</th>
										<th>类型</th>
										<th>条目</th>
										<th>数据</th>
										<th>是否可以添加</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<%
											@SuppressWarnings("unchecked")
											List<Basdict> list1 = (List<Basdict>) request.getAttribute("Basdict");
											if (list1 != null) {
												for (int i = 0; i < list1.size(); i++) {
													Basdict basdict = list1.get(i);%>
										
									<tr>
										<td><%=basdict.getDictId()%><input type="hidden" id="chcid" value="<%=basdict.getDictId()%>"/></td>
										<td><%=basdict.getDictType()%></td>
										<td><%=basdict.getDictItem()%></td>
										<td><%=basdict.getDictValue()%></td>
										<td><%if(basdict.getDictIsEditable()==1) {%>
										是<%}else{ %>否<%} %></td>
										<td>
											<div class="btn-group btn-group-xs">
													<a onclick='showModifyBox(<%=basdict.getDictId()%>)'class="btn btn-transparent" title="修改" >
													<i class="fa fa-pencil-square-o"></i>&nbsp;修改
													</a>
													<a class="btn btn-transparent" title="删除" onclick="deleteBasdict('deleteBasdict.bs?dictId=<%=basdict.getDictId()%>')">
													<i class="fa fa-trash-o"></i>&nbsp;删除
													</a>												
											</div>
										</td>										
									</tr>
								<%} }%>
								</tbody>
							</table>
							<!--分页-->
								<div class="fenye"  style="float:right">
									<font size="2">共 ${page.totalPageCount} 页</font> <font
										size="2">第 ${page.pageNow} 页</font> <a
										href="queryLikeBasdict.bs?pageNow=1">首页</a>
									<c:choose>
										<c:when test="${page.pageNow - 1 > 0}">
											<a href="queryLikeBasdict.bs?pageNow=${page.pageNow - 1}">上一页</a>
										</c:when>
										<c:when test="${page.pageNow - 1 < 0}">
											<a href="queryLikeBasdict.bs?pageNow=1">上一页</a>
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${page.pageNow + 1 <= page.totalPageCount}">
											<a href="queryLikeBasdict.bs?pageNow=${page.pageNow + 1}">下一页</a>
										</c:when>
										<c:when test="${page.pageNow  < page.totalPageCount}">
											<a href="queryLikeBasdict.bs?pageNow=${page.totalPageCount}">下一页</a>
										</c:when>
									</c:choose>
									<a href="queryLikeBasdict.bs?pageNow=${page.totalPageCount}">尾页</a>
								</div>	
							<!--分页结束-->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
 <div class="modal fade modify-box sm-modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header"><h4 class="modal-title">修改账户</h4></div>
			<div class="modal-body">
				<input type="text" class="form-control modifyAcctName" placeholder="账户名称 / 唯一键" maxlength="64" value="" disabled />
				<input type="text" class="form-control margin-top-15 mdoifyAcctNick" placeholder="账户昵称" maxlength="64" value="" />
			</div> 
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-default" onclick="mdoifyAccount()">修改</button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="delmodal" tabindex="-1" role="dialog" aria-labelledby="modal-small-label">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
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
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="modal-small-label">提醒</h4>
            </div>
            <div class="modal-body" id="msg"></div>
        </div>
    </div>
</div>
 <div class="modal fade add-box sm-modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header"><h4 class="modal-title">添加账户</h4></div>
			<div class="modal-body">
				<input type="text" class="form-control acctName" placeholder="账户名称 / 唯一键" maxlength="64" value="" />
				<input type="text" class="form-control margin-top-15 acctNick" placeholder="账户昵称" maxlength="64" value="" />
				<input type="password" class="form-control margin-top-15 acctPass" placeholder="账户密码" maxlength="64" value="" />
			</div> 
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-default" onclick="addAccount()">添加</button>
			</div>
		</div>
	</div>
</div>
<script src="<%=request.getContextPath()%>/javascripts/bootstrap-dialog.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){  
		  var arr = document.getElementsByClassName("has-child-item");
		  arr[4].classList.add("open-item");
		  arr[4].classList.add("active-item");
	})
	
	function initFun() {
	if(secure.find){
		dialog = BootstrapDialog.loading();
		findListInfo();
	}
	if(secure.add)
		$('button.add-btn').removeClass('hide');
	if(!secure.add)
		$('button.add-btn').remove();
	}
	
	function showAddBox(){
		$('.empty').removeClass('empty');
		$('input.acctName').val("");
		$('input.acctNick').val("");
		$('input.acctPass').val("");
		//BootstrapDialog.show($('div.add-box'));
		 $('div.add-box').modal();
	}
	
	function showModifyBox(id){
		$('div.modify-box').modal();  
	}
	
	
	function deleteBasdict(url) {  
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
				if (data == '2'||data == '') {  
	                 $('#msg').text('删除失败！');  
	                 $("#delresult").modal();
	                 setTimeout(function(){$("#delresult").modal("hide")},2000);
	            //提交失败的操作  
	             } else {  
	            	 $('#msg').text('删除成功！'); 
	            	 $("#delresult").modal();
	            	 setTimeout("window.location.href='findallBasdict.bs'",1000);
	         	}  
			});
	} 
</script>  
</body>
</html>
