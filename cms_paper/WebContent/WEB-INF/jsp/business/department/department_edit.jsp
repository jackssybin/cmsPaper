<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

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

					<div class="page-header">
						<h1>
							<small> <i class="ace-icon fa fa-angle-double-right"></i>
								编辑部门
							</small>
						</h1>
					</div>
					<!-- /.page-header -->



					<div class="row">
						<div class="col-xs-12">

							<form action="department/${msg}.do" name="Form" id="Form"
								method="post" class="form-horizontal">
								<input type="text" name="department_id" id="department_id"
									value="${pd.department_id }" /> <input type="text"
									name="parent_id" id="parent_id"
									value="${null == pd.parent_id ? parent_id:pd.parent_id}" />
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> 上级部门 :</label>
									<div class="col-sm-9">
										<div style="padding-top: 5px;">
											<div
												class="col-xs-4 label label-lg label-light arrowed-in arrowed-right">
												<b>${null == pds.department_name ?'(无) 此项为顶级部门':pds.department_name}</b>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> 部门名称 :</label>
									<div class="col-sm-9">
										<input type="text" name="department_name" id="department_name"
											value="${pd.department_name }" maxlength='255'
											placeholder="这里输入部门名称" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> 部门顺序 :</label>
									<div class="col-sm-9">
										<input type="number" name="order_by" id="order_by"
											value="${pd.order_by }" maxlength='4' placeholder="这里输入部门顺序"
											class="col-xs-10 col-sm-5" />
									</div>
								</div>


								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> 角色列表 : </label>
									<div class="col-sm-9">
										<input type="number" name="role_list" id="role_list"
											value="${pd.role_list}" placeholder="" title=""
											class="col-xs-10 col-sm-5" />
									</div>
								</div>


								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> 部门主管角色 : </label>
									<div class="col-sm-9">
										<input type="text" name="department_manager"
											id="department_manager" value="${pd.department_manager}"
											placeholder="" title="" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="clearfix form-actions">
									<div class="col-md-offset-3 col-md-9">
										<a class="btn btn-mini btn-primary" onclick="save();">保存</a> <a
											class="btn btn-mini btn-danger" onclick="goback();">取消</a>
									</div>
								</div>
								<div class="hr hr-18 dotted hr-double"></div>
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


		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
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
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		$(top.hangge());

		//取消
		function goback() {
			window.history.back(-1);
		}

		//保存
		function save() {
			if ($("#department_name").val() == "") {
				$("#department_name").tips({
					side : 3,
					msg : '请输入部门名称',
					bg : '#AE81FF',
					time : 2
				});
				$("#department_name").focus();
				return false;
			}
			if ($("#order_by").val() == "") {
				$("#order_by").tips({
					side : 3,
					msg : '请输入部门顺序',
					bg : '#AE81FF',
					time : 2
				});
				$("#order_by").focus();
				return false;
			}
			$("#Form").submit();
		}
	</script>


</body>
</html>