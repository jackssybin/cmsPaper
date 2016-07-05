<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
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

							<!-- 检索  -->
							<form action="department/list.do" method="post" name="Form"
								id="Form">
								<input type="text" name="preParentId" id="preParentId"
									value="${pd.preParentId}"> <input type="text"
									name="parent_id" id="parent_id" value="${pd.parent_id}">
								<%-- <table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="这里输入关键词" class="nav-search-input" id="nav-search-input" autocomplete="off" name="keywords" value="${pd.keywords }" placeholder="这里输入关键词"/>
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
									</div>
								</td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="开始日期"/></td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginEnd" name="lastLoginEnd"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="结束日期"/></td>
								<td style="vertical-align:top;padding-left:2px;">
								 	<select class="chosen-select form-control" name="name" id="id" data-placeholder="请选择" style="vertical-align:top;width: 120px;">
									<option value=""></option>
									<option value="">全部</option>
									<option value="">1</option>
									<option value="">2</option>
								  	</select>
								</td>
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
							</tr>
						</table>
						<!-- 检索  --> --%>

								<table id="simple-table"
									class="table table-striped table-bordered table-hover"
									style="margin-top: 5px;">
									<thead>
										<tr>
											<th class="center" style="width: 35px;"><label
												class="pos-rel"><input type="checkbox" class="ace"
													id="zcheckbox" /><span class="lbl"></span></label></th>
											<th class="center" style="width: 50px;">序号</th>
											<th class="center">部门名称</th>
											<th class="center">主管角色</th>
											<th class="center">人数</th>
											<th class="center">操作</th>
										</tr>
									</thead>

									<tbody>
										<!-- 开始循环 -->
										<c:choose>
											<c:when test="${not empty deptList}">
												<c:forEach items="${deptList}" var="var" varStatus="vs">
													<tr>
														<td class='center'><label class="pos-rel"><input
																type='checkbox' name='ids' value="${var.department_id}"
																class="ace" /><span class="lbl"></span></label></td>
														<td class='center' style="width: 30px;">${vs.index+1}</td>
														<%-- <td class='center'>${var.channel_id}</td> --%>
														<td class='center'><a
															href="javascript:goSonDepartment('${var.department_id}')">${var.department_name}</a>
														</td>
														<td class='center'>${var.department_manager}</td>
														<td class='center'>${var.role_list}</td>
														<td class="center">
															<div class="hidden-sm hidden-xs btn-group">
																<a class="btn btn-xs btn-success" title="增加人员"
																	onclick="addUser('${var.department_id}');"> <i
																	class="ace-icon  bigger-120"
																	title="增加人员">增加人员</i>
																</a> <a class="btn btn-xs btn-success" title="编辑"
																	onclick="edit('${var.department_id}');"> <i
																	class="ace-icon fa fa-pencil-square-o bigger-120"
																	title="编辑"></i>
																</a> <a class="btn btn-xs btn-danger"
																	onclick="del('${var.department_id}','${var.parent_id }');">
																	<i class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
																</a>
															</div>
															<div class="hidden-md hidden-lg">
																<div class="inline pos-rel">
																	<button
																		class="btn btn-minier btn-primary dropdown-toggle"
																		data-toggle="dropdown" data-position="auto">
																		<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
																	</button>

																	<ul
																		class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
																		<li><a style="cursor: pointer;"
																			onclick="edit('${var.department_id}');"
																			class="tooltip-success" data-rel="tooltip" title="修改">
																				<span class="green"> <i
																					class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																			</span>
																		</a></li>
																		<li><a style="cursor: pointer;"
																			onclick="del('${var.department_id}');"
																			class="tooltip-error" data-rel="tooltip" title="删除">
																				<span class="red"> <i
																					class="ace-icon fa fa-trash-o bigger-120"></i>
																			</span>
																		</a></li>
																	</ul>
																</div>
															</div>
														</td>
													</tr>

												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr class="main_info">
													<td colspan="100" class="center">没有相关数据</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
								<div class="page-header position-relative">
									<table style="width: 100%;">
										<tr>
											<td style="vertical-align: top;"><a
												class="btn btn-sm btn-success"
												onclick="add('${pd.parent_id}');">新增</a> <a
												class="btn btn-sm btn-danger"
												onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除"><i
													class='ace-icon fa fa-trash-o bigger-120'></i></a> <c:if
													test="${null != parent && parent != '0'}">
													<a class="btn btn-sm btn-success" onclick="goback();">返回</a>
												</c:if></td>
											<td style="vertical-align: top;"><div class="pagination"
													style="float: right; padding-top: 0px; margin-top: 0px;">${page.pageStr}</div></td>
										</tr>
									</table>
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
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/admin/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态	
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();			
		}
		$(function() {
		
			//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			});
			
			//下拉框
			if(!ace.vars['touch']) {
				$('.chosen-select').chosen({allow_single_deselect:true}); 
				$(window)
				.off('resize.chosen')
				.on('resize.chosen', function() {
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				}).trigger('resize.chosen');
				$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
					if(event_name != 'sidebar_collapsed') return;
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				});
				$('#chosen-multiple-style .btn').on('click', function(e){
					var target = $(this).find('input[type=radio]');
					var which = parseInt(target.val());
					if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
					 else $('#form-field-select-4').removeClass('tag-input-style');
				});
			}
			
			
			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});		
		//去此ID下的子菜单
		function goSonDepartment(Id){
			top.jzts();
			var preParentId=$("#parent_id").val();
			window.location.href="<%=basePath%>department/list.do?parent_id="+Id+"&preParentId="+preParentId;
		};
	
		//新增
		function add(){
			top.jzts();
			var parentId=$("#parent_id").val();
			alert(parentId);
			window.location.href='<%=basePath%>department/goAdd.do?parent_id='+parentId;
		}
		
		//删除
		function del(Id,Pid){			
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {	
					var url = "<%=basePath%>department/delete.do?department_id="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						if("success" == data){
							nextPage(${page.currentPage});
						}else if("false" == data){
							top.hangge();
							bootbox.dialog({
								message: "<span class='bigger-110'>删除失败,请先删除子部门!</span>",
								buttons: 			
								{
									"button" :
									{
										"label" : "确定",
										"className" : "btn-sm btn-success"
									}
								}
							});
						}
						
					});
				}
			});
		}
		
		//返回
		function goback(){
			window.location.href="<%=basePath%>department/list.do?parent_id="+$("#preParentId").val();
		}
		
		//修改
		function edit(Id){
			 top.jzts();
			 window.location.href='<%=basePath%>department/goEdit.do?department_id='+Id;
		}
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++){
					  if(document.getElementsByName('ids')[i].checked){
					  	if(str=='') str += document.getElementsByName('ids')[i].value;
					  	else str += ',' + document.getElementsByName('ids')[i].value;
					  }
					}
					if(str==''){
						bootbox.dialog({
							message: "<span class='bigger-110'>您没有选择任何内容!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						$("#zcheckbox").tips({
							side:1,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							$.ajax({
								type: "POST",
								url: '<%=basePath%>department/deleteAll.do?tm='+new Date().getTime(),
						    	data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									
									if(data.msg == "sucess"){
									 $.each(data.list, function(i, list){
											nextPage(${page.currentPage});
									 });										
									}else if(data.msg == "exist"){
										bootbox.dialog({
											message: "<span class='bigger-110'>"+data.name+"部门下存在子部门不能删除！</span>",
											buttons: 			
											{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
										});	 
									}
								}
							});
						}
					}
				}
			});
		};
		function addUser(department_id){
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="增加人员";
			 diag.URL = '<%=basePath%>department/goAddUser.do?department_id='+department_id;
			 diag.Width = 250;
			 diag.Height = 300;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
			
		}
	</script>


</body>
</html>