<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		<h2>公告详情</h2>
		<div>
			<form action="<c:url value='/AdminAnnouncementServlet?method=updateAnnouncement'/>" method="post">
				<table>
					<tr>
					<input type="hidden" name="announcement_id" value="${loadAnnouncement.announcement_id}"/>
						<td>公告标题：</td>
						<td><input type="text" name="announcement_title" value="${loadAnnouncement.announcement_title }"/></td>
					</tr>
					<tr>
						<td>发布时间：</td>
						<td>${loadAnnouncement.announcement_time }</td>
					</tr>
					<tr>
						<td>公告内容：</td>
						<td>
							<textarea name="announcement_content" rows="10" cols="80" >${loadAnnouncement.announcement_content }</textarea>
						</td>
					</tr>
					<tr>
						<td><input type="submit" value="完成"/></td>
					</tr>
				</table>
			</form>
		</div>
	</body>

</html>
