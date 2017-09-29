<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="fixed accounts sign-in">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>客户关系管理系统</title>
    <link rel="apple-touch-icon" sizes="120x120" href="favicon/apple-icon-120x120.png">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/stylesheets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/stylesheets/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/animate.css/animate.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/stylesheets/css/style.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/javascripts/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.min.js"></script>
</head>
<body style="background:#e6e6e6">
<div class="wrap">
    <div class="page-body animated slideInDown">
        <div class="logo" style="text-align:center;">
            <span style="text-align:center;font-size:25px;color:#194069">客户关系管理系统</span>
        </div>
        <div class="box" >
            <div class="panel mb-none" style="background:#e6e6e6">
                <div class="panel-content" >
                    <form  method="post" onsubmit="return checklogin()">
                        <div class="form-group mt-md">
                            <span class="input-with-icon">
                                    <input type="text" class="form-control" id="username"  onblur="checkusername()" name="username" placeholder="帐号">
                                    <i class="fa fa-envelope"></i>
                            </span>
                        </div>
                        <div class="form-group">
                             <span class="input-with-icon">
                                     <input type="password" class="form-control" id="password" onblur="checkpassword()" name="password"placeholder="密码">
                                     <i class="fa fa-key"></i>
                             </span>
                        </div>
                        <div class="form-group">
                            <span  class="msg" style="color:#cc0000"></span>                         	
                        </div>
                        <div class="form-group">
                            <button type="button" onclick="checklogin()" class="btn btn-primary btn-block">登录</button>
                        </div>
                        <div class="form-group text-center">
                            <a href="pages_forgot-password.html">忘记密码</a>
                        </div>
                    </form>
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
					 <span id="msg"></span>
				</div>		
			</div>			
		</div>		
</div>
<script type="text/javascript">  		
		 function checkusername(){
			 var username=document.getElementById("username").value;  			 
			 if(username==""){
					 $(".msg").text("用户名称不能为空！");	
					 $(".msg").prepend("<i class=\"fa fa-exclamation-circle\"></i>&nbsp\;");
			 }else
				 $(".msg").text("");		 
		 }
		 function checkpassword(){
			 var password=document.getElementById("password").value;  			 
			 if(password==""){
					 $(".msg").text("密码不能为空！");	
					 $(".msg").prepend("<i class=\"fa fa-exclamation-circle\"></i>&nbsp\;");
			 }else
				 $(".msg").text("");	 
		 }
		 function checklogin(){
			 var username=document.getElementById("username").value; 
			 var password=document.getElementById("password").value;
			 var url="<%=request.getContextPath()%>/login.do?username="+username+"&password="+password;
			//设置同步（默认异步true）
				$.ajaxSetup({
			        async : false
			    });
				$.get(url,function(data){
						if(data=="2"||data==""){
							//$("#msg").css("color","#cc0000");
							$("#msg").text("帐号或密码错误，请重新登录！");
							$("#msg").prepend("<i class=\"fa fa-exclamation-circle\"></i>&nbsp\;");
							 $("#mymodal").modal();
							 setTimeout(function(){$("#mymodal").modal("hide")},2000);
						}else{
							//$("#msg").css("color","green");
							$("#msg").text("登录成功！3秒后跳转");
							$("#msg").append("&nbsp\;<i class=\"fa fa-spinner\"></i>");
							$("#mymodal").modal();
							setTimeout("window.location.href='<%=request.getContextPath()%>/querysalchance.do?pageNow=1'",2000);
							return;
						}
				});
		 }
	</script>
</body>
</html>
