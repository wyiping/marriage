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
                                    <a href="<%=basePath%>home?cmd=search.jsp">寻找</a>
                                </li>
                                <li>
                                    <a href="<%=basePath%>home?cmd=members">会员</a>
                                </li>
                                <li>
                                    <a href="<%=basePath%>about.jsp">关于我们</a>
                                </li>
                                <li>
                                    <a href="<%=basePath%>contact.jsp">联系我们</a>
                                </li>
                                <c:if test="${user!=null}">
                                	<li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">消息<span
										class="caret"></span>
									</a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li>
                                                <a href="<%=basePath%>message?cmd=receive">收到的留言</a>
                                            </li>
                                            <li>
                                                <a href="<%=basePath%>message?cmd=sender">发出的消息</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">${user.name}<span
										class="caret"></span>
									</a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li>
                                                <a href="<%=basePath%>edit.jsp">修改资料</a>
                                            </li>
                                            <li>
                                                <a href="<%=basePath%>avatar.jsp">修改头像</a>
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
    
    <div class="grid_3">
		<div class="container">
			<div class="breadcrumb1">
				<ul>
					<a href="<%=basePath%>"><i class="fa fa-home home_1"></i></a>
					<span class="divider">&nbsp;|&nbsp;</span>
					<li class="current-page">寻找</li>
				</ul>
			</div>
			<div class="col-md-9 search_left">
				<form action="<%=basePath%>home?cmd=search" method="post">
					<div class="form_but1">
						<label class="col-sm-5 control-lable1">性别 : </label>
						<div class="col-sm-7 form_radios">
							<input type="radio" class="radio_1" name="sex" value="male" checked="checked" /> 男 &nbsp;&nbsp;
							<input type="radio" class="radio_1" name="sex" value="female"/> 女
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="form_but1">
						<label class="col-sm-5 control-lable1">婚姻状态 : </label>
						<div class="col-sm-7 form_radios">
							<input type="radio" class="radio_1" name="marital_situatio" value="0" checked="checked" /> 单身 &nbsp;&nbsp;
							<input type="radio" class="radio_1" name="marital_situatio" value="1"/> 离异 &nbsp;&nbsp;
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="form_but1">
						<label class="col-sm-5 control-lable1">身高 : </label>
						<div class="col-sm-5 input-group1">
							<input class="form-control has-dark-background" name="height" placeholder="身高">
						</div>
						<div class="clearfix"> </div>
						<div class="clearfix"> </div>
					</div>
					<div class="form_but1">
						<label class="col-sm-5 control-lable1">年龄 : </label>
						<div class="col-sm-5 input-group1">
							<input class="form-control has-dark-background" name="age" placeholder="年龄">
						</div>
						<div class="clearfix"> </div>
						<div class="clearfix"> </div>
					</div>
					<div class="form-actions">
						<center><input type="submit" id="edit-submit" value="查找" class="btn_1 submit"></center>
					</div>
				</form>
				<div class="paid_people">
					<h1>随便看看</h1>
					<c:forEach items="${users}" varStatus="st1" begin="0" step="2" end="5">
					<div class="row_1">
						<c:forEach items="${users}" step="1" var="u" varStatus="st" begin="${st1.index}" end="${st1.index+1}">
						<div class="col-sm-6 paid_people-left">
							<ul class="profile_item">
								<a href="<%=basePath%>home?cmd=profile&id=${u.userid}">
									<li class="profile_item-img">
										<img src="<%=basePath%>images/avatar/${u.avatar}" class="hover-animation image-zoom-in img-responsive" onerror="this.src='<c:choose><c:when test="${u.sex=='male'}">images/boy.png</c:when><c:otherwise>images/girl.png</c:otherwise></c:choose>'"/>
									</li>
									<li class="profile_item-desc">
										<span class="m_3">用户 ID : ${u.userid}</span><br>
										<h5>${u.name}</h5>
										<h5>
											<c:choose>
												<c:when test="${u.sex=='male'}">
													男
												</c:when>
												<c:otherwise>女</c:otherwise>
											</c:choose>，
											<c:choose>
												<c:when test="${u.marital_situatio=='0'}">
													未婚		
												</c:when>
												<c:otherwise>离异</c:otherwise>
											</c:choose>							
										</h5>
										<p>${u.age}岁，${u.height}CM<br></p>
									</li>
									<div class="clearfix"> </div>
								</a>
							</ul>
						</div>
						</c:forEach>
						<div class="clearfix"> </div>
					</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-md-3 match_right">
				<div class="profile_search1">
					<form action="<%=basePath%>home">
						<input type="hidden" value="profile" name="cmd" />
						<input type="text" class="m_1" name="id" size="30" required="" placeholder="输入用户ID:" onkeyup="value=value.replace(/[^1234567890-]+/g,'')">
						<input type="submit" value="Go">
					</form>
				</div>
				<section class="slider">
					<h3>结婚快乐</h3>
					<div class="flexslider">
						<ul class="slides">
							<li>
								<img src="images/s1.jpg" alt="" />
							</li>
							<li>
								<img src="images/s2.jpg" alt="" />
							</li>
							<li>
								<img src="images/s3.jpg" alt="" />
							</li>
						</ul>
					</div>
				</section>
				
			</div>
			<div class="clearfix"> </div>
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
    <link href="css/flexslider.css" rel='stylesheet' type='text/css' />
	<script defer src="js/jquery.flexslider.js"></script>
	<script type="text/javascript">
		$(function () {
			SyntaxHighlighter.all();
		});
		$(window).load(function () {
			$('.flexslider').flexslider({
				animation: "slide",
				start: function (slider) {
					$('body').removeClass('loading');
				}
			});
		});
	</script>
</body>
</html>