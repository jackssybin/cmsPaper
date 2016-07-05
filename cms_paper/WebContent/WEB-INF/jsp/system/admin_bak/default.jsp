<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<%@ include file="../../system/admin/top.jsp"%> 
	</head>
<body>
	<form action="" name="Form" id="Form" method="post" enctype="multipart/form-data">
		<div id="zhongxin">
				<div class="center">测试首页</div>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/>
		<img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
	</form>
		<script type="text/javascript">
		$(top.hangge());
		</script>
</body>
</html>
