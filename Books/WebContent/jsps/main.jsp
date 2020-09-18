<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath }/jquery-3.2.0.js" ></script>

<title>主页</title>
<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
</head>

<style type="text/css">
	body{
			height:100%;
			border: 3px solid #F00;
			text-align:center;
		}
	.table{
			width:1060px;
			height:100%;
			}
	iframe {
			width: 100%;
			height: 100%;
		}
</style>

<body>
<table class="table" align="center">
	<tr style="height:100%">
		<td colspan="2" align="center" height=200>
			<iframe frameborder="0" src="<c:url value='/jsps/top.jsp'/>" name="top" ></iframe>
		</td>
	</tr>
	<tr style="height:100%">
		<td width="240" height=2180 align="center">
			<iframe frameborder="0" width="120" src="<c:url value='/CategoryServlet?method=findAll'/>" name="left"></iframe>
		</td>
		<td>
			<iframe frameborder="0" src="<c:url value='/BookServlet?method=indexFind'/>" name="body"></iframe>
		</td>
	</tr>
	<tr style="height:100%">
		<td colspan="2" align="center" align="center">
			<iframe frameborder="0" src="<c:url value='/jsps/foot.jsp'/>" name="foot"></iframe>
		</td>
	</tr>
</table>

</body>
</html>