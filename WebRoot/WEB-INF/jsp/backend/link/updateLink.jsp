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

    <form id="addform" class="form-horizontal form-label-left"
          method="post" action="${pageContext.request.contextPath }/linkmanager/changeLinkmanager">

        <p>请填写信息

        </p>
        <span class="section"> </span>

        <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="id">id
                <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <input id="id" class="form-control col-md-7 col-xs-12"
                       name="id" readonly
                       required="required" type="text" value="${LinkList.id}">
            </div>
        </div>
        <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">网络名称
                <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <input id="name" class="form-control col-md-7 col-xs-12"
                       name="name" placeholder="请输入网站名称"
                       required="required" type="text" value="${LinkList.name}">

            </div>
            <span id="yzname"></span>
        </div>
        <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"
                   for="link">网络连接<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="text" id="link" name="link" required="required"
                       placeholder="请输入网站连接"
                       class="form-control col-md-7 col-xs-12" value="${LinkList.link}">

            </div>
            <span id="yzlink"></span>
        </div>


        <div class="ln_solid"></div>
        <div class="form-group">
            <div class="col-md-6 col-md-offset-3">
                <button id="send1" type="submit" class="btn btn-success">保存</button>
                <button id="send2" type="button" class="btn btn-primary">返回</button>
            </div>
        </div>
    </form>
</div>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
    var flag = false;
    var flag2 = false;


    $("#send1").click(function () {
        if (flag && flag2) {
            $("#addform").submit();

            <%--var bpar=$("#appaddform").serialize();--%>

            <%--$.ajax({--%>
            <%--type:"POST",--%>
            <%--url:"${pageContext.request.contextPath}/linkmanager/changeLinkmanager.json",--%>
            <%--data:bpar,--%>
            <%--dataType:"json",--%>
            <%--success:function (data) {--%>
            <%--if (data.status == "修改成功") {--%>
            <%--alert("修改成功！");--%>
            <%--&lt;%&ndash;$("#Content").load("${pageContext.request.contextPath}/singlepageReservations/findSinglepageReservations");&ndash;%&gt;--%>

            <%--} else {--%>
            <%--alert(data.status);--%>
            <%--}--%>
            <%--},--%>
            <%--error:function (data) {--%>
            <%--alert("修改大失败");--%>
            <%--}--%>
            <%--});--%>
        }else{
            alert("填写不符合，无法保存");
            return false;
        }

    });


    $("#name").blur(function () {
        var name=$("#name").val();
        if (name == "" || name == null) {
            flag = false;
            $("#yzname").html("网站名称不能为空")
        } else {
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/linkmanager/nameSole.json",
                data:"name="+name,
                dataType:"json",
                success:function (data) {
                    if (data.status == "success") {
                        $("#yzname").html("网站名称可以使用");
                        flag = true;
                    } else {
                        $("#yzname").html("网站名称已存在");
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

    $("#link").blur(function () {
        var link=$("#link").val();
        if (link == "" || link == null) {
            flag2 = false;
            $("#yzlink").html("网站链接不能为空")
        } else {
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/linkmanager/linkSole.json",
                data:"name="+name,
                dataType:"json",
                success:function (data) {
                    if (data.status == "success") {
                        $("#yzlink").html("网站链接可以使用");
                        flag2 = true;
                    } else {
                        $("#yzlink").html("网站链接已存在");
                        flag2 = false;
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

    $("#send2").click(function () {
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    });
</script>
</html>