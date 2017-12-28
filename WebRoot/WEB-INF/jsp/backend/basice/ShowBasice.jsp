<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
保存成功！！
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-1.4.4.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/layer/layer.js"></script>
<script>
    $(document).ready(
         function(){
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
                location.href = "${pageContext.request.contextPath }/basicsetting/findBasicsetting";
            });

    alert("保存成功");


//        function(){
//            layer.msg('保存成功！',{
//                icon: 1,
//                time: 1500
//            })




</script>
</html>
