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
					<li class="current-page">会员</li>
				</ul>
			</div>
			<div class="col-md-3 col_5">
				<ul class="match_box">
					<h4>查找</h4>
				</ul>
				<ul class="menu">
					<li class="item1">
						<h3 class="m_2">创建时间</h3>
						<ul class="cute">
							<li class="subitem1"><a href="#">一周内（2）</a></li>
							<li class="subitem2"><a href="#">一月内（4）</a></li>
						</ul>
					</li>
					<li class="item1">
						<h3 class="m_2">资料类型</h3>
						<ul class="cute">
							<li class="subitem1"><a href="#">有照片（4） </a></li>
						</ul>
					</li>
					<li class="item1">
						<h3 class="m_2">婚姻状态</h3>
						<ul class="cute">
							<li class="subitem1"><a href="#">未婚（3） </a></li>
							<li class="subitem1"><a href="#">离异（2） </a></li>
						</ul>
					</li>
					<li class="item1">
						<h3 class="m_2">母语</h3>
						<ul class="cute">
							<li class="subitem1"><a href="#">汉语 </a></li>
							<li class="subitem1"><a href="#">英语 </a></li>
						</ul>
					</li>
					<li class="item1">
						<h3 class="m_2">教育水平</h3>
						<ul class="cute">
							<li class="subitem1"><a href="#">高中（3）</a></li>
							<li class="subitem1"><a href="#">本科（4） </a></li>
							<li class="subitem1"><a href="#">研究生（5） </a></li>
							<li class="subitem1"><a href="#">博士（3） </a></li>
						</ul>
					</li>
					<li class="item1">
						<h3 class="m_2">职业</h3>
						<ul class="cute">
							<li class="subitem1"><a href="#">工程师（2） </a></li>
							<li class="subitem1"><a href="#">IT（3）</a></li>
							<li class="subitem1"><a href="#">教师（3） </a></li>
						</ul>
					</li>
					<li class="item1">
						<h3 class="m_2">健康状态</h3>
						<ul class="cute">
							<li class="subitem1"><a href="#">正常 </a></li>
						</ul>
					</li>
					<li class="item1">
						<h3 class="m_2">饮食</h3>
						<ul class="cute">
							<li class="subitem1"><a href="#">素食主义（4）</a></li>
						</ul>
					</li>
					<li class="item1">
						<h3 class="m_2">吸烟</h3>
						<ul class="cute">
							<li class="subitem1"><a href="#">从不（4）</a></li>
							<li class="subitem1"><a href="#">偶尔（3） </a></li>
						</ul>
					</li>
					<li class="item1">
						<h3 class="m_2">爱好</h3>
						<ul class="cute">
							<li class="subitem1"><a href="#">运动（4）</a></li>
							<li class="subitem1"><a href="#">篮球（5）</a></li>
							<li class="subitem1"><a href="#">足球（3） </a></li>
						</ul>
					</li>
				</ul>
			</div>
			<div class="col-md-9 profile_left2">
			<c:forEach items="${pager.list}" var="user">
				<div class="profile_top">
					<a href="<%=basePath%>home?cmd=profile&id=${user.userid}">
						<div class="col-sm-3 profile_left-top">
							<img src="<%=basePath%>>images/avatar/${user.avatar}" class="img-responsive" onerror="this.src='<c:choose><c:when test="${user.sex=='male'}">images/boy.png</c:when><c:otherwise>images/girl.png</c:otherwise></c:choose>'"/>
						</div>
						<div class="col-sm-3">
							<ul class="login_details1">
								<li>
									<p>"${user.detail}" </p>
								</li>
							</ul>
						</div>
						<div class="col-sm-6">
							<table class="table_working_hours">
								<tbody>
									<tr class="opened_1">
										<td class="day_label1">用户:</td>
										<td class="day_value">${user.username}</td>
									</tr>
									<tr class="opened">
										<td class="day_label1">性别:</td>
										<td class="day_value">
											<c:choose>
												<c:when test="${user.sex=='male'}">
													男
												</c:when>
												<c:otherwise>女</c:otherwise>
											</c:choose>										
										</td>
									</tr>
									<tr class="opened_1">
										<td class="day_label1">年龄:</td>
										<td class="day_value">${user.age}岁</td>
									</tr>
									<tr class="opened">
										<td class="day_label1">身高:</td>
										<td class="day_value">${user.height}CM</td>
									</tr>
									<tr class="opened">
										<td class="day_label1">邮箱:</td>
										<td class="day_value">${user.email}</td>
									</tr>
									<tr class="opened">
										<td class="day_label1">婚姻状态:</td>
										<td class="day_value">
											<c:choose>
												<c:when test="${user.marital_situatio=='0'}">
													未婚		
												</c:when>
												<c:otherwise>离异</c:otherwise>
											</c:choose>										
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="clearfix"> </div>
					</a>
				</div>
			</c:forEach>
			<nav class="Page navigatio">
			<center>
				<ul class="pagination">
					<li>
						<c:if test="${pager.pagectrl.currentindex==1}" var="fp">
							<a style="disabled:true">上一页</a>
						</c:if>
						<c:if test="${!fp}">
							<a href="<%=basePath%>home?cmd=members&index=${pager.pagectrl.currentindex-1}">上一页</a>
						</c:if>
					</li>						
					<c:forEach begin="${pager.pagectrl.minpage}" step="1" end="${pager.pagectrl.maxpage}" var="index">
					<li>
						<c:if test="${pager.pagectrl.currentindex==index}" var="t">
							<a style="color:red;background-color:#bbb">${index}</a>
						</c:if>
						<c:if test="${!t}">
						<a href="<%=basePath%>home?cmd=members&index=${index}">${index}</a>
						</c:if>
					</li>
					</c:forEach>
					
					<li>
						<c:if test="${pager.pagectrl.currentindex==pager.pagectrl.pagecount}" var="fp">
							<a style="disabled:true">下一页</a>
						</c:if>
						<c:if test="${!fp}">
							<a href="<%=basePath%>home?cmd=members&index=${pager.pagectrl.currentindex+1}">下一页</a>
						</c:if>
					</li>
				</ul>
			</center>
			</nav>
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
</body>
</html>