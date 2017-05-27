<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>

<head>
	<title>注册</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css' />
	<link href="css/calendar.css" rel='stylesheet' type='text/css' />
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-1.5.1.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/calendar.js"></script>
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
				<a class="brand" href="index.html"><img src="images/logo.png" alt="logo"></a>
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
						<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
							<ul class="nav navbar-nav nav_1">
								<li><a href="<%=basePath%>">首页</a></li>
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
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<div class="grid_3">
		<div class="container">
			<div class="breadcrumb1">
				<ul>
					<a href="<%=basePath%>"><i class="fa fa-home home_1"></i></a>
					<span class="divider">&nbsp;|&nbsp;</span>
					<li class="current-page">修改资料</li>
				</ul>
			</div>
			<div class="services">
				<div class="col-sm-6 col-sm-push-3 login_left">
					<form action="<%=basePath%>user?cmd=toedit&id=${user.userid}" method="post">
						<c:if test="${msg!=null}">
							<center style="color:red;">${msg}</center>
						</c:if>
						<div class="form-group">
							<label for="edit-name">用户名 <span class="form-required">*</span></label>
							<input type="text" id="edit-name" name="username" value="${user.username}" size="60" maxlength="60" class="form-text required">
						</div>
						<div class="form-group">
							<label for="edit-pass">密码 <span class="form-required">*</span></label>
							<input type="password" id="edit-pass" name="password" value="${user.password}" size="60" maxlength="128" class="form-text required">
						</div>
						<div class="form-group">
							<label for="edit-email">Email <span class="form-required">*</span></label>
							<input type="text" id="edit-email" name="email" value="${user.email}" size="60" maxlength="60" class="form-text required">
						</div>
						<div class="form-group">
							<label for="edit-height">身高 <span class="form-required">*</span></label>
							<input type="text" id="edit-height" name="height" value="${user.height}" size="60" maxlength="60" class="form-text required">
						</div>
						<div class="age_select">
							<label for="edit-bir">出生日期 <span class="form-required">*</span></label>
							<input type="text" id="edit-bir" name="birthday" value="${user.birthday}" size="60" maxlength="60" class="form-text required">
						</div>
						<div class="form-group form-group1">
							<label class="col-sm-7 control-lable">性别 : </label>
							<div class="col-sm-5">
								<div class="radios">
									<label for="radio-01" class="label_radio">
										<input type="radio" name="sex" value="male" <c:if test="${user.sex == 'male'}">checked="checked"</c:if>> 男
									</label>
									<label for="radio-02" class="label_radio">
										<input type="radio" name="sex" value="female" <c:if test="${user.sex == 'female'}">checked="checked"</c:if>> 女
									</label>
								</div>
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="form-group form-group1">
							<label class="col-sm-7 control-lable">婚姻状态 : </label>
							<div class="col-sm-5">
								<div class="radios">
									<label for="radio-01" class="label_radio">
										<input type="radio" name="marital_situatio" value="0" <c:if test="${!user.marital_situatio}">checked="checked"</c:if>> 未婚
									</label>
									<label for="radio-02" class="label_radio">
										<input type="radio" name="marital_situatio" value="1" <c:if test="${user.marital_situatio}">checked="checked"</c:if>> 已婚
									</label>
								</div>
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="form-group">
							<label for="edit-detail">描述 <span class="form-required">*</span></label>
							<textarea class="form-control bio" id="detail" name="detail" placeholder="" rows="3">${user.detail}</textarea>
						</div>
						<div class="form-actions">
							<center><input type="submit" id="edit-submit" value="修改" class="btn_1 submit"></center>
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
	<script>
		$('#edit-bir').calendar();
	</script>
</body>

</html>