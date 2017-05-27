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

		<title>新增用户</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/theme.css">
		<link href="<%=basePath%>css/calendar.css" rel='stylesheet' type='text/css' />
		<script src="<%=basePath%>js/jquery-1.5.1.js"></script>
		<script src="<%=basePath%>js/calendar.js"></script>
	</head>

	<body class="content1">
		<script>
$('#a_leader_txt', parent.document).html('编辑用户');
</script>
		<div class="container-fluid">
			<div class="row-fluid">
				<form method="post" action="<%=basePath%>admin?cmd=useredit&id=${user.userid}">
					<div class="well">
						<div class="tab-pane active in">
							<label>
								用户名：
							</label>
							<input type="text" name="username" maxlength="10" value="${user.username}">
							<label>
								用户密码：
							</label>
							<input type="password" name="password" maxlength="100" value="${user.password}">
							<label>
								性别：
							</label>
							<select name="sex">
								<option value="male" <c:if test="${user.sex == 'male'}">selected</c:if>>
									男
								</option>
								<option value="female" <c:if test="${user.sex == 'female'}">selected</c:if>>
									女
								</option>
							</select>
							<label for="edit-email">
								Email
							</label>
							<input type="text" id="edit-email" name="email" value="${user.email}">
							<label for="edit-height">
								身高
							</label>
							<input type="text" id="edit-height" name="height" maxlength="60" value="${user.height}">
							<label for="edit-bir">
								出生日期
							</label>
							<input type="text" id="edit-bir" name="birthday" maxlength="60" value="${user.birthday}">
							<label>
								婚姻状态 :
							</label>
							<label for="radio-01" class="label_radio">
								<input type="radio" name="marital_situatio" value="0" <c:if test="${!user.marital_situatio}">checked="checked"</c:if>>
								未婚
							</label>
							<label for="radio-02" class="label_radio">
								<input type="radio" name="marital_situatio" value="1" <c:if test="${user.marital_situatio}">checked="checked"</c:if>>
								已婚
							</label>
							<label for="edit-detail">
								描述
							</label>
							<textarea class="form-control bio" id="detail" name="detail" placeholder="" rows="3">${user.detail}</textarea>
							<label>
								用户角色：
							</label>
							<select name="role">
								<option value="user" <c:if test="${user.role == 'user'}">selected</c:if>>
									用户
								</option>
								<option value="admin" <c:if test="${user.role == 'admin'}">selected</c:if>>
									管理员
								</option>
							</select>
						</div>
					</div>
					<div class="btn-toolbar">
						<input type="submit" class="btn btn-primary" value="保存 ">
					</div>
				</form>
			</div>
		</div>
	</body>
	<script>
		$('#edit-bir').calendar();
	</script>
</html>
