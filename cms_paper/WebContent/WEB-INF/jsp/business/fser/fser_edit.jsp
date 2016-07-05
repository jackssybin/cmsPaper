<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/admin/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
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
					
					<form action="fser/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="USER_ID" id="FSER_ID" value="${pd.USER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">open_id:</td>
								<td><input type="text" name="OPEN_ID" id="OPEN_ID" value="${pd.OPEN_ID}" maxlength="100" placeholder="这里输入微信用户登录的OPEN_ID" title="OPEN_ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户昵称:</td>
								<td><input type="text" name="NICK_NAME" id="NICK_NAME" value="${pd.NICK_NAME}" maxlength="255" placeholder="这里输入用户昵称" title="用户昵称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户头像:</td>
								<td><input type="text" name="HEAD_IMGURL" id="HEAD_IMGURL" value="${pd.HEAD_IMGURL}" maxlength="255" placeholder="这里输入用户头像" title="用户头像" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户真实姓名:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入用户姓名" title="用户姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户的性别:</td>
								<td>
									<c:if test="${msg == 'save' }">
										男:&nbsp;&nbsp;<input type="radio" name="SEX" id="sex1" value="1" checked="true"/>&nbsp;&nbsp;&nbsp;&nbsp;女:&nbsp;&nbsp;<input type="radio" name="SEX" id="sex2" value="2"/>
									</c:if>
									<c:if test="${msg == 'edit' }">
										<input type="hidden" id="sex" value="${pd.SEX }" />
										男:&nbsp;&nbsp;<input type="radio" name="SEX" id="sex12" value="1" />&nbsp;&nbsp;&nbsp;&nbsp;女:&nbsp;&nbsp;<input type="radio" name="SEX" id="sex22" value="2"/>
									</c:if>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户使用的手机号:</td>
								<td><input type="text" name="PHONE" id="PHONE" value="${pd.PHONE}" maxlength="255" placeholder="这里输入用户使用的手机号" title="用户使用的手机号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户使用QQ号:</td>
								<td><input type="text" name="QQ" id="QQ" value="${pd.QQ}" maxlength="255" placeholder="这里输入用户使用QQ号" title="用户使用QQ号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户使用邮箱号:</td>
								<td><input type="text" name="EMAIL" id="EMAIL" value="${pd.EMAIL}" maxlength="255" placeholder="这里输入用户使用邮箱号" title="用户使用邮箱号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户地址:</td>
								<td><input type="text" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS}" maxlength="255" placeholder="这里输入用户地址" title="用户地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户的个人介绍:</td>
								<td><input type="text" name="INTRODUCTION" id="INTRODUCTION" value="${pd.INTRODUCTION}" maxlength="255" placeholder="这里输入用户的个人介绍" title="用户的个人介绍" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户的注册时间:</td>
								<td><input type="text" name="REGISTER_TIME" id="REGISTER_TIME" value="${pd.REGISTER_TIME}" maxlength="255" placeholder="这里输入用户的注册时间" title="用户的注册时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户的最后登录时间:</td>
								<td><input type="text" name="LAST_LOGIN_TIME" id="LAST_LOGIN_TIME" value="${pd.LAST_LOGIN_TIME}" maxlength="255" placeholder="这里输入用户的最后登录时间" title="用户的最后登录时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">最后登录IP:</td>
								<td><input type="text" name="LAST_IP" id="LAST_IP" value="${pd.LAST_IP}" maxlength="255" placeholder="这里输入最后登录IP" title="最后登录IP" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">常用登录IP:</td>
								<td><input type="text" name="COMMON_IP" id="COMMON_IP" value="${pd.COMMON_IP}" maxlength="255" placeholder="这里输入常用登录IP" title="常用登录IP" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户状态:</td>
								<td>
									<c:if test="${msg == 'save' }">
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
						
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						
					</form>
	
					<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
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


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/admin/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
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
		//保存
		function save(){
			if($("#OPEN_ID").val()==""){
				$("#OPEN_ID").tips({
					side:3,
		            msg:'请输入用户微信登录时需要的唯一标识',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OPEN_ID").focus();
			return false;
			}
			if($("#NICK_NAME").val()==""){
				$("#NICK_NAME").tips({
					side:3,
		            msg:'请输入用户昵称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NICK_NAME").focus();
			return false;
			}
			if($("#HEAD_IMGURL").val()==""){
				$("#HEAD_IMGURL").tips({
					side:3,
		            msg:'请输入用户头像，最后一个数值代表正方形头像大小',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#HEAD_IMGURL").focus();
			return false;
			}
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入用户姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#SEX").val()==""){
				$("#SEX").tips({
					side:3,
		            msg:'请输入用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SEX").focus();
			return false;
			}
			if($("#PHONE").val()==""){
				$("#PHONE").tips({
					side:3,
		            msg:'请输入用户使用的手机号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PHONE").focus();
			return false;
			}
			if($("#QQ").val()==""){
				$("#QQ").tips({
					side:3,
		            msg:'请输入用户使用QQ号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#QQ").focus();
			return false;
			}
			if($("#EMAIL").val()==""){
				$("#EMAIL").tips({
					side:3,
		            msg:'请输入用户使用邮箱号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EMAIL").focus();
			return false;
			}
			if($("#ADDRESS").val()==""){
				$("#ADDRESS").tips({
					side:3,
		            msg:'请输入用户地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADDRESS").focus();
			return false;
			}
			if($("#INTRODUCTION").val()==""){
				$("#INTRODUCTION").tips({
					side:3,
		            msg:'请输入用户的个人介绍',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#INTRODUCTION").focus();
			return false;
			}
			if($("#REGISTER_TIME").val()==""){
				$("#REGISTER_TIME").tips({
					side:3,
		            msg:'请输入用户的注册时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REGISTER_TIME").focus();
			return false;
			}
			if($("#LAST_LOGIN_TIME").val()==""){
				$("#LAST_LOGIN_TIME").tips({
					side:3,
		            msg:'请输入用户的最后登录时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LAST_LOGIN_TIME").focus();
			return false;
			}
			if($("#LAST_IP").val()==""){
				$("#LAST_IP").tips({
					side:3,
		            msg:'请输入最后登录IP',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LAST_IP").focus();
			return false;
			}
			if($("#COMMON_IP").val()==""){
				$("#COMMON_IP").tips({
					side:3,
		            msg:'请输入常用登录IP',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COMMON_IP").focus();
			return false;
			}
			if($("#USER_STATE").val()==""){
				$("#USER_STATE").tips({
					side:3,
		            msg:'请输入用户状态,当用户状态为N时，表示不能登录，当用户状态为Y时，表示可以登录',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USER_STATE").focus();
			return false;
			}
			
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>