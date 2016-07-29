<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//邮箱回显
	String backShowUserEmail = "";
	if (request.getAttribute("useremail") != null) {
		backShowUserEmail = (String) request.getAttribute("useremail");
	}
	//登录信息回显
	String message = "";
	if (request.getAttribute("message") != null) {
		message = (String) request.getAttribute("message");
	}
	//注册信息回显
	if (request.getAttribute("rMessage") != null) {
		message = (String) request.getAttribute("rMessage");
	}
%>

<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>太阳在线登录</title>

		<!-- Bootstrap CSS-->
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="css/login.min.css" />
	</head>

	<body class="login-body">
		<!--顶部logo以及文字面板-->
		<div class="panel panel-default panel-login">
			<div class="panel-body">
				<img src="img/logo.png" />
			</div>
		</div>
		<!--登录表单部分开始-->
		<form action="UserLogin" method="post" id="loginform">
			<!--登录邮箱-->
			<div class="input-group input-group-lg panel-login-email">
				<span class="input-group-addon" id="sizing-addon1">
						<i class="glyphicon glyphicon-envelope"></i>
					</span>
				<input type="email" class="form-control" placeholder="请输入邮箱" aria-describedby="sizing-addon1" name="useremail" id="user_login_email">
			</div>
			<!--登录密码-->
			<div class="input-group input-group-lg panel-login-pwd">
				<span class="input-group-addon" id="sizing-addon1">
						<i class="glyphicon glyphicon-lock"></i>
					</span>
				<input type="password" class="form-control" placeholder="请输入密码" aria-describedby="sizing-addon1" name="userpwd" id="user_login_pwd">
			</div>
			<!--新用户注册-->
			<div class="new-user-register">
				<a href="#" data-toggle="modal" data-target="#regisForm"><span>新用户注册</span></a>
			</div>
			<!--提交按钮-->
			<div class="btn-login-box">
				<button type="submit" class="btn btn-login">登录</button>
				<div><%=message %></div>
			</div>
		</form>
		<!--登录表单部分结束-->

		<!--注册模态框开始-->
		<div class="modal fade" id="regisForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">
							<img src="img/favicon.ico" id="regis-icon"/>&nbsp;&nbsp;新用户注册
						</h4>
					</div>
					<!--注册表单部分开始-->
					<form action="UserRegister" method="post" id="regisform">
						<div class="modal-body">
						<!-- 隐藏表单域防止重复提交 -->
							<input type="hidden" name="token" value="<%=session.getAttribute("token")%>">
							<!--用户昵称-->
							<div class="input-group input-group-lg panel-regis panel-regis-name">
								<span class="input-group-addon" id="sizing-addon1">
									<i class="glyphicon glyphicon-user"></i>
								</span>
								<input type="text" class="form-control" placeholder="请输入您的昵称" aria-describedby="sizing-addon1" name="usernickname" id="user_regis_id">
							</div>
							<!--登录邮箱-->
							<div class="input-group input-group-lg panel-regis panel-regis-email">
								<span class="input-group-addon" id="sizing-addon1">
									<i class="glyphicon glyphicon-envelope"></i>
								</span>
								<input type="email" class="form-control" placeholder="请输入邮箱" aria-describedby="sizing-addon1" name="useremail" id="user_regis_email">
							</div>
							<!--登录密码-->
							<div class="input-group input-group-lg panel-regis panel-regis-pwd">
								<span class="input-group-addon" id="sizing-addon1">
									<i class="glyphicon glyphicon-lock"></i>
								</span>
								<input type="password" class="form-control" placeholder="请输入密码" aria-describedby="sizing-addon1" name="userpwd" id="user_regis_pwd">
							</div>
							<!--确认密码-->
							<div class="input-group input-group-lg panel-regis panel-regis-repwd">
								<span class="input-group-addon" id="sizing-addon1">
									<i class="glyphicon glyphicon-repeat"></i>
								</span>
								<input type="password" class="form-control" placeholder="请再次输入密码" aria-describedby="sizing-addon1" name="reuserpwd" id="reuser_regis_pwd">
							</div>
							<!--用户手机号-->
							<div class="input-group input-group-lg panel-regis panel-regis-mobile">
								<span class="input-group-addon" id="sizing-addon1">
									<i class="glyphicon glyphicon-user"></i>
								</span>
								<input type="text" class="form-control" placeholder="请输入您的手机号" aria-describedby="sizing-addon1" name="usermobile" id="user_regis_mobile">
							</div>
						</div>
						<div class="modal-footer">
							<button type="reset" class="btn regis-btn-reset" data-dismiss="modal">重置</button>
							<button type="submit" class="btn regis-btn-regis">注册</button>
						</div>
					</form>
					<!--注册表单部分结束-->
				</div>
			</div>
		</div>
		<!--注册模态框结束-->
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="js/jquery-1.12.3.min.js" type="text/javascript" charset="utf-8"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<!--包含了对登录表单和注册表单的JS验证-->
		<script src="js/verify_mobile.min.js" type="text/javascript" charset="utf-8"></script>
	</body>

</html>