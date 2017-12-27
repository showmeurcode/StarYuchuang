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
          method="post" action="${pageContext.request.contextPath}/basicsetting/addBasicsetting">

        <p>请填写信息

        </p>
        <span class="section"> </span>

        <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">网络名称
                <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <input id="name" class="form-control col-md-7 col-xs-12"
                       name="name" placeholder="请输入网络名称"
                       required="required" type="text">

            </div>
            <span id="yzname"></span>
        </div>
        <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"
                   for="adress">域名地址<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="text" id="adress" name="adress" required="required"
                       placeholder="请输入域名地址"
                       class="form-control col-md-7 col-xs-12">

            </div>
            <span id="yzaddess"></span>
        </div>

        <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"
                   for="describe">站点描述 <span class="required">*</span>
            </label>

            <div class="col-md-6 col-sm-6 col-xs-12">
                    <textarea id="describe" required="required" name="describe"
                              class="form-control col-md-7 col-xs-12"
                              placeholder="请输入站点描述。"></textarea>

            </div>
            <span id="yztext"></span>
        </div>

        <div class="ln_solid"></div>
        <div class="form-group">
            <div class="col-md-6 col-md-offset-3">
                <button id="send1" type="submit" class="btn btn-success">保存</button>
                <button id="send2" type="button" class="btn btn-primary" onClick="custom_close()" >返回</button>

            </div>
        </div>
    </form>
</div>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
    var flag = false;

    $("#send1").click(function () {
        if (flag) {
            <%--var bpar=$("#appaddform").serialize();--%>

            <%--$.ajax({--%>
                <%--type:"POST",--%>
                <%--url:"${pageContext.request.contextPath}/basicsetting/addBasicsetting.json",--%>
                <%--data:bpar,--%>
                <%--dataType:"json",--%>
                <%--success:function (data) {--%>
                    <%--if (data.status == "添加成功") {--%>
                        <%--alert("添加成功！");--%>

                    <%--} else {--%>
                        <%--alert(data.status);--%>
                    <%--}--%>
                <%--},--%
                <%--error:function (data) {--%>
                    <%--alert("添加大失败");--%>
                <%--}--%>
            <%--});--%>
        }else {
            alert("填写不符合，无法保存");
            return false;
        }

    });


    $("#name").blur(function () {
        var name=$("#name").val();
        if (name == "" || name == null) {
            flag = false;
            $("#yzname").html("网络名称不能为空")
        }  else {
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/basicsetting/nameSole.json",
                data:"name="+name,
                dataType:"json",
                success:function (data) {
                    if (data.status == "success") {
                        $("#yzname").html("网络名称可以使用");
                        flag = true;
                    } else {
                        $("#yzname").html("网络名称已存在");
                        flag = false;
                    }

                },
                error:function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("XMLHttpRequest.status："+XMLHttpRequest.status);
                    alert("XMLHttpRequest.readyState："+XMLHttpRequest.readyState);
                    alert("textStatus："+textStatus);
                }
            });
        }
    });

    $("#adress").blur(function () {
        var adress=$("#adress").val();
        if (adress == "" || adress == null) {
            flag = false;
            $("#yzaddess").html("域名地址不能为空")
        }  else {
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/basicsetting/adressSole.json",
                data:"name="+name,
                dataType:"json",
                success:function (data) {
                    if (data.status == "success") {
                        $("#yzaddess").html("网络地址可以使用");
                        flag = true;
                    } else {
                        $("#yzaddess").html("网络地址已存在");
                        flag = false;
                    }

                },
                error:function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("XMLHttpRequest.status："+XMLHttpRequest.status);
                    alert("XMLHttpRequest.readyState："+XMLHttpRequest.readyState);
                    alert("textStatus："+textStatus);
                }
            });
        }
    });

    $("#describe").blur(function () {
        var describe=$("#describe").val();
        if (describe == "" || describe == null) {
            flag = false;
            $("#yztext").html("站点描述不能为空")
        } else {
            $("#yztext").html("");
            flag = true;
        }
    });

    $("#send2").click(function () {
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    });





</script>
</html>