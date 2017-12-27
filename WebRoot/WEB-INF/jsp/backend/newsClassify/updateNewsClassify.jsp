<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/12/23
  Time: 13:10
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
<form method="post" id="updateClassify">

    <%--<div class="x_content">--%>
        <%--<form class="form-horizontal form-label-left">--%>

            <%--<table>--%>
                <%--<tr class="item form-group">--%>
                    <%--<td><label class="control-label col-md-3 col-sm-3 col-xs-12">分类ID：</label></td>--%>
                    <%--<td>--%>
                        <%--<div class="col-md-6 col-sm-6 col-xs-12">--%>
                            <%--<input type="text" name="id" value="${newsClassify.id}" readonly class="form-control col-md-7 col-xs-12">--%>
                        <%--</div>--%>
                    <%--</td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                    <%--<td> <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">分类名称：</label></td>--%>
                    <%--<td>--%>
                        <%--<div class="col-md-6 col-sm-6 col-xs-12">--%>
                            <%--<input type="text" placeholder="请输入文本" name="name" id="name" required class="form-control col-md-7 col-xs-12">--%>
                        <%--</div>--%>
                        <%--<span id="caution"></span>--%>
                    <%--</td>--%>

                <%--</tr>--%>
                <%--<tr>--%>
                    <%--<td colspan="2" align="center">--%>
                        <%--<button type="button" id="submit"  class="btn btn-success">保存</button>--%>
                    <%--</td>--%>
                <%--</tr>--%>
            <%--</table>--%>

        <%--</form>--%>
    <%--</div>--%>



    <div class="x_content">

        <form class="form-horizontal form-label-left"
              method="post">

            <p>请填写信息

            </p>
            <span class="section"> </span>

            <div class="item form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="id">分类ID
                    <span class="required">*</span>
                </label>
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <input id="id" class="form-control col-md-7 col-xs-12"
                           name="id" required="required" type="text" readonly value="${newsClassify.id}"/>

                </div>
            </div>


            <div class="item form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">分类名称
                    <span class="required">*</span>
                </label>
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <input id="name" class="form-control col-md-7 col-xs-12"
                           name="name" placeholder="请输入分类名称"
                           required="required" type="text" value="${newsClassify.name}">

                </div>
                <span id="caution" style="color: red"></span>
            </div>

            <div class="ln_solid"></div>
            <div class="form-group">
                <div class="col-md-6 col-md-offset-3">
                    <button id="submit" type="button" class="btn btn-success">保存</button>
                    <button type="button" class="btn btn-primary" id="return">返回</button>
                </div>
            </div>
        </form>
    </div>



</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/layer/layer.js"></script>
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

                }
            });
        }


    });

    $("#submit").click(function () {

        if (flag) {
            var bparams = $("#updateClassify").serialize();
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/newsClassify/updateClassify.json",
                data:bparams,
                dataType:"json",
                success:function (data) {
                    if (data.status == "success") {
                        layer.msg('保存成功！',{
                            icon: 1,
                            time: 1500
                        }, function(){
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);
                        });
                    } else {
                        layer.msg('保存失败！',{
                            icon: 1,
                            time: 1500
                        }, function(){
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);
                        });
                    }

                }
            });
        } else {
            return false;
        }

    });

    $("#return").click(function () {
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    });


</script>
</body>
</html>
