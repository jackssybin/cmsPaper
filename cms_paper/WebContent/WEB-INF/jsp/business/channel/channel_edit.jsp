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
					
					<form action="channel/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="parent_id" id="parent_id" value="${pd.parent_id}"/>
						<input type="hidden" name="channel_workflow" id="channel_workflow" value="0"/>
						<input type="hidden" name="comment_flag" id="comment_flag" value="${pd.comment_flag}"/>
						<input type="hidden" name="is_show" id="is_show" value="${pd.is_show}"/>
						<input type="hidden" name="channel_id" id="channel_id" value="${pd.channel_id}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
							<td style="width:160px;text-align: right;padding-top: 13px;">上级栏目:</td>
							<td ><div class="col-sm-9">
									<div style="padding-top:5px; ">
										<div class="col-xs-4 label label-lg label-light arrowed-in arrowed-right">
											<b>${null == pds.channel_name ?'(无) 此项为顶级栏目':pds.channel_name}</b>
										</div>
									</div>
								</div></td>
								<%-- <c:if test="${not empty pd.channel_id }">
								<td style="text-align: center;">
									<a class="btn btn-mini btn-primary" onclick="change('${pd.channel_id}','${pd.parent_id}');">改变栏目位置</a>
								
								</td>
								</c:if> --%>
							</tr>
							<tr>
								<td style="width:160px;text-align: right;padding-top: 13px;" >栏目名称:</td>
								<td colspan="2"><input type="text" name="channel_name" id="channel_name" value="${pd.channel_name}" maxlength='100' placeholder="这里输入栏目名称 " title="栏目名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:160px;text-align: right;padding-top: 13px;">栏目权重:</td>
								<td colspan="2"><input type="number" name="order_no" id="order_no" value="${pd.order_no}" maxlength='4' placeholder="这里输入栏目顺序 " title="栏目顺寻" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:160px;text-align: right;padding-top: 13px;">栏目英文名:</td>
								<td colspan="2"><input type="text" name="eng_name" id="eng_name" value="${pd.eng_name}" maxlength="100" placeholder="这里输入栏目英文名" title="栏目英文名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:160px;text-align: right;padding-top: 13px;">栏目拼音:</td>
								<td colspan="2"><input type="text" name="channel_pinyin" id="channel_pinyin" value="${pd.channel_pinyin}" maxlength="100" placeholder="这里输入栏目拼音" title="栏目拼音" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:160px;text-align: right;padding-top: 13px;">栏目拼音名称缩写:</td>
								<td colspan="2">
								<input type="text" name="pinyin_first" id="pinyin_first" value="${pd.pinyin_first}" maxlength="10" placeholder="栏目拼音名称缩写" title="栏目名称缩写" style="width:98%;"/>
								</td>
							</tr>
							<tr>
								<td style="width:160px;text-align: right;padding-top: 13px;">栏目静态页面存放路径:</td>
								<td colspan="2"><input type="text" name="channel_path" id="channel_path" value="${pd.channel_path}" maxlength="255" placeholder="栏目静态页面存放路径" title="栏目静态页面存放路径" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:160px;text-align: right;padding-top: 13px;">描述:</td>
								<td colspan="2"><input type="text" name="remark" id="remark" value="${pd.remark}" maxlength="255" placeholder="这里输入描述" title="描述" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:160px;text-align: right;padding-top: 13px;">评论开关:</td>
								<!-- 评论开关 comment_flag==1 - 开 comment_flag==0 -  关 -->
								<td colspan="2"><div class="col-sm-9">
									<label style="float:left;padding-left: 8px;padding-top:7px;" id="comment_open">
										<input name="form-field-radio" type="radio" class="ace" id="form-field-radio1" <c:if test="${pd.comment_flag == 1 }">checked="checked"</c:if> onclick="setType('1',1);"/>
										<span class="lbl"> 开</span>
									</label>
									<label style="float:left;padding-left: 5px;padding-top:7px;">
										<input name="form-field-radio" type="radio" class="ace" id="form-field-radio2" <c:if test="${pd.comment_flag == 0 }">checked="checked"</c:if> onclick="setType('1',0);"/>
										<span class="lbl"> 关</span>
									</label>
								</div></td>
							</tr>
							<tr>
								<td style="width:160px;text-align: right;padding-top: 13px;">是否在首页显示:</td>
								<td colspan="2"><div class="col-sm-9">
									<label style="float:left;padding-left: 8px;padding-top:7px;" id="show">
										<input name="form-field-radio2" type="radio" class="ace" id="form-field-radio3" <c:if test="${pd.is_show == 1 }">checked="checked"</c:if> onclick="setType('2',1);"/>
										<span class="lbl"> 是</span>
									</label>
									<label style="float:left;padding-left: 5px;padding-top:7px;">
										<input name="form-field-radio2" type="radio" class="ace" id="form-field-radio4" <c:if test="${pd.is_show == 0 }">checked="checked"</c:if> onclick="setType('2',0);"/>
										<span class="lbl"> 否</span>
									</label>
								</div></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="back();">返回</a>
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
	
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor_21/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="plugins/ueditor_21/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="lang/zh-cn/zh-cn.js"></script>
	
		<script type="text/javascript">
		$(top.hangge());
		
		//返回
		function back(){
			window.history.back(-1);
			
		}
		//改变栏目位置；
		function change(channel_id,parent_id){
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="更改栏目位置";
			 diag.URL = '<%=basePath%>channel/channelTree.do?channel_id='+channel_id+'&parent_id='+parent_id;
			 diag.Width = 250;
			 diag.Height = 300;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
						 //setTimeout("self.location=self.location",100);
						 
				}
				diag.close();
			 };
			 diag.show();
			
		}
		//保存
		function save(){
			if($("#channel_name").val()==""){
				$("#channel_name").tips({
					side:3,
		            msg:'请输入栏目名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#channel_name").focus();
			return false;
			}
			if($("#eng_name").val()==""){
				$("#eng_name").tips({
					side:3,
		            msg:'请输入栏目英文名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#eng_name").focus();
			return false;
			}
			if($("#channel_pinyin").val()==""){
				$("#channel_pinyin").tips({
					side:3,
		            msg:'请输入栏目拼音',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#channel_pinyin").focus();
			return false;
			}
			if($("#pinyin_first").val()==""){
				$("#pinyin_first").tips({
					side:3,
		            msg:'请输入栏目拼音名称缩写',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#pinyin_first").focus();
			return false;
			}
			if($("#channel_path").val()==""){
				$("#channel_path").tips({
					side:3,
		            msg:'请输入栏目静态页面存放路径',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#channel_path").focus();
			return false;
			}
			if($("#remark").val()==""){
				$("#remark").tips({
					side:3,
		            msg:'请输入栏目描述',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#remark").focus();
			return false;
			}
			if($("#comment_flag").val()==""){
				$("#comment_open").tips({
					side:3,
		            msg:'请选择评论开关',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#comment_flag").focus();
			return false;
			}
			if($("#is_show").val()==""){
				$("#show").tips({
					side:3,
		            msg:'请选是否在首页显示',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#is_show").focus();
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
		//设置评论开关or是否在首页显示
		function setType(type,value){
			if(type == '1'){
				$("#comment_flag").val(value);
			}else{
				$("#is_show").val(value);
			}
		}
		</script>
</body>
</html>