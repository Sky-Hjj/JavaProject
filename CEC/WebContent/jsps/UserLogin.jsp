<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户登录</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/UserLogin.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.0.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.validate.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.validate.min.js" ></script>
<style>
.error{
	padding-left: 20px;
	color:red;
}
</style>
</head>
<script type="text/javascript">
$(function(){
	$("#myform").validate({
		rules:{
			"txtID":{
				"required":true,
				"digits":true,
			},
			"txtPwd":{
				"required":true
			}
		},
		messages:{
				"txtID":{
					"required":"用户名不能为空",
					"digits":"账号存在非法字符",
			},
				"txtPwd":{
					"required":"密码不能为空"
			}
		},
	})
})
</script>
<%
String name="";
String psw="";
Cookie[] cookies = request.getCookies();
if(cookies!=null){
	for(Cookie c:cookies){
		if("cookie_name".equals(c.getName())){
			name=c.getValue();
		}
		if("cookie_psw".equals(c.getName())){
			psw=c.getValue();
		}
		
	}
	}
%>
<body style="background-color: #B03060;">
	<div class="wholePage">
		<!--页面标题-->
		<div class="page_title">
			<span>Hi，亲爱的用户!</span>
		</div>
		<div class="login">
			<form id="myform" action="${pageContext.request.contextPath }/UserServlet?method=login" method="post">
				<p style="color: red; text-align:center;padding-top:20px;">${loginError}</p><br>
				<input type="text" name="txtID" id="txtID" placeholder="请输入登录ID" value="<%=name %>"/>
				<input type="password" name="txtPwd" id="txtPwd" placeholder="请输入密码" value="<%=psw %>"/>
				<input type="checkbox" name="rememberPwd" id="checkbox" value="rememberPwd" checked="checked"/>
				<span id="rememberPwd">记住密码</span> 
				<input type="checkbox"name="rememberID" id="checkboxTwo" value="rememberID"/>
				<span id="loginAutomatic">自动登录</span>
				<input type="submit" value="确定" id="OKBtn" />
			</form>
		</div>
	</div>
</body>
</html>
