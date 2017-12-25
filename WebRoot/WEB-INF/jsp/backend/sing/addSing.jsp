<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Gentellela Alela! | </title>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/statics/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath }/statics/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath }/statics/css/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">

    <!-- Datatables -->
    <link href="${pageContext.request.contextPath }/statics/css/jquery.dataTables.min.css" rel="stylesheet">

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>


<body>

<div class="x_content">

    <form id="appaddform" class="form-horizontal form-label-left"
          method="post" enctype="multipart/form-data">

        <p>请填写信息

        </p>
        <span class="section"> </span>

        <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="enrolment">报名对象
                <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <input id="enrolment" class="form-control col-md-7 col-xs-12"
                       name="enrolment" placeholder="请输入报名对象"
                       required="required" type="text">

            </div>
            <span id="yzenrolment"></span>
        </div>
        <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"
                   for="name">姓名<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="text" id="name" name="name" required="required"
                       placeholder="请输入姓名"
                       class="form-control col-md-7 col-xs-12">

            </div>
            <span id="yzname"></span>
        </div>
        <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"
                   for="age">年龄<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="text" id="age" name="age" required="required"
                       placeholder="请输入年龄"
                       class="form-control col-md-7 col-xs-12">

            </div>
            <span id="yzage"></span>
        </div>
        <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"
                   for="email">邮箱<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="text" id="email" name="email" required="required"
                       placeholder="请输入邮箱"
                       class="form-control col-md-7 col-xs-12">

            </div>
            <span id="yzemail"></span>
        </div>
        <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"
                   for="phone">电话<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="text" id="phone" name="phone" required="required"
                       placeholder="请输入电话"
                       class="form-control col-md-7 col-xs-12">

            </div>
            <span id="yzphone"></span>
        </div>

        <div class="item form-group">
            <label for="infovisit"
                   class="control-label col-md-3">是否信息已回访</label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <select name="infovisit" id="infovisit"
                        class="form-control col-md-7 col-xs-12" required="required">

                    <option value="0" selected>请选择</option> 
                    <option value="1">是</option> 
                    <option value="2">否</option> 
                </select>
            </div>
        </div>

        <div class="ln_solid"></div>
        <div class="form-group">
            <div class="col-md-6 col-md-offset-3">
                <a id="send1" type="button" class="btn btn-success">保存</a>
                </input>
                <button type="button" class="btn btn-primary">返回</button>
            </div>
        </div>
    </form>
</div>

</body>
</html>