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

</head>
<body>
<form method="post" id="updateClassify">
    <div>
        <table>
            <tr>
                <td>分类id：</td>
                <td> <input type="text" name="id" value="${newsClassify.id}" readonly/></td>
            </tr>
            <tr>
                <td><label for="name">分类名称：</label></td>
                <td>
                    <div>
                    <input type="text" name="name" id="name" required value="${newsClassify.name}"/>
                    <div id="caution"></div>
                </div>
                </td>
            </tr>
            <tr>
                <td colspan="2"><button type="button" id="submit">保存</button></td>
            </tr>
        </table>
    </div>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
    $("#submit").click(function () {
        var bparams = $("#updateClassify").serialize();
        alert(bparams);

        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/newsClassify/updateClassify.json",
            data:bparams,
            dataType:"json",
            success:function (data) {
                if (data.status == "success") {
                    alert("修改成功");
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
    });
</script>
</body>
</html>
