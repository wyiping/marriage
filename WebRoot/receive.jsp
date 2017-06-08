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
    <title>收件箱</title>
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
					<li class="current-page">收到的消息</li>
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
			<div class="col-md-9 members_box2">
				<h3>收件箱</h3>
				<div class="col_4">
					<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
						<ul id="myTab" class="nav nav-tabs nav-tabs1" role="tablist">
							<li role="presentation" class="active"><a href="#receive" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">全部</a></li>
						</ul>
						<div id="myTabContent" class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active" id="receive" aria-labelledby="home-tab">
								<ul class="pagination pagination_1">
									<c:forEach begin="${pager.pagectrl.minpage}" step="1" end="${pager.pagectrl.maxpage}" var="index">
										<c:if test="${pager.pagectrl.currentindex==index}" var="t">
											<li class="active"><a>${index}</a></li>
										</c:if>
										<c:if test="${!t}">
											<li><a href="<%=basePath%>message?cmd=receive&index=${index}">${index}</a></li>
										</c:if>
									</c:forEach>
								</ul>
								<div class="clearfix"> </div>
								<c:forEach items="${pager.list}" var="receiver">
								<div class="jobs-item with-thumb">
									<div class="thumb_top">
										<div class="thumb"><a href="<%=basePath%>home?cmd=profile&id=${receiver.sender}"><img src="images/boy.png" class="img-responsive" alt=""/></a></div>
										<div class="jobs_right">
											<h6 class="title"><a href="<%=basePath%>home?cmd=profile&id=${receiver.sender}">用户ID(${receiver.sender})</a></h6>
											<ul class="top-btns">
												<li><a href="#" class="">${receiver.status}</a></li>
												<li><a href="<%=basePath%>message?cmd=del&mid=${receiver.mid}">删除</a></li>
											</ul>
											<ul class="login_details1">
												<li>${receiver.time}</li>
											</ul>
											<p class="description"><a href="<%=basePath%>message?cmd=read&mid=${receiver.mid}">${receiver.message}</a></p>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
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