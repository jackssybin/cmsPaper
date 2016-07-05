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
<%@ include file="../../system/admin/top.jsp"%>
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
							
							<div class="tabbable">
								<ul class="nav nav-tabs" id="myTab">
									<li class="active">
										<a data-toggle="tab" href="#home">
											<i class="ace-icon glyphicon glyphicon-user"></i>
											用户信息
										</a>
									</li>

									<li>
										<a data-toggle="tab" href="#messages">
											<i class="green ace-icon fa fa-home bigger-120"></i>
											浏览记录
										</a>
									</li>

									<li class="dropdown">
										<a data-toggle="tab" href="#Dropdown">
											<i class="green fa fa-leaf"></i>
											个人收藏
										</a>
									</li>
									
									<li>
										<a data-toggle="tab" href="#comments">
											<i class="green fa fa-fire"></i>
											个人评论
										</a>
									</li>
								</ul>
								<div class="tab-content">
									<!-- 用户信息 -->
									<div id="home" class="tab-pane fade in active">
										<table id="table_report" class="table table-striped table-bordered table-hover">
											<tr>
												<td style="width:79px;text-align: right;padding-top: 13px;">用户ID:</td>
												<td><input type="text" name="USER_ID" id="loginname" value="${pd.USER_ID }" maxlength="32" title="用户ID" style="width:98%;" disabled="disabled"/></td>
											</tr>
											<tr>
												<td style="width:79px;text-align: right;padding-top: 13px;">OPEN_ID:</td>
												<td><input type="text" name="OPEN_ID" id="NUMBER" value="${pd.OPEN_ID }" maxlength="32" title="微信登录的OPEN_ID" style="width:98%;" disabled="disabled"/></td>
											</tr>
											<tr>
												<td style="width:79px;text-align: right;padding-top: 13px;">昵称:</td>
												<td><input type="text" name="NICKNAME" id="nickname"  value="${pd.NICK_NAME }"  maxlength="32" title="昵称" style="width:98%;" disabled="disabled"/></td>
											</tr>
											<tr>
												<td style="width:79px;text-align: right;padding-top: 13px;">用户头像地址:</td>
												<td><input type="text" name="HRADIMGURL" id="head_img_url"  value="${pd.HEAD_IMGURL }"  maxlength="32" title="用户的头像地址" style="width:98%;" disabled="disabled"/></td>
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
												<td>&nbsp;&nbsp;&nbsp;<input type="button" value="编辑用户" onclick="update('${pd.USER_ID }');"/>&nbsp;&nbsp;&nbsp;<input type="button" value="停用/启用   用户" onclick="upState('${pd.USER_ID }','${pd.USER_STATE}');"/>&nbsp;&nbsp;&nbsp;<input type="button" value="删除用户" onclick="delBuser('${pd.USER_ID }');"/></td>
											</tr>
										</table>
									</div>
									<!-- 浏览记录 -->
									<div id="messages" class="tab-pane fade">
										<p>浏览记录</p>
									</div>
									<!-- 个人收藏 -->
									<div id="Dropdown" class="tab-pane fade in dropdown">
										<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
											<thead>
												<tr>
													<th class="center" style="width:50px;">序号</th>
													<th class="center">文章ID</th>
													<th class="center">创建时间</th>
													
												</tr>
											</thead>
																	
											<tbody>
											<!-- 开始循环 -->	
											<c:choose>
												<c:when test="${not empty listFavorite}">
													<c:forEach items="${listFavorite}" var="var" varStatus="vs">
														<tr>
															<td class='center' style="width: 30px;">${vs.index+1}</td>
															<td class='center'>${var.ARTICAL_ID}</td>
															<td class='center'>${var.CREATE_TIME}</td>
															
														</tr>
													
													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr class="main_info">
														<td colspan="100" class="center" >没有相关数据</td>
													</tr>
												</c:otherwise>
											</c:choose>
											</tbody>
										</table>
									</div>
									<!-- 个人评论 -->
									<div id="comments" class="tab-pane fade">
										<p>个人评论</p>
									</div>
								</div>
							</div>
							
							
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
	<%@ include file="../../system/admin/foot.jsp"%>
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
	
	//编辑用户
	function update(Id){
		top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="编辑";
		 diag.URL = '<%=basePath%>fser/goEdit.do?USER_ID='+Id;
		 diag.Width = 450;
		 diag.Height = 355;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
			if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				 nextPage(${page.currentPage});
			}
			diag.close();
		 };
		 diag.show();
	}
	
	//修改用户状态
	function upState(Id,state){
		bootbox.confirm("确定要改变用户状态吗?", function(result) {
			if(result) {
				top.jzts();
				var url = "<%=basePath%>fser/editState.do?USER_ID="+Id+"&USER_STATE="+state+"&tm="+new Date().getTime();
				$.get(url,function(data){
					nextPage(${page.currentPage});
				});
			}
		});
	}
	
	//删除用户
	function delBuser(Id){
		bootbox.confirm("确定要删除吗?", function(result) {
			if(result) {
				top.jzts();
				var url = "<%=basePath%>fser/delete.do?USER_ID="+Id+"&tm="+new Date().getTime();
				$.get(url,function(data){
					nextPage(${page.currentPage});
				});
			}
		});
	}
</script>
</html>