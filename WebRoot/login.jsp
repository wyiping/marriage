<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>

<head>
	<title>登录</title>
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
			$(".dropdown").hover(
				function () {
					$('.dropdown-menu', this).stop(true, true).slideDown("fast");
					$(this).toggleClass('open');
				},
				function () {
					$('.dropdown-menu', this).stop(true, true).slideUp("fast");
					$(this).toggleClass('open');
				}
			);
		});
	</script>
</head>

<body>
	<!-- ============================  Navigation Start =========================== -->
	<div class="navbar navbar-inverse-blue navbar">
		<!--<div class="navbar navbar-inverse-blue navbar-fixed-top">-->
		<div class="navbar-inner navbar-inner_1">
			<div class="container">
				<div class="navigation">
				<c:if test="${user==null}">
					<nav id="colorNav">
						<ul>
							<li class="green">
								<a href="#" class="icon-home"></a>
								<ul>
									<li><a href="login.jsp">登录</a></li>
									<li><a href="register.jsp">注册</a></li>
								</ul>
							</li>
						</ul>
					</nav>
				</c:if>
				</div>
				<a class="brand" href="<%=basePath%>"><img src="images/logo.png" alt="logo"></a>
				<div class="pull-right">
					<nav class="navbar nav_bottom" role="navigation">
						<div class="navbar-header nav_2">
							<button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">菜单
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
							<a class="navbar-brand" href="#"></a>
						</div>
						<!-- Collect the nav links, forms, and other content for toggling -->
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
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- end navbar-inverse-blue -->
	<!-- ============================  Navigation End ============================ -->
	<div class="grid_3">
		<div class="container">
			<div class="breadcrumb1">
				<ul>
					<a href="<%=basePath%>"><i class="fa fa-home home_1"></i></a>
					<span class="divider">&nbsp;|&nbsp;</span>
					<li class="current-page">登录</li>
				</ul>
			</div>
			<div class="services">
				<div class="col-sm-6 col-sm-push-3 login_left">
					<form action="<%=basePath%>user?cmd=login" method="post">
						<c:if test="${msg!=null}">
							<div class="alert alert-danger" role="alert">${msg}</div>
						</c:if>
						<div class="form-item form-type-textfield form-item-name">
							<label for="edit-name">用户名 <span class="form-required" title="This field is required.">*</span></label>
							<input type="text" id="edit-name" name="username" value="" size="60" maxlength="60" class="form-text " required>
						</div>
						<div class="form-item form-type-password form-item-pass">
							<label for="edit-pass">密码 <span class="form-required" title="This field is required.">*</span></label>
							<input type="password" id="edit-pass" name="password" size="60" maxlength="128" class="form-text " required>
						</div>
						<div class="form-actions">
							<input type="submit" id="edit-submit" name="op" value="登录" class="btn_1 submit">
						</div>
					</form>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<div class="footer">
		<div class="container">
			<div class="copy">
				<p>Copyright &copy; 2017.Company name All rights reserved.</p>
			</div>
		</div>
	</div>
</body>

</html>