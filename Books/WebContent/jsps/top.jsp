<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/tf.css" type="text/css" media="all" />

<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.0.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.validate.min.js" ></script>

<script type="text/javascript">
$(document).ready(function() { 
 $('#nav li').hover(function() {
  $('ul', this).slideDown(200);
  $(this).children('a:first').addClass("hov");
 }, function() {
  $('ul', this).slideUp(100);
  $(this).children('a:first').removeClass("hov");  
 });
});
</script>
</head>
<body>

<div id="header">
    <div class="header-top">
    <div class="logo-container"><a href="<c:url value='/jsps/main.jsp'/>"target="_parent"><img src="${pageContext.request.contextPath }/images/ertongjie.gif" width="360" height="100" alt="logo" /></a></div>
       <ul id="nav">    
    <div class="header-nav">
      <ul>
        <li><a href="<c:url value='/jsps/main.jsp'/>"target="_parent">首页</a></li>
        <li><a href="#">资讯动态</a>
        <ul>
        <li><a href="#">消息</a></li>
        <li><a href="#">新鲜事</a></li>
        </ul>
        </li>
        <li><a>我的</a>
        <ul>
        <c:if test="${empty user }">
        <li><a href="<c:url value='/jsps/login.jsp'/>"target="_parent">登录</a></li>
        <li><a href="<c:url value='/jsps/register.jsp'/>"target="_parent">注册</a></li>
      	</c:if>
      	<c:if test="${!empty user }">
      	<li><a>${user.username }</a></li>
      	<li><a href="<c:url value='/OrderServlet?method=myOrders'/>"target="_parent">我的订单</a></li>
        <li><a target="_parent" href="${pageContext.request.contextPath }/UserServlet?method=logout">注销</a></li>
      	
      	</c:if>
      	</ul>
        </li>
        <li><a href="<c:url value='/jsps/shopping.jsp'/>"target="_parent">购物车</a></li>
        <li><a href="#">客服服务</a>
         <ul>
        <li><a href="#">联系</a></li>
        <li><a href="#">投诉</a></li>
        <li><a href="#">建议</a></li>
        </ul>
        </li>
      </ul>
    </div>
    <div>
    <form action="${pageContext.request.contextPath }/BookServlet?method=Find" target="_parent" method="post">
    <input type="text" class="seek" name="find" placeholder="请输入书名或作者"/>
    <input type="submit" name="submit" style="width:60px; height:34px;margin-top: 40px;background:#F00" value="搜&nbsp;&nbsp;索"/>
     </form>
    </div>
    </div>
</div>

</body>
</html>