<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache"); 
%>
<%--<%@include  file="sessionCheck.jsp"%>--%>

<!DOCTYPE html>
<html>


<!-- Mirrored from www.zi-han.net/theme/hplus/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 03 Mar 2016 12:31:16 GMT -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    
    <title>客户项目管理系统</title>

   
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
<script type="text/javascript">document.oncontextmenu=function(){ return false }</script>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="${pageContext.request.contextPath}/statics/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/css/style.min862f.css?v=4.1.0" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <span><img alt="image" class="img-circle" src="img/profile_small.jpg" /></span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">&nbsp;&nbsp;&nbsp;用户名</strong></span>
                                <span class="text-muted text-xs block">部门 <b class="caret"></b></span>
                                </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a class="J_menuItem" href="PasswordUpdate.jsp">修改密码</a>
                                </li>
                                <li class="divider"></li>
                                <li><a href="login.jsp">安全退出</a>
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element">H+
                        </div>
                    </li>
                    <li>
                        <a href="#" ondragstart="return false">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">主页</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="index_v1.html" data-index="0" ondragstart="return false">主页</a>
                            </li>
     
                        </ul>

                    </li>
                    <li>
                        <a href="#" ondragstart="return false"><i class="fa fa-database"></i> <span class="nav-label">文章</span><span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath}/backend/newslist.jsp" ondragstart="return false">文章管理</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath}/backend/newsclassify.jsp" ondragstart="return false">文章分类</a>
                            </li>

                        </ul>
                    </li>
                    <li>
                        <a href="#" ondragstart="return false">
                            <i class="fa fa fa-user"></i>
                            <span class="nav-label">管理员管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="Customer/CustomerManage.jsp" ondragstart="return false">管理员管理</a>
                            </li>

                        </ul>
                    </li>

                    <li>
                        <a href="#" ondragstart="return false"><i class="fa fa-credit-card"></i> <span class="nav-label">用户管理</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="ProjectManage/ProjectManage.jsp" ondragstart="return false">用户管理</a>
                   
                        </ul>
                    </li>
                    <li>
                        <a href="#" ondragstart="return false"><i class="fa fa-edit"></i> <span class="nav-label">网站基础设置</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="${pageContext.request.contextPath}/backend/BasiceManage.jsp" ondragstart="return false">网站基础设置</a>
                            </li>
          
                        </ul>
                    </li>
                    <li>
                        <a href="#" ondragstart="return false"><i class="fa fa-smile-o"></i> <span class="nav-label">友情链接管理</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="${pageContext.request.contextPath}/backend/LinkManage.jsp" ondragstart="return false">友情链接管理</a>
                            </li>
            
                           
                        </ul>
                    </li>
                    <li>
                        <a href="#" ondragstart="return false"><i class="fa fa-history"></i> <span class="nav-label">单页面管理</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="${pageContext.request.contextPath}/backend/SingManage.jsp" ondragstart="return false">预约报名</a>
                        </ul>
                    </li>
                    <li>
                        <a href="#" ondragstart="return false"><i class="fa fa-bar-chart"></i> <span class="nav-label">广告区域管理</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="report/KHManage.jsp" ondragstart="return false">广告区域管理</a>
                            </li>
                        </ul>
                    </li>

                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    

                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>

                    </div>

                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="index_v1.html">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">


                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                              <li class="divider"></li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
                <a href="login.jsp" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="index_v148b2.html?v=4.0" frameborder="0" data-id="index_v1.html" seamless></iframe>
            </div>
            <div class="footer">
                <div class="pull-right">&copy; 2016-2017
                </div>
            </div>
        </div>
        <!--右侧部分结束-->
        
    </div>
    <script src="${pageContext.request.contextPath}/statics/js/jquery.min63b9.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath}/statics/js/bootstrap.min14ed.js?v=3.3.6"></script>
    <script src="${pageContext.request.contextPath}/statics/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/plugins/layer/layer.min.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/hplus.min862f.js?v=4.1.0"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/contabs.min.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/plugins/pace/pace.min.js"></script>





</body>

</html>
