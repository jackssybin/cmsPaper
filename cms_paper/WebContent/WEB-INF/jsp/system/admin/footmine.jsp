		<%@ page language="java" contentType="text/html; charset=UTF-8"
			pageEncoding="UTF-8"%>
		<%
			String pathf = request.getContextPath();
			String basePathf = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ pathf + "/";
		%>
		<div class="navbar footer navbar-fixed-bottom">
        <img src="<%=basePathf%>static/images/bjl.png" class="img-responsive"/>
        <ul class="f_nav">
            <li class="li1"><a href="<%=basePathf%>npro/toIndex.do" class="a1 on"><img src="<%=basePathf%>static/images/wanttobuy.png" class="img-responsive"/>我要买</a></li>
            <li class="li2"><a href="<%=basePathf%>npro/change.do" class="a2"><img src="<%=basePathf%>static/images/wanttochange.png" class="img-responsive"/>我要换</a></li>
            <li class="li3"><a href="<%=basePathf%>comment/seeAllPerson.do" class="a3"><img src="<%=basePathf%>static/images/watchall.png" class="img-responsive">看大家</a></li>
            <li class="li4"><a href="<%=basePathf%>mine/myCart.do" class="a4"><img src="<%=basePathf%>static/images/shopcart.png" class="img-responsive"/>购物车</a></li>
            <li class="li5"><a href="<%=basePathf%>mine/myIndex.do" class="a5"><img src="<%=basePathf%>static/images/myeverything.png" class="img-responsive"/>我的</a></li>
        </ul>
    </div>
    
    <!-- loading toast -->
<div id="loadingToast" class="weui_loading_toast" style="display:none;">
    <div class="weui_mask_transparent"></div>
    <div class="weui_toast">
        <div class="weui_loading">
            <div class="weui_loading_leaf weui_loading_leaf_0"></div>
            <div class="weui_loading_leaf weui_loading_leaf_1"></div>
            <div class="weui_loading_leaf weui_loading_leaf_2"></div>
            <div class="weui_loading_leaf weui_loading_leaf_3"></div>
            <div class="weui_loading_leaf weui_loading_leaf_4"></div>
            <div class="weui_loading_leaf weui_loading_leaf_5"></div>
            <div class="weui_loading_leaf weui_loading_leaf_6"></div>
            <div class="weui_loading_leaf weui_loading_leaf_7"></div>
            <div class="weui_loading_leaf weui_loading_leaf_8"></div>
            <div class="weui_loading_leaf weui_loading_leaf_9"></div>
            <div class="weui_loading_leaf weui_loading_leaf_10"></div>
            <div class="weui_loading_leaf weui_loading_leaf_11"></div>
        </div>
        <p class="weui_toast_content">数据加载中</p>
    </div>
</div>


  <!--悬浮返回首页-->
    <div class="back_index">
           <img src="static/images/back_index.png" style="width:30px;height:30px;position:absolute;right:5px"/>
    </div>
    
    <script type="text/javascript" src="static/js/jquery-1.11.3.js"></script>
     <script type="text/javascript" src="static/js/jgestures.min.js"></script>
     <script type="text/javascript" src="static/js/common/common.js"></script>
    <script src="static/ace/js/bootstrap.js"></script>