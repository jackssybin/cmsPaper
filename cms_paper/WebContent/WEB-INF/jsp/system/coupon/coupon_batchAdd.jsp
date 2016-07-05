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
					
					<form action="coupon/save.do" name="Form" id="Form" method="post">
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<thead><th colspan="2" style="text-align:center">批量新增修改优惠码</th></thead>
							<tr>
								<td style="width:115px;text-align: right;padding-top: 13px;">优惠金额:</td>
								<td><input type="text" name="COUPON_MONEY" onchange="judgeAllMoney();" id="COUPON_MONEY" value="${pd.COUPON_MONEY}" maxlength="255" placeholder="这里输入优惠金额" title="优惠金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:115px;text-align: right;padding-top: 13px;">限制金额:</td>
								<td><input type="text" name="LOW_MONEY" id="LOW_MONEY" value="${pd.LOW_MONEY}" maxlength="255" placeholder="这里输入限制金额" title="限制金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:115px;text-align: right;padding-top: 13px;">生成数量:</td>
								<td><input type="number" name="BATCH_NUM" onchange="judgeAllMoney();" style="width:210px;"  id="BATCH_NUM" value="${pd.BATCH_NUM}" maxlength="32" placeholder="这里输入生成数量" title="生成数量"/></td>
							</tr>
							<tr>
								<td style="width:115px;text-align: right;padding-top: 13px;">优惠总金额:</td>
								<td><input type="number" name="COUPON_ALL_MONEY" style="width:210px;" readonly="readonly" value="${pd.COUPON_ALL_MONEY}" id="COUPON_ALL_MONEY" value="" maxlength="32" placeholder="这里输入优惠总金额" title="优惠总金额"/></td>
							</tr>
							<tr>
								<td style="width:115px;text-align: right;padding-top: 13px;">活动开始时间:</td>
								<td>
									<input class="span10 date-picker" style="width:210px;" name="ACTIVITY_START_TIME" id="ACTIVITY_START_TIME" value="${pd.ACTIVITY_START_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="活动开始时间" style="width:88px;" title="活动开始时间"/>
								</td>
							</tr>
							<tr>
								<td style="width:115px;text-align: right;padding-top: 13px;">活动结束时间:</td>
								<td>
									<input class="span10 date-picker" style="width:210px;" name="ACTIVITY_END_TIME" id="ACTIVITY_END_TIME" value="${pd.ACTIVITY_END_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="活动结束时间" style="width:88px;" title="活动结束时间"/>
								</td>
							</tr>
							<tr>
								<td style="width:115px;text-align: right;padding-top: 13px;">生效时间:</td>
								<td><input class="span10 date-picker" style="width:210px;" name="CREATE_TIME" id="CREATE_TIME" value="${pd.CREATE_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="生效时间" style="width:88px;" title="生效时间"/>
								</td>
							</tr>
							
							<tr>
								<td style="width:115px;text-align: right;padding-top: 13px;">失效时间:</td>
								<td><input class="span10 date-picker" style="width:210px;" name="INVALID_TIME" id="INVALID_TIME" value="${pd.INVALID_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="失效时间"  title="失效时间"/></td>
							</tr>
							
							<tr>
								<td style="text-align: center;" colspan="10">
									<c:if test="${empty pd.GROUP_TYPE}">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									</c:if>
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
	<script type="text/javascript" src="static/js/myjs/accmath.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#COUPON_MONEY").val()==""){
				$("#COUPON_MONEY").tips({
					side:3,
		            msg:'请输入优惠金额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COUPON_MONEY").focus();
			return false;
			}
			if($("#LOW_MONEY").val()==""){
				$("#LOW_MONEY").tips({
					side:3,
		            msg:'请输入限制金额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LOW_MONEY").focus();
			return false;
			}
			
			if($("#BATCH_NUM").val()==""){
				$("#BATCH_NUM").tips({
					side:3,
		            msg:'请输入生成数量',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BATCH_NUM").focus();
			return false;
			}
			if($("#CREATE_TIME").val()==""){
				$("#CREATE_TIME").tips({
					side:3,
		            msg:'请输入生效时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATE_TIME").focus();
			return false;
			}
			if($("#INVALID_TIME").val()==""){
				$("#INVALID_TIME").tips({
					side:3,
		            msg:'请输入失效时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#INVALID_TIME").focus();
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
		
		
			function judgeAllMoney(){
				var COUPON_MONEY=$("#COUPON_MONEY").val();
				var BATCH_NUM =$("#BATCH_NUM").val();
				var COUPON_ALL_MONEY=accMul(COUPON_MONEY,BATCH_NUM);
				$("#COUPON_ALL_MONEY").val(COUPON_ALL_MONEY);
				
		}
		
		</script>
</body>
</html>