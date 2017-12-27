<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/12/22
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">
    <title>客户项目管理系统 - 登录</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <link href="${pageContext.request.contextPath}/statics/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/css/style.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/css/login.min.css" rel="stylesheet">

    <script>
        if(window.top!==window.self){window.top.location=window.location};
    </script>

</head>
<body>
<body class="signin">
<div class="signinpanel">
    <div class="row">
        <div class="col-sm-7">
            <div class="signin-info">
                <div class="logopanel m-b">
                    <h1>[ 客户项目管理系统 ]</h1>
                </div>
                <div class="m-b"></div>
                <h4> <strong></strong></h4>
                <ul class="m-b">
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 基础数据</li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 客户管理</li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 项目管理</li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 实施管理</li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 售后管理</li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 跟踪实施</li>
                    <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 综合报表</li>
                </ul>

            </div>
        </div>
        <div class="col-sm-5">
            <form action="${pageContext.request.contextPath}/devuser/login" method="post" >
                <h4 class="no-margins">登录：</h4>
                <p class="m-t-md">登录到华兴科软[ 客户项目管理系统 ]</p>
                <font color="#c00fff">*</font>
                <div style="display: inline; color:red">
                    ${error}
                </div>
                <div>
                    <input type="text" name="devName" class="form-control uname"value="${devUser.devName}" placeholder="用户名" required=""/>
                </div>
                <div>
                    <input type="password" name="devPassword" class="form-control pword m-b" value="${devUser.devPassword}" placeholder="密码" required=""/>
                </div>
                <a href="#">忘记密码了？</a>
                <input class="btn btn-success btn-block" type="submit">登录</input>
            </form>
        </div>
    </div>
    <div class="signup-footer">
        <div class="pull-left">
            &copy; 2016-2017 All Rights Reserved.
        </div>
    </div>
</div>
<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/bootstrap.min14ed.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/validate/jquery.validate.min.js"></script>

</body>

</body>
</html>
