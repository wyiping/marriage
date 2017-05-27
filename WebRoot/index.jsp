<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>

<head>
    <title>婚恋网站</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css' />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- Custom Theme files -->
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <link href="css/font-awesome.css" rel="stylesheet">
    <script>
        $(document).ready(function () {
            $(".dropdown").hover(function () {
                $('.dropdown-menu', this).stop(true, true).slideDown("fast");
                $(this).toggleClass('open');
            }, function () {
                $('.dropdown-menu', this).stop(true, true).slideUp("fast");
                $(this).toggleClass('open');
            });
        });
    </script>
</head>

<body>
    <!-- ============================  Navigation Start =========================== -->
    <div class="navbar navbar-inverse-blue navbar">
        <div class="navbar-inner">
            <div class="container">
                <div class="navigation">
                    <c:if test="${user==null}">
                        <nav id="colorNav">
                            <ul>
                                <li class="green">
                                    <a href="#" class="icon-home"></a>
                                    <ul>
                                        <li>
                                            <a href="login.jsp">登录</a>
                                        </li>
                                        <li>
                                            <a href="register.jsp">注册</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </c:if>
                </div>
                <a class="brand" href="<%=basePath%>"><img src="images/logo.png" alt="logo"></a>
                <div class="pull-right">
                    <nav class="navbar nav_bottom" role="navigation">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header nav_2">
                            <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
								菜单
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
                            <a class="navbar-brand" href="#"></a>
                        </div>
                        <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                            <ul class="nav navbar-nav nav_1">
                                <li>
                                    <a href="<%=basePath%>">首页</a>
                                </li>
                                <li>
                                    <a href="<%=basePath%>home?cmd=members">会员</a>
                                </li>
                                <c:if test="${user!=null}">
                                    <li class="dropdown js-user">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">${user.username}<span
										class="caret"></span>
									</a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li>
                                                <a href="<%=basePath%>user?cmd=edit">修改资料</a>
                                            </li>
                                            <li>
                                                <a href="<%=basePath%>user?cmd=avatar">修改头像</a>
                                            </li>
                                            <li>
                                                <a href="<%=basePath%>user?cmd=logout">注销</a>
                                            </li>
                                        </ul>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                    </nav>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <!-- end navbar-inverse-blue -->
    <div class="banner">
        <div class="profile_search">
            <div class="container wrap_1">
                <form action="<%=basePath%>home?cmd=search" method="post">
                    <div class="search_top">
                        <div class="inline-block">
                            <label class="gender_1">性别:</label>
                            <div class="age_box1" style="max-width: 100%; display: inline-block;">
                                <select name="sex">
                                    <option value="male">男</option>
                                    <option value="female">女</option>
                                </select>
                            </div>
                        </div>
                        <div class="inline-block">
                            <label class="gender_1">身高:</label>
                            <div class="age_box1" style="max-width: 100%; display: inline-block;">
                                <select name="height">
                                    <option value="160">160</option>
                                    <option value="165">165</option>
                                    <option value="170">170</option>
                                    <option value="175">175</option>
                                    <option value="180">180</option>
                                </select>
                            </div>
                        </div>
                        <div class="inline-block">
                            <label class="gender_1">婚姻状态 :</label>
                            <div class="age_box1" style="max-width: 100%; display: inline-block;">
                                <select name="marital_situatio">
                                    <option value="0">单身</option>
                                    <option value="1">已婚</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="inline-block">
                        <div class="age_box2" style="max-width: 220px;">
                            <label class="gender_1">年龄:</label>
                            <input class="transparent" style="width: 30%;" type="text" name="age">
                        </div>
                    </div>
                    <div class="submit inline-block">
                        <input id="submit-btn" class="hvr-wobble-vertical" type="submit" value="寻找">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="grid_1">
        <div class="container">
            <h1>随便看看</h1>
            <div class="heart-divider">
                <span class="grey-line"></span>
                <i class="fa fa-heart pink-heart"></i>
                <i class="fa fa-heart grey-heart"></i>
                <span class="grey-line"></span>
            </div>
            <ul id="flexiselDemo3">
            <c:forEach items="${s_users}" var="u">
                <li>
                    <div class="col_1">
                        <a href="<%=basePath%>home?cmd=profile&id=${u.userid}">
                            <img src="<%=basePath%>images/avatar/${u.avatar}" class="hover-animation image-zoom-in img-responsive" onerror="this.src='<c:choose><c:when test="${u.sex=='male'}">images/boy.png</c:when><c:otherwise>images/girl.png</c:otherwise></c:choose>'"/>
                            <h3>
                                <span class="m_3">用户 ID : ${u.userid}</span><br>
                                ${u.age}岁<br>
                                ${u.height}CM
                            </h3>
                        </a>
                    </div>
                </li>
            </c:forEach>
            </ul>
            <script type="text/javascript">
                $(window).load(function () {
                    $("#flexiselDemo3").flexisel({
                        visibleItems: 6,
                        animationSpeed: 1000,
                        autoPlay: false,
                        autoPlaySpeed: 3000,
                        pauseOnHover: true,
                        enableResponsiveBreakpoints: true,
                        responsiveBreakpoints: {
                            portrait: {
                                changePoint: 480,
                                visibleItems: 1
                            },
                            landscape: {
                                changePoint: 640,
                                visibleItems: 2
                            },
                            tablet: {
                                changePoint: 768,
                                visibleItems: 3
                            }
                        }
                    });

                });
            </script>
            <script type="text/javascript" src="js/jquery.flexisel.js"></script>
        </div>
    </div>
    <div class="footer">
        <div class="container">
            <div class="copy">
                <p>
                    Copyright &copy; 2017.Company name All rights reserved.
                </p>
            </div>
        </div>
    </div>
</body>
</html>