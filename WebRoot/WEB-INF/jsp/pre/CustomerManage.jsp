<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>用户管理页面</title>


    <link rel="shortcut icon" href="favicon.ico"> <link href="${pageContext.request.contextPath}/statics/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/css/style.min862f.css?v=4.1.0" rel="stylesheet">
<style type="text/css">

    #centerdiv.div{text-align:center}

</style>

</head>
<%
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");

    int initVar=0;


%>
<body class="gray-bg" >
<div id="centerdiv">
   <div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">

                    <button type="button" id="loading-example-btn" class="btn btn-success btn-sm" onclick="AddUser()" ><i class="fa fa-spinner" aria-hidden="true"></i> 新增用户</button>

                </div>
                <div style="display: block;" class="ibox-content">


                    <div class="row">
                        <div class="col-sm-12">
                            <div class="ibox float-e-margins">



                                <table class="table table-striped table-bordered table-hover dataTables-example">
                                    <thead>
                                    <tr>
                                        <th style="text-align:center; width:10%;">序号</th>
                                        <th style="text-align:center; width:10%;">用户名</th>
                                        <th style="text-align:center; width:15%;">密码</th>
                                        <th style="text-align:center; width:10%;">电话</th>
                                        <th style="text-align:center; width:10%;">QQ</th>
                                        <th style="text-align:center; width:10%;">邮箱</th>
                                        <th style="text-align:center; width:15%;">创建时间</th>
                                        <th style="text-align:center; width:20%;">操作</th>

                                    </tr>
                                    </thead>
                                    <tbody style="text-align:center;">
                                    <c:forEach var="adminUserList" items="${adminUserList}">
                                        <tr>

                                            <td>${devUserList.id}</td>
                                            <td>${devUserList.devName}</td>
                                            <td>${devUserList.devPassword}</td>
                                            <td>${devUserList.phone}</td>
                                            <td>${devUserList.qq}</td>
                                            <td>${devUserList.devEmail}</td>
                                            <td>${devUserList.registerDate}</td>

                                            <td><a class="btn btn-primary btn-sm" href="#" onclick="edittype('${devUserList.id}')">编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-danger btn-sm" href="#" onclick="del('${devUserList.id}')">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-primary btn-sm" href="#" onclick="stop('${devUserList.id}')">停用</a></td>


                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th style="text-align:center; width:10%;">序号</th>
                                        <th style="text-align:center; width:10%;">用户名</th>
                                        <th style="text-align:center; width:15%;">密码</th>
                                        <th style="text-align:center; width:10%;">电话</th>
                                        <th style="text-align:center; width:10%;">QQ</th>
                                        <th style="text-align:center; width:10%;">邮箱</th>
                                        <th style="text-align:center; width:15%;">创建时间</th>
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
</div>

<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/bootstrap.min14ed.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/jeditable/jquery.jeditable.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/dataTables/dataTables.bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/layer/layer.js"></script>



<script>

    //删除用户信息
    function del(id) {
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
                url: "${pageContext.request.contextPath}/devuser/deleteuser",
                data: {
                    "id": id
                }, success: function (data) {
                    //table.ajax.reload();
                    if (data=1){
                        setTimeout(function(){swal("删除成功！", "您已经永久删除了这条信息。", "success");},100);
                        var table = $('.dataTables-example').DataTable();
                        table.draw( false );
                    }else if (data=0){
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

   //修改用户信息
    function edittype(id) {

        layer.open({
            type : 2,
            title : '用户信息修改',
            maxmin : true,
            shadeClose : false, //点击遮罩关闭层
            area : [ '700px', '600px' ],
            content : ['${pageContext.request.contextPath}/devuser/upeateUserbyid?id='+ id ],//此处 'no' 表示无下拉框选择
            end: function(){
                var table = $('.dataTables-example').DataTable();
                table.draw( false );
            }

        });
    }

    //用户停用
    function stop(id) {

        layer.open({
            type : 2,
            title : '用户停用',
            maxmin : true,
            shadeClose : false, //点击遮罩关闭层
            area : [ '700px', '600px' ],
            content : ['${pageContext.request.contextPath}/devuser/upeateUserbyid?id='+ id ],//此处 'no' 表示无下拉框选择
            end: function(){
                var table = $('.dataTables-example').DataTable();
                table.draw( false );
            }

        });
    }

    //添加用户信息
    function AddUser() {
        var table = $('.dataTables-example').DataTable();
        layer.open({
            type : 2,
            title : '添加用户',
            maxmin : true,
            shadeClose : false, //点击遮罩关闭层
            area : [ '800px', '550px' ],
            content : '${pageContext.request.contextPath}/devuser/adduser',
            end: function(){
                var table = $('.dataTables-example').DataTable();
                table.draw( false );
            }
        });
    }

</script>

</body>
</html>
