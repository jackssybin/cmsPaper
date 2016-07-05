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
						<form action="article/list.do" method="post" name="Form" id="Form">
						<input type="hidden" name="channelId" id="channelId" value="${pd.channelId}">
						<table style="margin-top:5px;">
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
								 	<select class="chosen-select form-control" name="oper_status" id="oper_status" data-placeholder="请选择" style="vertical-align:top;width: 120px;">
									<option value=""></option>
									<c:forEach items="${pd.operTypeList}" var="var" varStatus="vs">
										<option value="${var.PARAM_CODE}"  <c:if test="${var.PARAM_CODE==pd.TYPE }"> selected="selected"</c:if>  >
										${var.PARAM_CODE}${var.PARAM_NAME}
										</option>
									</c:forEach>
								  	</select>
								</td>
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">标题</th>
									<th class="center">点击</th>
									<th class="center" style="width:200px;">文章内容</th>
									<th class="center" >发布人</th>
									<th class="center" >发布时间</th>
									<th class="center">状态</th>
									<th class="center">操作</th>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td class='center'>
												<label class="pos-rel"><input type='checkbox' name='ids' value="${var.articleId}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center'>${var.title}</td>
											<td class='center'>0</td>
											<td class='center' style="width:400px;height:100px;"><div style="width:400px;height:100px;overflow:auto;">${var.articleContent}
												</div>
											</td>
											<td class='center'>${var.editorId}</td>
											<td class='center'>${var.updateDate}</td>
											<td class='center'>${pd.operTypeMap[var.status]}</td>
											<td class="center">
												<div class="btn-group">
													<c:if test="${not empty var.sysAudit.nextStatus}">
														<a class="btn btn-xs btn-purple" onclick="auditMsg('${var.articleId}','${var.status}','${var.sysAudit.nextStatus}','${pd.operTypeMap[var.sysAudit.nextStatus]}');">
															${pd.operTypeMap[var.sysAudit.nextStatus]}
														</a>
													</c:if>
													<c:if test="${not empty var.sysAudit.prevStatus}">
														<a class="btn btn-xs btn-pink" onclick="auditMsg('${var.articleId}','${var.status}','${var.sysAudit.prevStatus}','${pd.operTypeMap[var.sysAudit.prevStatus]}');">
															${pd.operTypeMap[var.sysAudit.prevStatus]}
														</a>
													</c:if>
													<a class="btn btn-xs btn-yellow" onclick="view('${var.articleId}');">
														预览
													</a>
													<a class="btn btn-xs btn-success" title="编辑" onclick="edit('${var.articleId}');">
														编辑
													</a>
													<a class="btn btn-xs btn-danger" onclick="del('${var.articleId}');">
														删除
													</a>
												</div>
											</td>
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
						<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;">
									<a class="btn btn-sm btn-success" onclick="add();">新增</a>
									<a class="btn btn-sm btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" ><i class='ace-icon fa fa-trash-o bigger-120'></i></a>
								</td>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
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
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	<!-- 审核信息modal start -->
						 <div class="modal fade" id="auditMsgModal" aria-hidden="true" role="dialog">
	                       <div class="modal-dialog">
	                           <div class="modal-content">
	                               <div class="modal-header">
	                               
	                               		<button type="button" class="close" 
             							  data-dismiss="modal" aria-hidden="true">
               								   &times;
           								 </button>
          								  <h4 class="modal-title" id="myModalLabel">
              							审核状态:<font color="red"><span id="auditStatusSpan" ></span></font>
              							<input type="hidden" name="auditStatusInfo" id="auditStatusInfo" value="">
              							<input type="hidden" name="curStatusInfo" id="curStatusInfo" value="">
              							<input type="hidden" name="operArticleId" id="operArticleId" value="">
      								      </h4>
	                               </div>
	                               <div class="modal-body">
	                               			<div class="row">
	                               				<div class="col-xs-2" style="text-align:center;">审核意见:</div>
	                               				<textarea rows="5" class="col-xs-10" id="auditMsgInfo"></textarea>
	                               			</div>
	                               </div>
	                               <div class="modal-footer">
	                                     <button type="button" class="btn btn-default" data-dismiss="modal"  aria-label="Close">关闭</button>
                                		 <button type="button" class="btn btn btn-primary"  onclick="saveAuditMsg();" >确认提交</button>
	                               </div>
	                           </div>
	                       </div>
	                   </div>
						
	<!-- 审核信息modal end -->


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
		
		
		function auditMsg(articleId,curStatus,auditStatus,auditStatusChn){
			var oldauditStatusInfo=$("#auditStatusInfo").val();
			if(""!=oldauditStatusInfo&&oldauditStatusInfo!=auditStatus){
				$("#auditMsgInfo").val("");
			}
			$("#curStatusInfo").val(curStatus)//当前文章状态
			$("#auditStatusInfo").val(auditStatus)//审核文章状态
			$("#operArticleId").val(articleId);//操作的文章id
			$("#auditStatusSpan").html(auditStatusChn)
			$('#auditMsgModal').modal('show');
		}
		
		function saveAuditMsg(){
			var auditMsgInfo=$("#auditMsgInfo").val();
			var curStatusInfo=$("#curStatusInfo").val();
			var auditStatusInfo=$("#auditStatusInfo").val();
			var operArticleId=$("#operArticleId").val();
			//alert("auditMsgInfo="+auditMsgInfo)
			if(auditMsgInfo==""){
				$("#auditMsgInfo").tips({
					side:3,
		            msg:'请输入审核意见',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#auditMsgInfo").focus();
			return false;
			}
			
			var postData =  {"operArticleId":operArticleId,"auditMsgInfo":auditMsgInfo,"curStatusInfo":curStatusInfo,"auditStatusInfo":auditStatusInfo,tm:new Date().getTime()};
			$.ajax({
				type: 'POST',
				url: 'article/saveAuditMsg.do',
		    	data:postData,
				dataType:'json',
				cache: false,
				success: function(data){
					alert("保存审核意见成功!")
					nextPage(${page.currentPage});
				}
			});
			
			
			$('#auditMsgModal').modal('hide');
		}
		
		
		function getArticleByChannelId(channelId){
			//alert("channelId="+channelId)
			$("#channelId").val(channelId);
			$("#Form").submit();
		}
		
		
		//新增
		function add(){
			window.location.href='<%=basePath%>article/goAdd.do';
		}
		
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>article/delete.do?articleId="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		//修改
		function edit(Id){
			<%-- window.location.href='<%=basePath%>article/goEdit.do?articleId='+Id; --%>
			 top.jzts();
			 window.location.href='<%=basePath%>article/goEdit.do?articleId='+Id;
			 <%-- var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>article/goEdit.do?articleId='+Id;
			 diag.Width = 1100;
			 diag.Height = 555;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show(); --%>
		}
		
		//预览
		function view(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>article/goView.do?articleId='+Id;
			 diag.Width = 1024;
			 diag.Height = 800;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show(); 
			 
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
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>article/deleteAll.do?tm='+new Date().getTime(),
						    	data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											nextPage(${page.currentPage});
									 });
								}
							});
						}
					}
				}
			});
		};
		
	</script>


</body>
</html>