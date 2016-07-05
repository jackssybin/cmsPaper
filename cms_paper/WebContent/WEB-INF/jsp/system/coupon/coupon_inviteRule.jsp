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
					
					<form action="coupon/saveRule.do" name="Form" id="Form" method="post">
						<input type="hidden" name="INVITE_ID" id="INVITE_ID" value="100010001000"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<thead><th colspan="2" style="text-align:center">邀请码规则配置</th></thead>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">邀请人获得金额:</td>
								<td><input type="text" name="INVITE_USER_GET" id="INVITE_USER_GET" value="${pd.INVITE_USER_GET}" maxlength="255" placeholder="这里输入邀请人所得红包金额" title="邀请人所得红包金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">被邀请人所得红包金额:</td>
								<td><input type="text" name="INVITE_RECEIVE_GET" id="INVITE_RECEIVE_GET" value="${pd.INVITE_RECEIVE_GET}" maxlength="255" placeholder="这里输入被邀请人所得红包金额" title="被邀请人所得红包金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">邀请人能邀请的最多人数:</td>
								<td><input type="text" name="INVITE_MAX_NUMBER" id="INVITE_MAX_NUMBER" value="${pd.INVITE_MAX_NUMBER}" maxlength="255" placeholder="这里输入邀请人能邀请的最多人数" title="邀请人邀请人能邀请的最多人数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">活动最多金额:</td>
								<td><input type="text" name="INVITE_MAX_MONEY" id="INVITE_MAX_MONEY" value="${pd.INVITE_MAX_MONEY}" maxlength="255" placeholder="这里输入邀请人活动最多金额" title="邀请人活动最多金额" style="width:98%;"/></td>
							</tr>
							
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">活动开始时间:</td>
								<td>
								<input class="span10 date-picker" style="width:210px;" name="INVITE_START_TIME" id="INVITE_START_TIME" value="${pd.INVITE_START_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="活动开始时间" style="width:88px;" title="活动开始时间"/>
								</td>
							</tr>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">活动结束时间:</td>
								<td>
								<input class="span10 date-picker" style="width:210px;" name="INVITE_END_TIME" id="INVITE_END_TIME" value="${pd.INVITE_END_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="活动结束时间" style="width:88px;" title="活动结束时间"/>
								</td>
							</tr>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">使用期限开始时间:</td>
								<td>
								<input class="span10 date-picker" style="width:210px;" name="USE_START_TIME" id="USE_START_TIME" value="${pd.USE_START_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="期限开始时间" style="width:88px;" title="期限开始时间"/>
								</td>
							</tr>
							<tr>
								<td style="width:200px;text-align: right;padding-top: 13px;">使用期限结束时间:</td>
								<td>
								<input class="span10 date-picker" style="width:210px;" name="USE_END_TIME" id="USE_END_TIME" value="${pd.USE_END_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="期限结束时间" style="width:88px;" title="期限结束时间"/>
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
		//保存
		function save(){
			
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