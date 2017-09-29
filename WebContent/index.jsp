<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.crm.model.Salchance"%>
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
				<div class="panel" style="height:100vh">
					<div class="panel-content">
						<div class="row">
							<div class="col-md-12">
								<form class="form-inline" action="querysalchance.do"
									method="post">
									<blockquote class="b-darker-1 bl-md">
										<p>
											销售机会管理
										</p>
									</blockquote>
									<div class="col-md-12 right-operate">
										<button type="button" class="btn btn-default">
											<i class="fa fa-bars"></i>&nbsp;&nbsp;帮助
										</button>
										<a href="create_salchance.jsp" type="button"class="btn btn-default">
											<i class=" fa fa-plus"></i>&nbsp;&nbsp;新建
										</a>
									</div>									
									<div class="col-md-12"
										style="margin-top: 20px; margin-bottom: 20px">
										<div class="form-group">
											<label class="sr-only" for="chcCustName">客户名称</label> <input
												type="text" class="form-control" name="chcCustName"
												id="chcCustName" placeholder="客户名称">
												<input type="hidden" value="sal_chance" name="flag"/>
										</div>
										<div class="form-group">
											<label class="sr-only" for="chcTitle">概要</label> <input
												type="text" class="form-control" name="chcTitle"
												id="chcTitle" placeholder="概要">
										</div>
										<div class="form-group">
											<label class="sr-only" for="chcLinkman">联系人</label> <input
												type="text" class="form-control" name="chcLinkman"
												id="chcLinkman" placeholder="联系人">
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
								class="table table-striped table-condensed table-bordered text-center"
								cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>编号</th>
										<th>客户名称</th>
										<th>概要</th>
										<th>联系人</th>
										<th>联系人电话</th>
										<th>创建时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<%
										@SuppressWarnings("unchecked")
										List<Salchance> list = (List<Salchance>) request.getAttribute("salList");
										if (list != null) {
											for (int i = 0; i < list.size(); i++) {
												Salchance sal = list.get(i);%>
									<tr>
										<td><%=sal.getChcId()%><input type="hidden" id="chcid" value="<%=sal.getChcId()%>"/></td>
										<td><%=sal.getChcCustName()%></td>
										<td><%=sal.getChcTitle()%></td>
										<td><%=sal.getChcLinkman()%></td>
										<td><%=sal.getChcTel()%></td>
										<td><%=sal.getChcCreateDate()%></td>
										<td>
											<div class="btn-group btn-group-xs">
												<% if(sal.getChcStatus().equals("未分配")){%>
													<a class="btn btn-transparent" title="指派" href="editsalchance.do?chcid=<%=sal.getChcId()%>&flag=due">
													<i class="fa fa-hand-pointer-o color-primary"></i>&nbsp;<%=sal.getChcStatus()%>
													</a>
													<a class="btn btn-transparent " title="编辑"href="editsalchance.do?chcid=<%=sal.getChcId()%>&flag=edit">
													<i class="fa fa-pencil-square-o color-primary"></i>&nbsp;编辑
													</a>
													<a id="<%=sal.getChcId()%>" class="btn btn-transparent" title="删除"
													onclick="delsalchance('delsalchance.do?chcid=<%=sal.getChcId()%>')" >
														<i class="fa fa-trash-o color-primary"></i>&nbsp;删除
													</a>
												<% }else if(sal.getChcStatus().equals("已指派")){%>
													<a class="btn btn-transparent color-primary" title="查看" href="queryplan.pl?chcid=<%=sal.getChcId()%>&flag=succplan">
													<i class="fa fa-check-square-o "></i>&nbsp;<%=sal.getChcStatus()%>
													</a>
													<a class="btn btn-transparent " title="制定计划"href="queryplan.pl?chcid=<%=sal.getChcId()%>&flag=zdplan">
													<i class="fa fa-wpforms color-primary"></i>&nbsp;计划
													</a>
													<a id="<%=sal.getChcId()%>" class="btn btn-transparent" title="删除"
													onclick="delsalchance('delsalchance.do?chcid=<%=sal.getChcId()%>')" >
														<i class="fa fa-trash-o color-primary"></i>&nbsp;删除
													</a>
												<%}else{%>
													<a class="btn btn-transparent" title="查看" href="#">
													<i class="fa fa-check-square-o color-primary"></i>&nbsp;已归档
													</a>
													<a class="btn btn-transparent" title="编辑"href="queryplan.pl?chcid=<%=sal.getChcId()%>&flag=succplan">
													<i class="fa fa-eye color-primary"></i>&nbsp;查看
													</a>
													<a id="<%=sal.getChcId()%>" class="btn btn-transparent" title="删除"
													onclick="delsalchance('delsalchance.do?chcid=<%=sal.getChcId()%>')" >
														<i class="fa fa-trash-o color-primary"></i>&nbsp;删除
													</a>
												<%}%>
											</div>
										</td>										
									</tr>
									<%}
										}%>
								</tbody>
							</table>
							<!--分页-->
								<div class="fenye"  style="float:right">
									<font size="2">共 ${page.totalPageCount} 页</font> <font
										size="2">第 ${page.pageNow} 页</font> <a
										href="querysalchance.do?pageNow=1">首页</a>
									<c:choose>
										<c:when test="${page.pageNow - 1 > 0}">
											<a href="querysalchance.do?pageNow=${page.pageNow - 1}">上一页</a>
										</c:when>
										<c:when test="${page.pageNow - 1 < 0}">
											<a href="querysalchance.do?pageNow=1">上一页</a>
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${page.pageNow + 1 <= page.totalPageCount}">
											<a href="querysalchance.do?pageNow=${page.pageNow + 1}">下一页</a>
										</c:when>
										<c:when test="${page.pageNow  < page.totalPageCount}">
											<a href="querysalchance.do?pageNow=${page.totalPageCount}">下一页</a>
										</c:when>
									</c:choose>
									<a href="querysalchance.do?pageNow=${page.totalPageCount}">尾页</a>
								</div>	
							<!--分页结束-->
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
		  arr[0].classList.add("open-item");
		  arr[0].classList.add("active-item");
	})
	function delsalchance(url) {  
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
