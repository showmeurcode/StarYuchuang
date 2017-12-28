<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>修改用户信息</title>


    <link rel="shortcut icon" href="favicon.ico"> <link href="${pageContext.request.contextPath}/statics/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/css/style.min862f.css?v=4.1.0" rel="stylesheet">

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<%
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");

    int initVar=0;


%>
<div class="col-sm-6">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>添加用户</h5>
            <div class="ibox-tools">
                <a class="collapse-link">
                    <i class="fa fa-chevron-up"></i>
                </a>
                <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
                    <i class="fa fa-wrench"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="form_basic.html#">选项1</a>
                    </li>
                    <li><a href="form_basic.html#">选项2</a>
                    </li>
                </ul>
                <a class="close-link">
                    <i class="fa fa-times"></i>
                </a>
            </div>
        </div>
        <div class="ibox-content">
            <form class="form-horizontal m-t" id="userform" method="post" action="${pageContext.request.contextPath}/devuser/userupdatesave?id=${devUser.id}">


                <div class="form-group">
                    <label class="col-sm-3 control-label">用户名：</label>
                    <div class="col-sm-8">
                        <input id="adminName" name="adminName" class="form-control" type="text" value="${devUser.devName}" maxlength="10" required="required">
                    </div>

        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label">密码：</label>
            <div class="col-sm-8">
                <input id="adminPassword" name="adminPassword" class="form-control" type="text" value="${devUser.devPassword}"maxlength="16" required="required">
            </div>

        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">确认密码：</label>
            <div class="col-sm-8">
                <input id="adminPassword2" name="adminPassword2" class="form-control" type="text" value="${devUser.devPassword}" maxlength="16" required="required">
                <span class="help-block m-b-none"><i class="fa fa-info-circle"></i> 请再次输入您的密码</span>
            </div>
            <font color="#c00fff">*</font>
            <div id="passwordDiv" style="display: inline; color:red"></div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">手机：</label>
            <div class="col-sm-8">
                <input id="phone" name="phone" class="form-control" type="text" value="${devUser.phone}" aria-required="true" aria-invalid="false" class="valid" maxlength="11" required="required">
            </div>
            <font color="#c00fff">*</font>
            <div id="phoneDiv" style="display: inline; color:red"></div>
        </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">QQ：</label>
                    <div class="col-sm-8">
                        <input id="qq" name="qq" class="form-control" type="text" aria-required="true" value="${devUser.qq}" aria-invalid="false" class="valid" maxlength="10" required="required">
                    </div>
                    <font color="#c00fff">*</font>
                    <div id="qqDiv" style="display: inline; color:red"></div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">邮箱：</label>
                    <div class="col-sm-8">
                        <input id="devEmail" name="devEmail" class="form-control" type="devEmail" aria-required="true" value="${devUser.devEmail}" aria-invalid="false" class="valid" maxlength="20" required="required">
                    </div>
                    <font color="#c00fff">*</font>
                    <div id="devEmailDiv" style="display: inline; color:red"></div>
                </div>

                <div class="form-group">
            <label class="col-sm-3 control-label">权限：</label>
            <div class="col-sm-8">
                <input id="jurisdiction" name="jurisdiction" class="form-control" type="text" aria-required="true" value="${devUser.jurisdiction}" aria-invalid="false" class="valid">
            </div>
            <font color="#c00fff">*</font>
            <div id="jurisdictionDiv" style="display: inline; color:red"></div>
        </div>

        <div class="form-group">
            <div class="col-sm-8 col-sm-offset-3">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" class="checkbox" id="agree" name="agree" required="required"> 我已经认真阅读并同意《用户使用协议》
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-8 col-sm-offset-3">
                <button class="btn btn-primary" type="submit" id="submit" href="#">保存</button>&nbsp;&nbsp;&nbsp;&nbsp;
                <button class="btn btn-primary" type="button" id="back" onclick="history.go(-1)">返回</button>

            </div>
        </div>
            </form>
        </div>
    </div>
</div>

<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/bootstrap.min14ed.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/jeditable/jquery.jeditable.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/dataTables/dataTables.bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/layer/layer.js"></script>
<script type="text/javascript">


</script>



</body>
</html>
