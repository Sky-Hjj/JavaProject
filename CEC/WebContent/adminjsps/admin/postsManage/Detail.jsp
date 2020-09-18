<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<title>My JSP 'add.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<meta http-equiv="content-type" content="text/html;charset=utf-8">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<style type="text/css">
			body {
				background: rgb(254, 238, 189);
			}
		</style>
	</head>

	<body>
		<h2>帖子详情</h2>
		<div>
			<form action="" method="post">
				<table>
					<tr>
						<td>帖子标题：</td>
						<td>${detailPosts.posts_title }</td>
					</tr>
					<tr>
						<td>发帖人ID：</td>
						<td>
						<c:forEach items="${findAllUser }" var="findAllUser">
     						<c:if test="${findAllUser.user_id eq detailPosts.cec_user.user_id }">${findAllUser.user_name }</c:if>
						</c:forEach>
						</td>
					</tr>
					<td>发帖时间：</td>
						<td>${detailPosts.posts_time }</td>
					</tr>
					<tr>
						<td>帖子内容：</td>
						<td>
						${detailPosts.posts_content }
							<%-- <textarea name="posts_content" rows="10" cols="80" placeholder="说点儿什么吧">${detailPosts.posts_content }</textarea> --%>
						</td>
					</tr>
					<tr>
						<!--<td><input type="submit" value="完成"/></td>-->
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>