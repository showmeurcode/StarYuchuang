<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>星煜创客开发管理系统</title>
    <link href="statics/css/404.css" rel="stylesheet" type="text/css" />
    <script src="statics/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">
        $(function() {
            var h = $(window).height();
            $('body').height(h);
            $('.mianBox').height(h);
            centerWindow(".tipInfo");
        });

        //2.将盒子方法放入这个方，方便法统一调用
        function centerWindow(a) {
            center(a);
            //自适应窗口
            $(window).bind('scroll resize',
                function() {
                    center(a);
                });
        }

        //1.居中方法，传入需要剧中的标签
        function center(a) {
            var wWidth = $(window).width();
            var wHeight = $(window).height();
            var boxWidth = $(a).width();
            var boxHeight = $(a).height();
            var scrollTop = $(window).scrollTop();
            var scrollLeft = $(window).scrollLeft();
            var top = scrollTop + (wHeight - boxHeight) / 2;
            var left = scrollLeft + (wWidth - boxWidth) / 2;
            $(a).css({
                "top": top,
                "left": left
            });
        }
    </script>
</head>
<body>
<div class="mianBox">
    <img src="statics/images/yun0.png" alt="" class="yun yun0" />
    <img src="statics/images/yun1.png" alt="" class="yun yun1" />
    <img src="statics/images/yun2.png" alt="" class="yun yun2" />
    <img src="statics/images/bird.png" alt="" class="bird" />
    <img src="statics/images/san.png" alt="" class="san" />
    <div class="tipInfo">
        <div class="in">
            <div class="textThis">
                <h2 style="font-size: 23px">星煜创客开发管理系统</h2>
                <p><span>请选择您的身份</span></p>
                <p><span><a id="href2" href="${pageContext.request.contextPath}/showlogin?href=prelogin" style="text-decoration-line: none">我是开发者</a></span></p>
                <p><span><a id="href1" href="${pageContext.request.contextPath }/showlogin?href=adminlogin"  style="text-decoration-line: none">我是管理员</a></span></p>

            </div>
        </div>
    </div>
</div>
</body>
</html>
