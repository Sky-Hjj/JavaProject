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
<style type="text/css">
body {
	background: rgb(254, 238, 189);
}

table {
	font-family: 宋体;
	width: 90%;
}

#th {
	background: rgb(78, 78, 78);
	height: 36px;
	color: white;
}

tr {
	height: 30px;
}
</style>
</head>

<body>
	<h2>公告列表</h2>
	<table align="center" border="1px" cellpadding="0" cellspacing="0">
		<tr id="th" bordercolor="rgb(78,78,78)">
			<th>公告ID</th>
			<th>公告标题</th>
			<th>发布时间</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${findAllAnnouncement.beanList }" var="findAllAnnouncement">
			<tr bordercolor="rgb(78,78,78)">
				<td>${findAllAnnouncement.announcement_id }</td>
				<td>${findAllAnnouncement.announcement_title }</td>
				<td>${findAllAnnouncement.announcement_time }</td>
				<td>
				<a href="<c:url value='/AdminAnnouncementServlet?method=loadAnnouncement&announcement_id=${findAllAnnouncement.announcement_id }'/>">修改</a> |
				<a onclick="return confirm('您真要删除该公告吗?')" href="<c:url value='/AdminAnnouncementServlet?method=deleteAnnouncement&announcement_id=${findAllAnnouncement.announcement_id }'/>">删除</a></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<center>
		第${findAllAnnouncement.pc }页/共${findAllAnnouncement.tp}页 <a
			href="<c:url value='/AdminAnnouncementServlet?method=findAllAnnouncement&pc=1'/>">首页</a>
		<c:if test="${resignationUser.pc>1 }">
			<a
				href="<c:url value='/AdminAnnouncementServlet?method=findAllAnnouncement&pc=${findAllAnnouncement.pc-1 }'/>">上一页</a>
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
		[${i }]
		</c:when>
				<c:otherwise>
					<a
						href="<c:url value='/AdminAnnouncementServlet?method=findAllAnnouncement&pc=${i }'/>">[${i }]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:if test="${findAllAnnouncement.pc < findAllAnnouncement.tp }">
			<a
				href="<c:url value='/AdminAnnouncementServlet?method=findAllAnnouncement&pc=${findAllAnnouncement.pc+1 }'/>">下一页</a>
		</c:if>
		<a
			href="<c:url value='/AdminAnnouncementServlet?method=findAllAnnouncement&pc=${findAllAnnouncement.tp }'/>">尾页</a>
	</center>
</body>
</html>
