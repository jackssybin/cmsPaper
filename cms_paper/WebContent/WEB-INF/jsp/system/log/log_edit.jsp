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
					
					<form action="log/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="LOG_ID" id="LOG_ID" value="${pd.LOG_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">操作用户:</td>
								<td><input type="text" name="LOG_USER" id="LOG_USER" value="${pd.LOG_USER}" maxlength="255" placeholder="这里输入操作用户" title="操作用户" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">操作时间:</td>
								<td><input type="text" name="LOG_TIME" id="LOG_TIME" value="${pd.LOG_TIME}" maxlength="255" placeholder="这里输入操作时间" title="操作时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">日志内容:</td>
								<td><input type="text" name="LOG_CONTENT" id="LOG_CONTENT" value="${pd.LOG_CONTENT}" maxlength="255" placeholder="这里输入日志内容" title="日志内容" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">日志菜单:</td>
								<td><input type="text" name="LOG_MENU" id="LOG_MENU" value="${pd.LOG_MENU}" maxlength="255" placeholder="这里输入日志菜单" title="日志菜单" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">LOG_STATUS:</td>
								<td><input type="text" name="LOG_STATUS" id="LOG_STATUS" value="${pd.LOG_STATUS}" maxlength="1" placeholder="这里输入LOG_STATUS" title="LOG_STATUS" style="width:98%;"/></td>
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
			if($("#LOG_USER").val()==""){
				$("#LOG_USER").tips({
					side:3,
		            msg:'请输入操作用户',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LOG_USER").focus();
			return false;
			}
			if($("#LOG_TIME").val()==""){
				$("#LOG_TIME").tips({
					side:3,
		            msg:'请输入操作时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LOG_TIME").focus();
			return false;
			}
			if($("#LOG_CONTENT").val()==""){
				$("#LOG_CONTENT").tips({
					side:3,
		            msg:'请输入日志内容',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LOG_CONTENT").focus();
			return false;
			}
			if($("#LOG_MENU").val()==""){
				$("#LOG_MENU").tips({
					side:3,
		            msg:'请输入日志菜单',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LOG_MENU").focus();
			return false;
			}
			if($("#LOG_STATUS").val()==""){
				$("#LOG_STATUS").tips({
					side:3,
		            msg:'请输入LOG_STATUS',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LOG_STATUS").focus();
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