<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>出错了</title>
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
										<p>错误报告><span class="color-danger">发生了500错误</span>
										<a href="javascript:history.go(-1)" class="btn btn-default" style="float:right"><i class=" fa fa-arrow-circle-left"></i>&nbsp;&nbsp;返回</a>
									</blockquote>							
							        <div style="width:620px;margin:200px auto">
							        	<a href="javascript:history.go(-1)" class="text-center"> <img alt="" src="images/error.jpg"></a>
							        </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>