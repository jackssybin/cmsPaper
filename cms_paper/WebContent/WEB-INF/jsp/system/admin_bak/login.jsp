<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<!-- basic styles -->
		<link href="static/css/bootstrap.min.css"  type="text/css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" type="text/css" rel="stylesheet" />
		<link href="static/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
		<!--[if IE 7]>
		  <link rel="stylesheet" href="css/font-awesome-ie7.min.css" />
		<![endif]-->
		<!-- page specific plugin styles -->
		
		<!-- ace styles -->
		<link href="static/css/ace.min.css"  type="text/css" rel="stylesheet" />
		<link href="static/css/ace-responsive.min.css"  type="text/css" rel="stylesheet" />
		<!--[if lt IE 9]>
		  <link rel="stylesheet" href="css/ace-ie.min.css" />
		<![endif]-->
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
	//服务器校验
	function severCheck(){
		if(check()){
			var loginname = $("#loginname").val();
			var password = $("#password").val();
			var code = loginname+","+password+","+$("#code").val();
			$.ajax({
				type: 'POST',
				url: 'login_login',
		    	data: {KEYDATA:code,tm:new Date().getTime()},
				dataType:'json',
				cache: false,
				success: function(data){
					if("success" == data.result){
						saveCookie();
						window.location.href="main/index";
					}else if("usererror" == data.result){
						$("#loginname").tips({
							side : 1,
							msg : "用户名或密码有误",
							bg : '#FF5080',
							time : 15
						});
						$("#loginname").focus();
					}else if("codeerror" == data.result){
						$("#code").tips({
							side : 1,
							msg : "验证码输入有误",
							bg : '#FF5080',
							time : 15
						});
						$("#code").focus();
					}else{
						$("#loginname").tips({
							side : 1,
							msg : "缺少参数",
							bg : '#FF5080',
							time : 15
						});
						$("#loginname").focus();
					}
				}
			});
		}
	}

	//客户端校验
	function check() {

		if ($("#loginname").val() == "") {

			$("#loginname").tips({
				side : 2,
				msg : '用户名不得为空',
				bg : '#AE81FF',
				time : 3
			});

			$("#loginname").focus();
			return false;
		} else {
			$("#loginname").val(jQuery.trim($('#loginname').val()));
		}

		if ($("#password").val() == "") {

			$("#password").tips({
				side : 2,
				msg : '密码不得为空',
				bg : '#AE81FF',
				time : 3
			});

			$("#password").focus();
			return false;
		}
		if ($("#code").val() == "") {

			$("#code").tips({
				side : 1,
				msg : '验证码不得为空',
				bg : '#AE81FF',
				time : 3
			});

			$("#code").focus();
			return false;
		}

		$("#login-box").tips({
			side : 1,
			msg : '正在登录 , 请稍后 ...',
			bg : '#68B500',
			time : 10
		});

		return true;
	}
	
	$(document).ready(function() {
		changeCode();
		$("#codeImg").bind("click", changeCode);
		getNewCode();
	});

	$(document).keyup(function(event) {
		if (event.keyCode == 13) {
			$("#to-recover").trigger("click");
		}
	});

	function genTimestamp() {
		var time = new Date();
		return time.getTime();
	}

	function getNewCode(){
		$.ajax({
			type: "POST",
			url: 'login_getNewCode',
	    	data: {tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				$("#code").val(data.result)
			}
		});
	}
	
	
	function changeCode() {
		$("#codeImg").attr("src", "code.do?t=" + genTimestamp());
		getNewCode();
	}

	function savePaw() {
		if (!$("#saveid").attr("checked")) {
			$.cookie('loginname', '', {
				expires : -1
			});
			$.cookie('password', '', {
				expires : -1
			});
			$("#loginname").val('');
			$("#password").val('');
		}
	}

	function saveCookie() {
		if ($("#saveid").attr("checked")) {
			$.cookie('loginname', $("#loginname").val(), {
				expires : 7
			});
			$.cookie('password', $("#password").val(), {
				expires : 7
			});
		}
	}
	function quxiao() {
		$("#loginname").val('');
		$("#password").val('');
	}
	
	jQuery(function() {
		var loginname = $.cookie('loginname');
		var password = $.cookie('password');
		if (typeof(loginname) != "undefined"
				&& typeof(password) != "undefined") {
			$("#loginname").val(loginname);
			$("#password").val(password);
			$("#saveid").attr("checked", true);
			$("#code").focus();
		}
	});
		//TOCMAT重启之后 点击左侧列表跳转登录首页 
		if (window != top) {
			top.location.href = location.href;
		}
	</script>
		
	</head>
	<body class="login-layout" style="background-color:#438EB9">
	
		<div class="container-fluid" id="main-container">
			<div id="main-content">
				<div class="row-fluid">
					<div class="span12">
						
<div class="login-container">
<div class="row-fluid">
	<div class="center">
		<h1><i class="icon-leaf green"></i><span class="white"></span></h1>
	</div>
</div>
<div class="space-6"></div>
<div class="row-fluid">
<div class="position-relative">
	<div id="login-box" class="visible widget-box no-border">
		<div class="widget-body">
		 <div class="widget-main">
			<h4 class="header lighter bigger"><i class="icon-coffee green"></i> 请输入您的登陆信息</h4>
			
			<div class="space-6"></div>
			
			<form>
				 <fieldset>
					<label>
						<span class="block input-icon input-icon-right">
							<input type="text" name="loginname" id="loginname" value="admin" class="span12" placeholder="请输入用户名" />
							<i class="icon-user"></i>
						</span>
					</label>
					<label>
						<span class="block input-icon input-icon-right">
							<input type="password" name="password" id="password" class="span12" placeholder="请输入密码" value="1" />
							<i class="icon-lock"></i>
						</span>
					</label>
					<label>
						<span class="block input-icon input-icon-right">
							<input type="text" name="code" id="code" class="span4"
								style="height:22px; padding-top:0px;" />
							<i><img style="height:22px;" id="codeImg" alt="点击更换"
								title="点击更换" src="" /></i>
						</span>
					</label>
					<div class="space"></div>
					<div class="row-fluid">
						<label class="span8">
							<input name="form-field-checkbox" id="saveid" type="checkbox"
							onclick="savePaw();" style="padding-top:0px;" /><span class="lbl"> 记住我</span>
						</label>
						<span class="block input-icon input-icon-right">
							<i><a onclick="severCheck();"
							class="flip-link btn btn-info" id="to-recover">登录</a>
							</i>
						</span>
						
					</div>
					
				  </fieldset>
			</form>
		 </div><!--/widget-main-->
		
		
		 <div class="toolbar clearfix">
			<div>
				<a href="#" onclick="show_box('forgot-box'); return false;" class="forgot-password-link"><i class="icon-arrow-left"></i>忘记密码？</a>
			</div>
			<div>
				<a href="#" onclick="show_box('signup-box'); return false;" class="user-signup-link">注册 <i class="icon-arrow-right"></i></a>
			</div>
		 </div>
		</div><!--/widget-body-->
	</div><!--/login-box-->
	
	
	
	
	
	
	<div id="forgot-box" class="widget-box no-border">
		<div class="widget-body">
		 <div class="widget-main">
			<h4 class="header red lighter bigger"><i class="icon-key"></i> 找回密码</h4>
			
			<div class="space-6"></div>
			
			<p>
				输入您的邮箱完成找回
			</p>
			<form>
				 <fieldset>
					<label>
						<span class="block input-icon input-icon-right">
							<input type="email" class="span12" placeholder="Email" />
							<i class="icon-envelope"></i>
						</span>
					</label>
	
					<div class="row-fluid">
						<button onclick="return false;" class="span5 offset7 btn btn-small btn-danger"><i class="icon-lightbulb"></i> 发送!</button>
					</div>
					
				  </fieldset>
			</form>
		 </div><!--/widget-main-->
		
		 <div class="toolbar center">
			<a href="#" onclick="show_box('login-box'); return false;" class="back-to-login-link">返回登陆 <i class="icon-arrow-right"></i></a>
		 </div>
		</div><!--/widget-body-->
	</div><!--/forgot-box-->
	
	
	
	<div id="signup-box" class="widget-box no-border">
		<div class="widget-body">
		 <div class="widget-main">
			<h4 class="header green lighter bigger"><i class="icon-group blue"></i> 新用户注册</h4>
			<div class="space-6"></div>
			<p>
				输入您的详细:
			</p>
			
			<form>
				 <fieldset>
					<label>
						<span class="block input-icon input-icon-right">
							<input type="email" class="span12" placeholder="电子邮件" />
							<i class="icon-envelope"></i>
						</span>
					</label>
					<label>
						<span class="block input-icon input-icon-right">
							<input type="text" class="span12" placeholder="用户名" />
							<i class="icon-user"></i>
						</span>
					</label>
					<label>
						<span class="block input-icon input-icon-right">
							<input type="password" class="span12" placeholder="密码" />
							<i class="icon-lock"></i>
						</span>
					</label>
					<label>
						<span class="block input-icon input-icon-right">
							<input type="password" class="span12" placeholder="重复密码" />
							<i class="icon-retweet"></i>
						</span>
					</label>
					
					<label>
						<input type="checkbox"><span class="lbl"> 我接受 <a href="#">用户协议</a></span>
					</label>
					
					<div class="space-24"></div>
					
					<div class="row-fluid">
						<button type="reset" class="span6 btn btn-small"><i class="icon-refresh"></i> 重置</button>
						<button onclick="return false;" class="span6 btn btn-small btn-success">注册 <i class="icon-arrow-right icon-on-right"></i></button>
					</div>
					
				  </fieldset>
			</form>
		</div>
		
		<div class="toolbar center">
			<a href="#" onclick="show_box('login-box'); return false;" class="back-to-login-link"><i class="icon-arrow-left"></i> 返回登陆</a>
		</div>
	 </div><!--/widget-body-->
	</div><!--/signup-box-->
	
	
</div><!--/position-relative-->
	
</div>
</div>
					</div><!--/span-->
				</div><!--/row-->
			</div>
		</div><!--/.fluid-container-->
		<!-- basic scripts -->
		<script type="text/javascript">
		window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
		</script>
		<!-- page specific plugin scripts -->
		
		<!-- inline scripts related to this page -->
		
		<script type="text/javascript">
		
function show_box(id) {
 $('.widget-box.visible').removeClass('visible');
 $('#'+id).addClass('visible');
}
		</script>
		
	</body>
</html>
