<%@page import="com.sunonline.web.bean.OldDriverVideoBean"%>
<%@page import="com.sunonline.web.bean.HigoVideoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%
	//获取视频信息实体
	OldDriverVideoBean oldDriverVideoBean = (OldDriverVideoBean) request.getAttribute("oldDriverVideoInfo");
	//逐条获取视频信息
	int video_id = oldDriverVideoBean.getLSJ_video_id();
	String video_url = oldDriverVideoBean.getLSJ_video_url();
	String video_name = oldDriverVideoBean.getLSJ_video_name();
	Date upload_date = oldDriverVideoBean.getLSJ_video_date();
	String pic_url = oldDriverVideoBean.getLSJ_video_pic_url();
	int played_time = oldDriverVideoBean.getLSJ_video_played_number();
	String video_intro = oldDriverVideoBean.getLSJ_video_intro();
	String video_uploader = oldDriverVideoBean.getLSJ_video_uploader();
	//获取推荐视频
	List<OldDriverVideoBean> oldDriverRecommendation = (List<OldDriverVideoBean>) request
			.getAttribute("oldDriverRecommendation");
	//获取用户昵称
	String userNickName = (String) session.getAttribute("usernickname");
%>
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>影视老司机-<%=video_name %></title>

		<!-- Bootstrap CSS-->
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="css/HOC-third.min.css"/>
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
<!--面包屑导航部分-->
		<ol class="breadcrumb">
			<li>
				<a href="IndexRouter">首页</a>
			</li>
			<li>
				<a href="OldDriverPager">影视老司机</a>
			</li>
		</ol>
		<!--播放器部分开始-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12 col-md-12">
					<div class="video-player">
						<video class="full" width="100%" height="100%" src="<%=video_url %>" controls="controls" poster="<%=pic_url %>">
						</video>
					</div>
				</div>
			</div>
		</div>
		<!--播放器部分结束-->
		<!--标签页开始-->
		<div class="pubClassTh-navTabs">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs nav-center-king" role="tablist">
				<li role="presentation" class="active">
					<a href="#video-intro" aria-controls="video-list" role="tab" data-toggle="tab">课程简介</a>
				</li>
				<li role="presentation">
					<a href="#video-discuss" aria-controls="video-discuss" role="tab" data-toggle="tab">评论</a>
				</li>
			</ul>

			<!-- Tab panes -->
			<!--为了针对公益课堂三级页面设置单独的面板样式，增加一个pubClassTh样式-->
			<div class="tab-content pubClassTh">

				<div role="tabpanel" class="tab-pane fade in active" id="video-intro">
					<!--课程简介部分-->
					<div class="panel panel-default">
						<div class="panel-body">
							<strong>视频名称</strong>：<%=video_name %>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-body">
							<strong>上传者</strong>：<%=video_uploader %>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-body">
							<strong>视频简介</strong>：<%=video_intro %>
						</div>
					</div>
				</div>

				<div role="tabpanel" class="tab-pane fade" id="video-discuss">
					<!--评论部分-->
					<!-- 多说评论框 start -->
					<div class="ds-thread" data-thread-key="<%="olddriver " + video_id %>" data-title="<%="olddriver " + video_name %>" data-url="请替换成文章的网址"></div>
					<!-- 多说评论框 end -->
					<!-- 多说公共JS代码 start (一个网页只需插入一次) -->
					<script type="text/javascript">
						var duoshuoQuery = {
							short_name: "sunonline"
						};
						(function() {
							var ds = document.createElement('script');
							ds.type = 'text/javascript';
							ds.async = true;
							ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//static.duoshuo.com/embed.js';
							ds.charset = 'UTF-8';
							(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(ds);
						})();
					</script>
					<!-- 多说公共JS代码 end -->
				</div>
			</div>
		</div>
		<!--标签页结束-->
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
