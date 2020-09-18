<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

    <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订单详情</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/shopping.css" type="text/css" media="all" />

<jsp:include page="top.jsp" />
</head>
<body>
<div id="container">
<c:forEach items="${orderList }" var="order">
<table border="0" cellspacing="0" cellpadding="0" id="order"> 

<p class="title">订单编号：${order.oid } &nbsp;&nbsp;状态：<c:choose>
				<c:when test="${order.state eq 1 }">
					<a href="<c:url value='/OrderServlet?method=load&oid=${order.oid }'/>">付款</a>
				</c:when>
				<c:when test="${order.state eq 2 }">等待发货</c:when>
				<c:when test="${order.state eq 3 }">
					<a href="<c:url value='/OrderServlet?method=confirm&oid=${order.oid }'/>">确认收货</a>
				</c:when>
				<c:when test="${order.state eq 4 }">交易成功</c:when>
			</c:choose>
			&nbsp;&nbsp;总金额：${order.total }
			</p>  
<c:forEach items="${order.orderItemList }" var="orderItem">
 <tr id="1">
 	<td><a>${orderItem.book.bname }</a></td>
 	<td><img src="${pageContext.request.contextPath }/images/${orderItem.book.image }" height="100" /></td>    
   	<td>&nbsp;&nbsp;${orderItem.count }&nbsp;&nbsp;</td>    
   	<td>&yen;${orderItem.book.price }</td>
   	<td>&yen;${orderItem.subtotal }</td>
 </tr>
</c:forEach> 

</table>
</c:forEach>
</div>

<jsp:include page="foot.jsp" />
</body></html>
