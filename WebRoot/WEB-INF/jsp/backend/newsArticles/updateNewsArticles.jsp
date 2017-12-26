<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/12/23
  Time: 14:37
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
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body>
<form method="post" id="updateArticles">

    <input name="id" value="${newsArticles.id}" hidden/>
    <label for="title">文章标题</label><input type="text" name="title" id="title" required placeholder="文章标题" value="${newsArticles.title}"/>
    文章分类
    <select name="classifyId">
        <c:forEach items="${newsClassifyList}" var="newsClassify">
        <option value="${newsClassify.id}" <c:if test="${newsArticles.classifyId == newsClassify.id}">selected</c:if> >${newsClassify.name}</option>
        </c:forEach>
    </select>
    <div id="div1">
        ${newsArticles.content}
    <textarea name="content" id="content" style="width:100%; height:200px;" hidden></textarea>

    <button type="button" id="submit">保存</button>

    <!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/wangEditor.js"></script>
    <script type="text/javascript">
        var E = window.wangEditor
        var editor = new E('#div1')
        var $text1 = $('#content')
        editor.customConfig.onchange = function (html) {
            // 监控变化，同步更新到 textarea
            $text1.val(html)
        }
        editor.create()
        // 初始化 textarea 的值
        $text1.val(editor.txt.html())

    </script>

    <script type="text/javascript">

        $("#submit").click(function () {
            var bparams = $("#updateArticles").serialize();
            alert(bparams);
            $.ajax({

                type:"POST",
                url:"${pageContext.request.contextPath}/newsAtricles/updateAtricles.json",
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
</form>
</body>
</html>
