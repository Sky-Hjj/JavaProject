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

<p class="title">订单编号：${order.oid}</p>
<form action="<c:url value='/OrderServlet?method=pay'/>"method="post">  
<table border="0" cellspacing="0" cellpadding="0" id="order">    
 <tr class="title">    
   <td>商品名称</td>  
   <td>商品图片</td>    
   <td>数量</td>    
   <td>单价</td>    
   <td>小计</td>    
 </tr>    
<c:forEach items="${order.orderItemList }" var="orderItem">
 <tr id="1">
 	<td><a>${orderItem.book.bname }</a></td>
 	<td><img src="${pageContext.request.contextPath }/images/${orderItem.book.image }" height="100" /></td>    
   	<td>${orderItem.count}</td>    
   	<td>&yen;${orderItem.book.price }</td>
   	<td>&yen;${orderItem.subtotal }</td>
 </tr>
</c:forEach> 

</table>

<p style="text-align: right;margin-right:20px;">合计：${order.total }元</p>

<div>
			<hr />
			<br>
			
			<input type="hidden" name="method" value="pay"/>
			<input type="hidden" name="oid" value="${order.oid }"/>
			<input type="hidden" name="total" value="${order.total }"/>
			<div class="form-horizontal"style="margin-top: 5px; margin-left: 200px;">
				<div>
					<label style="font-size:18px;" >地址&nbsp;&nbsp;&nbsp;</label>
					<input type="text"placeholder="请输入收货地址" style="width:270px; height:30px;">
				</div><br>
				<div>
					<label style="font-size:18px;">收货人</label>
					<input  type="text" placeholder="请输收货人" style="width:270px; height:30px;">
				</div><br>
				<div>
					<label style="font-size:18px;">电话&nbsp;&nbsp;&nbsp;</label>
					<input type="text" placeholder="请输入联系方式" style="width:270px; height:30px;">
				</div><br>
			</div>
			<hr />
			<div style="margin-top: 5px; margin-left: 200px;">
				<strong>选择银行：</strong>
				<p>
					<br /> 
					<input type="radio" name="pd_FrpId" value="ICBC-NET-B2C"checked="checked" />工商银行 <img 
						src="${pageContext.request.contextPath }/bank_img/icbc.bmp"
						align="middle" />&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="radio"name="pd_FrpId" value="BOC-NET-B2C" />中国银行 <img
						src="${pageContext.request.contextPath }/bank_img/bc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="pd_FrpId" value="ABC-NET-B2C" />农业银行 <img
						src="${pageContext.request.contextPath }/bank_img/abc.bmp" align="middle" /> <br /> <br />
					<input type="radio" name="pd_FrpId" value="BOCO-NET-B2C" />交通银行 <img
						src="${pageContext.request.contextPath }/bank_img/bcc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="pd_FrpId" value="PINGANBANK-NET" />平安银行
						<img src="${pageContext.request.contextPath }/bank_img/pingan.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="pd_FrpId" value="CCB-NET-B2C" />建设银行 <img
						src="${pageContext.request.contextPath }/bank_img/ccb.bmp" align="middle" /> <br /> <br /> 
					<input type="radio" name="pd_FrpId" value="CEB-NET-B2C" />光大银行 <img
						src="${pageContext.request.contextPath }/bank_img/guangda.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C" />招商银行
					<img src="${pageContext.request.contextPath }/bank_img/cmb.bmp" align="middle" /><br /><br /> 
				</p>
				
			</div>
		
			<hr />
			<p class=""><input type="submit" value="确认订单" name="submit"
								style="background:#F00; margin-top: 10px;margin-left:700px; margin-bottom:20px; height:30px; width:260px; font-size:18; "/></p>

</div>
</form>
</div>
<jsp:include page="foot.jsp" />

</body></html>
