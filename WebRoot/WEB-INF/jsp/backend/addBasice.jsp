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

<!--新增app内容区 -->
<div id="Content" class="right_col" role="main" hidden>

    <div class="">
        <div class="page-title">



        </div>
        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>新增APP基础信息
                            <small>sub title</small>
                        </h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                                   role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">Settings 1</a>
                                    </li>
                                    <li><a href="#">Settings 2</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">

                        <form id="appaddform" class="form-horizontal form-label-left"
                              method="post" enctype="multipart/form-data">

                            <p>请填写信息

                            </p>
                            <span class="section"> </span>

                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="softwareName">软件名称
                                    <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="softwareName" class="form-control col-md-7 col-xs-12"
                                           name="softwareName" placeholder="请输入文件名称"
                                           required="required" type="text">

                                </div>
                                <span id="yzname"></span>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="APKName">APK名称<span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="APKName" name="APKName" required="required"
                                           placeholder="请输入APK名称"
                                           class="form-control col-md-7 col-xs-12">

                                </div>
                                <span id="yzAPK"></span>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="supportROM">支持ROM<span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="supportROM" name="supportROM"
                                           required="required" placeholder="请输入支持的ROM"
                                           class="form-control col-md-7 col-xs-12">
                                </div>
                                <span id="yzROM"></span>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="interfaceLanguage">界面语言<span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="interfaceLanguage" name="interfaceLanguage"
                                           required="required" placeholder="请输入软件支持的界面语言"
                                           class="form-control col-md-7 col-xs-12">

                                </div>
                                <span id="yzlanguage"></span>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="softwareSize">软件大小 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="softwareSize" name="softwareSize"
                                           required="required" placeholder="请输入软件大小，单位是Mb"
                                           class="form-control col-md-7 col-xs-12">

                                </div>
                                <span id="yzSize"></span>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="downloads">下载次数 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="downloads" type="text" name="downloads"
                                           placeholder="请输入下载次数" required="required"
                                           class="optional form-control col-md-7 col-xs-12">

                                </div>
                                <span id="yzloads"></span>
                            </div>
                            <div class="item form-group">
                                <label for="flatformId"
                                       class="control-label col-md-3">所属平台</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="flatformId" id="flatformId"
                                            class="form-control col-md-7 col-xs-12" required="required">

                                        <option value="0" selected>请选择</option> 
                                        <option value="1">手机</option> 
                                        <option value="2">平板</option> 
                                        <option value="3">通用</option> 
                                    </select>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label for="categoryLevel1"
                                       class="control-label col-md-3 col-sm-3 col-xs-12">一级分类</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="categoryLevel1" id="categoryLevel1"
                                            class="form-control col-md-7 col-xs-12" required="required">
                                        <option value="0" selected>请选择</option> 
                                        <c:forEach items="${appCategoryList1}" var="appCategory1">
                                            <option value="${appCategory1.id}">${appCategory1.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label for="categoryLevel2"
                                       class="control-label col-md-3 col-sm-3 col-xs-12">二级分类</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="categoryLevel2" id="categoryLevel2"
                                            class="form-control col-md-7 col-xs-12" required="required">
                                        <option value="0" selected>请选择</option> 


                                    </select>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label for="categoryLevel3"
                                       class="control-label col-md-3 col-sm-3 col-xs-12">三级分类</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="categoryLevel3" id="categoryLevel3"
                                            class="form-control col-md-7 col-xs-12" required="required">
                                        <option value="0" selected>请选择</option> 

                                    </select>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="status">APP状态 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="status" name="status" value="1" hidden type="text"/>
                                    待审核
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="appInfo">应用简介 <span class="required">*</span>
                                </label>

                                <div class="col-md-6 col-sm-6 col-xs-12">
                    <textarea id="appInfo" required="required" name="appInfo"
                              class="form-control col-md-7 col-xs-12"
                              placeholder="请输入本软件的相关信息，本信息作为软件的详细信息进行软件介绍。"></textarea>

                                </div>
                                <span id="yztext"></span>
                            </div>

                            <div class="item form-group">
                                <input type="hidden" id="errorinfo" value="${uploadFileError}"/>
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="logoPicPath1">LOGO图片 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="logoPicPath1" type="file" name="logoPicPath1" required="required"
                                           class="optional form-control col-md-7 col-xs-12">
                                </div>

                            </div>
                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-3">
                                    <a id="send1" type="button" class="btn btn-success">保存</a>
                                    </input>
                                    <button type="button" class="btn btn-primary">返回</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- /page content -->











</body>
</html>