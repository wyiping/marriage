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
    <title>${u.name}的资料</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css' />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- Custom Theme files -->
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <link href="css/font-awesome.css" rel="stylesheet">
    <script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
	<link href="css/popup.css" rel="stylesheet" type="text/css">
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
					<li class="current-page">个人资料</li>
				</ul>
			</div>
			<div class="profile">
				<div class="col-md-8 profile_left">
					<h2>用户 Id : ${u.userid}</h2>
					<div class="col_3">
						<div class="col-sm-4 row_2">
							<div class="flexslider">
								<ul class="slides">
									<li><img style="width:200px;" src="images/avatar/${u.avatar}"  onerror="this.src='<c:choose><c:when test="${u.sex=='male'}">images/boy.png</c:when><c:otherwise>images/girl.png</c:otherwise></c:choose>'"/></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-8 row_1">
							<table class="table_working_hours">
								<tbody>
									<tr class="opened_1">
										<td class="day_label1">用户:</td>
										<td class="day_value">${u.username}</td>
									</tr>
									<tr class="opened">
										<td class="day_label1">性别:</td>
										<td class="day_value">
											<c:choose>
												<c:when test="${u.sex=='male'}">
													男
												</c:when>
												<c:otherwise>女</c:otherwise>
											</c:choose>										
										</td>
									</tr>
									<tr class="opened_1">
										<td class="day_label1">年龄:</td>
										<td class="day_value">${u.age}岁</td>
									</tr>
									<tr class="opened">
										<td class="day_label1">身高:</td>
										<td class="day_value">${u.height}CM</td>
									</tr>
									<tr class="opened">
										<td class="day_label1">邮箱:</td>
										<td class="day_value">${u.email}</td>
									</tr>
									<tr class="opened">
										<td class="day_label1">婚姻状态:</td>
										<td class="day_value">
											<c:choose>
												<c:when test="${u.marital_situatio=='0'}">
													未婚		
												</c:when>
												<c:otherwise>已婚</c:otherwise>
											</c:choose>							
										</td>
									</tr>
								</tbody>
							</table>
							<c:choose>
								<c:when test="${user == null}">
									<ul class="login_details">
										<li>登录后给TA留言 <a href="login.jsp">登录</a></li>
										<li>不是会员？ <a href="register.jsp">免费注册</a></li>
									</ul>
								</c:when>
								<c:otherwise>
									<div class="buttons">
										<a class="popup-with-zoom-anim order-btn col-md-2" href="#small-dialog">留言</a>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div id="small-dialog" class="mfp-hide">
						<div class="pop_up">
						<div class="payment-online-form-left">
							<form action="<%=basePath%>message?cmd=send&receiver=${u.userid}" method="post">
								<h4>给他留言</h4>
								<textarea rows="6" style="width: 100%;" name="message"></textarea>
								<ul class="payment-sendbtns">
									<li><input type="submit" value="提交"></li>
								</ul>
								<div class="clearfix"> </div>
							</form>
						</div>
						</div>
					</div>
					<div class="col_4">
						<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
							<ul id="myTab" class="nav nav-tabs nav-tabs1" role="tablist">
								<li role="presentation" class="active"><a href="#myself" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">个人资料</a></li>
								<li role="presentation"><a href="#family" role="tab" id="profile-tab" data-toggle="tab">家庭资料</a></li>
							</ul>
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane fade in active" id="myself" aria-labelledby="home-tab">
									<div class="tab_box">
										<h1>${u.detail}</h1>
										<p></p>
									</div>
									<div class="basic_1">
										<h3>基本资料</h3>
										<div class="col-md-6 basic_1-left">
											<table class="table_working_hours">
												<tbody>
													<tr class="opened_1">
														<td class="day_label">姓名:</td>
														<td class="day_value">${u.name}</td>
													</tr>
													<tr class="opened">
														<td class="day_label">婚姻状态:</td>
														<td class="day_value">
															<c:choose>
																<c:when test="${u.marital_situatio=='0'}">
																	未婚		
																</c:when>
																<c:otherwise>已婚</c:otherwise>
															</c:choose>					
														</td>
													</tr>
													<tr class="opened">
														<td class="day_label">身高 :</td>
														<td class="day_value">${u.height }cm</td>
													</tr>
													<tr class="opened">
														<td class="day_label">年龄:</td>
														<td class="day_value closed"><span>${u.age}</span></td>
													</tr>
													<tr class="opened">
														<td class="day_label">资料:</td>
														<td class="day_value closed"><span>自己</span></td>
													</tr>
													<tr class="opened">
														<td class="day_label">饮酒 :</td>
														<td class="day_value closed"><span>不</span></td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="col-md-6 basic_1-left">
											<table class="table_working_hours">
												<tbody>
													<tr class="opened_1">
														<td class="day_label">年龄 :</td>
														<td class="day_value">${u.age}</td>
													</tr>
													<tr class="opened">
														<td class="day_label">生日 :</td>
														<td class="day_value">${u.birthday}</td>
													</tr>
													<tr class="opened">
														<td class="day_label">体重 :</td>
														<td class="day_value">60KG</td>
													</tr>
													<tr class="opened">
														<td class="day_label">血型:</td>
														<td class="day_value">B+</td>
													</tr>
													<tr class="closed">
														<td class="day_label">饮食 :</td>
														<td class="day_value closed"><span>正常</span></td>
													</tr>
													<tr class="closed">
														<td class="day_label">吸烟 :</td>
														<td class="day_value closed"><span>不</span></td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="clearfix"> </div>
									</div>
									<div class="basic_1 basic_2">
										<h3>教育经历</h3>
										<div class="basic_1-left">
											<table class="table_working_hours">
												<tbody>
													<tr class="opened">
														<td class="day_label">学历 :</td>
														<td class="day_value">本科</td>
													</tr>
													<tr class="opened">
														<td class="day_label">学校:</td>
														<td class="day_value">中北大学</td>
													</tr>
													<tr class="opened">
														<td class="day_label">专业:</td>
														<td class="day_value closed"><span>软件工程</span></td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="clearfix"> </div>
									</div>
								</div>
								<div role="tabpanel" class="tab-pane fade" id="family" aria-labelledby="profile-tab">
									<div class="basic_3">
										<h4>家庭详细资料</h4>
										<div class="basic_1 basic_2">
											<h3>无详细资料</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 profile_right">
					<div class="newsletter">
						<form action="<%=basePath%>home">
							<input type="hidden" value="profile" name="cmd" />
							<input type="text" name="id" size="30" required="" placeholder="请输入用户 ID :">
							<input type="submit" value="Go">
						</form>
					</div>
					<div class="view_profile">
						<h3>最近访客</h3>
						<c:forEach items="${visited}" var="user" begin="0" end="3">
						<ul class="profile_item">
							<a href="<%=basePath%>home?cmd=profile&id=${user.userid}">
								<li class="profile_item-img">
									<img src="<%=basePath%>images/avatar/${user.avatar}" class="hover-animation image-zoom-in img-responsive" onerror="this.src='<c:choose><c:when test="${user.sex=='male'}">images/boy.png</c:when><c:otherwise>images/girl.png</c:otherwise></c:choose>'"/>
								</li>
								<li class="profile_item-desc">
									<h4>${user.username}</h4>
									${user.age}岁<br>
                                	${user.height}CM
									<h5>看看Ta的资料</h5>
								</li>
								<div class="clearfix"> </div>
							</a>
						</ul>
						</c:forEach>
					</div>
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
    
    <script>
		$(document).ready(function () {
			$('.popup-with-zoom-anim').magnificPopup({
				type: 'inline',
				fixedContentPos: false,
				fixedBgPos: true,
				overflowY: 'auto',
				closeBtnInside: true,
				preloader: false,
				midClick: true,
				removalDelay: 300,
				mainClass: 'my-mfp-zoom-in'
			});
		});
	</script>
</body>
</html>