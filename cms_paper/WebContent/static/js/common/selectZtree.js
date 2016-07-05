var setting = {
			check: {
				enable: true,
				chkboxType: { "Y" : "", "N" : "" }
			},
			view: {
				dblClickExpand: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			async: {
				enable: true,
				url: ""
			},
			jilian:true,
			callback: {
				//beforeClick: beforeClick,
				onClick: function (){
			    },
			    onMouseDown:function(event, treeId){
			    	
			    	return true;
			    },
			    onAsyncSuccess:function(event, treeId, treeNode){
			    
			    }
			}
		};

function filter(node) {
    return (node.level == 2 && node.name.indexOf("test")>-1);
}


		function beforeClick(treeId, treeNode) {
			var check = (treeNode && !treeNode.isParent);
			if (!check) alert("");
			return check;
		}
		function onClick(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			nodes = zTree.getSelectedNodes(),
			v = "";
			nodes.sort(function compare(a,b){return a.id-b.id;});
			for (var i=0, l=nodes.length; i<l; i++) {
				v += nodes[i].name + ",";
			}
			if (v.length > 0 ) v = v.substring(0, v.length-1);
			var cityObj = $("#citySel");
			cityObj.attr("value", v);
		}
		function setValue(treeid,nameId,vId,contenId){
			var zTree = $.fn.zTree.getZTreeObj(treeid);
			try{
				nodes = zTree.getCheckedNodes();
			}catch(e){
				nodes = zTree.getSelectedNodes();
			}
			n = "";
			v="";
			for(var i=0, l=nodes.length; i<l; i++) {
				n += nodes[i].name + ",";
				v+=nodes[i].id + ",";
			}
			if (v.length > 0 ) v = v.substring(0, v.length-1);
			if (n.length > 0 ) n = n.substring(0, n.length-1);
			var nameObj = $("#"+nameId);
			//nameObj.attr("value", n);
			nameObj.val(n);
			var vId = $("#"+vId);
			//vId.attr("value", v);
			vId.val(v);
			hideMenu(contenId);
			
		}
		
		function empty(treeid,nameId,vId,contenId){
			
			 $("#"+nameId).val('');
			 $("#"+vId).val('');
			 hideMenu(contenId);
		}
		function showMenu(contenId,t, treeId, checkedValue, useFreq) {
			var jId="#"+t.id;
			var cityObj = $(jId);
			var cityOffset = $(jId).offset();
			if($("#"+contenId).height() == 400){
				$("#"+contenId).height(410);
			}
			$("#"+contenId).css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");
			$("body").bind("mousedown", onBodyDown);
			
			if(void 0!= useFreq){
				var tree =  $.fn.zTree.getZTreeObj(treeId);
				tree.setting.async.otherParam.freq=useFreq;

				$.fn.zTree.init($("#"+treeId), tree.setting);
			}
			
			if(void 0 != checkedValue && checkedValue){
				var tree =  $.fn.zTree.getZTreeObj(treeId);
				var ids = checkedValue.split(',');
				for(var i=0;i<ids.length;i++){
					if(ids[i]==''){
						continue;
					}
					var nodes = tree.getNodes();
					var selfNode = tree.getNodeByParam('id',ids[i]);
					if(selfNode)
						tree.checkNode(selfNode, true);
				}
			}
		}
		
		function hideMenu(contenId) {
			$("#"+contenId).fadeOut("fast");
			//$("body").unbind("mousedown", onBodyDown);
		}
		function onBodyDown(event) {
			if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
				hideMenu();
			}
		}

		function setCheck(id,t) {
			var zTree = $.fn.zTree.getZTreeObj(id);
			py ="";// t.checked? "p":"";
			sy = t.checked? "s":"";
			pn = "";//t.checked? "p":"";
			sn = t.checked? "s":"";
			type = { "Y":py + sy, "N":pn + sn};
			zTree.setting.check.chkboxType = type;
		}
		
		
//		$(document).ready(function(){
//			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
//		});
		//llbb_bankclass.do?action=commonAsyncTree
		function onAsyncSuccess(e, treeId, treeNode, msg){
			if(null == treeId) return;
			var tree = $.fn.zTree.getZTreeObj(treeId);
			if(null == treeNode){
				var nodes = tree.getNodes();
				for ( var i = 0; i < nodes.length; i++) {
					if(nodes[i].isParent){
						tree.reAsyncChildNodes(nodes[i], "refresh");
					}
				}
			}else if(treeNode.isParent){
				var childs = treeNode.childs;
				if(null == childs){
					tree.reAsyncChildNodes(treeNode, "refresh");
				}
			}
		}
		var findT=0;
		function filterSearch(treeId, t){
			var va=$("#"+t+" > div > .myfilter").val();
			if(null != treeId && null != va && '' != va.trim()){
				var tree = $.fn.zTree.getZTreeObj(treeId);
				tree.cancelSelectedNode();
				var nodes = tree.getNodesByParamFuzzy("name", va);
				if(findT>=nodes.length){
					findT=0;
				}	
				for(var i = 0 ;i<nodes.length;i++){
					tree.selectNode(nodes[i], true);
					findT++;
				}
				/*if(nodes.length>1){
					tree.selectNode(nodes[findT], true);
					findT++;
				}*/
			}
		}
		function resetI(){
			findT=0;
		}
		
		var findTNodes=0;
		
		
		function checkNodeAll(tree,nodes){
			if(nodes.length>0){
				for(var i= 0 ;i<nodes.length;i++){
					tree.checkNode(nodes[i], true, false, false);
				}
				alert("自动勾选了"+nodes.length+"个复选框!")
			}
		}
		
		
		function createSelectSimpleZtree(treeId,contentId,url,nameIds,VIds,parms,exSetting,vWidth,vHeight){
			if(typeof vWidth == 'undefined'){
				vWidth=270;
			}
			if(typeof vHeight == 'undefined'){
				vHeight=300;
			}
		if(void 0 == exSetting){
			exSetting = setting;
		}else{
			exSetting = $.extend(setting, exSetting);
		}
		
		exSetting.async.url=url;
		var temp = "<div id=\""+contentId+"\" class=\"menuContent\" style=\"display:none;position: absolute;width: "+vWidth+"px;height: "+vHeight+"px;background-color:#FFFFFF; border:1px solid #165AB3;z-index: 999;\">";
		var treeHeight = 290;
		if(exSetting.filter){
			temp += "<div align=\"center\">栏&nbsp;&nbsp;&nbsp;&nbsp;目:<input type=\"text\" class='myfilter' style=\"width:150px\" name=\"filter\" onpropertychange=\"resetI()\" /><img src='static/images/search.gif' onclick=\"filterSearch('"+treeId+"','"+contentId+"')\" style='cursor:hand;'/>";
			treeHeight = 250;
		}
		temp += "<div style=\"width:270px;height:"+treeHeight+";\">"+
			"<ul id=\""+treeId+"\" class=\"ztree\" style=\"margin-top:0;width: 270;overflow:auto;height: "+treeHeight+"px;border:0px\"  url="+url+"></ul>"+
		"</div>";
		
		temp = temp +"<div style=\"height: 38px\" ><table><tr>";
		 
		temp = temp + 	
		"<td><button class=\"btn btn-primary\" type=\"button\" onclick=\"setValue('"+treeId+"','"+nameIds+"','"+VIds+"','"+contentId+"'"+");\" name=\"BtnView\" value=\"确定\" style=\"margin-left:5px;margin-top:4px;\"  >确定</button></td>"+
		"<td><button class=\"btn btn-default\" type=\"button\" onclick=\"hideMenu('"+contentId+"');\" name=\"BtnView\" value=\"关闭\"  style=\"margin-left:5px;margin-top:4px;\" >关闭</button></td>" ;
		/*"<td><button class=\"btn btn-primary\" type=\"button\" onclick=\"empty('"+treeId+"','"+nameIds+"','"+VIds+"','"+contentId+"'"+");\" name=\"BtnView\" value=\"清除\"  style=\"margin-left:5px;margin-top:4px;\" >清除</button></td>";*/
		temp = temp + "</tr>";
		temp=temp+'<iframe src="" marginwidth="0" marginheight="0" frameborder="0" style="position:absolute; filter:alpha(opacity=0); visibility:inherit; z-index:-1; border:0; margin:0 0 0 0; width:500px; height:500px; top:0px; left:0px; "></iframe>'+
		"</table></div>";
		$('body').append(temp);
		$('#console').text(temp);
		var p=["id=id"];
		if(parms!=null){
			if($.type(parms)=='array'){//
				p = parms;
			}else{
				p = [parms];
			}
		}
		exSetting.async.autoParam=p;
		$.fn.zTree.init($("#"+treeId), exSetting);
	}
		
		function checkNode(zTree, node){
			var checkLevel = zTree.setting.checkedLevel;
			var flag = zTree.setting.checkedFlag;
			if(checkLevel == node.level){//如果当前机构是选择的机构层就勾选，否则向下展开
				zTree.checkNode(node, flag);
			}else{
				zTree.reAsyncChildNodes(node, "refresh");
			}
		}
