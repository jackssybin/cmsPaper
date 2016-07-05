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
							<div id="zhongxin" style="padding-top: 13px;">
							<table id="table_report" class="table table-striped table-bordered table-hover">
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">用户ID:</td>
									<td><input type="text" name="USERID" id="loginname" value="${pd.USERID }" maxlength="32" title="用户ID" style="width:98%;" disabled="disabled"/></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">OPEN_ID:</td>
									<td><input type="text" name="OPENID" id="NUMBER" value="${pd.OPENID }" maxlength="32" title="微信登录的OPEN_ID" style="width:98%;" disabled="disabled"/></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">昵称:</td>
									<td><input type="text" name="NICKNAME" id="nickname"  value="${pd.NICKNAME }"  maxlength="32" title="昵称" style="width:98%;" disabled="disabled"/></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">用户头像地址:</td>
									<td><input type="text" name="HRADIMGURL" id="head_img_url"  value="${pd.HEADIMGURL }"  maxlength="32" title="用户的头像地址" style="width:98%;" disabled="disabled"/></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">用户的真实姓名:</td>
									<td><input type="text" name="NAME" id="name"  value="${pd.NAME }"  maxlength="32" title="用户的真实姓名" style="width:98%;" disabled="disabled"/></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">用户性别:</td>
									<td><input type="text" name="SEX" id="sex"  value="<c:if test='${pd.SEX == 1}' >男</c:if><c:if test='${pd.SEX == 2}' >女</c:if>"  maxlength="32" title="性别" style="width:98%;" disabled="disabled"/></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">手机号:</td>
									<td><input type="number" name="PHONE" id="phone"  value="${pd.PHONE }"  maxlength="32" title="手机号" style="width:98%;" disabled="disabled"/></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">QQ号:</td>
									<td><input type="number" name="QQ" id="qq"  value="${pd.QQ }"  maxlength="32" title="QQ号" style="width:98%;" disabled="disabled"/></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">邮箱:</td>
									<td><input type="email" name="EMAIL" id="email"  value="${pd.EMAIL }" maxlength="32" title="邮箱" onblur="hasE('${pd.USERNAME }')" style="width:98%;" disabled="disabled"/></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">用户地址:</td>
									<td><input type="text" name="ADDRESS" id="address"  value="${pd.ADDRESS }"  maxlength="32" title="地址" style="width:98%;" disabled="disabled"/></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">用户的自我介绍:</td>
									<td><input type="text" name="INTRODUCTION" id="phone"  value="${pd.INTRODUCTION }"  maxlength="32" title="手机号" style="width:98%;" disabled="disabled"/></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">注册时间:</td>
									<td><input type="text" name="REGISTER_TIME" id="register_time"  value="${pd.REGISTER_TIME }"  maxlength="32" title="注册时间" style="width:98%;" disabled="disabled"/></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">最后的登录时间:</td>
									<td><input type="text" name="LAST_LOGIN_TIME" id="last_login_time"  value="${pd.LAST_LOGIN_TIME }"  maxlength="32" title="最后登录的时间" style="width:98%;" disabled="disabled"/></td>
								</tr>  
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">最后的登录IP:</td>
									<td><input type="text" name="LAST_IP" id="last_ip"  value="${pd.LAST_IP }"  maxlength="32" title="最后的登录IP" style="width:98%;" disabled="disabled"/></td>
								</tr>
								
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">常用的登录IP:</td>
									<td><input type="text" name="COMMON_IP" id="common_ip"  value="${pd.COMMON_IP }"  maxlength="32" title="常用的登录IP" style="width:98%;" disabled="disabled"/></td>
								</tr>
			  					<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">用户状态:</td>
									<td><input type="text" name="USER_STATE" id="user_state" value=<c:if test="${pd.USER_STATE == 'N'}" >已停用</c:if><c:if test="${pd.USER_STATE == 'Y'}" >使用中</c:if>  maxlength="64" title="用户的状态" style="width:98%;" disabled="disabled"/></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">操作:</td>
									<td>&nbsp;&nbsp;&nbsp;<input type="button" value="编辑用户" onclick="update();"/>&nbsp;&nbsp;&nbsp;<input type="button" value="停用/启用   用户" onclick="upState();"/>&nbsp;&nbsp;&nbsp;<input type="button" value="删除用户" onclick="delBuser();"/></td>
								</tr>
							</table>
							</div>
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
	
	function update(){
		alert("编辑用户");
	}
	
	function upState(){
		alert("修改用户状态");
	}
	
	function delBuser(){
		alert("删除用户");
	}
</script>
</html>