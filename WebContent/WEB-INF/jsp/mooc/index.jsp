<%@page import="com.sunonline.web.webapi.bean.mooc.MediasAfter"%>
<%@page import="com.sunonline.web.webapi.bean.mooc.RadioInterview"%>
<%@page import="com.sunonline.web.webapi.bean.mooc.SoftwareDeveloping"%>
<%@page import="com.sunonline.mooc.model.CoursesBean"%>
<%@page import="com.sunonline.mooc.dao.MoocVideoDaoImpl"%>
<%@page import="com.sunonline.mooc.dao.MoocVideoDao"%>
<%@page import="com.sunonline.mooc.model.TypeBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<TypeBean> typeBeans = (List<TypeBean>)request.getAttribute("typeBeans");
	//获取软件开发列表
	List<SoftwareDeveloping> softwareDevelopings = (List<SoftwareDeveloping>)request.getAttribute("softwareDevelopings");
	//获取播音主持列表
	List<RadioInterview> radioInterviews = (List<RadioInterview>)request.getAttribute("radioInterviews");
	//获取影视后期列表
	List<MediasAfter> mediasAfters = (List<MediasAfter>)request.getAttribute("mediasAfters");
	
	MoocVideoDao moocVideoDao = new MoocVideoDaoImpl();
	
	//获取用户昵称
	String userNickName = (String) session.getAttribute("usernickname");	
%>
<!--公益课堂首页-->
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>公益课堂</title>

		<!-- Bootstrap CSS-->
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="css/publicClass.min.css"/>
	</head>

	<body>
				<!--导航条部分开始需要抽取出来作为公共部分-->
		<nav class="navbar navbar-default" id="top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				        <span class="sr-only">Toggle navigation</span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
      				</button>
					<img src="img/logo.png" />
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li>
							<a href="IndexRouter">首页</a>
						</li>
						<li>
							<a href="HigoPager">HIGO大学季</a>
						</li>
						<li>
							<a href="mooc">公益课堂</a>
						</li>
						<li>
							<a href="OldDriverPager">影视老司机</a>
						</li>
						<li>
							<a href="CollegeVoiceVideoPager">高校最强音</a>
						</li>
						<li>
							<a href="aboutUs.html">关于我们</a>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">其他<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li>
									<a href="EduNewsMenuRouter">教育资讯</a>
								</li>
								<li role="separator" class="divider"></li>
								<li>
									<a href="#">高校人物风采录</a>
								</li>
								<li role="separator" class="divider"></li>
								<li>
									<a href="#">山西高校图片库</a>
								</li>
							</ul>
						</li>
					</ul>

					<!--用户登录后用于显示用户名和注销按钮，需要时解开注释-->
				<%
					if (userNickName != null && userNickName.length() > 0) {
				%>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">用户名：<%=userNickName %></a></li>
					<li><a href="UserLogout">注销</a></li>
				</ul>
				<%
					} else {
				%>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="UserRegisterRouter">注册</a></li>
					<li><a href="UserLoginRouter">登录</a></li>
				</ul>
				<%
					}
				%>
			</div>
			</div>
		</nav>
		<!--导航条部分结束-->

		<!--课程模块部分开始-->
		<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingOne">
					<h4 class="panel-title">
				        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				         	公益课堂&nbsp;/&nbsp;软件开发系列课程
				        </a>
      				</h4>
      				<img src="img/software.jpg"/>
				</div>
				<div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
					<div class="panel-body">
						<!--课程列表开始-->
						<div class="container">
							<!--单行内容-->
							<div class="row">
							<%
								if(softwareDevelopings != null && softwareDevelopings.size() > 0) {
									for (SoftwareDeveloping softwareDeveloping : softwareDevelopings) {
								
							%>
								<!--每一行的单个内容-->
								<div class="col-sm-6 col-md-4">
									<div class="thumbnail">
										<img src="<%=softwareDeveloping.getC_pic_url() %>" alt="课程图片">
										<div class="caption">
											<h3><%=softwareDeveloping.getC_name() %></h3>
											<p>主讲人：<%=softwareDeveloping.getC_teacher_name() %></p>
											<p style="text-align: right;">
												<a href="CoursesVideoPager?current_pageno=1&c_id=<%=softwareDeveloping.getC_id()%>" class="btn btn-primary" role="button">点击学习</a>
											</p>
										</div>
									</div>
								</div>
							<%}} %>	
							</div>
						</div>
						<!--课程列表结束-->
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingTwo">
					<h4 class="panel-title">
				        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
				          	公益课堂&nbsp;/&nbsp;影视后期系列课程
				        </a>
      				</h4>
      				<img src="img/videolatter.jpg"/>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
					<div class="panel-body">
						<!--课程列表开始-->
						<div class="container">
							<!--单行内容-->
							<div class="row">
								<%
									if(mediasAfters != null && mediasAfters.size() > 0) {
										for (MediasAfter mediasAfter : mediasAfters) {
									
								%>
								<!--每一行的单个内容-->
								<div class="col-sm-6 col-md-4">
									<div class="thumbnail">
										<img src="<%=mediasAfter.getC_pic_url() %>" alt="课程图片">
										<div class="caption">
											<h3><%=mediasAfter.getC_name() %></h3>
											<p>主讲人：<%=mediasAfter.getC_teacher_name() %></p>
											<p style="text-align: right;">
												<a href="CoursesVideoPager?current_pageno=1&c_id=<%=mediasAfter.getC_id()%>" class="btn btn-primary" role="button">点击学习</a>
											</p>
										</div>
									</div>
								</div>
								<%} }%>
							</div>
						</div>
						<!--课程列表结束-->
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingThree">
					<h4 class="panel-title">
				        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
				          	公益课堂&nbsp;/&nbsp;播音主持系列课程
				        </a>
      				</h4>
      				<img src="img/broadcast.jpg"/>
				</div>
				<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
					<div class="panel-body">
						<!--课程列表开始-->
						<div class="container">
							<!--单行内容-->
							<div class="row">
								<%
									if(radioInterviews != null && radioInterviews.size() > 0) {
										for (RadioInterview radioInterview : radioInterviews) {
									
								%>
								<!--每一行的单个内容-->
								<div class="col-sm-6 col-md-4">
									<div class="thumbnail">
										<img src="<%=radioInterview .getC_pic_url() %>" alt="课程图片">
										<div class="caption">
											<h3><%=radioInterview .getC_name() %></h3>
											<p>主讲人：<%=radioInterview.getC_teacher_name() %></p>
											<p style="text-align: right;">
												<a href="CoursesVideoPager?current_pageno=1&c_id=<%=radioInterview .getC_id()%>" class="btn btn-primary" role="button">点击学习</a>
											</p>
										</div>
									</div>
								</div>
								<%} }%>
							</div>
						</div>
						<!--课程列表结束-->
					</div>
				</div>
			</div>
		</div>
		<!--课程模块部分结束-->

		<!--footer部分开始,最后抽取为公共部分-->
		<div class="blank-block">
			
		</div>
		<div class="footer">
				<span class="footer-content">(c)2015-2016 山西太阳在线</span>
		</div>
		<!--footer部分结束-->

		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="js/jquery-1.12.3.min.js" type="text/javascript" charset="utf-8"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	</body>

</html>