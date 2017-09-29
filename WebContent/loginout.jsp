<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>客户关系管理系统</title>
</head>
<style>
</style>
<body>
	<%@include file="head_left_right.jsp"%>
	<div class="content">
		<div class="row animated fadeInRight">
			<div class="col-sm-12">
				<div class="panel" style="height:100vh">
					<div class="panel-content">
						<div class="row">
							<div class="col-md-12">	
									<blockquote class="b-darker-1 bl-md">
										<p>错误报告><span class="color-danger">未登录或登录超时，请重新登录！</span></p>
										<a href="javascript:history.go(-1)" class="btn btn-default" style="float:right"><i class=" fa fa-arrow-circle-left"></i>&nbsp;&nbsp;返回</a>
									</blockquote>							
							        <div style="width:620px;margin:200px auto">
							        	<a href="javascript:history.go(-1)" class="text-center"> <img alt="" src="<%=request.getContextPath()%>/images/error.jpg"></a>
							        </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="loginmodal" tabindex="-1" role="dialog" aria-labelledby="modal-small-label">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header state modal-default">
                <h4 class="modal-title" id="modal-small-label">提醒</h4>
            </div>
            <div class="modal-body">登录超时，请重新登录！</div>
            <div class="modal-footer">
                <a href="exit.do" class="btn btn-default">确定</a>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">  		
			$(document).ready(function () {			
				$('#loginmodal').modal();
	    });	    
</script>
</body>
</html>