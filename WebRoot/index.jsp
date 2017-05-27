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
		<link href="css/bootstrap-3.1.1.min.css" rel='stylesheet'
			type='text/css' />
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="js/jquery.min.js">
</script>
		<script src="js/bootstrap.min.js">
</script>
		<!-- Custom Theme files -->
		<link href="css/style.css" rel='stylesheet' type='text/css' />
		<link href="css/font-awesome.css" rel="stylesheet">
		<script>
$(document).ready(function() {
	$(".dropdown").hover(function() {
		$('.dropdown-menu', this).stop(true, true).slideDown("fast");
		$(this).toggleClass('open');
	}, function() {
		$('.dropdown-menu', this).stop(true, true).slideUp("fast");
		$(this).toggleClass('open');
	});
});
</script>
	</head>

	<body>
		<!-- ============================  Navigation Start =========================== -->
		<div class="navbar navbar-inverse-blue navbar">
			<!--<div class="navbar navbar-inverse-blue navbar-fixed-top">-->
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
					<a class="brand" href="/"><img src="images/logo.png" alt="logo">
					</a>
					<div class="pull-right">
						<nav class="navbar nav_bottom" role="navigation">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header nav_2">
							<button type="button"
								class="navbar-toggle collapsed navbar-toggle1"
								data-toggle="collapse" data-target="#bs-megadropdown-tabs">
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
								<c:if test="${user!=null}">
								<li class="dropdown js-user">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown">${user.username}<span
										class="caret"></span>
									</a>
									<ul class="dropdown-menu" role="menu">
										<li>
											<a href="<%=basePath%>user?cmd=info">个人中心</a>
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
					<div class="clearfix">
					</div>
				</div>
			</div>
		</div>
		<!-- end navbar-inverse-blue -->
		<!-- ============================  Navigation End ============================ -->
		<div class="banner">
			<div class="container">
				<div class="banner_info">
					<h3>
						Millions of verified Members
					</h3>
					<a href="view_profile.html" class="hvr-shutter-out-horizontal">Create
						your Profile</a>
				</div>
			</div>
			<div class="profile_search">
				<div class="container wrap_1">
					<form action="">
						<div class="search_top">
							<div class="inline-block">
								<label class="gender_1">
									I am looking for :
								</label>
								<div class="age_box1"
									style="max-width: 100%; display: inline-block;">
									<select>
										<option value="">
											* Select Gender
										</option>
										<option value="Male">
											Bride
										</option>
										<option value="Female">
											Groom
										</option>
									</select>
								</div>
							</div>
							<div class="inline-block">
								<label class="gender_1">
									Located In :
								</label>
								<div class="age_box1"
									style="max-width: 100%; display: inline-block;">
									<select>
										<option value="">
											* Select State
										</option>
										<option value="Washington">
											Washington
										</option>
										<option value="Texas">
											Texas
										</option>
										<option value="Georgia">
											Georgia
										</option>
										<option value="Virginia">
											Virginia
										</option>
										<option value="Colorado">
											Colorado
										</option>
									</select>
								</div>
							</div>
							<div class="inline-block">
								<label class="gender_1">
									Interested In :
								</label>
								<div class="age_box1"
									style="max-width: 100%; display: inline-block;">
									<select>
										<option value="">
											* Select Interest
										</option>
										<option value="Sports &amp; Adventure">
											Sports &amp; Adventure
										</option>
										<option value="Movies &amp; Entertainment">
											Movies &amp; Entertainment
										</option>
										<option value="Arts &amp; Science">
											Arts &amp; Science
										</option>
										<option value="Technology">
											Technology
										</option>
										<option value="Fashion">
											Fashion
										</option>
									</select>
								</div>
							</div>
						</div>
						<div class="inline-block">
							<div class="age_box2" style="max-width: 220px;">
								<label class="gender_1">
									Age :
								</label>
								<input class="transparent" placeholder="From:"
									style="width: 34%;" type="text" value="">
								&nbsp;-&nbsp;
								<input class="transparent" placeholder="To:" style="width: 34%;"
									type="text" value="">
							</div>
						</div>
						<div class="inline-block">
							<label class="gender_1">
								Status :
							</label>
							<div class="age_box1"
								style="max-width: 100%; display: inline-block;">
								<select>
									<option value="">
										* Select Status
									</option>
									<option value="Single">
										Single
									</option>
									<option value="Married">
										Married
									</option>
									<option value="In a Relationship">
										In a Relationship
									</option>
									<option value="It's Complicated">
										It's Complicated
									</option>
								</select>
							</div>
						</div>
						<div class="submit inline-block">
							<input id="submit-btn" class="hvr-wobble-vertical" type="submit"
								value="Find Matches">
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="copyrights">
			Collect from
			<a href="http://www.cssmoban.com/" title="网站模板">网站模板</a>
		</div>
		<div class="grid_1">
			<div class="container">
				<h1>
					Featured Profiles
				</h1>
				<div class="heart-divider">
					<span class="grey-line"></span>
					<i class="fa fa-heart pink-heart"></i>
					<i class="fa fa-heart grey-heart"></i>
					<span class="grey-line"></span>
				</div>
				<ul id="flexiselDemo3">
					<li>
						<div class="col_1">
							<a href="view_profile.html"> <img src="images/1.jpg" alt=""
									class="hover-animation image-zoom-in img-responsive" />
								<div
									class="layer m_1 hidden-link hover-animation delay1 fade-in">
									<div class="center-middle">
										About Him
									</div>
								</div>
								<h3>
									<span class="m_3">Profile ID : MI-387412</span>
									<br>
									28, Christian, Australia
									<br>
									Corporate
								</h3>
							</a>
						</div>
					</li>
					<li>
						<div class="col_1">
							<a href="view_profile.html"> <img src="images/2.jpg" alt=""
									class="hover-animation image-zoom-in img-responsive" />
								<div
									class="layer m_1 hidden-link hover-animation delay1 fade-in">
									<div class="center-middle">
										About Her
									</div>
								</div>
								<h3>
									<span class="m_3">Profile ID : MI-387412</span>
									<br>
									28, Christian, Australia
									<br>
									Corporate
								</h3>
							</a>
						</div>
					</li>
					<li>
						<div class="col_1">
							<a href="view_profile.html"> <img src="images/3.jpg" alt=""
									class="hover-animation image-zoom-in img-responsive" />
								<div
									class="layer m_1 hidden-link hover-animation delay1 fade-in">
									<div class="center-middle">
										About Him
									</div>
								</div>
								<h3>
									<span class="m_3">Profile ID : MI-387412</span>
									<br>
									28, Christian, Australia
									<br>
									Corporate
								</h3>
							</a>
						</div>
					</li>
					<li>
						<div class="col_1">
							<a href="view_profile.html"> <img src="images/4.jpg" alt=""
									class="hover-animation image-zoom-in img-responsive" />
								<div
									class="layer m_1 hidden-link hover-animation delay1 fade-in">
									<div class="center-middle">
										About Her
									</div>
								</div>
								<h3>
									<span class="m_3">Profile ID : MI-387412</span>
									<br>
									28, Christian, Australia
									<br>
									Corporate
								</h3>
							</a>
						</div>
					</li>
					<li>
						<div class="col_1">
							<a href="view_profile.html"> <img src="images/5.jpg" alt=""
									class="hover-animation image-zoom-in img-responsive" />
								<div
									class="layer m_1 hidden-link hover-animation delay1 fade-in">
									<div class="center-middle">
										About Him
									</div>
								</div>
								<h3>
									<span class="m_3">Profile ID : MI-387412</span>
									<br>
									28, Christian, Australia
									<br>
									Corporate
								</h3>
							</a>
						</div>
					</li>
					<li>
						<div class="col_1">
							<a href="view_profile.html"> <img src="images/6.jpg" alt=""
									class="hover-animation image-zoom-in img-responsive" />
								<div
									class="layer m_1 hidden-link hover-animation delay1 fade-in">
									<div class="center-middle">
										About Her
									</div>
								</div>
								<h3>
									<span class="m_3">Profile ID : MI-387412</span>
									<br>
									28, Christian, Australia
									<br>
									Corporate
								</h3>
							</a>
						</div>
					</li>
				</ul>
				<script type="text/javascript">
$(window).load(function() {
	$("#flexiselDemo3").flexisel( {
		visibleItems : 6,
		animationSpeed : 1000,
		autoPlay : false,
		autoPlaySpeed : 3000,
		pauseOnHover : true,
		enableResponsiveBreakpoints : true,
		responsiveBreakpoints : {
			portrait : {
				changePoint : 480,
				visibleItems : 1
			},
			landscape : {
				changePoint : 640,
				visibleItems : 2
			},
			tablet : {
				changePoint : 768,
				visibleItems : 3
			}
		}
	});

});
</script>
				<script type="text/javascript" src="js/jquery.flexisel.js">
</script>
			</div>
		</div>
		<div class="grid_2">
			<div class="container">
				<h2>
					Success Stories
				</h2>
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
									<span class="entry-1">Dec 20, 2015</span>
								</div>
								<div class="suceess_story-content-container">
									<figure class="suceess_story-content-featured-image">
									<img width="75" height="75" src="images/7.jpg"
										class="img-responsive" alt="" />
									</figure>
									<div class="suceess_story-content-info">
										<h4>
											<a href="#">Lorem & Ipsum</a>
										</h4>
										<p>
											There are many variations of passages of Lorem Ipsum
											available, but the majority have suffered alteration in some
											form,.
											<a href="#">More...</a>
										</p>
									</div>
								</div>
							</li>
							<li>
								<div class="suceess_story-date">
									<span class="entry-1">Dec 20, 2015</span>
								</div>
								<div class="suceess_story-content-container">
									<figure class="suceess_story-content-featured-image">
									<img width="75" height="75" src="images/8.jpg"
										class="img-responsive" alt="" />
									</figure>
									<div class="suceess_story-content-info">
										<h4>
											<a href="#">Lorem & Ipsum</a>
										</h4>
										<p>
											There are many variations of passages of Lorem Ipsum
											available, but the majority have suffered alteration in some
											form,.
											<a href="#">More...</a>
										</p>
									</div>
								</div>
							</li>
							<li>
								<div class="suceess_story-date">
									<span class="entry-1">Dec 20, 2015</span>
								</div>
								<div class="suceess_story-content-container">
									<figure class="suceess_story-content-featured-image">
									<img width="75" height="75" src="images/9.jpg"
										class="img-responsive" alt="" />
									</figure>
									<div class="suceess_story-content-info">
										<h4>
											<a href="#">Lorem & Ipsum</a>
										</h4>
										<p>
											There are many variations of passages of Lorem Ipsum
											available, but the majority have suffered alteration in some
											form,.
											<a href="#">More...</a>
										</p>
									</div>
								</div>
							</li>
							<li>
								<div class="suceess_story-date">
									<span class="entry-1">Dec 20, 2015</span>
								</div>
								<div class="suceess_story-content-container">
									<figure class="suceess_story-content-featured-image">
									<img width="75" height="75" src="images/10.jpg"
										class="img-responsive" alt="" />
									</figure>
									<div class="suceess_story-content-info">
										<h4>
											<a href="#">Lorem & Ipsum</a>
										</h4>
										<p>
											There are many variations of passages of Lorem Ipsum
											available, but the majority have suffered alteration in some
											form,.
											<a href="#">More...</a>
										</p>
									</div>
								</div>
							</li>
							<li>
								<div class="suceess_story-date">
									<span class="entry-1">Dec 20, 2015</span>
								</div>
								<div class="suceess_story-content-container">
									<figure class="suceess_story-content-featured-image">
									<img width="75" height="75" src="images/11.jpg"
										class="img-responsive" alt="" />
									</figure>
									<div class="suceess_story-content-info">
										<h4>
											<a href="#">Lorem & Ipsum</a>
										</h4>
										<p>
											There are many variations of passages of Lorem Ipsum
											available, but the majority have suffered alteration in some
											form,.
											<a href="#">More...</a>
										</p>
									</div>
								</div>
							</li>
							<li>
								<div class="suceess_story-date">
									<span class="entry-1">Dec 20, 2015</span>
								</div>
								<div class="suceess_story-content-container">
									<figure class="suceess_story-content-featured-image">
									<img width="75" height="75" src="images/12.jpg"
										class="img-responsive" alt="" />
									</figure>
									<div class="suceess_story-content-info">
										<h4>
											<a href="#">Lorem & Ipsum</a>
										</h4>
										<p>
											There are many variations of passages of Lorem Ipsum
											available, but the majority have suffered alteration in some
											form,.
											<a href="#">More...</a>
										</p>
									</div>
								</div>
							</li>
							<li>
								<div class="suceess_story-date">
									<span class="entry-1">Dec 20, 2015</span>
								</div>
								<div class="suceess_story-content-container">
									<figure class="suceess_story-content-featured-image">
									<img width="75" height="75" src="images/13.jpg"
										class="img-responsive" alt="" />
									</figure>
									<div class="suceess_story-content-info">
										<h4>
											<a href="#">Lorem & Ipsum</a>
										</h4>
										<p>
											There are many variations of passages of Lorem Ipsum
											available, but the majority have suffered alteration in some
											form,.
											<a href="#">More...</a>
										</p>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="col-md-4 row_1-right">
						<h3>
							News & Events
						</h3>
						<div class="box_1">
							<figure class="thumbnail1">
							<img width="170" height="155" src="images/14.jpg"
								class="img-responsive" alt="" />
							</figure>
							<div class="extra-wrap">
								<div class="post-meta">
									<span class="day"> <time
											datetime="2014-05-25T10:15:43+00:00">25</time> </span>
									<span class="month"> <time
											datetime="2014-05-25T10:11:51+00:00">May</time> </span>
								</div>
								<h4 class="post-title">
									<a href="#">There are many variations of passages</a>
								</h4>
								<div class="clearfix">
								</div>
								<div class="post-content">
									The standard chunk of Lorem Ipsum used since the 1500s..
								</div>
								<a href="#" class="vertical">Read More</a>
							</div>
						</div>
						<div class="box_1">
							<figure class="thumbnail1">
							<img width="170" height="155" src="images/15.jpg"
								class="img-responsive" alt="" />
							</figure>
							<div class="extra-wrap">
								<div class="post-meta">
									<span class="day"> <time
											datetime="2014-05-25T10:15:43+00:00">25</time> </span>
									<span class="month"> <time
											datetime="2014-05-25T10:11:51+00:00">May</time> </span>
								</div>
								<h4 class="post-title">
									<a href="#">There are many variations of passages</a>
								</h4>
								<div class="clearfix">
								</div>
								<div class="post-content">
									The standard chunk of Lorem Ipsum used since the 1500s..
								</div>
								<a href="#" class="vertical">Read More</a>
							</div>
						</div>
						<div class="box_2">
							<figure class="thumbnail1">
							<img width="170" height="155" src="images/1.jpg"
								class="img-responsive" alt="" />
							</figure>
							<div class="extra-wrap">
								<div class="post-meta">
									<span class="day"> <time
											datetime="2014-05-25T10:15:43+00:00">25</time> </span>
									<span class="month"> <time
											datetime="2014-05-25T10:11:51+00:00">May</time> </span>
								</div>
								<h4 class="post-title">
									<a href="#">There are many variations of passages</a>
								</h4>
								<div class="clearfix">
								</div>
								<div class="post-content">
									The standard chunk of Lorem Ipsum used since the 1500s..
								</div>
								<a href="#" class="vertical">Read More</a>
							</div>
						</div>
						<div class="religion">
							<div class="religion_1-title">
								Religion :
							</div>
							<a href="#" target="_blank" class="religion_1"
								title="Hindu Matrimonial" style="padding-left: 0px !important;">Hindu</a>
							<span>|</span><a href="#" target="_blank" class="religion_1"
								title="Muslim Matrimonial">Muslim</a>
							<span>|</span><a href="#" target="_blank" class="religion_1"
								title="Christian Matrimonial">Christian</a>
							<span>|</span><a href="#" target="_blank" class="religion_1"
								title="Sikh Matrimonial">Sikh</a>
							<span>|</span><a href="#" target="_blank" class="religion_1"
								title="Inter Religion Matrimonial">Inter Religion</a>
						</div>
						<div class="religion">
							<div class="religion_1-title">
								Country :
							</div>
							<a href="#" target="_blank" class="religion_1"
								title="Hindu Matrimonial" style="padding-left: 0px !important;">India</a>
							<span>|</span><a href="#" target="_blank" class="religion_1"
								title="Muslim Matrimonial">Australia</a>
							<span>|</span><a href="#" target="_blank" class="religion_1"
								title="Christian Matrimonial">Russia</a>
							<span>|</span><a href="#" target="_blank" class="religion_1"
								title="Sikh Matrimonial">India</a>
							<span>|</span><a href="#" target="_blank" class="religion_1"
								title="Inter Religion Matrimonial">Kuwait</a>
							<span>|</span><a href="#" target="_blank" class="religion_1"
								title="Inter Religion Matrimonial">Uk</a>
							<span>|</span><a href="#" target="_blank" class="religion_1"
								title="Inter Religion Matrimonial">View All</a>
						</div>
						<div class="religion">
							<div class="religion_1-title">
								Caste :
							</div>
							<a href="#" target="_blank" class="religion_1"
								title="Hindu Matrimonial" style="padding-left: 0px !important;">Brahmin</a>
							<span>|</span><a href="#" target="_blank" class="religion_1"
								title="Muslim Matrimonial">Kapu</a>
							<span>|</span><a href="#" target="_blank" class="religion_1"
								title="Christian Matrimonial">Kamma</a>
							<span>|</span><a href="#" target="_blank" class="religion_1"
								title="Sikh Matrimonial">Padmasali</a>
							<span>|</span><a href="#" target="_blank" class="religion_1"
								title="Inter Religion Matrimonial">Reddy</a>
							<span>|</span><a href="#" target="_blank" class="religion_1"
								title="Inter Religion Matrimonial">View All</a>
						</div>
						<div class="religion">
							<div class="religion_1-title">
								Regional :
							</div>
							<a href="#" target="_blank" class="religion_1"
								title="Hindu Matrimonial" style="padding-left: 0px !important;">Urdu</a>
							<span>|</span><a href="#" target="_blank" class="religion_1"
								title="Muslim Matrimonial">Hindi</a>
							<span>|</span><a href="#" target="_blank" class="religion_1"
								title="Christian Matrimonial">Telugu</a>
							<span>|</span><a href="#" target="_blank" class="religion_1"
								title="Sikh Matrimonial">Marwadi</a>
							<span>|</span><a href="#" target="_blank" class="religion_1"
								title="Inter Religion Matrimonial">Oriya</a>
							<span>|</span><a href="#" target="_blank" class="religion_1"
								title="Inter Religion Matrimonial">View All</a>
						</div>
					</div>
					<div class="clearfix">
					</div>
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