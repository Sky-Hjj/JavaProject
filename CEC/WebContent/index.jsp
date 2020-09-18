<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty user }">
<jsp:forward page="/jsps/UserLogin.jsp" />
</c:if>
<c:if test="${!empty user }">
<jsp:forward page="/PostsServlet?method=findNewPosts" />
</c:if>