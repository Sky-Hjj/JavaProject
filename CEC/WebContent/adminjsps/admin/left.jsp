<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/adminjs/mymenu.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admincss/mymenu.css" type="text/css" media="all">
<script language="javascript">

var bar1 = new Q6MenuBar("bar1", "cec企业员工管理系统");
function load() {
	bar1.colorStyle = 2;
	bar1.config.imgDir = "${pageContext.request.contextPath}/admincss/img/";
	bar1.config.radioButton=false;
	bar1.add("员工管理", "查询全部员工", "<c:url value='/AdminUserServlet?method=findAllUser'/>", "body");
	bar1.add("员工管理", "新增员工信息", "userManage/add.jsp", "body");
	bar1.add("员工管理", "已离职员工", "<c:url value='/AdminUserServlet?method=resignationUser'/>", "body");

	bar1.add("公告管理", "查看所有公告", "<c:url value='/AdminAnnouncementServlet?method=findAllAnnouncement'/>", "body");
	bar1.add("公告管理", "添加新的公告", "announcementManage/add.jsp", "body");

	bar1.add("帖子管理", "查询所有帖子", "<c:url value='/AdminPostsServlet?method=findAllPosts'/>", "body");
	bar1.add("帖子管理", "已删除的帖子", "<c:url value='/AdminPostsServlet?method=findAlldeletePosts'/>", "body");

	var d = document.getElementById("menu");
	d.innerHTML = bar1.toString();
}
</script>

</head>

<body onload="load()" style="margin: 0px; background: rgb(254,238,189);">
<div id="menu"></div>

</body>
</html>
