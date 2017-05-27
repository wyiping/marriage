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
		<base href="<%=basePath%>">
		<title>用户管理</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/theme.css">
		<script src="<%=basePath%>js/jquery.min.js" type="text/javascript"></script>
	</head>

	<body class="content1">
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="well">
					<table class="table">
						<thead>
							<c:if test="${msg!=null}">
								<tr><td colspan="8"><center style="color:red;">${msg}</center></td></tr>
							</c:if>
							<tr>
								<th>用户ID</th>
								<th>用户名</th>
								<th>性别</th>
								<th>生日</th>
								<th>身高</th>
								<th>状态</th>
								<th>角色</th>
								<th style="width: 90px;">
									编辑
								</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pager.list}" var="item">
								<tr>
									<td>${item.userid}</td>
									<td>${item.username}</td>
									<td>${item.sex}</td>
									<td>${item.birthday}</td>
									<td>${item.height}</td>
									<td>
										<c:choose>
											<c:when test="${item.marital_situatio=='0'}">
												未婚		
											</c:when>
											<c:otherwise>已婚</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${item.role=='admin'}">
												管理员
											</c:when>
											<c:otherwise>用户</c:otherwise>
										</c:choose>
									</td>
									<td>
										<a href="<%=basePath%>admin?cmd=upreedit&id=${item.userid}">编辑</a>
										<a href="<%=basePath%>admin?cmd=userdel&id=${item.userid}">删除</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="pagination pagination-right">
						<ul>
							<li>
								<a>共计：${pager.pagectrl.pagecount}页/${pager.pagectrl.rscount}条记录</a>
							</li>
							
							<li>
								<c:if test="${pager.pagectrl.currentindex==1}" var="fp">
									<a style="disabled:true">上一页</a>
								</c:if>
								<c:if test="${!fp}">
									<a href="<%=basePath%>admin?cmd=userlist&index=${pager.pagectrl.currentindex-1}">上一页</a>
								</c:if>
							</li>						
							<c:forEach begin="${pager.pagectrl.minpage}" step="1" end="${pager.pagectrl.maxpage}" var="index">
							<li>
								<c:if test="${pager.pagectrl.currentindex==index}" var="t">
									<a style="color:red;background-color:#bbb">${index}</a>
								</c:if>
								<c:if test="${!t}">
								<a href="<%=basePath%>admin?cmd=userlist&index=${index}">${index}</a>
								</c:if>
							</li>
							</c:forEach>
							
							<li>
								<c:if test="${pager.pagectrl.currentindex==pager.pagectrl.pagecount}" var="fp">
									<a style="disabled:true">下一页</a>
								</c:if>
								<c:if test="${!fp}">
									<a href="<%=basePath%>admin?cmd=userlist&index=${pager.pagectrl.currentindex+1}">下一页</a>
								</c:if>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
