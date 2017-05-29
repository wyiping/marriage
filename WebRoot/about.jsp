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
    <title>关于我们</title>
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
					<li class="current-page">关于我们</li>
				</ul>
			</div>
			<div class="about">
				<div class="col-md-6 about_left">
					<img src="images/a3.jpg" class="img-responsive" alt="" />
				</div>
				<div class="col-md-6 about_right">
					<h1>关于我们</h1>
					<p>一个致力于帮助所有单身的人寻找爱情，遇到爱情，收获爱情，享受爱情的网站！</p>
					<div class="accordation">
						<div class="jb-accordion-wrapper">
							<div id="accordion-1-" class="jb-accordion-content collapse in" style="height: auto;">
								<p>美好的爱情依然存在，只是稀少，因为大家的勇气不见了。你有太多选择，对方也一样。没人跟你死磕，你还磕个什么劲儿啊!</p>
							</div>
						</div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<div class="about_middle">
		<div class="container">
			<h2>Happy Clients</h2>
			<div class="about_middle-grid1">
				<div class="col-sm-6 testi_grid list-item-0">
					<blockquote class="testi_grid_blockquote">
						<figure class="featured-thumbnail">
							<img src="images/a1.jpg" class="img-responsive" alt="" />
						</figure>
						<div><a href="javascript:void(0)"> 一份真正的感情，需要彼此的珍惜;一份执着的守望，需要彼此的用心。不是所有的等待，都能守候成美丽的风景，不是所有的感情，都能成为美丽的故事。用心珍惜每一份爱，用心付出每一份情。爱，在珍惜里，温暖;情，在守候里，长久。</a>
							<div class="clearfix"></div>
						</div>
					</blockquote>
				</div>
				<div class="col-sm-6 testi_grid list-item-1">
					<blockquote class="testi_grid_blockquote">
						<figure class="featured-thumbnail">
							<img src="images/a2.jpg" class="img-responsive" alt="" />
						</figure>
						<div><a href="javascript:void(0)">认识你之后，和你一起，我在乎你，因为我爱你，但我不会挑剔你，伤害你，我能理解你，你的每一句话，每个动作我都很在意，可我不会发火，因为我的某些方面也有不足，我们一起前行。</a>
							<div class="clearfix"></div>
						</div>
					</blockquote>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="about_middle-grid2">
				<div class="col-sm-6 testi_grid list-item-0">
					<blockquote class="testi_grid_blockquote">
						<figure class="featured-thumbnail">
							<img src="images/a1.jpg" class="img-responsive" alt="" />
						</figure>
						<div><a href="javascript:void(0)">我可能比之前稍微理性一点吧，之前是看到一个，咣，我就直接就飞过去了这样，也不管是什么，对，那我觉得，其实爱情是一个很狡猾的东西。</a>
							<div class="clearfix"></div>
						</div>
					</blockquote>
				</div>
				<div class="col-sm-6 testi_grid list-item-1">
					<blockquote class="testi_grid_blockquote">
						<figure class="featured-thumbnail">
							<img src="images/a2.jpg" class="img-responsive" alt="" />
						</figure>
						<div><a href="javascript:void(0)">敢作敢当，爱了就应该面对这份爱所带来的一切压力，这是我性格的一部分，也是我人格的一部分。这些优点抑或缺点铸就了今天的我，我只是选择面对和接受这样一个真实但不完美的我自己。</a>
							<div class="clearfix"></div>
						</div>
					</blockquote>
				</div>
				<div class="clearfix"> </div>
			</div>
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