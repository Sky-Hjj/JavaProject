<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.validate.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#announcement-form").validate({
			rules : {
				"announcement_title" : {
					"required" : true,
				},
				"announcement_content" : {
					"required" : true,
				}
			},
			messages : {
				"announcement_title" : {
					"required" : "公告标题不能为空",
				},
				"announcement_content" : {
					"required" : "公告内容不能为空",
				}
			}
		})
	})
</script>
<style type="text/css">
body {
	background: rgb(254, 238, 189);
}

.error {
	padding-left: 20px;
	color: red;
}
</style>
</head>

<body>
	<h2>添加新的公告</h2>
	<div>
		<form
			action="${pageContext.request.contextPath }/AdminAnnouncementServlet?method=addAnnouncement"
			method="post" id="announcement-form">
			<table>
				<tr>
					<td>公告标题：</td>
					<td><input type="text" name="announcement_title" /></td>
				</tr>
				<tr>
					<td>公告内容：</td>
					<td><textarea name="announcement_content" rows="10" cols="80"
							placeholder="说点儿什么吧"></textarea></td>
				</tr>
				<tr>
					<td><input type="submit" value="完成" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>

</html>