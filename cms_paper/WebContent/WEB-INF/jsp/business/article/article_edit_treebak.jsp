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
	<link type="text/css" rel="stylesheet" href="plugins/zTree/2.6/zTreeStyle.css"/>
	
	 <style type="text/css">  
        ul.tree  
        {  
            margin-top: 10px;  
            border: 1px solid #617775;  
            background: #f0f6e4;  
            width: 220px;  
            height: 140px;  
            overflow-y: scroll;  
            overflow-x: auto;  
        }  
    </style>  
	
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
					
					<form action="article/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="articleId" id="articleId" value="${article.articleId}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">栏目:</td>
								<td><input type="text" name="channelId" id="channelId" value="${article.channelId}" />
									<input class="treeText" readonly="readonly" type="text" id="channelName" name="channelName" 
									style="width: 65%;" onFocus="showMenu('channelTreeContent',this)" />
								</td>
							</tr>
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">标题:</td>
								<td><input type="text" name="title" id="title" value="${article.title}" maxlength="100" placeholder="这里输入标题" title="标题" style="width:80%;"/></td>
							</tr>
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">副标题:</td>
								<td><input type="text" name="subtitle" id="subtitle" value="${article.subtitle}" maxlength="100" placeholder="这里输入副标题" title="副标题" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">文章内容:</td>
								<td>
								<input type="hidden" name="articleContent" id="articleContent" value="" maxlength="1000" placeholder="这里输入文章内容" title="文章内容" style="width:98%;"/>
								<div id="editor" type="text/plain" style="width:1024px;height:300px;"></div>
								</td>
							</tr>
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">内容挂件:</td>
								<td><input type="text" name="contentExt" id="contentExt" value="${article.contentExt}" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">Tags:</td>
								<td><input type="text" name="contentTags" id="contentTags" value="${article.contentTags}" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">摘要:</td>
								<td><input type="text" name="shortContent" id="shortContent" value="${article.shortContent}" maxlength="200" placeholder="这里输入摘要" title="摘要" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">缩略图:</td>
								<td><input type="text" name="pic" id="pic" value="${article.pic}" maxlength="200" placeholder="这里输入缩略图" title="缩略图" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">作者:</td>
								<td><input type="text" name="author" id="author" value="${article.author}" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">编辑人员:</td>
								<td><input type="text" name="editorId" id="editorId" value="${article.editorId}" maxlength="20" placeholder="这里输入编辑人员" title="编辑人员" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">属性:</td>
								<td><input type="text" name="attribute" id="attribute" value="${article.attribute}" style="width:50%;"/></td>
							</tr>
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">权重:</td>
								<td><input type="text" name="weight" id="weight" value="${article.weight}" style="width:50%;"/></td>
							</tr>
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">相关阅读:</td>
								<td>
									<input type="hidden" name="contentRefId" id="contentRefId" value="${pd.contentRefId}" />
									<input type="text" name="contentRefName" id="contentRefName" readonly onclick="showRefReading('${article.articleId}');" <c:if test="${empty pd.contentRefId}">value="未设置"</c:if> <c:if test="${not empty pd.contentRefId}">value="已设置"</c:if> style="width:50%;"/>
								</td>
							</tr>
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">允许评论:</td>
								<td><input type="hidden" name="isComment" id="isComment" value="${article.isComment}"  maxlength="1" style="width:50%;"/>
									<label style="float:left;padding-left: 8px;padding-top:7px;" >
										<input name="form-field-radio2" type="radio" class="ace"  <c:if test="${article.isComment == '1' }">checked="checked"</c:if> onclick="setType('isComment','1');"/>
										<span class="lbl"> 是</span>
									</label>
									<label style="float:left;padding-left: 5px;padding-top:7px;">
										<input name="form-field-radio2" type="radio" class="ace" <c:if test="${article.isComment != '1' }">checked="checked"</c:if> onclick="setType('isComment','0');"/>
										<span class="lbl"> 否</span>
									</label>
								</td>
							</tr>
							<c:if test="${not empty article.status}">
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">状态:</td>
								<td><input type="hidden" name="status" id="status" value="${article.status}" maxlength="2" placeholder="这里输入状态" title="状态" style="width:98%;"/>
									<c:if test="${article.status=='draft' ||article.status=='un_audit' }">
									<label style="float:left;padding-left: 8px;padding-top:7px;" id="comment_open">
										<input name="form-field-radio" type="radio" class="ace" id="form-field-radio1" <c:if test="${article.status == 'un_audit' }">checked="checked"</c:if> onclick="setType('status','un_audit');"/>
										<span class="lbl"> 发布</span>
									</label>
									<label style="float:left;padding-left: 5px;padding-top:7px;">
										<input name="form-field-radio" type="radio" class="ace" id="form-field-radio2" <c:if test="${article.status == 'draft' }">checked="checked"</c:if> onclick="setType('status','draft');"/>
										<span class="lbl"> 草稿</span>
									</label>
									</c:if>
									<c:if test="${article.status!='draft' and article.status!='un_audit' }">
										${article.status}
									</c:if>
									
								</td>
							</tr>
							</c:if>
 							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">上线时间:</td>
								<td><input type="text" class="span10 date-timepicker"  name="onlineTime" id="onlineTime" value="${article.onlineTime}" maxlength="2" placeholder="这里输入上线时间"  title="上线时间" style="width:98%;"/>
								</td>
							</tr>
 							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">下线时间:</td>
								<td><input type="text" class="span10 date-timepicker" name="offlineTime" id="offlineTime" value="${article.offlineTime}" maxlength="2" placeholder="这里输入下线时间" title="下线时间" style="width:98%;"/>
								</td>
							</tr>
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">是否转载:</td>
								<td><input type="hidden" name="isTransfer" id="isTransfer" value="${article.isTransfer}" maxlength="1" placeholder="这里输入来源" title="来源" style="width:50%;"/> 
									<label style="float:left;padding-left: 8px;padding-top:7px;" >
										<input name="form-field-radio3" type="radio" class="ace"  <c:if test="${article.isTransfer == '1' }">checked="checked"</c:if> onclick="setType('isTransfer','1');"/>
										<span class="lbl"> 是</span>
									</label>
									<label style="float:left;padding-left: 5px;padding-top:7px;">
										<input name="form-field-radio3" type="radio" class="ace" <c:if test="${article.isTransfer != '1' }">checked="checked"</c:if> onclick="setType('isTransfer','0');"/>
										<span class="lbl"> 否</span>
									</label>
								
								</td>
							</tr>
 								<tr class="isTransferDiv" style="display:none;">
									<td style="width:175px;text-align: right;padding-top: 13px;">来源标题:</td>
									<td><input type="text" name="sourceTitle" id="sourceTitle" value="${article.sourceTitle}" maxlength="2" placeholder="这里输入来源标题" title="来源标题" style="width:98%;"/></td>
								</tr>
 								<tr class="isTransferDiv" style="display:none;">
									<td style="width:175px;text-align: right;padding-top: 13px;">来源链接:</td>
									<td><input type="text" name="sourceLink" id="sourceLink" value="${article.sourceLink}" maxlength="2" placeholder="这里输入来源链接" title="来源链接" style="width:98%;"/></td>
								</tr>
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">置顶类型(首页栏目):</td>
								<td><input type="text" name="topType" id="topType" value="${article.topType}" maxlength="200" placeholder="这里输入置顶类型" title="置顶类型" style="width:98%;"/></td>
							</tr>													
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">置顶缩略图:</td>
								<td><input type="text" name="topPic" id="topPic" value="${article.topPic}" maxlength="200" placeholder="这里输入置顶缩略图" title="置顶缩略图" style="width:98%;"/></td>
							</tr>
							
							<tr>
								<td style="width:175px;text-align: right;padding-top: 13px;">静态链接:</td>
								<td><input type="text" name="staticUrl" id="staticUrl" value="${article.staticUrl}" maxlength="200" placeholder="这里输入静态链接" title="静态链接" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="back();">返回</a>
									<a class="btn btn-mini btn-danger" onclick="getContent();">查看内容</a>
									
								</td>
							</tr>
						</table>
						</div>
						
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						
					</form>
	
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
	
	<script src="static/ace/js/moment.min.js"></script>
	<script type="text/javascript" src="static/ace/js/date-time/bootstrap-datetimepicker.js"></script>
	
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.all.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="plugins/ueditor/lang/zh-cn/zh-cn.js"></script>
    
    <script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.excheck.min.js"></script>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.exedit.min.js"></script>
	<link rel="stylesheet" type="text/css" href="plugins/zTree/3.5/zTreeStyle.css" />
	<script type="text/javascript" src="static/js/common/selectZtree.js"></script>
    	
	
		<script type="text/javascript">
		try{
			$(top.hangge());
		}catch(e){
		}
		var zTree;
			//实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
   		var ueditor=UE.getEditor('editor');
		$(document).ready(function(){
			var oldcontent = '${article.articleContent}';
			UE.getEditor('editor').addListener("ready", function () {
					// editor准备好之后才可以使用
					if(oldcontent==null||oldcontent==""){
					UE.getEditor('editor').setContent("这里输入文章内容");
					}else{
						UE.getEditor('editor').setContent('${article.articleContent}');
					}

				});
				
				
			var setting2 = {
		    showLine: true,
		    checkable:true,
		    callback:{
		    	beforeClick:beforeClick,
				onClick:onClick
					}
			}
			
		 //var zn = '${treeJson}';
		//zNodes=eval(zn);
		//zTree = $("#tree").zTree(setting, zNodes);	
		
		var channelSeting = {
				check: {
					enable: true,
					chkboxType: { "Y" : "s", "N" : "s"  }
					//chkStyle: "radio",
					//radioType: "level"
				},
				filter:true
		}
		
		createSelectZtree("channelTree", "channelTreeContent","bankBasis.do?action=commonInstTree", "channelName","channelId", "id=pId", channelSeting);
		
			
		})///ready 结束
		
		
		function showMenu2() {  
            var nameObj = $("#channelName");  
            var nameOffset = $("#channelName").offset();  
            $("#menuContent").css({ left: nameOffset.left + "px", top: nameOffset.top + nameObj.outerHeight() + "px" }).slideDown("fast");  
  
            $("body").bind("mousedown", onBodyDown);  
        }  
  
        function hideMenu2() {  
            $("#menuContent").fadeOut("fast");  
            $("body").unbind("mousedown", onBodyDown);  
            checkChoseTree();
        } 
        
        function checkChoseTree2(){
            var nodes=zTree.getCheckedNodes(true);
            var vNames="";
            var vIds="";
            for(var i=0;i<nodes.length;i++){
            vNames+=nodes[i].name + ",";
            //alert(nodes[i].id); //获取选中节点的值
            vIds+=nodes[i].id+",";
            }
            if(vNames!=""){
            	$("#channelName").val(vNames);
            	$("#channelId").val(vIds);
            }
            
        }
        
        function showRefReading(articleId){
			 top.jzts();
			 var contentRefId =$("#contentRefId").val();
			 if(""==contentRefId){
			 	contentRefId="";
			 	//async: false
			 var postData =  {"articleId":articleId,tm:new Date().getTime()};
			$.ajax({
				type: 'POST',
				url: 'article/showContentRefId.do',
		    	data:postData,
				dataType:'json',
				cache: false,
				async: false,//同步方法
				success: function(data){
					if(data.result="success"){
						//alert("data.contentRefId="+data.contentRefId)
						contentRefId=data.contentRefId;
					}
				}
			});
			 	
			 	
			 }
			 
			/// alert("contentRefId="+contentRefId);
		  	 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>article/showRefReading.do?articleId='+articleId+"&contentRefId="+contentRefId;
			 diag.Width = 1100;
			 diag.Height = 555;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					var contentRefId= diag.innerFrame.contentWindow.document.getElementById("contentRefId").value;
					var contentRefName= diag.innerFrame.contentWindow.document.getElementById("contentRefName").value;
					if(""!=contentRefId){
						$("#contentRefName").val("已设置");
						$("#contentRefId").val(contentRefId);
					}else{
						$("#contentRefName").val("未设置");
					}
				}
				diag.close();
			 };
			 diag.show();
			 
        }
        
        
         
        // 当点击窗口其他区域时zTree消息框隐藏  
        function onBodyDown(event) {  
            if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {  
                hideMenu();  
            }  
        }  
		
		
		
		//返回
		function back(){
			window.history.back(-1);
			
		}
		
		 function getContent() {
		  var arr = []; 
        arr.push(ueditor.getContent());
        alert(arr.join("\n"));
    }
		
		//设置评论开关or是否在首页显示
		function setType(type,value){
			$("#"+type).val(value);		
			//alert("type="+type+" value="+value)
			if(type=='isTransfer'){
				if('1'==value){
					$(".isTransferDiv").show();
				}else{
					$(".isTransferDiv").hide();
				}
			}
		}
		
		
		//保存
		function save(){
			if($("#title").val()==""){
				$("#title").tips({
					side:3,
		            msg:'请输入标题',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#title").focus();
			return false;
			}
			if($("#subtitle").val()==""){
				$("#subtitle").tips({
					side:3,
		            msg:'请输入副标题',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#subtitle").focus();
			return false;
			}
			if($("#shortContent").val()==""){
				$("#shortContent").tips({
					side:3,
		            msg:'请输入摘要',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#shortContent").focus();
			return false;
			}
			if($("#pic").val()==""){
				$("#pic").tips({
					side:3,
		            msg:'请输入缩略图',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#pic").focus();
			return false;
			}
			if($("#topPic").val()==""){
				$("#topPic").tips({
					side:3,
		            msg:'请输入置顶缩略图',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#topPic").focus();
			return false;
			}
			var content=UE.getEditor('editor').getContent();
		//	alert(content)
			$("#articleContent").val(content)
			if($("#articleContent").val()==""){
				$("#articleContent").tips({
					side:3,
		            msg:'请输入文章内容',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#articleContent").focus();
			return false;
			}
			if($("#staticUrl").val()==""){
				$("#staticUrl").tips({
					side:3,
		            msg:'请输入静态链接',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#staticUrl").focus();
			return false;
			}
			if($("#updateDate").val()==""){
				$("#updateDate").tips({
					side:3,
		            msg:'请输入更新时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#updateDate").focus();
			return false;
			}
			if($("#source").val()==""){
				$("#source").tips({
					side:3,
		            msg:'请输入来源',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#source").focus();
			return false;
			}
			if($("#editorId").val()==""){
				$("#editorId").tips({
					side:3,
		            msg:'请输入编辑人员',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#editorId").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			
			$('.date-timepicker').datetimepicker({
                format: 'YYYY-MM-DD HH:mm'
			});
		});
		</script>
</body>
</html>