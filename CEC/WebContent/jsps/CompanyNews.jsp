<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>公司新闻</title>
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/CompanyNews.css" />
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
				<a href="<c:url value='/PostsServlet?method=findAllPosts'/>" class="head-list">公司论坛</a>
				<!--头像-->
				<span class="head-login">
						<!--头像图片-->
						<img src="${pageContext.request.contextPath}/images/${sessionScope.user.user_head}" class="login-img"/>
						<!--登录名称-->
						<a href="<c:url value='/UserServlet?method=myhome&user_id=${sessionScope.user.user_id}'/>" class="user-name">${sessionScope.user.user_name}</a>
					</span>
			</div>
		</div>
		<!--新闻展示盒子-->
		<div class="news-box">
			<!--新闻中间层-->
			<div class="news-middle">
				<!--新闻列表-->
				<ul class="news-list">
					<!--公司公告-->
					<li class="news-head">
						公司公告
					</li>
					<c:forEach items="${findAllAnnouncement.beanList }" var="findAllAnnouncement">
					<li class="news">
						<!--新闻标签-->
						<span class="news-tab">公告</span>
						<!--新闻链接-->
						<a href="<c:url value='/AnnouncementServlet?method=detailsAnnouncement&announcement_id=${findAllAnnouncement.announcement_id }'/>" class="news-href">${findAllAnnouncement.announcement_title }</a>
						<!--新闻日期-->
						<span class="news-date">${findAllAnnouncement.announcement_time }</span>
					</li>
					</c:forEach>
					</ul>
					<ul class="page-turn">
						<!--页数-->
						<a class="page-href" >
							<li class="pages" id="other-page">
								第${findAllAnnouncement.pc }页/共${findAllAnnouncement.tp}页
							</li>
						</a>
						<!--翻页链接-->
						<a href="<c:url value='/AnnouncementServlet?method=findAllAnnouncement&pc=1'/>" class="page-href">
						<li class="pages" id="big-page">
							首页</li>
						</a>
						<c:if test="${findAllAnnouncement.pc>1 }">
						<a href="<c:url value='/AnnouncementServlet?method=findAllAnnouncement&pc=${findAllAnnouncement.pc-1 }'/>" class="page-href">
							<li class="pages" id="big-page">
								上一页
							</li>
						</a>
						</c:if>
						
						<c:choose>
			<%--页面不足10页时，把所有的页数都显示出来 --%>
			<c:when test="${findAllAnnouncement.tp<=5 }">
				<c:set var="begin" value="1" />
				<c:set var="end" value="${findAllAnnouncement.tp }" />
			</c:when>
			<%--页面>10页时，把所有的页数都显示出来 --%>
			<c:otherwise>
				<c:set var="begin" value="${findAllAnnouncement.pc-2 }" />
				<c:set var="end" value="${findAllAnnouncement.pc+2 }" />
				<%--头溢出 --%>
				<c:if test="${begin<1 }">
					<c:set var="begin" value="1" />
					<c:set var="end" value="10" />
				</c:if>
				<%--尾溢出 --%>
				<c:if test="${end > findAllAnnouncement.tp }">
					<c:set var="begin" value="${findAllAnnouncement.tp - 4 }" />
					<c:set var="end" value="${findAllAnnouncement.tp }" />
				</c:if>
			</c:otherwise>
		</c:choose>
		
		<c:forEach var="i" begin="${begin }" end="${end }">
			<c:choose>
				<c:when test="${i eq findAllAnnouncement.pc }">
		<a class="page-href">
							<li class="pages">
								${i }
							</li>
						</a>
		</c:when>
				<c:otherwise>
				<a href="<c:url value='/AnnouncementServlet?method=findAllAnnouncement&pc=${i }'/>" class="page-href">
							<li class="pages">
								${i }
							</li>
						</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
						
						
						<c:if test="${findAllAnnouncement.pc < findAllAnnouncement.tp }">
						<a href="<c:url value='/AnnouncementServlet?method=findAllAnnouncement&pc=${findAllAnnouncement.pc+1 }'/>" class="page-href">
							<li class="pages" id="big-page">
								下一页
							</li>
						</a>
						</c:if>
						<a href="<c:url value='/AnnouncementServlet?method=findAllAnnouncement&pc=${findAllAnnouncement.tp }'/>" class="page-href">
							<li class="pages" id="big-page">
								尾页
							</li>
						</a>
					</ul>
					<div>
				<!--公司新闻标题展示-->
				<ul class="news-title-list">
					<!--公司新闻-->
					<li class="company-news">
						<!--新闻内容-->
						<div class="news-context">
							习近平会见<br />葡萄牙总理科斯塔
						</div>
					</li>
					<li class="company-news">
						<!--新闻内容-->
						<div class="news-context">
							习近平<br />出席G20峰会纪实
						</div>
					</li>
					<li class="company-news">
						<!--新闻内容-->
						<div class="news-context" style="line-height: 44px;">
							英国退欧遭反对
						</div>
					</li>
					<li class="company-news">
						<!--新闻内容-->
						<div class="news-context" style="line-height: 44px;">
							华为概念股暴跌
						</div>
					</li>
					<li class="company-news">
						<!--新闻内容-->
						<div class="news-context">
							小布什<br />为父致悼词
						</div>
					</li>
				</ul>
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