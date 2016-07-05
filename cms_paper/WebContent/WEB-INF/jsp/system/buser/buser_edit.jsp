<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../admin/top.jsp"%>
</head>
<body class="no-skin">
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
								<form action="management_user/${msg }.do" name="userForm" id="userForm" method="post">
									<input type="hidden" name="USERID" id="userid" value="${pd.USERID }"/>
									<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report" class="table table-striped table-bordered table-hover">
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">openid:</td>
											<td><input type="text" name="OPENID" id="openid" value="${pd.OPENID }" maxlength="32" placeholder="这里输入openid" title="OPENID" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">用户昵称:</td>
											<td><input type="text" name="NICKNAME" id="nickname" value="${pd.NICKNAME }" maxlength="32" placeholder="这里输入用户昵称" title="用户昵称" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">用户头像:</td>
											<td><input type="text" name="HEADIMGURL" id="headimgurl" value="${pd.HEADIMGURL }" maxlength="32" placeholder="这里输入用户头像路径" title="头像" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">用户姓名:</td>
											<td><input type="text" name="NAME" id="name" value="${pd.NAME }" maxlength="32" placeholder="这里输入用户的姓名" title="用户姓名" onblur="hasN('${pd.USERNAME }')" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">用户性别:</td>
											<td>
												<c:if test="${msg == 'add' }">
													男:&nbsp;&nbsp;<input type="radio" name="SEX" id="sex1" value="1" checked="true"/>&nbsp;&nbsp;&nbsp;&nbsp;女:&nbsp;&nbsp;<input type="radio" name="SEX" id="sex2" value="2"/>
												</c:if>
												<c:if test="${msg == 'edit' }">
													<input type="hidden" id="sex" value="${pd.SEX }" />
													男:&nbsp;&nbsp;<input type="radio" name="SEX" id="sex12" value="1" />&nbsp;&nbsp;&nbsp;&nbsp;女:&nbsp;&nbsp;<input type="radio" name="SEX" id="sex22" value="2"/>
												</c:if>
											</td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">手机号:</td>
											<td><input type="number" name="PHONE" id="PHONE"  value="${pd.PHONE }"  maxlength="32" placeholder="这里输入手机号" title="手机号" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">QQ:</td>
											<td><input type="number" name="QQ" id="qq"  value="${pd.QQ }"  maxlength="32" placeholder="这里输入qq号" title="qq" style="width:98%;"/></td>
										</tr>
										
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">邮箱:</td>
											<td><input type="email" name="EMAIL" id="EMAIL"  value="${pd.EMAIL }" maxlength="32" placeholder="这里输入邮箱" title="邮箱" onblur="hasE('${pd.USERNAME }')" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">用户地址:</td>
											<td><input type="text" name="ADDRESS" id="address" value="${pd.ADDRESS }" placeholder="这里输入用户地址" maxlength="64" title="地址" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">个人介绍:</td>
											<td><input type="text" name="INTRODUCTION" id="introduction" value="${pd.INTRODUCTION }" placeholder="这里输入个人介绍" maxlength="64" title="个人介绍" style="width:98%;"></input></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">注册时间:</td>
											<td><input type="text" name="REGISTER_TIME" id="register_TIME" value="${pd.REGISTER_TIME }" placeholder="这里输入注册时间" maxlength="64" title="注册时间" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">最后登录时间:</td>
											<td><input type="text" name="LAST_LOGIN_TIME" id="last_login_time" value="${pd.LAST_LOGIN_TIME }" placeholder="这里输入最后登录" maxlength="64" title="最后登录时间" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">最后登录的IP:</td>
											<td><input type="text" name="LAST_IP" id="last_ip" value="${pd.LAST_IP }" placeholder="这里输入最后登录的IP" maxlength="64" title="最后登录IP" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">最常登录的IP:</td>
											<td><input type="text" name="COMMON_IP" id="common_ip" value="${pd.COMMON_IP }" placeholder="这里输入最常登录的IP" maxlength="64" title="最常用IP" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">用户状态:</td>
											<td>
												<c:if test="${msg == 'add' }">
													使用中:&nbsp;&nbsp;<input type="radio" name="USER_STATE" id="user_state1" value="Y" checked="true"/>&nbsp;&nbsp;&nbsp;&nbsp;已停用:&nbsp;&nbsp;<input type="radio" name="USER_STATE" id="user_state2" value="N"/>
												</c:if>
												<c:if test="${msg == 'edit' }">
													<input type="hidden" id="user_state" value="${pd.USER_STATE }" />
													使用中:&nbsp;&nbsp;<input type="radio" name="USER_STATE" id="user_state12" value="Y"/>&nbsp;&nbsp;&nbsp;&nbsp;已停用:&nbsp;&nbsp;<input type="radio" name="USER_STATE" id="user_state22" value="N"/>
												</c:if>
											</td>
										</tr>
										<tr>
											<td style="text-align: center;" colspan="10">
												<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
												<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
											</td>
										</tr>
									</table>
									</div>
									<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
								</form>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../admin/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</body>
<script type="text/javascript">
	$(top.hangge());
	//修改用户的性别和存在状态时，默认原来的性别和状态
	$(function(){
		if($("#sex").val() == '1'){
			$("#sex12").attr("checked","true");
		}else{
			$("#sex22").attr("checked","true");
		}
		if($("#user_state").val() == 'Y'){
			$("#user_state12").attr("checked","true");
		}else{
			$("#user_state22").attr("checked","true");
		}
	});
	$(document).ready(function(){
		if($("#user_id").val()!=""){
			$("#loginname").attr("readonly","readonly");
			$("#loginname").css("color","gray");
		}
		
	});
	//保存
	function save(){
		if($("#loginname").val()=="" || $("#loginname").val()=="此用户名已存在!"){
			$("#loginname").tips({
				side:3,
	            msg:'输入用户名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#loginname").focus();
			$("#loginname").val('');
			$("#loginname").css("background-color","white");
			return false;
		}else{
			$("#loginname").val(jQuery.trim($('#loginname').val()));
		}
		
		if($("#NUMBER").val()==""){
			$("#NUMBER").tips({
				side:3,
	            msg:'输入编号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#NUMBER").focus();
			return false;
		}else{
			$("#NUMBER").val($.trim($("#NUMBER").val()));
		}
		if($("#user_id").val()=="" && $("#password").val()==""){
			$("#password").tips({
				side:3,
	            msg:'输入密码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#password").focus();
			return false;
		}
		if($("#password").val()!=$("#chkpwd").val()){
			
			$("#chkpwd").tips({
				side:3,
	            msg:'两次密码不相同',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#chkpwd").focus();
			return false;
		}
		if($("#name").val()==""){
			$("#name").tips({
				side:3,
	            msg:'输入姓名',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#name").focus();
			return false;
		}
		var myreg = /^(((13[0-9]{1})|159)+\d{8})$/;
		if($("#PHONE").val()==""){
			
			$("#PHONE").tips({
				side:3,
	            msg:'输入手机号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#PHONE").focus();
			return false;
		}else if($("#PHONE").val().length != 11 && !myreg.test($("#PHONE").val())){
			$("#PHONE").tips({
				side:3,
	            msg:'手机号格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#PHONE").focus();
			return false;
		}
		if($("#EMAIL").val()==""){
			
			$("#EMAIL").tips({
				side:3,
	            msg:'输入邮箱',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#EMAIL").focus();
			return false;
		}else if(!ismail($("#EMAIL").val())){
			$("#EMAIL").tips({
				side:3,
	            msg:'邮箱格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#EMAIL").focus();
			return false;
		}
		if($("#user_id").val()==""){
			hasU();
		}else{
			$("#userForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
	}
	function ismail(mail){
		return(new RegExp(/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/).test(mail));
		}
	
	//判断用户名是否存在
	function hasU(){
		var USERNAME = $.trim($("#loginname").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>user/hasU.do',
	    	data: {USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" == data.result){
					$("#userForm").submit();
					$("#zhongxin").hide();
					$("#zhongxin2").show();
				 }else{
					$("#loginname").css("background-color","#D16E6C");
					setTimeout("$('#loginname').val('此用户名已存在!')",500);
				 }
			}
		});
	}
	
	//判断邮箱是否存在
	function hasE(USERNAME){
		var EMAIL = $.trim($("#EMAIL").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>user/hasE.do',
	    	data: {EMAIL:EMAIL,USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#EMAIL").tips({
							side:3,
				            msg:'邮箱 '+EMAIL+' 已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					 $("#EMAIL").val('');
				 }
			}
		});
	}
	
	//判断编码是否存在
	function hasN(USERNAME){
		var NUMBER = $.trim($("#NUMBER").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>user/hasN.do',
	    	data: {NUMBER:NUMBER,USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#NUMBER").tips({
							side:3,
				            msg:'编号 '+NUMBER+' 已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					 $("#NUMBER").val('');
				 }
			}
		});
	}
</script>
</html>