<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<!--
    	作者：刘洋
    	时间：2018-12-01
    	描述：cec毕业项目主页面
    -->

	<head>
		<meta charset="utf-8" />
		<title>论坛主页</title>
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.0.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>
	</head>

	<body style="background-color: #eeeeee;">
		<div class="head">
			<!--头部导航-->
			<div class="head-nav">
				<!--网页logo-->
				<i class="head-logo"><span>C</span>EC</i>
				<!--菜单导航-->
				<div class="nav-list">
					<!--导航列表-->
					<div class="nav" id="nav-one">
						<a href="index.html">首页</a>
						<p>HOME</p>
					</div>
					<div class="nav" id="nav-two">
						<a href="bbs.html">热门</a>
						<p>HOT</p>
					</div>
					<div class="nav" id="nav-three">
						<a href="#">话题</a>
						<p>TOPIC</p>
					</div>
					<div class="nav" id="nav-four">
						<a href="<c:url value='/AnnouncementServlet?method=findAllAnnouncement'/>">公司公告</a>
						<p>COMPANY NEWS</p>
					</div>
					<div class="nav" id="nav-five">
						<a href="#">联系我们</a>
						<p>CONTACT</p>
					</div>
				</div>
				<!--用户登录版块-->
				<div class="login-box">
					<!--登录头像-->
					<img src="${pageContext.request.contextPath}/images/${sessionScope.user.user_head}" class="login-img" />
					<!--登录名-->
					<a href="<c:url value='/UserServlet?method=myhome&user_id=${sessionScope.user.user_id}'/>" class="login-name">${sessionScope.user.user_name}</a>
					<input type="hidden" name="user_id" value="${sessionScope.user.user_id}"/>
					<!--注销盒子-->
					<div class="quit-box">
						<a href="<c:url value='/UserServlet?method=logout'/>" class="change-user">更换用户</a>
					</div>
				</div>
			</div>
			<!--提示文字-->
			<div class="head-tip">
				今晚，我们来谈谈人<span>性</span>
			</div>
		</div>
		<!--页面中间层-->
		<div class="middle">
			<!--页面中间盒子-->
			<div class="middle-box">
				<!--图片轮播层-->
				<div class="pics-play-turn">
					<ul class="ul_img">
						<li class="li_img"><img src="${pageContext.request.contextPath}/img/index_img/b1.jpg" /></li>
						<li class="li_img"><img src="${pageContext.request.contextPath}/img/index_img/b1.jpg" /></li>
						<li class="li_img"><img src="${pageContext.request.contextPath}/img/index_img/b1.jpg" /></li>
						<li class="li_img"><img src="${pageContext.request.contextPath}/img/index_img/b1.jpg" /></li>
					</ul>

					<div>
						<div class="div_btn" id="div_one">环境一</div>
						<div class="div_btn" id="div_two">环境二</div>
						<div class="div_btn" id="div_three">环境三</div>
						<div class="div_btn" id="div_four">环境四</div>
					</div>
				</div>
				<!--右侧列表层-->
				<div class="box-right">
				<div class="box-title">
						公司公告
						<div id="left-line"></div>
						<div id="middle-circle"></div>
						<div id="right-line"></div>
					</div>
					<ul class="news-list">
					<c:forEach items="${findNewAnnouncement }" var="findNewAnnouncement">
						<li class="news">
							<!--新闻标签-->
							<span class="news-tab">公告</span>
							<!--新闻链接-->
							<a href="<c:url value='/AnnouncementServlet?method=detailsAnnouncement&announcement_id=${findNewAnnouncement.announcement_id }'/>" class="news-href">${findNewAnnouncement.announcement_title }</a>
							<!--新闻日期-->
							<span class="news-date">${findNewAnnouncement.announcement_time }</span>
						</li>
						</c:forEach>
						
						<a href="<c:url value='/AnnouncementServlet?method=findAllAnnouncement'/>" class="more-news">
							<span class="c1">阅读更多</span>
							<span class="c2">公司公告</span>
						</a>
					</ul>
				</div>
			</div>
		</div>
		<!--论坛帖子-->
		<div class="bbs-page">
			<div class="bbs-middle-box">
				<!--论坛名称-->
				<div class="bbs-name">
					<!--上层层-->
					<div class="top-div"></div>
					<p>公司论坛</p>
					<div class="bottom-div"></div>
				</div>
				<!--论坛列表-->
				<ul class="bbs-list">
				<c:forEach items="${findNewPosts }" var="findNewPosts">
					<li class="bbs">
						<!--新闻标签-->
						<span class="bbs-tab">帖子</span>
						<!--新闻链接-->
						<a href="<c:url value='/PostsServlet?method=detailsPosts&posts_id=${findNewPosts.posts_id }'/>" class="bbs-href">${findNewPosts.posts_title }</a>
						<!--新闻日期-->
						<span class="bbs-date">${findNewPosts.posts_time }</span>
					</li>
					</c:forEach>
					
					<a href="<c:url value='/PostsServlet?method=findAllPosts'/>" class="more-news">
						<span class="c1">阅读更多</span>
						<span class="c2">热门帖子</span>
					</a>
				</ul>
				<!--话题展示-->
				<div class="topic-show">
					<!--话题显示层名称-->
					<div class="topic-show-name"><span>HOT</span>话题</div>
					<!--大型话题-->
					<div class="big-topic">
						<img src="${pageContext.request.contextPath}/img/index_img/bbs/topic-img-3.jpg" height="160px" width="320px" />
						<!--覆盖层-->
						<div class="cover-box">
							<!--覆盖层文字-->
							<div class="cover-text">我们的火，要把世界点燃。</div>
						</div>
					</div>
					<div class="big-topic-name">
						<a href="">都市</a>
					</div>
					<!--大型话题-->
					<div class="big-topic">
						<img src="${pageContext.request.contextPath}/img/index_img/bbs/topic-img-2.jpg" height="160px" width="320px" />
						<!--覆盖层-->
						<div class="cover-box">
							<!--覆盖层文字-->
							<div class="cover-text">等一个人、还是等一个故事。</div>
						</div>
					</div>
					<div class="big-topic-name">
						<a href="">两性</a>
					</div>
					<!--大型话题-->
					<div class="big-topic">
						<img src="${pageContext.request.contextPath}/img/index_img/bbs/topic-img-1.jpeg" height="160px" width="320px" />
						<!--覆盖层-->
						<div class="cover-box">
							<!--覆盖层文字-->
							<div class="cover-text">沧海桑田，唯有艺术永恒</div>
						</div>
					</div>
					<div class="big-topic-name">
						<a href="">艺术</a>
					</div>
				</div>
				<!--右侧话题展示-->
				<div class="topic-show-right">
					<!--话题显示层名称-->
					<div class="topic-show-name"></div>
					<!--大型话题-->
					<div class="big-topic">
						<img src="${pageContext.request.contextPath}/img/index_img/bbs/topic-img-4.jpg" height="160px" width="320px" />
						<!--覆盖层-->
						<div class="cover-box">
							<!--覆盖层文字-->
							<div class="cover-text">我可以接受失败，但我决不放弃</div>
						</div>
					</div>
					<div class="big-topic-name">
						<a href="">体育</a>
					</div>
					<!--大型话题-->
					<div class="big-topic">
						<img src="${pageContext.request.contextPath}/img/index_img/bbs/topic-img-5.jpg" height="160px" width="320px" />
						<!--覆盖层-->
						<div class="cover-box">
							<!--覆盖层文字-->
							<div class="cover-text">每一张照片，都是时光的标本。</div>
						</div>
					</div>
					<div class="big-topic-name">
						<a href="">摄影</a>
					</div>
					<!--大型话题-->
					<div class="big-topic">
						<img src="${pageContext.request.contextPath}/img/index_img/bbs/topic-img-6.jpg" height="160px" width="320px" />
						<!--覆盖层-->
						<div class="cover-box">
							<!--覆盖层文字-->
							<div class="cover-text">难过的时候，你开始懂得了歌词</div>
						</div>
					</div>
					<div class="big-topic-name">
						<a href="">音乐</a>
					</div>
				</div>
				<!--更多-->
				<a href="#" class="more-bbs">
					<span class="c1">话题不够？</span>
					<span class="c2">更多话题</span>
				</a>
			</div>
		</div>
		<!--页面页脚-->
		<div class="foots">
			<!--页脚中间层-->
			<div class="foots-middle">
				<div class="foot-logo">
					<i class="foot-logos"><span>C</span>EC</i>
					<!--页脚文字-->
					<i class="foot-text">
						企业员工交流平台
					</i>
				</div>
				<!--页脚许可-->
				<div class="foot-copyright">
					<p class="foot-big-text">企业员交流平台版权所有</p>
					<p class="foot-small-text">COPYRIGHT © 1998 - 2018 CEC. ALL RIGHTS RESERVED.</p>
					<p class="foot-small-text">COPYRIGHT © 2012 CEC,Inc. ALL RIGHTS RESERVED.</p>
					<p class="foot-big-text">本网络论坛适合18+岁的用户使用；为了您的健康，请合理控制浏览时间。</p>
					<p class="foot-big-text"> 粤网文[2018]FH4017-197号|新出网证（粤）字010号</p>
					<p class="foot-big-text">批准文号：新出审字[2011]310号 |文网进字[2011] 004号 | 出版物号：TEK-097 9527-5-119169-200-5|全国文化市场统一举报电话：12318 </p>
				</div>
			</div>
		</div>
	</body>

</html>