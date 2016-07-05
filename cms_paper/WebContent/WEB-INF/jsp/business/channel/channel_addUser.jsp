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
						<input type="hidden" name="channel_id" id="channel_id" value="${pd.channel_id}"/>
						
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							
							<tr>								
								<td style="width:100px;text-align: right;padding-top: 13px;">人员列表:</td>
								
								<td>
							<c:choose>
								<c:when test="${not empty userList}">
									<c:forEach items="${userList}" var="user" varStatus="vs">
									<label><input name="userList" type="checkbox" value="${user.USER_ID }" 
									<c:forEach items="${channelUserList}" var="cu" varStatus="vs">
									<c:if test="${cu.user_id == user.USER_ID }">
									checked ="checked"
									</c:if>									
									</c:forEach>
									
									/>${user.USERNAME} </label><br>									
								</c:forEach>
								</c:when>
								</c:choose>
							</td>
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
	
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor_21/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="plugins/ueditor_21/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="lang/zh-cn/zh-cn.js"></script>
	
		<script type="text/javascript">
		$(top.hangge());
		
			
		
		//保存
		function save(){
			var str = '';
			var channel_id =$("#channel_id").val();
			for(var i=0;i < document.getElementsByName('userList').length;i++){
			  if(document.getElementsByName('userList')[i].checked){
			  	if(str=='') str += document.getElementsByName('userList')[i].value;
			  	else str += ',' + document.getElementsByName('userList')[i].value;
			  }
			}
			
				var url ="<%=basePath%>channel/addUser.do?userIdList="+str+"&channel_id="+channel_id;
			  $("#Form").attr("action",url);
			  $("#Form").submit();
			  $("#zhongxin").hide();
			  $("#zhongxin2").show();
			  //top.Dialog.close();
			  
		}
		
	
		
		</script>
</body>
</html>