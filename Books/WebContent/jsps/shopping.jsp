<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
    <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>购物车</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/shopping.css" type="text/css" media="all" />

<jsp:include page="top.jsp" />
</head>

<div id="container">
<p class="title">我的购物车</p>



</head>    
<body>
<c:choose>
	<%-- 如果没有车，或车的内容集合为0长 --%>
	<c:when test="${empty sessionScope.cart or fn:length(sessionScope.cart.cartItems) eq 0}">
		<p style="text-align: center"><img src="<c:url value='/images/gouwuche.jpg'/>" width="500px";/></p>
	</c:when>
	<c:otherwise>  
<form action="<c:url value='/OrderServlet?method=add'/>"method="post">  
<table border="0" cellspacing="0" cellpadding="0" id="order">    
 <tr class="title">    
   <td>商品名称</td>  
   <td>商品图片</td>    
   <td>数量</td>    
   <td>价格</td>    
   <td>操作</td>    
 </tr>    
 <c:forEach items="${sessionScope.cart.cartItems }" var="cartItem">
 <tr id="1">
 <td><a>${cartItem.book.bname }</a></td>
 <td><img src="${pageContext.request.contextPath }/images/${cartItem.book.image}" height="100" /></td>    
   <td>${cartItem.count}</td>    
   <td>&yen;${cartItem.subtotal }</td>
   
   <td><a href="<c:url value='/CartServlet?method=delete&bid=${cartItem.book.bid }'/>">删除</a>   
   </td>
   
 </tr>
 </c:forEach> 
 <tr>    
   <td colspan="5" style="height:40px;">    
   <p>合计：${sessionScope.cart.total }元</p>
 </tr>    
 <tr>  

   <td colspan="5" style="height:40px;">    
   <input name="submit" type="submit" value="提交订单" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<c:url value='/CartServlet?method=clear'/>">清空购物车</a></td>    
   
 </tr>    
</table>
</form>
</c:otherwise>
</c:choose>   
 </div>

<jsp:include page="foot.jsp" />
</body></html>
