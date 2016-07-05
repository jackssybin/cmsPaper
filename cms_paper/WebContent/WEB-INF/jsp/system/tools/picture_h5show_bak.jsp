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
<%@ include file="../admin/top.jsp"%>

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
<div class="each">
        <textarea name="" rows="6" placeholder="(500字以内)写下购物感受，为其他小伙伴提供帮助，还有机会赢取大奖哦！"></textarea>
        <div id="uploader">
            <!--<div id="fileList" class="uoloader-list"></div>-->
            <!--<div id="filePicker">+晒图</div>-->
            <input type="file" capture="camera"/>
            <input type="file" accept="image/*" id="capture" capture="camera">
        </div>
    </div>
    <div class="each">
        <textarea name="" rows="6" placeholder="(500字以内)写下购物感受，为其他小伙伴提供帮助，还有机会赢取大奖哦！"></textarea>
        <div id="uploader-demo">
            <ul id="fileList" class="uploader-list" style="overflow:hidden"></ul>
            <div id="filePicker">选择图片</div>
        </div>
    </div>

    <div class="each">
        <video id="video" autoplay="" style='width:100px;height:100px'></video>
        <button id='picture'>PICTURE</button>
        <canvas id="canvas" width="100" height="100"></canvas>
    </div>							
							
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
	<%@ include file="../../system/admin/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- webuploader上传插件js -->
   	<script type="text/javascript" src="plugins/webuploader/webuploader.js"></script>
   	<script type="text/javascript" src="plugins/webuploader/upload.js"></script>
	<script type="text/javascript">
		$(top.hangge());
     	 // 初始化Web Uploader
        var uploader = WebUploader.create({
            // 选完文件后，是否自动上传。
            auto: true,
            // swf文件路径
            swf:'plugins/webuploader/Uploader.swf',

            // 文件接收服务端。var url = "<%=basePath%>checkeye/delete.do?CHECKEYE_ID="+Id+"&tm="+new Date().getTime();
            server: '<%=basePath%>/comment/picSave.do',

            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: '#filePicker',

            // 只允许选择图片文件。
            accept: {
                title: 'Images',
                extensions: 'gif,jpg,jpeg,bmp,png',
                mimeTypes: 'image/*'
            }
        });
        // 当有文件添加进来的时候
        uploader.on( 'fileQueued', function( file ) {
            var $li = $(
                            '<li id="' + file.id + '" class="file-item thumbnail">' +
                            '<img>' +
//                            '<div class="info">' + file.name + '</div>' +
                            '</li>'
                    ),
                    $img = $li.find('img');

            // $list为容器jQuery实例
            $("#fileList").append( $li );
            if($li.length>=9){
                alert("最多传8张图片");
            }
            // 创建缩略图
            // 如果为非图片文件，可以不用调用此方法。
            // thumbnailWidth x thumbnailHeight 为 100 x 100
            uploader.makeThumb( file, function( error, src ) {
                if ( error ) {
                    $img.replaceWith('<span>不能预览</span>');
                    return;
                }
//                var thumnailWidth=100;
//                var thumbnailHeight=100;
                $img.attr( 'src', src );
            }, 100, 100 );
        });
        // 文件上传过程中创建进度条实时显示。
        uploader.on( 'uploadProgress', function( file, percentage ) {
            var $li = $( '#'+file.id ),
                    $percent = $li.find('.progress span');

            // 避免重复创建
            if ( !$percent.length ) {
                $percent = $('<p class="progress"><span></span></p>')
                        .appendTo( $li )
                        .find('span');
            }
            $percent.css( 'width', percentage * 100 + '%' );
        });

        // 文件上传成功，给item添加成功class, 用样式标记上传成功。
        uploader.on( 'uploadSuccess', function( file ) {
            $( '#'+file.id ).addClass('upload-state-done');
        });

        // 文件上传失败，显示上传出错。
        uploader.on( 'uploadError', function( file ) {
            var $li = $( '#'+file.id ),
                    $error = $li.find('div.error');

            // 避免重复创建
            if ( !$error.length ) {
                $error = $('<div class="error"></div>').appendTo( $li );
            }

            $error.text('上传失败');
        });

        // 完成上传完了，成功或者失败，先删除进度条。
        uploader.on( 'uploadComplete', function( file ) {
            $( '#'+file.id ).find('.progress').remove();
        });

//非通用
var video = document.getElementById("video");
var context = canvas.getContext("2d")
var errocb = function () {
    console.log('sth wrong!');
}

//navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia; //Google

if (navigator.getUserMedia) { // 标准的API
    navigator.getUserMedia({ "video": true }, function (stream) {
        video.src = stream;
        video.play();
    }, errocb);
} else if (navigator.webkitGetUserMedia) { // WebKit 核心的API
    navigator.webkitGetUserMedia({ "video": true }, function (stream) {
        video.src = window.webkitURL.createObjectURL(stream);
        video.play();
    }, errocb);
}
document.getElementById("picture").addEventListener("click", function () {
    context.drawImage(video, 0, 0, 100, 100);
});

//第三种
var video_element=document.getElementById('video');
if(navigator.getUserMedia){ // opera应使用opera.getUserMedianow
    navigator.getUserMedia('video',success,error);  //success是回调函数,当然你也可以直接在此写一个匿名函数
}
function success(stream){
    video_element.src=stream;
}


var canvas=document.createElement('canvas'); //动态创建画布对象
var ctx=canvas.getContext('2d');
var cw=video.width,ch=video.height;
ctx.fillStyle="#ffffff";
ctx.fillRect(0,0,cw,ch);
ctx.drawImage(video_element,0,0,cw,ch,0,0,vw,vh); //将video对象内指定的区域捕捉绘制到画布上指定的区域，可进行不等大不等位的绘制。
document.body.append(canvas);
var imgData=canvas.toDataURL("image/png");
var data=imgData.substr(22);
var length=atob(data).length; //atob 可解码用base-64解码的字串
$.post('upload.php',{'data':data});
    </script>

</body>
</html>