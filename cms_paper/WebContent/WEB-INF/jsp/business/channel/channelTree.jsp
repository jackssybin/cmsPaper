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
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/admin/top.jsp"%>
	<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
	<link type="text/css" rel="stylesheet" href="plugins/zTree/2.6/zTreeStyle.css"/>
	<script type="text/javascript" src="plugins/zTree/2.6/jquery.ztree-2.6.min.js"></script>
	<style type="text/css">
	footer{height:50px;position:fixed;bottom:0px;left:0px;width:100%;text-align: center;}
	</style>
<body>

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
							<div id="zhongxin">
							<c:if test="${not empty channel_id}">
							<input type="hidden" name="channel_id" id="channel_id" value="${channel_id}"/>
							<input type="hidden" name="parent_id" id="parent_id" value="${parent_id}"/>
							<c:if test="${ not empty List}">
							<input type="hidden" name="haveSon" id="haveSon" value="true"/>
							</c:if>
							请选择要移动到的栏目位置：
							<c:if test="${parent_id != '0'}">
							<br>
							<a class="btn btn-mini btn-primary" onclick="up(${channel_id});">提升为一级栏目</a>
							</c:if>
							</c:if>
								<div style="scrolling: no;width: 309px;">
								<ul id="tree" class="tree" style="overflow:auto;"></ul>
								</div>
							<c:if test="${not empty channel_id}">
							<a class="btn btn-mini btn-danger" onclick="back();" style="align:center;">返回</a>
							</c:if>
							</div>
							</form>
							<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">正在保存...</h4></div>
							</div>
						<!-- /.col -->
						</div>
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->
	
	<script src="static/ace/js/bootbox.js"></script>	
	<script type="text/javascript">
	try{
	$(top.hangge());
	
	}catch(e){
	
	}
	var zTree;
	function back(){
		top.Dialog.close();
	}
	function up(channel_id){
		var parent_id = "0";
		window.location.href='<%=basePath%>channel/change.do?channel_id='+channel_id+'&parent_id='+	parent_id;
	}
	function beforeClick(treeId, treeNode, clickFlag){
		var channel_id = $("#channel_id").val();
		var parent_id = $("#parent_id").val();
		var haveSon =$("#haveSon").val();
		if(channel_id != null){			
		if(haveSon == "true"){
			alert("此栏目存在 子栏目，不能移动！");
		}else if(channel_id == treeNode.id) {
			alert("不能移动到本栏目下！");
		}else if(parent_id == treeNode.id){
			alert("此栏目已在"+treeNode.name+"栏目下！");
		}else if(treeNode.pId != "0"){
			alert("不能移动到二级栏目下！");
		}else{
			
			var result = window.confirm("确定要移动此栏目到"+treeNode.name+"栏目下吗？");
				if(result) {
				
					ajaxSubmit(channel_id,treeNode);
					//formSubmit(channel_id,treeNode);
					
					
					}
			}	
		}else{
	    window.parent.frames['rightContent'].getArticleByChannelId(treeNode.id);			
		}	
	    
		return (treeNode.id !== 1);
	};
	
	function formSubmit(channel_id,treeNode){
	var url ="channel/change.do?channel_id="+channel_id+"&parent_id="+treeNode.id;
						$("#Form").attr("action",url);
						$("#Form").submit();
							$("#zhongxin").hide();
								//top.Dialog.close();
	}
	
	function ajaxSubmit(channel_id,treeNode){
		var postData =  {"channel_id":channel_id,"parent_id":treeNode.id,tm:new Date().getTime()};
						$.ajax({
							type: 'POST',
							url: 'channel/changeAjax.do',
		   				 	data:postData,
							dataType:'json',
							cache: false,
							async: false,//同步方法
							success: function(data){
								//alert("suceess")
								$("#zhongxin").hide();
								top.Dialog.close();
								}
						});
	
	}
	
	
	function onClick(event, treeId, treeNode,clickFlag){
	};
	
	$(document).ready(function(){
		var setting = {
		    showLine: true,
		    callback:{
		    	beforeClick:beforeClick,
				onClick:onClick
			}
			}
		
		
		//var zn='{"name":"test1","pId":"0","id":"1"}';
		//var zn ='{name:"test1", open:true,children:[{name:"test1_1"}, {name:"test1_2"}]},{name:"test2", open:true, children:[{name:"test2_1"}, {name:"test2_2"}]}';
		//var zn = '{"name":"11","pId":"0","id":"31d94c953ffc4364ac0165df96a0e93e"}';
		//var zn= '{name: "pNode 01", children: [{name: "child 01"},{name: "child 02"}]}';
		//var zTreeNodes = eval(zn);
		//zTree = $("#tree").zTree(setting, zTreeNodes);
		

		/* var zNodes =[
			{ id:1, pId:0, name:"pNode 1", open:true},
			{ id:11, pId:1, name:"pNode 11"},
			{ id:111, pId:11, name:"leaf node 111"},
			{ id:112, pId:11, name:"leaf node 112"},
			{ id:113, pId:11, name:"leaf node 113"},
			{ id:114, pId:11, name:"leaf node 114"},
			{ id:12, pId:1, name:"pNode 12"},
			{ id:121, pId:12, name:"leaf node 121"},
			{ id:122, pId:12, name:"leaf node 122"},
			{ id:123, pId:12, name:"leaf node 123"},
			{ id:124, pId:12, name:"leaf node 124"},
			{ id:13, pId:1, name:"pNode 13 - no child", isParent:true},
			{ id:2, pId:0, name:"pNode 2"},
			{ id:21, pId:2, name:"pNode 21", open:true},
			{ id:211, pId:21, name:"leaf node 211"},
			{ id:212, pId:21, name:"leaf node 212"},
			{ id:213, pId:21, name:"leaf node 213"},
			{ id:214, pId:21, name:"leaf node 214"},
			{ id:22, pId:2, name:"pNode 22"},
			{ id:221, pId:22, name:"leaf node 221"},
			{ id:222, pId:22, name:"leaf node 222"},
			{ id:223, pId:22, name:"leaf node 223"},
			{ id:224, pId:22, name:"leaf node 224"},
			{ id:23, pId:2, name:"pNode 23"},
			{ id:231, pId:23, name:"leaf node 231"},
			{ id:232, pId:23, name:"leaf node 232"},
			{ id:233, pId:23, name:"leaf node 233"},
			{ id:234, pId:23, name:"leaf node 234"},
			{ id:3, pId:0, name:"pNode 3 - no child", isParent:true}
		]; */
		
		 var zn = '${zTreeNodes}';
		var zNodes=eval(zn);
		
		zTree = $("#tree").zTree(setting, zNodes);
		
		
		
		
	});
	
	
	</script>
</body>
</html>