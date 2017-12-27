<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>网络基础设置</title>


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

            </div>
        </div>
        <div class="ibox-content">
            <form class="form-horizontal m-t" id="signupForm" method="post" action="${pageContext.request.contextPath}/adminuser/usersave">


                <div class="form-group">
                    <label class="col-sm-3 control-label">用户名：</label>
                    <div class="col-sm-8">
                        <input id="adminName" name="adminName" class="form-control" required="required" placeholder="用户名" type="text"><font color="#c00fff">*</font>
                        <div id="adminNameDiv" style="display: inline; color:red"></div>
                    </div>

                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">密码：</label>
                    <div class="col-sm-8">
                        <input id="adminPassword" name="adminPassword" class="form-control" required="required" placeholder="密码" type="password" pattern="^\w{10,16}$" maxlength="16">
                    </div>

                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">确认密码：</label>
                    <div class="col-sm-8">
                        <input id="adminPassword2" name="adminPassword2" class="form-control" placeholder="确认密码" type="password"required="required" ><font color="#c00fff">*</font>
                        <div id="adminPasswordDiv" style="display: inline; color:red"></div>
                        <span class="help-block m-b-none"><i class="fa fa-info-circle"></i> 请再次输入您的密码（密码必须是数字和字母组成的10--16位数!）</span>
                    </div>

                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">手机：</label>
                    <div class="col-sm-8">
                        <input id="phone" name="phone" class="form-control" type="text" aria-required="true" aria-invalid="false" class="valid" required="required"><font color="#c00fff">*</font>
                        <div id="phoneDiv" style="display: inline; color:red"></div>
                    </div>

                </div>

                <div class="form-group">
                    <div class="col-sm-8 col-sm-offset-3">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" class="checkbox" id="agree" name="agree" required="required"> 我已经认真阅读并同意《管理员使用协议》
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-8 col-sm-offset-3">
                        <button class="btn btn-primary" type="submit" id="submit" href="#" >提交</button>
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
<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">

    $(function () {
        var open=1;
        var open1=1;
        var open2=1;

        // 用户名

        $("#adminName").blur( function() {

                var name = $("#adminName").val();

                if (name == null || name == "") {
                    $("#adminNameDiv").html("用户名不能为空！");
                    return;
                } else {
                    $("#adminNameDiv").html("");
                    open=0;

                }
            });

        // 密码
        $("#adminPassword2").blur(function() {
            var password1 = $("#adminPassword").val();
            var password2 = $("#adminPassword2").val();
            var reg = /^[0-9a-zA-Z]+$/;
            if (password1 == "" || password2 == "") {
                $("#adminPasswordDiv").html("密码不能为空！");

            } else if (!reg.test(password1)) {
                $("#adminPasswordDiv").html("密码必须是数字和字母组成的10--16位数!");
            } else if (password1.length < 10) {
                $("#adminPasswordDiv").html("密码必须是数字和字母组成的10--16位数!");

            } else if (password1 != password2) {

                $("#adminPasswordDiv").html("两次密码输入不一样，请重新输入！");

            } else {
                $("#adminPasswordDiv").html("");
                open1=0;
            }

        });
            // 手机
            $("#phone").blur(function() {
                var phone = $("#phone").val();
                var reg = /^1\d{10}$/;
                if (phone == null || phone == "") {
                    $("#phoneDiv").html("手机号码不能为空!");
                } else if (!reg.test(phone)) {
                    $("#phoneDiv").html("手机号码格式不正确!");

                } else {
                    $("#phoneDiv").html("");
                    open2=0;
                }

            });

        //表单信息正确才可以提交

            $("#submit").blur(function () {
                var admin = $("#adminNameDiv").val();
                var adminPassword= $("#adminPasswordDiv").val();
                var phone = $("#phoneDiv").val();

                if(admin==adminPassword==phone==""){

                    $('#submit').attr("disabled",false);

                }else{
                    $('#submit').attr("disabled",true);
                }

            })



    });



</script>




</body>
</html>
