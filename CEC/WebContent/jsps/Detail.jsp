<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>帖子详情</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/Normalize.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/Detail.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/posts_text.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.2.0.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.validate.min.js"></script>
</head>
<script type="text/javascript">
	$(function() {
		$("#comment-form").validate({
			rules : {
				"comment_content" : {
					"required" : true,
					"rangelength" : [ 1, 50 ],
				}
			},
			messages : {
				"comment_content" : {
					"required" : "评论不能为空",
					"rangelength" : "最多不能超过50个字"
				}
			}
		})
	})
</script>
<style type="text/css">
.error {
	padding-left: 35px;
	color: red;
}
</style>
<body>
	<!--页面头部-->
	<div id="page_head">
		<div style="width: 680px; margin: 0 auto;">
			<!--
                	作者：offline
                	时间：2018-12-07
                	描述：用户头像
                -->
			<img src="${pageContext.request.contextPath}/images/${sessionScope.user.user_head}" width="36px" height="36px"
				style="border-radius: 18px;" /> <a href="<c:url value='/UserServlet?method=myhome&user_id=${sessionScope.user.user_id}'/>">${sessionScope.user.user_name}</a> <a
				href="<c:url value='/PostsServlet?method=findNewPosts'/>">首页</a>
		</div>
	</div>
	<!--帖子内容-->
	<div class="content">
		<h1 class="title">${detailsPosts.posts_title }</h1> 
		<span style="color: #999999; margin-right: 20px;"><fmt:formatDate value="${detailsPosts.posts_time }" pattern="yyyy-MM-dd  HH:mm:ss"/></span>
		<c:forEach items="${findAllUser }" var="findAllUser">
     						<c:if test="${findAllUser.user_id eq detailsPosts.cec_user.user_id }">${findAllUser.user_name }</c:if>
						</c:forEach>
		<%-- <a href="pzone.html">${detailsPosts.cec_user.user_id }</a> --%>
		<hr />

		<span class="content_text">${detailsPosts.posts_content }</span>
	</div>
	<!--评论区-->
	<div class="posts">
		<!--评论-->
		<div class="posts_set" id="posts_set">
			<!--评论者头像-->
			<form action="${pageContext.request.contextPath }/PostsServlet?method=insertComment" method="post" id="comment-form">
			<img src="${pageContext.request.contextPath}/images/${sessionScope.user.user_head}" width="30px" height="30px"
				style="border-radius: 15px;" />
			<!--评论内容-->
			<textarea id="text" name="comment_content" placeholder="想对作者说些什么" cols="78"
				style="border-radius: 4px;" onclick="posts_text()"></textarea>
			<input type="hidden" name="posts_id" value="${detailsPosts.posts_id}"/>
			<div id="enter">
				<input type="submit" value="发表" />
			</div>
			</form>
		</div>
		<!--历史评论的内容-->
		<c:forEach items="${allComment }" var="allComment">
			<div class="posts_content">
				<!--评论者头像-->
				<img src="${pageContext.request.contextPath}/images/${allComment.user_head}" width="30px" height="30px"
					style="border-radius: 15px;" />
				<!--评论者名称-->
				<strong class="posts_user"><a href="#">${allComment.user_name }<strong>：</strong></a>
				</strong>
				<!--评论者内容-->
				<span class="posts_text">${allComment.comment_content }<span
					class="posts_time">(评论时间: <fmt:formatDate value="${allComment.comment_time }" pattern="yyyy-MM-dd  HH:mm:ss"/>)</span></span>
			</div>
		</c:forEach>

	</div>
</body>

</html>