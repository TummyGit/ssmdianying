<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.Info" %>
<%@ taglib prefix="ssm" uri="http://ssm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head><title>Home</title>
    <link href="qtstyle/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="qtstyle/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <!------ js ------>
    <script src="qtstyle/js/jquery.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!------ js ------>
    <!---- animated-css ---->
    <link href="qtstyle/css/animate.css" rel="stylesheet" type="text/css" media="all">
    <script src="qtstyle/js/wow.min.js"></script>
    <script src="qtstyle/js/bootstrap.js"></script>
    <script>
        new WOW().init();
    </script>
    <!---- animated-css ---->
</head>
<body>
<!--- header ---->
<div id="to-top" class="header-bg">
    <div id="home" class="header">
        <!--- container ---->
        <div class="header-menu-box">
            <div class="container">
                <div class="header-quanxian">
                    <c:choose>
                        <c:when test="${sessionScope.username != null && '' !=  sessionScope.username }">

                            欢迎${sessionScope.username}登录，
                            您得权限：${sessionScope.cx}
                            <a href="main.do" class="btn btn-primary btn-xs"> 个人中心</a>
                            <a href="logout.do" class="btn btn-default btn-xs" onclick="return confirm('你确定退出？')">
                                退出</a>
                        </c:when><c:otherwise>
                        <div class="btn-group">
                            <a href="javascript:;" class="btn btn-primary btn-xs" data-toggle="modal"
                               data-target="#myModal">登录</a>

                        </div>
                    </c:otherwise></c:choose>

                </div>
                <div class="header-logo">
                    <h2><a href="./">影院票务系统</a></h2>
                </div>
                <div class="header-nav">
                    <span class="menu"><label> <i class="glyphicon glyphicon-expand"></i> </label> </span>
                    <ul>
                        <li class="active"><a href="./">首页</a></li>
                        <li>
                            <a href="dianyingxinxilist.do">在播影片</a>
                        </li>
                        <li>
                            <a href="javascript:;">评价反馈</a>
                            <div class="header-nav-sub">
                                <a href="pingjiafankuiadd.do">我要评价</a>
                                <a href="pingjiafankuilist.do">评论区</a>
                            </div>
                        </li>
                        <li>
                            <a href="zhuceyonghuadd.do">用户注册</a>
                        </li>
                        <li class="xinsuo_menu">
                            <a href="login.do">后台管理</a>
                        </li>
                    </ul>
                </div>
                <div class="clearfix"></div>
                <!----- script-for-menu ---->
                <script>
                    $("span.menu").click(function () {
                        $(".header-nav ul").slideToggle("slow", function () {
                        });
                    });
                </script>
                <!----- script-for-menu ---->
                <div class="clearfix"></div>
            </div>
        </div>
        <!--- container --->
    </div>
</div>

<link rel="stylesheet" href="qtstyle/css/swipe.css">
<script src="qtstyle/css/swipe.js"></script>
    <% ArrayList<HashMap> bhtList = Query.make("lunbotu").order("id desc").limit(10).select();
request.setAttribute("bhtList" , bhtList);
 %>
<div class="menu_banner">
    <div class="banner">
        <ul>
            <c:forEach items="${bhtList}" var="t">
                <li style="background: url(${t.image}) no-repeat top center; width: 100%; height: 450px; background-size: cover">
                    <a href="${t.url}" style="width: 100%; height: 450px; display: block;"></a>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
<script>
    $(function () {
        var unslider = $('.banner').unslider({
            autoplay: true,
            arrows: {
                prev: '<a href="javascript:;" class="unslider-arrow prev"></a>',
                next: '<a href="javascript:;" class="unslider-arrow next"></a>'
            },
            speed: 500,               //  The speed to animate each slide (in milliseconds)
            delay: 3000,              //  The delay between slide animations (in milliseconds)
            complete: function () {
            },  //  A function that gets called after every slide animation
            keys: true,               //  Enable keyboard (left, right) arrow shortcuts
            dots: true,               //  Display dot navigation
            fluid: false              //  Support responsive design. May break non-responsive designs
        });
    });
</script>


<!-- Modal -->
<div class="modal fade bs-example-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">登录</h4>
            </div>
            <div class="modal-body">
                <div class="pa10">
                    <form action="authLogin.do?a=a" method="post" class="form-horizontal">
                        <div>
                            <div class="form-group">
                                <input type="text" placeholder="用户名" class="form-control" name="username" value=""/>
                            </div>
                            <div class="form-group">
                                <input type="password" placeholder="密码" class="form-control" name="pwd" value=""/>
                            </div>
                            <div class="form-group">
                                <select name="cx" class="form-control" id="cx">
                                    <option value="注册用户">注册用户</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="验证码" name="pagerandom"
                                           value=""/>
                                    <span class="input-group-addon">
                                        <img src="captcha.do"
                                             style="width: 60px;height: 20px;max-width: 60px;max-height: 20px"
                                             onclick="this.src='captcha.do?rand='+new Date().getTime()"/>
                                    </span>
                                </div>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-block">登录</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!--- header ---->
<div class="clearfix"></div>