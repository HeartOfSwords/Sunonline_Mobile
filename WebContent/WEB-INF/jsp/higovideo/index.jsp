<%@page import="com.sunonline.web.bean.pager.HigoPagerBean"%>
<%@page import="com.sunonline.web.bean.HigoVideoBean"%>
<%@page import="com.sunonline.web.dao.higo.HigoVideoDaoImpl"%>
<%@page import="com.sunonline.web.dao.higo.HigoVideoDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//获取视频列表
	HigoVideoDao higoVideoDao = new HigoVideoDaoImpl();
	List<HigoVideoBean> higoVideos = higoVideoDao.fetchAllVideos();
	
	//获取推荐视频
	List<HigoVideoBean> higoVideoRecommendation = (List<HigoVideoBean>)request.getAttribute("higoVideoRecommendation");
	//获取用户昵称
	String userNickName = (String) session.getAttribute("usernickname");	
%>
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Higo大学季</title>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="css/HOC-second.min.css" />
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

			<!--轮播图部分开始-->
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="img/lunbo_1.png" alt="轮播图1" style="width: 100%;">
					<div class="carousel-caption">

					</div>
				</div>
				<div class="item">
					<img src="img/lunbo_2.png" alt="轮播图2" style="width: 100%;">
					<div class="carousel-caption">

					</div>
				</div>
				<div class="item">
					<img src="img/lunbo_3.png" alt="轮播图3" style="width: 100%;">
					<div class="carousel-caption">

					</div>
				</div>
			</div>
			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<!--轮播图部分结束-->

		<!--面包屑导航部分-->
		<ol class="breadcrumb">
			<li>
				<a href="IndexRouter">首页</a>
			</li>
			<li class="active">HIGO大学季</li>
		</ol>

		<!--视频列表部分开始-->
	<%
		List<HigoVideoBean> higoVideoBeans = (List<HigoVideoBean>) request.getAttribute("higoVideoList");
		if (higoVideoBeans != null && higoVideoBeans.size() > 0) {

			for (HigoVideoBean higoVideoBean : higoVideoBeans) {
	%>
	<!--单个视频模块开始-->
	<div class="panel panel-default">
		<a href="HigoVideoPlayPage?id=<%=higoVideoBean.getHigoVideoId()%>" class="HOC-panel-a">
			<div class="panel-body">
				<div class="HOC-panel-pic">
					<img src="<%=higoVideoBean.getHigoVideoPicUrl() %>" />
				</div>
				<div class="HOC-panel-title"><%=higoVideoBean.getHigoVideoName()%></div>
			</div>
		</a>
	</div>

	<!--单个视频模块结束-->
	<%
		}
		} else {
			out.println("<font color='red'>视频列表加载失败，请刷新重试！</font>");
		}
	%>

	<!--分页按钮部分开始-->
		<div class="page_roll HOC-page-roll">
			<div class="btn-group">
			<%
				HigoPagerBean higoVideoPagerBean = (HigoPagerBean) request.getAttribute("higoPagerBean");
				if (higoVideoPagerBean != null) {
			%>
			<button type="button" class="btn btn-default"
				onclick="window.location.href='HigoPager?current_pageno=1'">
				<span class="glyphicon glyphicon-home">首页</span></a>
			</button>
			<button type="button" class="btn btn-default"
				onclick="window.location.href='HigoPager?current_pageno=<%=higoVideoPagerBean.getCurPage() - 1%>'">
				<span class="glyphicon glyphicon-circle-arrow-left">上一页</span>
			</button>
			<button type="button" class="btn btn-default"
				onclick="window.location.href='HigoPager?current_pageno=<%=higoVideoPagerBean.getCurPage() + 1%>'">
				<span class="glyphicon glyphicon-circle-arrow-right">下一页</span>
			</button>
			<button type="button" class="btn btn-default"
				style="margin-right: 10px;"
				onclick="window.location.href='HigoPager?current_pageno=<%=higoVideoPagerBean.getMaxPage()%>'">
				<span class="glyphicon glyphicon-play">尾页</span>
			</button>
			<%
				}
			%>
		</div>
		</div>

		<!--分页按钮部分结束-->

		<!--视频列表部分结束-->

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
