<%@page import="com.sunonline.spider.gui.bean.EducationNews"%>
<%@page import="com.sunonline.web.bean.User"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.sunonline.mooc.model.CoursesBean"%>
<%@page import="com.sunonline.web.bean.OldDriverVideoBean"%>
<%@page import="com.sunonline.web.bean.CollegeVoiceVideoBean"%>
<%@page import="com.sunonline.web.bean.HigoVideoBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	*获取所有视频列表
	*/
	//Higo列表
	List<HigoVideoBean> higoVideoBeans = (List<HigoVideoBean>)request.getAttribute("higoVideoBeans");
	//获取最强音列表
	List<CollegeVoiceVideoBean> collegeVoiceVideoBeans = (List<CollegeVoiceVideoBean>)request.getAttribute("collegeVoiceVideoBeans");
	//获取老司机列表
	List<OldDriverVideoBean> oldDriverVideoBeans = (List<OldDriverVideoBean>)request.getAttribute("oldDriverVideoBeans");
	//获取公益课堂列表
	List<CoursesBean> coursesBeans = (List<CoursesBean>)request.getAttribute("coursesBeans");
	//获取用户昵称
	String userNickName = (String) session.getAttribute("usernickname");
	/*unused*/
	//获取用户手机号
	String usermobile = (String) session.getAttribute("usermobile");
	//获取用户昵称修改标记
	String usernameModifyFlag = (String) session.getAttribute("flag");
	
%>
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>太阳在线</title>

		<!-- Bootstrap CSS-->
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
		<!--引入index.css，最终发行版删掉此CSS文件-->
		<link rel="stylesheet" type="text/css" href="css/index.min.css" />
		
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

		<!--版块部分开始，采用统一的样式，可以公用-->
		<!--面包屑导航部分-->
		<ol class="breadcrumb">
			<li>
				<a href="IndexRouter">首页</a>
			</li>
			<li class="active">公益课堂</li>
			<li>
				<!--链接到公益课堂页面-->
				<a href="mooc">更多</a>
			</li>
		</ol>
		<!--模块内容展示部分-->
		<div class="container">
		
			<!--单行内容-->
			<div class="row">
				<%
					if(coursesBeans != null && coursesBeans.size() > 0) {
						for(int i = 0; i < coursesBeans.size(); i++) {
				%>
				<!--每一行的单个内容-->
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail">
						<img src="<%=coursesBeans.get(i).getC_pic_url() %>" alt="课程图片">
						<div class="caption">
							<h3><%=coursesBeans.get(i).getC_name()%></h3>
							<p>主讲人：<%=coursesBeans.get(i).getC_teacher_name()%></p>
							<p style="text-align: right;">
								<a href="CoursesVideoPager?current_pageno=1&c_id=<%=coursesBeans.get(i).getC_id()%>" class="btn btn-primary" role="button" >点击学习</a>
							</p>
						</div>
					</div>
				</div>
				<% 	
						}
					}
					
				%>
			</div>
		</div>
		<!--公用版块部分结束-->
		
		<!--版块部分开始，采用统一的样式，可以公用-->
		<!--面包屑导航部分-->
		<ol class="breadcrumb">
			<li>
				<a href="IndexRouter">首页</a>
			</li>
			<li class="active">HIGO大学季</li>
			<li>
				<!--链接到HIGO大学季页面-->
				<a href="HigoPager">更多</a>
			</li>
		</ol>
		<!--模块内容展示部分-->
		<div class="container">
			<!--单行内容-->
			<div class="row">
				<!--每一行的单个内容-->
				<%
					if(higoVideoBeans != null && higoVideoBeans.size() > 0) {
						for(int i = 0; i < higoVideoBeans.size(); i++) {
				%>
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail">
						<img src="<%=higoVideoBeans.get(i).getHigoVideoPicUrl() %>" alt="课程图片">
						<div class="caption">
							<h3><%=higoVideoBeans.get(i).getHigoVideoName() %></h3>
							<p>上传者：<%=higoVideoBeans.get(i).getHigoVideoUploader() %></p>
							<p style="text-align: right;">
								<a href="HigoVideoPlayPage?id=<%=higoVideoBeans.get(i).getHigoVideoId()%>" class="btn btn-primary" role="button" >点击播放</a>
							</p>
						</div>
					</div>
				</div>
				<% 	
						}
					}
					
				%>
				
			</div>
		</div>
		<!--公用版块部分结束-->
		
		<!--版块部分开始，采用统一的样式，可以公用-->
		<!--面包屑导航部分-->
		<ol class="breadcrumb">
			<li>
				<a href="IndexRouter">首页</a>
			</li>
			<li class="active">影视老司机</li>
			<li>
				<!--链接到影视老司机页面-->
				<a href="OldDriverPager">更多</a>
			</li>
		</ol>
		<!--模块内容展示部分-->
		<div class="container">
			<!--单行内容-->
			<div class="row">
				<!--每一行的单个内容-->
				<%
					if(oldDriverVideoBeans != null && oldDriverVideoBeans.size() > 0) {
						for(int i = 0; i < oldDriverVideoBeans.size(); i++) {
				%>
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail">
						<img src="<%=oldDriverVideoBeans.get(i).getLSJ_video_pic_url() %>" alt="课程图片">
						<div class="caption">
							<h3><%=oldDriverVideoBeans.get(i).getLSJ_video_name() %></h3>
							<p>上传者：<%=oldDriverVideoBeans.get(i).getLSJ_video_uploader() %></p>
							<p style="text-align: right;">
								<a href="OldDriverVideoPlayPage?id=<%=oldDriverVideoBeans.get(i).getLSJ_video_id() %>" class="btn btn-primary" role="button" >点击播放</a>
							</p>
						</div>
					</div>
				</div>
				<% 	
						}
					}
					
				%>
			</div>
		</div>
		<!--公用版块部分结束-->
		
		<!--版块部分开始，采用统一的样式，可以公用-->
		<!--面包屑导航部分-->
		<ol class="breadcrumb">
			<li>
				<a href="IndexRouter">首页</a>
			</li>
			<li class="active">高校最强音</li>
			<li>
				<!--链接到高校最强音页面-->
				<a href="CollegeVoiceVideoPager">更多</a>
			</li>
		</ol>
		<!--模块内容展示部分-->
		<div class="container">
			<!--单行内容-->
			<div class="row">
				<!--每一行的单个内容-->
				<%
					if(collegeVoiceVideoBeans != null && collegeVoiceVideoBeans.size() > 0) {
						for(int i = 1; i < collegeVoiceVideoBeans.size(); i++) {
				%>
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail">
						<img src="<%=collegeVoiceVideoBeans.get(i).getZqy_video_pic_url() %>" alt="课程图片">
						<div class="caption">
							<h3><%=collegeVoiceVideoBeans.get(i).getZqy_video_name() %></h3>
							<p>上传者：<%=collegeVoiceVideoBeans.get(i).getZqy_video_uploader() %></p>
							<p style="text-align: right;">
								<a href="<%=collegeVoiceVideoBeans.get(i).getZqy_video_pic_url() %>" class="btn btn-primary" role="button" >点击播放</a>
							</p>
						</div>
					</div>
				</div>
				<% 	
						}
					}
					
				%>
			</div>
		</div>
		<!--公用版块部分结束-->
		<!--返回顶部按钮-->
		<div class="index-return-top">
			<a href="#top"><span class="glyphicon glyphicon-open"></span></a>
		</div>
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