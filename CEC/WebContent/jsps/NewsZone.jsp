<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>公告详情</title>
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/NewsZone.css" />
	</head>

	<body>
		<!--头部分-->
		<div class="head">
			<!--头部居中层-->
			<div class="head-middle">
				<!--头部分logo-->
				<i class="head-logo">
						<span>c</span>ec
					</i>
				<a href="<c:url value='/PostsServlet?method=findNewPosts'/>" class="head-list">首页</a>
				<a href="#" class="head-list">话题</a>
				<a href="<c:url value='/AnnouncementServlet?method=findAllAnnouncement'/>" class="head-list">公司公告</a>
				<!--头像-->
				<span class="head-login">
						<!--头像图片-->
						<img src="${pageContext.request.contextPath}/images/${sessionScope.user.user_head}" class="login-img"/>
						<!--登录名称-->
						<a href="<c:url value='/UserServlet?method=myhome&user_id=${sessionScope.user.user_id}'/>" class="user-name">${sessionScope.user.user_name}</a>
				</span>
			</div>
		</div>
		<!--页面中间-->
		<div class="middle">
			<!--页面中间盒子-->
			<div class="middle-box">
				<!--公告部分-->
				<div class="zone">
					<!--公告头部分-->
					<div class="zone-head">
						<h2 class="zone-title">${cec_announcement.announcement_title }</h1>
							<!--公告头部发帖信息-->
						<div class="zone-palette">
							<!--发帖人名称-->
							<span class="editor-name">CEC官方团队</span>
							<!--发帖时间-->
							<span class="editing-time "><fmt:formatDate value="${cec_announcement.announcement_time }" pattern="yyyy-MM-dd  HH:mm:ss"/></span>
						</div>
					</div>
					<!--公告显示盒子-->
					<div class="news-show-box">
						<!--公告显示-->
						<div class="news-show">
							<p>${cec_announcement.announcement_content }</p>
							
						</div>
					</div>
				</div>
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