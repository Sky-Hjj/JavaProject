<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>发表文章</title>
		<link type="text/css" rel="stylesheet" href="../css/publish.css" />
		<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.2.0.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.validate.min.js"></script>
	</head>
<script type="text/javascript">
	$(function() {
		$("#posts-form").validate({
			rules : {
				"posts_title" : {
					"required" : true,
					"rangelength" : [ 1, 20 ],
				},
				"posts_content" : {
					"required" : true,
					"rangelength" : [ 1, 300 ],
				}
			},
			messages : {
				"posts_title" : {
					"required" : "标题不能为空",
					"rangelength" : "最多不能超过20个字"
				},
				"posts_content" : {
					"required" : "内容不能为空",
					"rangelength" : "最多不能超过300个字"
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
		<!--页面头部分-->
		<div class="head">
			<i class="head-href" title="CEC交流平台">
				<a href="bbs.html"><span style="color: #B03060;">C</span>EC</a>
			</i>
			<div class="head-middle">
				<!--头部内容-->
				<span class="head-context">发表文章</span>
			</div>
		</div>
		<!--页面中间层-->
		<div class="middle">
			<!--表单验证-->
			<form action="${pageContext.request.contextPath }/PostsServlet?method=insertPosts" method="post" class="forms" id="posts-form">	
				<!--帖子标题-->
				<input type="hidden" name="user_id" value="${sessionScope.user.user_id}"/>
				<input type="text" name="posts_title" class="post-title" placeholder="请输入标题（最多20个字）" />
				<!--帖子内容输入-->
				<textarea class="post-context" rows="30" cols="70" placeholder="在此输入文字" autocomplete="off" name="posts_content"></textarea>
				<!--提交按钮-->
				<input type="submit" name="btnPost" value="发&nbsp表" class="post-btn"/>
			</form>
		</div>
	</body>

</html>