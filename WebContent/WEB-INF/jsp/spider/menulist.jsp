<%@page import="com.sunonline.spider.gui.bean.EducationNews"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//从后台获取教育新闻列表
	List<EducationNews> educationNewsList = (List<EducationNews>) request.getAttribute("educationNewslist");
	//获取新闻推荐列表
	List<EducationNews> educationNewsRecommendation = (List<EducationNews>) request.getAttribute("recommendationNews");
	//获取用户昵称
	String userNickName = (String) session.getAttribute("usernickname");	
%>
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>博览天下</title>

		<!-- Bootstrap CSS-->
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
		<!--引入mobile.min.css-->
		<link rel="stylesheet" type="text/css" href="css/news.min.css">
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
		
		<!--资讯列表部分开始-->
		<!--面包屑导航部分-->
		<ol class="breadcrumb">
			<li>
				<a href="IndexRouter">首页</a>
			</li>
			<li class="active">资讯速览</li>
		</ol>
	<%
		if (educationNewsList != null && educationNewsList.size() > 0) {
			for (EducationNews educationNews : educationNewsList) {
	%>
	<div class="newsList">
		<div class="panel panel-default">
			<div class="panel-body">
				<span class="glyphicon glyphicon-certificate"></span> <a href="EduNewsContentRouter?id=<%=educationNews.getId() %>"><%=educationNews.getTitle() %></a>
			</div>
		</div>
	</div>
	<%
		}
		}
	%>


	<!--返回顶部按钮-->
		<div class="news-return-top">
			<a href="#top"><span class="glyphicon glyphicon-open"></span></a>
		</div>
		<!--资讯列表部分结束-->

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