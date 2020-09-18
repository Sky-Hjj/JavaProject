<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品详情</title>
<jsp:include page="top.jsp"/>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/details.css" type="text/css" media="all" />


</head>
<div id="container">
<p class="title">商品介绍</p>

<div>
  <p><img src="${pageContext.request.contextPath }/images/${book.image}"width="500" height="500" class="images"></p>

  <div class="content-title">
    <strong>${book.bname }</strong>
    <p class="introduce-title">作者：${book.author }</p>
  <p><span class="price">&yen;${book.price }</span></p>
  </div>
 <form id="form" action="<c:url value='/CartServlet?method=add'/>"method="post">
 <input type="hidden" name="bid" value="${book.bid }"/>
<p class="introduce-title">数量：<input type="text" name="count" value="1" style="height:27px; width:180px;"/></p>
<p class="btu"><input type="submit" value="加&nbsp;&nbsp;入&nbsp;&nbsp;购&nbsp;&nbsp;物&nbsp;&nbsp;车" name="submit"
								style="background:#F00; height:40px; width:180px; font-size:18"/></p>
</form>  
</div>

</div>
<div id="container">
<p class="title">详细信息</p>

<p class="introduce-images">${book.bdesc }</p>
<p class="introduce-images"><img src="${pageContext.request.contextPath }/images/${book.image}" style="height:100%;"></p>

</div>
<jsp:include page="foot.jsp"/>
</body>
</html>
