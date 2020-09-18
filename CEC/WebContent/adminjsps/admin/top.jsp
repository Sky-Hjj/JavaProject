<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="background: rgb(78,78,78);color: white;">
<h1 style="text-align: center; ">cec企业员工管理系统</h1>
 <c:if test="${!empty adminuser }">
<p style="font-size: 11pt;">欢迎：${sessionScope.adminuser.admin_id}</p>
<a href="${pageContext.request.contextPath }/LoginServlet?method=logout"style="color:red;"target="_parent">注销</a>
</c:if>
<c:if test="${empty adminuser }">
<p style="font-size: 11pt;">你好!<a href="<c:url value='/adminjsps/login.jsp'/>" style="color:red;"target="_parent">请登录</a></p>
</c:if>
  </body>
</html>
