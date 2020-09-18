<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>

<title>注册</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/register.css" type="text/css" media="all"/>
<jsp:include page="top.jsp"/>

<style>
.error{
	padding-left: 25px;
 	color:red
}
</style>
<title>用户注册</title>
<script type="text/javascript">
//自定义校验规则
$.validator.addMethod(
	//规则的名称
	"CheckUsername",
	//校验的函数
	function(value,element,params){
		
		//定义一个标志
		var flag = false;
		
		//value:输入的内容
		//element:被校验的元素对象
		//params：规则对应的参数值
		//目的：对输入的username进行ajax校验
		$.ajax({
			"async":false,
			"url":"${pageContext.request.contextPath}/UserServlet?method=checkUsername",
			"data":{"username":value},
			"type":"POST",
			"dataType":"json",
			"success":function(data){
				flag = data.isExist;
			}
		});
		
		
		//返回false代表该校验器不通过
		return !flag;
	}
);

$(function(){
	$("#myform").validate({
		rules:{
			"username":{
				"required":true,
				"CheckUsername":true,
			},
			"password":{
				"required":true,
				"rangelength":[6,12],
			},
			"repassword":{
				"required":true,
				"rangelength":[6,12],
				"equalTo":"#password",
			},
			"email":{
				"required":true,
				"email":true,
			},
			"telephone":{
				"required":true,
				
			},
			"name":{
				"required":true,
			},
			"birthday":{
				"required":true,
			},
			"sex":{
				"required":true,
			}
			
		},
		messages:{
			"username":{
				"required":"用户名不能为空",
				"CheckUsername":"用户名已存在",
			},
			"password":{
				"required":"密码不能为空",
				"rangelength":"密码长度6~12位"
			},
			"repassword":{
				"required":"密码不能为空",
				"rangelength":"密码长度6-12位",
				"equalTo":"两次密码不一致",
			},
			"email":{
				"required":"邮箱不能为空",
				"email":"邮箱格式不正确",
			},
			"telephone":{
				"required":"电话号码不能为空",
				
			},
			"name":{
				"required":"姓名不能为空",
			},
			"birthday":{
				"required":"请选择出生年月日",
			}
		}
	})
})
</script>




</head>


<body>


<div id="container">

    <div class="regist-con">
      <form id="myform"action="${pageContext.request.contextPath }/UserServlet?method=register" method="post">
        <fieldset>
          <legend>用户注册</legend>
          <ul class="regist-cont">
            <li>
              <dl>
                <dt>用户名：*</dt>
                <dd><input type="text" placeholder="用户名" name="username"></dd>
              </dl>
              
            </li>
            <li>
              <dl>
                <dt>密码：*</dt>
                <dd class="regist-password"><input type="password" placeholder="请输入密码" name="password" id="password"></dd>
              </dl>
              
            </li>
            <li>
              <dl>
                <dt>确认密码：*</dt>
                <dd class="regist-password"><input type="password"placeholder="请输入确认密码" name="repassword" ></dd>
              </dl>
             </li>
            <li>
              <dl>
                <dt>邮箱：*</dt>
                <dd><input type="text" placeholder="请输入邮箱" name="email"></dd>
              </dl>
            </li>
             <li>
              <dl>
                <dt>电话：*</dt>
                <dd><input type="text" placeholder="请输入电话" name="telephone"></dd>
              </dl>
            </li>
            <li>
              <dl>
                <dt>姓名：*</dt>
                <dd><input type="text" placeholder="请输入姓名" name="name"></dd>
              </dl>
            </li>
            <li>性别：
            <input type="radio"name="sex" id="sex1" value="male">男
			<input type="radio"name="sex" id="sex2" value="female">女
			<label class="error" for="sex" style="display:none">请选择你的性别</label>
			</li>
            
            <li>
              <dl>
                <dt>生日：*</dt>
                <dd><input type="date" class="form-control" name="birthday"> </dd>
              </dl>
              
            </li>
          </ul>
          <p class="btn-regist"><input type="submit" value="注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;册" name="submit"
								style="background:#F00; height:30px; width:200px; font-size:18"/></p>
          <p class="login-direct"><a href="login.html">直接登录</a></p>
  		</fieldset>
      </form>
    </div>
  </div> 
<jsp:include page="foot.jsp"/>

</body>
</html>
