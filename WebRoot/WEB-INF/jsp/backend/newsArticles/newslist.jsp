<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>基础数据管理>>课程列表</title>


    <link rel="shortcut icon" href="favicon.ico"> <link href="${pageContext.request.contextPath}/statics/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<%
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");

    int initVar=0;


%>
<body class="gray-bg" >
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">

                    <button type="button" id="loading-example-btn" class="btn btn-success btn-sm" onclick="AddType()" ><i class="fa fa-spinner" aria-hidden="true"></i> 新增文章</button>

                </div>
                <div style="display: block;" class="ibox-content">


                    <div class="row">
                        <div class="col-sm-12">
                            <div class="ibox float-e-margins">



                                <table class="table table-striped table-bordered table-hover dataTables-example">
                                    <thead>
                                    <tr>
                                        <th style="text-align:center; width:10%;">序号</th>
                                        <th style="text-align:center; width:70%;">文章标题</th>
                                        <th style="text-align:center; width:20%;">操作</th>

                                    </tr>
                                    </thead>
                                    <tbody style="text-align:center;">
                                    <c:forEach var="atricles" items="${articlesList}">

                                        <tr>
                                            <td>${atricles.id}</td>
                                            <td>${atricles.title}</td>
                                            <td><a class="btn btn-primary btn-sm" href="#" onclick="edittype('${atricles.id}')">&#x7F16;&#x8F91;</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-danger btn-sm" href="#" onclick="del('${atricles.id}')">&#x5220;&#x9664;</a></td>
                                        </tr>

                                    </c:forEach>

                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th style="text-align:center; width:10%;">序号</th>
                                        <th style="text-align:center; width:70%;">文章标题</th>
                                        <th style="text-align:center; width:20%;">操作</th>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
</div>

<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/bootstrap.min14ed.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/jeditable/jquery.jeditable.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/dataTables/dataTables.bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/layer/layer.js"></script>



<script>

    function del(sid) {
        swal({
            title: "您确定要删除这条信息吗",
            text: "删除后将无法恢复，请谨慎操作！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "是的，我要删除！",
            cancelButtonText: "让我再考虑一下...",
            closeOnConfirm: true
        }, function () {
            $.ajax({
                url: "${pageContext.request.contextPath}/newsAtricles/delAtricles",
                data: {
                    "id": sid
                }, success: function (data) {
                    //table.ajax.reload();
                    if (data.status="success"){
                        setTimeout(function(){swal("删除成功！", "您已经永久删除了这条信息。", "success");},100);
                        var table = $('.dataTables-example').DataTable();
                        table.draw( false );
                    }else if (data.status="error"){
                        setTimeout(function(){swal("删除失败！", "此信息没有执行删除操作。", "error");},100);
                    }
                }
            });

        });

    }

    function init(str,str2){

        var table = $('.dataTables-example').DataTable();
        table.page.len( str2 ).draw();
        table.page(str).draw( false );
    }
</script>
<script>
    $(document).ready(function() {
        $("#loading-example-btn").click(function() {
            var table = $('.dataTables-example').DataTable();
            var pps=table.page();

        });
    });
    function delet(btn,state) {

        var table = $('.dataTables-example').DataTable();

        table.row(3).remove().draw( false );



    };
    function edittype(sid) {
        var table = $('.dataTables-example').DataTable();
        layer.open({
            type : 2,
            title : '修改文章',
            maxmin : true,
            shadeClose : false, //点击遮罩关闭层
            area : [ '600px', '260px' ],
            content : ['${pageContext.request.contextPath}/newsAtricles/update?id=' + sid,'no'],
            end: function(){
                var table = $('.dataTables-example').DataTable();
                table.draw( false );
            }

        });
    }
    function AddType() {
        layer.open({
            type : 2,
            title : '新增文章',
            maxmin : true,
            shadeClose : false, //点击遮罩关闭层
            area : [ '600px', '260px' ],
            content : '${pageContext.request.contextPath}/newsAtricles/add',
            end: function(){
                var table = $('.dataTables-example').DataTable();
                table.draw( false );
            }
        });
    }
</script>

</body>
</html>
