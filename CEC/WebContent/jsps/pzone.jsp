<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!--在移动设备浏览器上，通过为视口（viewport） user-scalable=no 可以禁用其缩放（zooming）功能-->
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>企业员工交流平台</title>
		<link rel="stylesheet" type="text/css"href="${pageContext.request.contextPath}/css/Normalize.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/backColor.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.0.js"></script>
	</head>
	<body class="body_back_color">
		<!--
        	作者：offline
        	时间：2018-10-31   换肤色
        	描述：background-image: linear-gradient(45deg, #ff9a9e 0%, #fad0c4 99%, #fad0c4 100%);
        -->
		<div id="pzone_head">
			<!--描述：使用 定位 实现  界面 头部 排版-->
			<div class="head_img"><img src="${pageContext.request.contextPath}/images/${sessionScope.user.user_head}" width="100%" height="100%"/></div>
			<!--更换主题-->
			
			<div class="user_info">
				<span style="font-size: 18px; font-weight: 800;">${sessionScope.user.user_name}</span><br />
				<a href="<c:url value='/UserServlet?method=loadUser&user_id=${sessionScope.user.user_id }'/>" class="user_set">
					<span>修改个人资料</span>
				</a>
				<a href="<c:url value='/PostsServlet?method=findNewPosts'/>" class="return">主页</a>
				<br />
				<span><c:if test="${sessionScope.user.user_sex eq 1 }">男</c:if> <c:if
						test="${sessionScope.user.user_sex eq 0 }">女</c:if></span>
				<br />
				<span>${sessionScope.user.user_email}</span>
				<br />
				<span>${sessionScope.user.user_address}</span>
			</div>
		</div>
		<div id="pzone_box">
			<div class="pzone_context_head">
				<a href="#" class="select">
					<strong>我发布的帖子 </strong>
				</a>
			</div>
			
			<!--用户个人文章内容-->
			<c:forEach items="${myposts }" var="myposts">
			<div class="pzone_context">
				<!--单个文章层-->
				<div class="context_div">
					<!--文章用户信息-->
					<div class="essay_user">
						<div class="essay_user_img"><!--<img src="img/g3.jpg" width="100%" height="100%" />-->
							<a href="<c:url value='/PostsServlet?method=detailsPosts&posts_id=${myposts.posts_id }'/>" class="essay_user_name">${myposts.posts_title }</a>
							<span class="essay_time">${myposts.posts_time }</span>
							<a onclick="return confirm('您真要删除该帖子吗?')" href="<c:url value='/PostsServlet?method=deletePosts&posts_id=${myposts.posts_id }&user_id=${sessionScope.user.user_id }'/>" class="delete">删除</a>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
			<div class="pzone_context_bottom"></div>
		</div>
	</body>
</html>
