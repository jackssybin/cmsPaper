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
					
					<form action="param/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="PARAM_ID" id="PARAM_ID" value="${pd.PARAM_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">参数code:</td>
								<td><input type="text" name="PARAM_CODE" id="PARAM_CODE" value="${pd.PARAM_CODE}" maxlength="255" placeholder="这里输入参数code" title="参数code" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">参数名字:</td>
								<td><input type="text" name="PARAM_NAME" id="PARAM_NAME" value="${pd.PARAM_NAME}" maxlength="255" placeholder="这里输入参数名字" title="参数名字" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">参数值:</td>
								<td><input type="text" name="PARAM_VALUE" id="PARAM_VALUE" value="${pd.PARAM_VALUE}" maxlength="255" placeholder="这里输入参数值" title="参数值" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">参数类型:</td>
								<td><input type="text" name="PARAM_TYPE" id="PARAM_TYPE" value="${pd.PARAM_TYPE}" maxlength="255" placeholder="这里输入参数类型" title="参数类型" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">参数描述:</td>
								<td><input type="text" name="PARAM_DESC" id="PARAM_DESC" value="${pd.PARAM_DESC}" maxlength="255" placeholder="这里输入参数描述" title="参数描述" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">参数顺序:</td>
								<td><input type="text" name="PARAM_ORDER" id="PARAM_ORDER" value="${pd.PARAM_ORDER}" maxlength="255" placeholder="这里输入参数顺序" title="参数顺序" style="width:98%;"/></td>
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
			if($("#PARAM_CODE").val()==""){
				$("#PARAM_CODE").tips({
					side:3,
		            msg:'请输入参数code',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PARAM_CODE").focus();
			return false;
			}
			if($("#PARAM_NAME").val()==""){
				$("#PARAM_NAME").tips({
					side:3,
		            msg:'请输入参数名字',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PARAM_NAME").focus();
			return false;
			}
			if($("#PARAM_VALUE").val()==""){
				$("#PARAM_VALUE").tips({
					side:3,
		            msg:'请输入参数值',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PARAM_VALUE").focus();
			return false;
			}
			if($("#PARAM_TYPE").val()==""){
				$("#PARAM_TYPE").tips({
					side:3,
		            msg:'请输入参数类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PARAM_TYPE").focus();
			return false;
			}
			if($("#PARAM_DESC").val()==""){
				$("#PARAM_DESC").tips({
					side:3,
		            msg:'请输入参数描述',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PARAM_DESC").focus();
			return false;
			}
			if($("#PARAM_ORDER").val()==""){
				$("#PARAM_ORDER").tips({
					side:3,
		            msg:'请输入参数顺序',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PARAM_ORDER").focus();
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