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
	<!-- jsp文件头和头部 -->
	<%@ include file="../admin/top.jsp"%> 
	
<style type="text/css">
#bg{   top: 0%; left: 0%; width: 100%; height: 100%; background-color: red; z-index:1001; -moz-opacity: 0.7; opacity:.70; filter: alpha(opacity=70);}
</style>
	
	<script language="javascript" type="text/javascript">
	function showdiv() { 
		 document.getElementById("bg").style.display ="block";
		 }
		  function hidediv() {
		  document.getElementById("bg").style.display ='none';
		  }
	</script>
	</head> 
	
	<body>
<div class="container-fluid" id="main-container">
<div id="page-content" class="clearfix">
						
  <div class="row-fluid">

	<div class="row-fluid">
			<table id="table_report" class="table table-striped table-bordered table-hover">
				<tr>
					<td> 
					</td>
					<td>
						<div id="te" style="background-color:red;width:320;height:250;z-index:1002">
						    <div id="bg" >
								<video width="320" height="240" controls="controls" >
								  <source src="<%=basePath%>static/video/test.mp4" type="video/mp4" />
								</video>
							</div>
						 </div>
					</td>
					<td><video width="320" height="240" controls="controls" autoplay="controls">
					  <source src="<%=basePath%>static/video/test.mp4" type="video/mp4" />
					</video>
					</td>
					<td><video width="320" height="240" controls="controls" autoplay="controls">
					  <source src="<%=basePath%>static/video/test.mp4" type="video/mp4" />
					</video>
					</td>
				</tr>
			</table>
		<div class="page-header position-relative">
		<table style="width:100%;">
			<tr>
				<td style="vertical-align:top;">
				<input id="btnshow" type="button" value="Show" onclick="showdiv();"/>
				<input id="btnclose" type="button" value="Close" onclick="hidediv();"/>
					<a class="btn btn-small btn-success" onclick="add();">新增</a>
					<a class="btn btn-small btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" ><i class='icon-trash'></i></a>
				</td>
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		</div>
		</form>
	</div>
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->

		<script>
		top.hangge();
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>video/uploadevideo.do';
			 diag.Width = 400;
			 diag.Height = 100;
			 diag.CancelEvent = function(){ //关闭事件
				 top.jzts();
				 setTimeout("self.location=self.location",100);
				diag.close();
			 };
			 diag.show();
		}
		</script>

	</body>
</html>

