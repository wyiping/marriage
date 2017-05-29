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
                                	<option value="">无所谓</option>
                                	<option value="155" selected>155</option>
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
                            <input class="transparent" style="width: 30%;" type="text" name="age" placeholder="min">
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
            <c:forEach items="${users}" var="u">
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
    
    <div class="grid_2">
	<div class="container">
		<h2>成功故事</h2>
       	<div class="heart-divider">
			<span class="grey-line"></span>
			<i class="fa fa-heart pink-heart"></i>
			<i class="fa fa-heart grey-heart"></i>
			<span class="grey-line"></span>
        </div>
        <div class="row_1">
	     <div class="col-md-8 suceess_story">
	         <ul> 
			   <li>
				  	<div class="suceess_story-date">
						<span class="entry-1">2013年09月01日</span>
					</div>
					<div class="suceess_story-content-container">
						<figure class="suceess_story-content-featured-image">
						   <img width="75" height="75" src="images/7.jpg" class="img-responsive" alt=""/>				            
					    </figure>
						<div class="suceess_story-content-info">
				        	<h4><a href="#">冰天雪地 &雪落有声</a></h4>				        	
				        	<p>我们终于在一起了，感谢网站给了我们这个的平台。希望更多的单身朋友能够在这里找到自己的另一半。</p>
				        </div>
				    </div>
				</li>
	            <li>
				  	<div class="suceess_story-date">
						<span class="entry-1">2016年12月25日</span>
					</div>
					<div class="suceess_story-content-container">
						<figure class="suceess_story-content-featured-image">
						   <img width="75" height="75" src="images/8.jpg" class="img-responsive" alt=""/>				            
					    </figure>
						<div class="suceess_story-content-info">
				        	<h4><a href="#">留恋 & 可儿</a></h4>
				        	<p>我们终于在一起了，感谢网站给了我们这个的平台。希望更多的单身朋友能够在这里找到自己的另一半。</p>			        	
				        </div>
				    </div>
				</li>
	            <li>
				  	<div class="suceess_story-date">
						<span class="entry-1">2016年11月29日</span>
					</div>
					<div class="suceess_story-content-container">
						<figure class="suceess_story-content-featured-image">
						   <img width="75" height="75" src="images/9.jpg" class="img-responsive" alt=""/>				            
					    </figure>
						<div class="suceess_story-content-info">
				        	<h4><a href="#">gkyj & 盏心</a></h4>
				        	<p>我们终于在一起了，感谢网站给了我们这个的平台。希望更多的单身朋友能够在这里找到自己的另一半。</p>
				        </div>
				    </div>
				</li>
	            <li>
				  	<div class="suceess_story-date">
						<span class="entry-1">2017年01月01日</span>
					</div>
					<div class="suceess_story-content-container">
						<figure class="suceess_story-content-featured-image">
						   <img width="75" height="75" src="images/10.jpg" class="img-responsive" alt=""/>				            
					    </figure>
						<div class="suceess_story-content-info">
				        	<h4><a href="#">米兰 & 缘分</a></h4>
							<p>我们终于在一起了，感谢网站给了我们这个的平台。希望更多的单身朋友能够在这里找到自己的另一半。</p>
				        </div>
				    </div>
				</li>
	            <li>
				  	<div class="suceess_story-date">
						<span class="entry-1">2017年04月01日</span>
					</div>
					<div class="suceess_story-content-container">
						<figure class="suceess_story-content-featured-image">
						   <img width="75" height="75" src="images/11.jpg" class="img-responsive" alt=""/>				            
					    </figure>
						<div class="suceess_story-content-info">
				        	<h4><a href="#">翩若惊鸿 & 猫♨☞</a></h4>
				        	<p>我们终于在一起了，感谢网站给了我们这个的平台。希望更多的单身朋友能够在这里找到自己的另一半。</p>
				        </div>
				    </div>
				</li>
	            <li>
				  	<div class="suceess_story-date">
						<span class="entry-1">2017年04月25日</span>
					</div>
					<div class="suceess_story-content-container">
						<figure class="suceess_story-content-featured-image">
						   <img width="75" height="75" src="images/12.jpg" class="img-responsive" alt=""/>				            
					    </figure>
						<div class="suceess_story-content-info">
				        	<h4><a href="#">茄子 & 小嫚儿</a></h4>
				        	<p>我们终于在一起了，感谢网站给了我们这个的平台。希望更多的单身朋友能够在这里找到自己的另一半。</p>
				        </div>
				    </div>
				</li>
	            <li>
				  	<div class="suceess_story-date">
						<span class="entry-1">2017年06月01日</span>
					</div>
					<div class="suceess_story-content-container">
						<figure class="suceess_story-content-featured-image">
						   <img width="75" height="75" src="images/13.jpg" class="img-responsive" alt=""/>				            
					    </figure>
						<div class="suceess_story-content-info">
				        	<h4><a href="#">毛毛虫 & 大宝</a></h4>
				        	<p>我们终于在一起了，感谢网站给了我们这个的平台。希望更多的单身朋友能够在这里找到自己的另一半。</p>
				        </div>
				    </div>
				</li>
	        </ul>
	    </div>
	    <div class="col-md-4 row_1-right">
	      <h3>爱情语录</h3>
	        <div class="box_1">
		      <figure class="thumbnail1"><img width="170" height="155" src="images/14.jpg" class="img-responsive" alt=""/></figure>
			  <div class="extra-wrap">
				<div class="post-meta">
					<span class="day">
					<time>25</time>
					</span>
					<span class="month">
					<time>5月</time>
					</span>
				</div>
				<h4 class="post-title"><a href="#">一份真正的感情，需要彼此的珍惜。</a></h4>
				<div class="clearfix"> </div>
				<a href="#" class="vertical">查看</a>
			  </div>
	        </div>
	        <div class="box_1">
		      <figure class="thumbnail1"><img width="170" height="155" src="images/15.jpg" class="img-responsive" alt=""/></figure>
			  <div class="extra-wrap">
				<div class="post-meta">
					<span class="day">
					<time>25</time>
					</span>
					<span class="month">
					<time>5月</time>
					</span>
				</div>
				<h4 class="post-title"><a href="#">一份执着的守望，需要彼此的用心。</a></h4>
				<div class="clearfix"> </div>
				<a href="#" class="vertical">查看</a>
			  </div>
	        </div>
	        <div class="box_1">
		      <figure class="thumbnail1"><img width="170" height="155" src="images/1.jpg" class="img-responsive" alt=""/></figure>
			  <div class="extra-wrap">
				<div class="post-meta">
					<span class="day">
					<time>25</time>
					</span>
					<span class="month">
					<time>5月y</time>
					</span>
				</div>
				<h4 class="post-title"><a href="#">不是所有的等待，都能守候成美丽的风景，不是所有的感情，都能成为美丽的故事。</a></h4>
				<div class="clearfix"> </div>
				<a href="#" class="vertical">查看</a>
			  </div>
	        </div>
	        <div class="box_1">
		      <figure class="thumbnail1"><img width="170" height="155" src="images/2.jpg" class="img-responsive" alt=""/></figure>
			  <div class="extra-wrap">
				<div class="post-meta">
					<span class="day">
					<time>25</time>
					</span>
					<span class="month">
					<time>5月y</time>
					</span>
				</div>
				<h4 class="post-title"><a href="#">用心珍惜每一份爱，用心付出每一份情。</a></h4>
				<div class="clearfix"> </div>
				<a href="#" class="vertical">查看</a>
			  </div>
	        </div>
	        <div class="box_1">
		      <figure class="thumbnail1"><img width="170" height="155" src="images/3.jpg" class="img-responsive" alt=""/></figure>
			  <div class="extra-wrap">
				<div class="post-meta">
					<span class="day">
					<time>25</time>
					</span>
					<span class="month">
					<time>5月y</time>
					</span>
				</div>
				<h4 class="post-title"><a href="#">爱，在珍惜里，温暖;情，在守候里，长久。</a></h4>
				<div class="clearfix"> </div>
				<a href="#" class="vertical">查看</a>
			  </div>
	        </div>
	     </div>
	     <div class="clearfix"> </div>
	   </div> 
	  </div>
    </div>
    
    <div class="bg">
		<div class="container"> 
			<h3>Love Story</h3>
			<div class="heart-divider">
				<span class="grey-line"></span>
				<i class="fa fa-heart pink-heart"></i>
				<i class="fa fa-heart grey-heart"></i>
				<span class="grey-line"></span>
            </div>
            <div class="col-sm-6">
            	<div class="bg_left">
            		<h4>一</h4>
            		<h5>　</h5>
            		<p>那一年，他们高三。在同一所学校，而一个是理科，一个文科。有一天，他和平常一样去上早自习，猛然看见她的身影。原来她搬到他家楼下。从那时，他就期待下晚自习，那样他便可以跟着她后面。就这样，高考结束了。他也没有表明。而她却一直在等他。</p>
            	</div>
            </div>
            <div class="col-sm-6">
            	<div class="bg_left">
            		<h4>二</h4>
            		<h5>　</h5>
            		<p>他喜欢她，却不知道她的心意，他静静地看着她，开口说“我想开始新的生活，我不想错过你”。她笑着说“做朋友吧”他只能答应了。一个月后，她说“不知道为什么，看见你跟别的女生在一起开玩笑，我心会痛。”他宠溺地说“那我们开始吧”。故事从这里开始，从爱开始。</p>
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