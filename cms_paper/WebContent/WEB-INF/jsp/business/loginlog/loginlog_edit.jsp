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
					
					<form action="loginlog/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="LOGINLOG_ID" id="LOGINLOG_ID" value="${pd.LOGINLOG_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">登录用户:</td>
								<td><input type="text" name="LOG_LOGIN_USER" id="LOG_LOGIN_USER" value="${pd.LOG_LOGIN_USER}" maxlength="255" placeholder="这里输入登录用户" title="登录用户" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">最后登录的IP:</td>
								<td><input type="text" name="LOG_LAST_LOGIN_IP" id="LOG_LAST_LOGIN_IP" value="${pd.LOG_LAST_LOGIN_IP}" maxlength="255" placeholder="这里输入最后登录的IP" title="最后登录的IP" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">最后登录的时间:</td>
								<td><input type="text" name="LOG_LAST_LOGIN_TIME" id="LOG_LAST_LOGIN_TIME" value="${pd.LOG_LAST_LOGIN_TIME}" maxlength="255" placeholder="这里输入最后登录的时间" title="最后登录的时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">日志登录的结果:</td>
								<td><input type="text" name="LOG_LOGIN_RESULT" id="LOG_LOGIN_RESULT" value="${pd.LOG_LOGIN_RESULT}" maxlength="2" placeholder="这里输入日志登录的结果" title="日志登录的结果" style="width:98%;"/></td>
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
		//保存
		function save(){
			if($("#LOG_LOGIN_USER").val()==""){
				$("#LOG_LOGIN_USER").tips({
					side:3,
		            msg:'请输入登录用户',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LOG_LOGIN_USER").focus();
			return false;
			}
			if($("#LOG_LAST_LOGIN_IP").val()==""){
				$("#LOG_LAST_LOGIN_IP").tips({
					side:3,
		            msg:'请输入最后登录的IP',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LOG_LAST_LOGIN_IP").focus();
			return false;
			}
			if($("#LOG_LAST_LOGIN_TIME").val()==""){
				$("#LOG_LAST_LOGIN_TIME").tips({
					side:3,
		            msg:'请输入最后登录的时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LOG_LAST_LOGIN_TIME").focus();
			return false;
			}
			if($("#LOG_LOGIN_RESULT").val()==""){
				$("#LOG_LOGIN_RESULT").tips({
					side:3,
		            msg:'请输入日志登录的结果',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LOG_LOGIN_RESULT").focus();
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