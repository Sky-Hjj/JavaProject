<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品分类</title>
<link rel="stylesheet"
		href="${pageContext.request.contextPath }/css/stationery.css"
		type="text/css" media="all" />
<jsp:include page="top.jsp" />
</head>

<body>
	<div class="content">
		<div class="middle">
		<c:forEach items="${categoryFind }" var="category">
			<p class="title" >
			<a href="<c:url value='/BookServlet?method=findAllCategory&cid=${category.cid }'/>">${category.cname} &nbsp;&gt;</a>
			</p>
		</c:forEach>
			<div class="salegoods">
			<c:forEach items="${CategorybooskList }" var="book">
				<dl>
					<dt>
						<a href="<c:url value='/BookServlet?method=load&bid=${book.bid }'/>"><img src="${pageContext.request.contextPath }/images/${book.image}" /></a>
					</dt>
					<dd>
						<a href="<c:url value='/BookServlet?method=load&bid=${book.bid }'/>"> <span class="disc"> <strong>${book.bname }</strong>
						<span class="price">&yen;${book.price}</span></a>
					</dd>
				</dl>
			</c:forEach>
			</div>
		</div>
	</div>

	
</body>
<jsp:include page="foot.jsp" />

</html>
