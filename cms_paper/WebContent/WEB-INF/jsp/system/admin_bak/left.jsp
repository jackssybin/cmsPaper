﻿
<%
	String pathl = request.getContextPath();
	String basePathl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+pathl+"/";
%>
		<!-- 本页面涉及的js函数，都在head.jsp页面中     -->
		<div id="sidebar" class="menu-min">
				<div id="sidebar-shortcuts">
					<div id="sidebar-shortcuts-large">
						<button class="btn btn-small btn-success" onclick="changeMenu();" title="代码生成"><i class="icon-pencil"></i></button>
						<button class="btn btn-small btn-info" title="UI实例" onclick="window.open('<%=basePathl%>static/UI_ace/index.html');"><i class="icon-eye-open"></i></button>
					</div>
					<div id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>
						<span class="btn btn-info"></span>
						<span class="btn btn-warning"></span>
						<span class="btn btn-danger"></span>
					</div>
				</div><!-- #sidebar-shortcuts -->
				<ul class="nav nav-list">
					<li class="active" id="fhindex">
					  <a href="main/index"><i class="icon-dashboard"></i><span>后台首页</span></a>
					</li>

			<c:forEach items="${menuList}" var="menu">
				<li id="lm${menu.MENU_ID }">
					  <a style="cursor:pointer;" class="dropdown-toggle" >
						<i class="${menu.MENU_ICON == null ? 'icon-desktop' : menu.MENU_ICON}"></i>
						<span>${menu.MENU_NAME }</span>
						<b class="arrow icon-angle-down"></b>
					  </a>
					  <ul class="submenu">
							<c:forEach items="${menu.subMenu}" var="sub">
								<c:choose>
									<c:when test="${not empty sub.MENU_URL}">
									<li id="z${sub.MENU_ID }">
									<a style="cursor:pointer;" target="mainFrame"  onclick="siMenu('z${sub.MENU_ID }','lm${menu.MENU_ID }','${sub.MENU_NAME }','${sub.MENU_URL }')"><i class="icon-double-angle-right"></i>${sub.MENU_NAME }</a></li>
									</c:when>
									<c:otherwise>
									<li><a href="javascript:void(0);"><i class="icon-double-angle-right"></i>${sub.MENU_NAME }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
				  		</ul>
				</li>
			</c:forEach>

				</ul><!--/.nav-list-->

				<div id="sidebar-collapse"><i class="icon-double-angle-left"></i></div>

			</div><!--/#sidebar-->

