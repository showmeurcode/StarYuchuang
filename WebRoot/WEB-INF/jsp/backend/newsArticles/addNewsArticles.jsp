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
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body>
<form id="addArticles" method="post" class="form-horizontal form-label-left">

    <label for="title">文章标题</label>
    <input type="text" name="title" id="title" required placeholder="文章标题"/>
    <span id="yztitle"></span>
    文章分类
    <select name="classifyId" id="classifyId">
        <c:forEach items="${newsClassifyList}" var="newsClassify">
            <option value="${newsClassify.id}">${newsClassify.name}</option>
        </c:forEach>
    </select>
    <p>正文内容</p>

    <div id="div1">
        <p>欢迎使用 <b>wangEditor</b> 富文本编辑器</p>
    </div>
    <span id="yzdiv1"></span>
    <textarea name="content" id="content" style="width:100%; height:200px;" hidden></textarea>


    <button type="button" id="submit" class="btn btn-success">保存</button>

    <!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
    <script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/wangEditor.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/plugins/layer/layer.js"></script>
    <script type="text/javascript">
        var E = window.wangEditor;
        var editor = new E('#div1');
        var $text1 = $('#content');
        editor.customConfig.onchange = function (html) {
            // 监控变化，同步更新到 textarea
            $text1.val(html)
        };
        editor.create();
        // 初始化 textarea 的值
        $text1.val(editor.txt.html())

    </script>

    <script type="text/javascript">

        var flag = false;
        $("#title").blur(function () {
            var title = $("#title").val();
            if (title == "" || title == null) {
                flag = false;
                $("#yztitle").html("标题不能为空")
            } else {
                $("#yztitle").html("");
                flag = true;
            }
        });

        $("#submit").click(function () {
            if (flag) {
                var bparams = $("#addArticles").serialize();
                $.ajax({

                    type:"POST",
                    url:"${pageContext.request.contextPath}/newsAtricles/addAtricles.json",
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
    </script>
</form>
</body>
</html>
