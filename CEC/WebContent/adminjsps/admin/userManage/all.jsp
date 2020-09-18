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
	<h2>在职员工列表</h2>
	<h2>${Error }</h2>
	<table align="center" border="1px" cellpadding="0" cellspacing="0">
		<tr id="th" bordercolor="rgb(78,78,78)">
			<th>员工ID</th>
			<th>员工名称</th>
			<th>员工密码</th>
			<th>员工性别</th>
			<th>员工年龄</th>
			<th>身份证号</th>
			<th>手机号</th>
			<th>邮箱号</th>
			<th>家庭住址</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${pb.beanList }" var="findAllUser">
			<tr bordercolor="rgb(78,78,78)">
				<td name="user_id">${findAllUser.user_id }</td>
				<td>${findAllUser.user_name }</td>
				<td>${findAllUser.user_password }</td>
				<td><c:if test="${findAllUser.user_sex eq 1 }">男</c:if> <c:if
						test="${findAllUser.user_sex eq 0 }">女</c:if></td>
				<td>${findAllUser.user_age }</td>
				<td>${findAllUser.user_idcard }</td>
				<td>${findAllUser.user_phone }</td>
				<td>${findAllUser.user_email }</td>
				<td>${findAllUser.user_address }</td>
				<td><a
					href="<c:url value='/AdminUserServlet?method=loadUser&user_id=${findAllUser.user_id }'/>">修改</a>
					| <a onclick="return confirm('您真要删除该员工吗?')"
					href="<c:url value='/AdminUserServlet?method=deleteUser&user_id=${findAllUser.user_id }'/>">删除</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<center>
		第${pb.pc }页/共${pb.tp}页 <a
			href="<c:url value='/AdminUserServlet?method=findAllUser&pc=1'/>">首页</a>
		<c:if test="${pb.pc>1 }">
			<a
				href="<c:url value='/AdminUserServlet?method=findAllUser&pc=${pb.pc-1 }'/>">上一页</a>
		</c:if>


		<c:choose>
			<%--页面不足10页时，把所有的页数都显示出来 --%>
			<c:when test="${pb.tp<=5 }">
				<c:set var="begin" value="1" />
				<c:set var="end" value="${pb.tp }" />
			</c:when>
			<%--页面>10页时，把所有的页数都显示出来 --%>
			<c:otherwise>
				<c:set var="begin" value="${pb.pc-2 }" />
				<c:set var="end" value="${pb.pc+2 }" />
				<%--头溢出 --%>
				<c:if test="${begin<1 }">
					<c:set var="begin" value="1" />
					<c:set var="end" value="10" />
				</c:if>
				<%--尾溢出 --%>
				<c:if test="${end > pb.tp }">
					<c:set var="begin" value="${pb.tp - 4 }" />
					<c:set var="end" value="${pb.tp }" />
				</c:if>
			</c:otherwise>
		</c:choose>

		<c:forEach var="i" begin="${begin }" end="${end }">
			<c:choose>
				<c:when test="${i eq pb.pc }">
		[${i }]
		</c:when>
				<c:otherwise>
					<a
						href="<c:url value='/AdminUserServlet?method=findAllUser&pc=${i }'/>">[${i }]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:if test="${pb.pc < pb.tp }">
			<a
				href="<c:url value='/AdminUserServlet?method=findAllUser&pc=${pb.pc+1 }'/>">下一页</a>
		</c:if>
		<a
			href="<c:url value='/AdminUserServlet?method=findAllUser&pc=${pb.tp }'/>">尾页</a>
	</center>
</body>
</html>
