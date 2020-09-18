<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>论坛社区</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bbs.css" />
</head>

<body>
	<!--头部分-->
	<div class="head">
		<!--头部居中层-->
		<div class="head-middle">
			<!--头部分logo-->
			<i class="head-logo"> <span>c</span>ec
			</i> <a href="<c:url value='/PostsServlet?method=findNewPosts'/>"
				class="head-list">首页</a> <a href="#" class="head-list">话题</a> <a
				href="<c:url value='/AnnouncementServlet?method=findAllAnnouncement'/>" class="head-list">公司公告</a>
			<!--头像-->
			<span class="head-login"> <!--头像图片--> <img
				src="${pageContext.request.contextPath}/images/${sessionScope.user.user_head}"
				class="login-img" /> <!--登录名称--> <a
				href="<c:url value='/UserServlet?method=myhome&user_id=${sessionScope.user.user_id}'/>"
				class="user-name">${sessionScope.user.user_name}</a>
			</span>
		</div>
	</div>
	<!--页面中间层-->
	<div class="middle">
		<!--论坛中间层-->
		<div class="bbs-middle">
			<!--话题列表展示-->
			<ul class="topic-list">
				<!--论坛标题层-->
				<div class="bbs-title" style="width: 230px;">
					<!--左侧竖层-->
					<span class="icon-left"></span>
					<!--标题内容-->
					<span class="title-text">热门话题分类</span>
				</div>
				<li class="bbs-topic"><img
					src="${pageContext.request.contextPath}/img/bbs-topic-img/social.png"
					class="topic-img" /> <!--话题类型--> <a href="" class="topic-type">社会</a></li>
				<li class="bbs-topic"><img
					src="${pageContext.request.contextPath}/img/bbs-topic-img/international.png"
					class="topic-img" /> <!--话题类型--> <a href="" class="topic-type">国际</a></li>
				<li class="bbs-topic"><img
					src="${pageContext.request.contextPath}/img/bbs-topic-img/science_technology.png"
					class="topic-img" /> <!--话题类型--> <a href="" class="topic-type">科技</a></li>
				<li class="bbs-topic"><img
					src="${pageContext.request.contextPath}/img/bbs-topic-img/polular_science .png"
					class="topic-img" /> <!--话题类型--> <a href="" class="topic-type">科普</a></li>
				<li class="bbs-topic"><img
					src="${pageContext.request.contextPath}/img/bbs-topic-img/finance.png"
					class="topic-img" /> <!--话题类型--> <a href="" class="topic-type">财经</a></li>
				<li class="bbs-topic"><img
					src="${pageContext.request.contextPath}/img/bbs-topic-img/stars.png"
					class="topic-img" /> <!--话题类型--> <a href="" class="topic-type">明星</a>
				</li>
				<li class="bbs-topic"><img
					src="${pageContext.request.contextPath}/img/bbs-topic-img/variety.png"
					class="topic-img" /> <!--话题类型--> <a href="" class="topic-type">综艺</a></li>
				<li class="bbs-topic"><img
					src="${pageContext.request.contextPath}/img/bbs-topic-img/tv_show.png"
					class="topic-img" /> <!--话题类型--> <a href="" class="topic-type">电视剧</a></li>
				<li class="bbs-topic"><img src="${pageContext.request.contextPath}/img/bbs-topic-img/movie.png"
					class="topic-img" /> <!--话题类型--> <a href="" class="topic-type">电影</a>
				</li>
				<li class="bbs-topic"><img src="${pageContext.request.contextPath}/img/bbs-topic-img/music.png"
					class="topic-img" /> <!--话题类型--> <a href="" class="topic-type">音乐</a>
				</li>
				<li class="bbs-topic"><img src="${pageContext.request.contextPath}/img/bbs-topic-img/car.png"
					class="topic-img" /> <!--话题类型--> <a href="" class="topic-type">汽车</a>
				</li>
				<li class="bbs-topic"><img
					src="${pageContext.request.contextPath}/img/bbs-topic-img/sports.png" class="topic-img" /> <!--话题类型-->
					<a href="" class="topic-type">体育</a></li>
				<li class="bbs-topic"><img
					src="${pageContext.request.contextPath}/img/bbs-topic-img/body_building.png" class="topic-img" />
					<!--话题类型--> <a href="" class="topic-type">健身</a></li>
				<li class="bbs-topic"><img
					src="${pageContext.request.contextPath}/img/bbs-topic-img/photography.png"
					class="topic-img" /> <!--话题类型--> <a href="" class="topic-type">摄影</a></li>
				<li class="bbs-topic"><img src="${pageContext.request.contextPath}/img/bbs-topic-img/urban.png"
					class="topic-img" /> <!--话题类型--> <a href="" class="topic-type">都市</a>
				</li>
				<li class="bbs-topic"><img
					src="${pageContext.request.contextPath}/img/bbs-topic-img/bisexual.png"
					class="topic-img" /> <!--话题类型--> <a href="" class="topic-type">两性</a></li>
				<li class="bbs-topic"><img src="${pageContext.request.contextPath}/img/bbs-topic-img/art.png"
					class="topic-img" /> <!--话题类型--> <a href="" class="topic-type">艺术</a>
				</li>
				<li class="bbs-topic"><img
					src="${pageContext.request.contextPath}/img/bbs-topic-img/positive_energy.png"
					class="topic-img" /> <!--话题类型--> <a href="" class="topic-type">正能量</a></li>
				<li class="bbs-topic"><img src="${pageContext.request.contextPath}/img/bbs-topic-img/funny.png"
					class="topic-img" /> <!--话题类型--> <a href="" class="topic-type">搞笑</a>
				</li>
				<li class="bbs-topic"><img src="${pageContext.request.contextPath}/img/bbs-topic-img/game.png"
					class="topic-img" /> <!--话题类型--> <a href="" class="topic-type">游戏</a>
				</li>
				<li class="bbs-topic"><img src="${pageContext.request.contextPath}/img/bbs-topic-img/tour.png"
					class="topic-img" /> <!--话题类型--> <a href="" class="topic-type">旅游</a>
				</li>
				<li class="bbs-topic"><img
					src="${pageContext.request.contextPath}/img/bbs-topic-img/cute_animal.png"
					class="topic-img" /> <!--话题类型--> <a href="" class="topic-type">萌宠</a></li>
				<li class="bbs-topic"><img src="${pageContext.request.contextPath}/img/bbs-topic-img/food.png"
					class="topic-img" /> <!--话题类型--> <a href="" class="topic-type">美食</a>
				</li>
				<li class="bbs-topic"><img
					src="${pageContext.request.contextPath}/img/bbs-topic-img/fashion.png"
					class="topic-img" /> <!--话题类型--> <a href="" class="topic-type">时尚</a></li>
				<li class="bbs-topic"><img
					src="${pageContext.request.contextPath}/img/bbs-topic-img/beauty.png"
					class="topic-img" /> <!--话题类型--> <a href="" class="topic-type">美女</a></li>
				<li class="bbs-topic"><img
					src="${pageContext.request.contextPath}/img/bbs-topic-img/constellation.png"
					class="topic-img" /> <!--话题类型--> <a href="" class="topic-type">星座</a></li>
			</ul>
			<!--论坛盒子-->
			<div class="bbs-box">
				<!--论坛标题层-->
				<div class="bbs-title">
					<!--左侧竖层-->
					<span class="icon-left"></span>
					<!--标题内容-->
					<span class="title-text">热门话题</span>
				</div>
				<!--论坛列表-->
				<ul class="bbs-list">
					<c:forEach items="${findAllPosts.beanList }" var="findAllPosts">
						<li class="bbs">
							<!--新闻标签--> <span class="bbs-tab">帖子</span> <!--新闻链接--> <a
							href="<c:url value='/PostsServlet?method=detailsPosts&posts_id=${findAllPosts.posts_id }'/>"
							class="bbs-href">${findAllPosts.posts_title }</a> <!--新闻日期--> <span
							class="bbs-date"><fmt:formatDate value="${findAllPosts.posts_time }" pattern="yyyy-MM-dd  HH:mm:ss"/></span>
						</li>
					</c:forEach>
				</ul>
				<!--翻页层-->
				<!--翻页层-->
				<ul class="page-turn">
					<!--页数-->
					<a class="page-href">
						<li class="pages" id="other-page">第${findAllPosts.pc }页/共${findAllPosts.tp}页
					</li>
					</a>
					<!--翻页链接-->
					<a href="<c:url value='/PostsServlet?method=findAllPosts&pc=1'/>"
						class="page-href">
						<li class="pages" id="big-page">首页</li>
					</a>
					<c:if test="${findAllPosts.pc>1 }">
						<a
							href="<c:url value='/PostsServlet?method=findAllPosts&pc=${findAllPosts.pc-1 }'/>"
							class="page-href">
							<li class="pages" id="big-page">上一页</li>
						</a>
					</c:if>

					<c:choose>
						<%--页面不足10页时，把所有的页数都显示出来 --%>
						<c:when test="${findAllPosts.tp<=5 }">
							<c:set var="begin" value="1" />
							<c:set var="end" value="${findAllPosts.tp }" />
						</c:when>
						<%--页面>10页时，把所有的页数都显示出来 --%>
						<c:otherwise>
							<c:set var="begin" value="${findAllPosts.pc-2 }" />
							<c:set var="end" value="${findAllPosts.pc+2 }" />
							<%--头溢出 --%>
							<c:if test="${begin<1 }">
								<c:set var="begin" value="1" />
								<c:set var="end" value="10" />
							</c:if>
							<%--尾溢出 --%>
							<c:if test="${end > findAllPosts.tp }">
								<c:set var="begin" value="${findAllPosts.tp - 4 }" />
								<c:set var="end" value="${findAllPosts.tp }" />
							</c:if>
						</c:otherwise>
					</c:choose>

					<c:forEach var="i" begin="${begin }" end="${end }">
						<c:choose>
							<c:when test="${i eq findAllPosts.pc }">
								<a class="page-href">
									<li class="pages">${i }</li>
								</a>
							</c:when>
							<c:otherwise>
								<a
									href="<c:url value='/PostsServlet?method=findAllPosts&pc=${i }'/>"
									class="page-href">
									<li class="pages">${i }</li>
								</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>


					<c:if test="${findAllPosts.pc < findAllPosts.tp }">
						<a
							href="<c:url value='/PostsServlet?method=findAllPosts&pc=${findAllPosts.pc+1 }'/>"
							class="page-href">
							<li class="pages" id="big-page">下一页</li>
						</a>
					</c:if>
					<a
						href="<c:url value='/PostsServlet?method=findAllPosts&pc=${findAllPosts.tp }'/>"
						class="page-href">
						<li class="pages" id="big-page">尾页</li>
					</a>
				</ul>
			</div>
			<!--右侧话题盒子-->
			<div class="right-topic-box">
				<!--发表盒子-->
				<div class="publish-box">
					<!--发表帖子按钮-->
					<a href="<c:url value='jsps/publish.jsp'/>" class="publish-href">发表文章</a>
				</div>
				<!--个人列表-->
				<ul class="personal-list">
					<!--个人 列表内容-->
					<a href="">
						<li class="persnal-list-context">
							<!--个人列表图标--> <img
							src="${pageContext.request.contextPath}/img/bbs-topic-img/bbs-personal-img/collection.png"
							class="personal-img" /> <!--个人列表名称--> <span
							class="personal-list-name">我的收藏</span>
					</li>
					</a>
					<a href="">
						<li class="persnal-list-context">
							<!--个人列表图标--> <img
							src="${pageContext.request.contextPath}/img/bbs-topic-img/bbs-personal-img/follow.png"
							class="personal-img" /> <!--个人列表名称--> <span
							class="personal-list-name">我的关注</span>
					</li>
					</a>
					<a href="">
						<li class="persnal-list-context">
							<!--个人列表图标--> <img
							src="${pageContext.request.contextPath}/img/bbs-topic-img/bbs-personal-img/good_friend.png"
							class="personal-img" /> <!--个人列表名称--> <span
							class="personal-list-name">好友圈</span>
					</li>
					</a>
					<a href="">
						<li class="persnal-list-context">
							<!--个人列表图标--> <img
							src="${pageContext.request.contextPath}/img/bbs-topic-img/bbs-personal-img/nice.png"
							class="personal-img" /> <!--个人列表名称--> <span
							class="personal-list-name">我的赞</span>
					</li>
					</a>
					<a href="">
						<li class="persnal-list-context">
							<!--个人列表图标--> <img
							src="${pageContext.request.contextPath}/img/bbs-topic-img/bbs-personal-img/service.png"
							class="personal-img" /> <!--个人列表名称--> <span
							class="personal-list-name">站内服务中心</span>
					</li>
					</a>
				</ul>
				<!--论坛标题层-->
				<div class="bbs-title" style="width: 300px;">
					<!--左侧竖层-->
					<span class="icon-left"></span>
					<!--标题内容-->
					<span class="title-text">站内通告</span>
				</div>
				<!--站内通告列表-->
				<ul class="inside-news">
					<!--通告列表-->
					<li class="inside-news-list">
						<!--通告连接--> <a class="inside-href" href=""> 致CEC企业交流平台用户的一封信 </a>
						<!-- <span class="inside-date">12-07</span> -->
					</li>
					<li class="inside-news-list">
						<!--通告连接--> <a class="inside-href" href=""> 近期CEC交流平台活动 </a> 
						<!-- <span class="inside-date">12-07</span> -->
					</li>
					<li class="inside-news-list">
						<!--通告连接--> <a class="inside-href" href=""> 关于CEC交流平台发帖规则 </a>
						 <!-- <span class="inside-date">12-07</span> -->
					</li>
					<li class="inside-news-list">
						<!--通告连接--> <a class="inside-href" href=""> 关于CEC交流平台个人帖子版权 </a>
						<!--  <span class="inside-date">12-07</span> -->
					</li>
					<li class="inside-news-list">
						<!--通告连接--> <a class="inside-href" href=""> CEC交流平台网站维护通告 </a> 
						<!-- <span class="inside-date">12-07</span> -->
					</li>
					<li class="inside-news-list">
						<!--通告连接--> <a class="inside-href" href=""> 关于CEC交流平台发展前景 </a>
						<!-- <span class="inside-date">12-07</span> -->
					</li>
					<li class="inside-news-list">
						<!--通告连接--> <a class="inside-href" href=""> CEC交流平台招聘信息 </a>
						<!-- <span class="inside-date">12-07</span> -->
					</li>
				</ul>
			</div>
			<!--广告列表盒子-->
			<ul class="advertisement-box">
				<a href="">
					<li class="advertisement">
						<!--广告标题--> <span class="advertisement-title">开发人员小站<br />（你觉得里面会有什么呢）
					</span>
				</li>
				</a>
				<a href="">
					<li class="advertisement" id="advertisement-two">
						<!--广告标题--> <span class="advertisement-title">CEC交流平台<br />诚招合作伙伴
					</span>
				</li>
				</a>
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
				<i class="foot-text"> 企业员工交流平台 </i>
			</div>
			<!--页脚许可-->
			<div class="foot-copyright">
				<p class="foot-big-text">企业员交流平台版权所有</p>
				<p class="foot-small-text">COPYRIGHT © 1998 - 2018 CEC. ALL
					RIGHTS RESERVED.</p>
				<p class="foot-small-text">COPYRIGHT © 2012 CEC,Inc. ALL RIGHTS
					RESERVED.</p>
				<p class="foot-big-text">本网络论坛适合18+岁的用户使用；为了您的健康，请合理控制浏览时间。</p>
				<p class="foot-big-text">粤网文[2018]FH4017-197号|新出网证（粤）字010号</p>
				<p class="foot-big-text">批准文号：新出审字[2011]310号 |文网进字[2011] 004号 |
					出版物号：TEK-097 9527-5-119169-200-5|全国文化市场统一举报电话：12318</p>
			</div>
		</div>
	</div>
</body>

</html>