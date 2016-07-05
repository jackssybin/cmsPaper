<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
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

<!-- jsp文件头和头部 -->
<%@ include file="../../system/admin/top.jsp"%>

<link rel="stylesheet" href="static/ace/css/bootstrap-duallistbox.min.css" />

</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="hr hr-18 dotted hr-double"></div>
					<div class="row">
						<div class="col-xs-12">
							<form action="article/showRefReading.do" name="Form" id="Form" method="post">
							
							<input type="hidden" name="articleId" id="articleId" value="${pd.articleId}" />
							<input type="hidden" name="contentRefId" id="contentRefId" value="${pd.contentRefId}" />
							<input type="hidden" name="contentRefName" id="contentRefName" value="" />
							<div id="zhongxin" style="padding-top: 13px;">
								<div class="form-group">
										<div class="col-sm-12">
											<select multiple="multiple" size="10" name="duallistbox_demo1[]" id="duallist">
											<!-- 开始循环 -->	
												<c:forEach items="${refList}" var="var" varStatus="vs">
													<option value="${var.articleId}" 
														<c:if test="${var.checkFlag}"> selected="selected" </c:if>
													    >${var.title}</option>
											 	</c:forEach>
											</select>
											<div class="hr hr-16 hr-dotted"></div>
										</div>
										<div class="col-sm-12">
											<button type="button" id="saveRefShow" class="btn btn-lg btn-success" onclick="saveRef();">保存 </button>
										</div>
										<c:forEach items="${refList}" var="var" varStatus="vs">
													<input type="hidden" name="${var.articleId}" id="${var.articleId}" value="${var.title}"/>
										</c:forEach>
									</div>
							  </div>
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
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/admin/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace.js"></script>
	<script src="static/ace/js/jquery.bootstrap-duallistbox.min.js"></script>
	
	<script type="text/javascript">
		try{
			$(top.hangge());
		}catch(e){}
		$(function() {
		 var demo1 = $('select[name="duallistbox_demo1[]"]').bootstrapDualListbox(
			 {infoTextFiltered: '<span class="label label-purple label-lg">Filtered</span>',
			  filterTextClear:"显示所有"
		 	}
		 );
				var container1 = demo1.bootstrapDualListbox('getContainer');
				container1.find('.btn').addClass('btn-white btn-info btn-bold');
		$(".info").hide();				
		
			//alert("contentRefId="+'${pd.contentRefId}')
		
		});
		
		function saveRef(){
			var refShowArticleIds=$('[name="duallistbox_demo1[]"]').val()+"";
			var refShowArticleNames="";
			$("#contentRefId").val(refShowArticleIds);
			var tmps=refShowArticleIds.split(",");
				for(var i=0;i<tmps.length;i++){
					refShowArticleNames+=$("#"+tmps[i]).val()+",";
				}
			$("#contentRefName").val(refShowArticleNames);	
			$("#zhongxin").hide();
			top.Dialog.close();
		}
	</script>

</body>
</html>