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
          method="post" enctype="multipart/form-data" >

        <p>请填写信息

        </p>
        <span class="section"> </span>

        <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="netname">网络名称
                <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <input id="netname" class="form-control col-md-7 col-xs-12"
                       name="netname" placeholder="请输入网络名称"
                       required="required" type="text">

            </div>
            <span id="yzname"></span>
        </div>
        <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"
                   for="addess">域名地址<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="text" id="addess" name="addess" required="required"
                       placeholder="请输入域名地址"
                       class="form-control col-md-7 col-xs-12">

            </div>
            <span id="yzaddess"></span>
        </div>

        <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"
                   for="appInfo">站点描述 <span class="required">*</span>
            </label>

            <div class="col-md-6 col-sm-6 col-xs-12">
                    <textarea id="appInfo" required="required" name="appInfo"
                              class="form-control col-md-7 col-xs-12"
                              placeholder="请输入站点描述。"></textarea>

            </div>
            <span id="yztext"></span>
        </div>

        <div class="ln_solid"></div>
        <div class="form-group">
            <div class="col-md-6 col-md-offset-3">
                <button id="send1" type="button" class="btn btn-success">保存</button>
                <button type="button" class="btn btn-primary">返回</button>
            </div>
        </div>
    </form>
</div>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">


    $("#send1").click(function () {
        var netname=$("#netname").val();
        var addess=$("#addess").val();
        var appInfo=$("#appInfo").val();
        var data="netname="+netname+"&addess="+addess+"&appInfo="+appInfo;

        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/singlepageReservations/addSinglepageReservations",
            data:data,
            dataType:"json",
            async:false,
            cache:false,
            contentType:false,
            processData:false,
            success:function (data) {
                if (data.status == "添加成功") {
                    alert("添加成功！");
                    <%--$("#Content").load("${pageContext.request.contextPath}/singlepageReservations/findSinglepageReservations");--%>

                } else {
                    alert(data.status);
                }
            },
            error:function (data) {
                alert("添加大失败");
            }
        });
    });

</script>
</html>