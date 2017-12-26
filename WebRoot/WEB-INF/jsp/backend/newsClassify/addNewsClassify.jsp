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

</head>
<body>
<form>
    <div>
        <table>
            <tr>
                <td><label for="name">分类名称：</label></td>
                <td>
                    <div>
                <input type="text" placeholder="请输入文本" name="name" id="name" required>
                <div id="caution">

                </div>
            </div>
                </td>
            </tr>
            <tr><td colspan="2"><button type="button" id="submit">保存</button></td></tr>
        </table>
    </div>
</form>

<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
    $("#submit").click(function () {
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
    });
</script>

</body>
</html>
