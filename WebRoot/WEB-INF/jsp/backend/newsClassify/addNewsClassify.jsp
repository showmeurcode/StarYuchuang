<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/12/23
  Time: 10:19
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
    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
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


</head>
<body>
<div class="x_content">
    <form class="form-horizontal form-label-left">

        <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">分类名称：</label>

            <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="text" placeholder="请输入文本" name="name" id="name" required class="form-control col-md-7 col-xs-12">
            </div>
            <span id="caution"></span>
        </div>

        <button type="button" id="submit"  class="btn btn-success">保存</button>

    </form>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

    var flag = false;

    $("#name").blur(function () {
        var name = $("#name").val();

        if (name == "" || name == null) {
            $("#caution").html("分类名称不可以为空");
            flag = false;
        } else {
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/newsClassify/nameSole.json",
                data:"name="+name,
                dataType:"json",
                success:function (data) {
                    if (data.status == "success") {
                        $("#caution").html("分类名称可以使用");
                        flag = true;
                    } else {
                        $("#caution").html("分类名称已存在");
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

    $("#submit").click(function () {

       if (flag) {
           var name = $("#name").val();
           var bparams = "name="+name;
           $.ajax({
               type:"POST",
               url:"${pageContext.request.contextPath}/newsClassify/addClassify.json",
               data:bparams,
               dataType:"json",
               success:function (data) {
                   if (data.status == "success") {
                       alert("添加成功");
                   } else {
                       alert(data.status);
                   }

               },
               error:function (XMLHttpRequest, textStatus, errorThrown) {
                   alert("XMLHttpRequest.status："+XMLHttpRequest.status);
                   alert("XMLHttpRequest.readyState："+XMLHttpRequest.readyState);
                   alert("textStatus："+textStatus);
               }
           });
       } else {
           return false;
       }

    });
</script>

</body>
</html>
