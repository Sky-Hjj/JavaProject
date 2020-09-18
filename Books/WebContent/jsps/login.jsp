<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%><html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>

<title>登录</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/login.css" type="text/css" media="all" />
<jsp:include page="top.jsp"/>
<style>
.error{
	padding-left: 20px;
 	color:red
}
</style>
</head>
<script type="text/javascript">
$(function(){
	$("#myform").validate({
		rules:{
			"username":{
				"required":true
			},
			"password":{
				"required":true
				
			}
		},
		
		messages:{
				"username":{
					"required":"用户名不能为空"
			},
				"password":{
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


  <div id="container">
    <div class="login-con">
      <form id="myform" name="loginForm" action="${pageContext.request.contextPath }/UserServlet?method=login" method="post">
        <fieldset>
          <legend>用户登录</legend>
          <div class="login-cont">
            <p class="login-left"><img src="${pageContext.request.contextPath }/images/d7b166542c067e1e7a82a5f919748eff.jpg" width="233" height="204" /></p>
            
            <div class="login-right">
            <p style="color: red; font-weight: 900">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${loginError}</p><br>
              <p class="login-name">账号：<input type="text" name="username" placeholder="请输入登录ID" value="<%=name%>"/></p>
              <p class="login-password">密码：<input type="password" name="password" placeholder="请输入登录ID" value="<%=psw%>"/></p>
              
              
              </br>
              <div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="checkbox">
									<label> <input type="checkbox" name="autoLogin" value="autoLogin"> 自动登录
									</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label> 
									<input type="checkbox"name="remName" value="remName"checked="checked"> 记住用户名密码
									</label>
								</div>
							</div>
						</div>
              <p class="btn-login"><input type="submit" value="登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录" name="submit"
								style="background:#F00; height:30px; width:260px; font-size:18"/></p>
              
              <p class="new-user"><a href="register.html">新用户注册</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <a href="#">忘记密码？</a></p>
            </div>
          </div>
  		</fieldset>
      </form>
    </div>
</div>
  <jsp:include page="foot.jsp"/>
</body>
</html>
