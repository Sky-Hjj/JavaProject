<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>My JSP 'add.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html;charset=utf-8">

<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.validate.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#updateuser-form").validate({
			rules : {
				"user_name" : {
					"required" : true,

				},
				"user_password":{
					"required" : true,
				},
				"user_age" : {
					"required" : true,
					"rangelength" : [ 1, 2 ],
				},
				"user_idcard" : {
					"required" : true,
					"rangelength" : [ 18, 18 ],
				},
				"user_phone" : {
					"required" : true,
					"digits" : true,
				},
				"user_email" : {
					"required" : true,
					"email" : true,
				},
				"user_address" : {
					"required" : true,
				}
			},
			messages : {
				"user_name" : {
					"required" : "姓名不能为空",
				},
				"user_password":{
					"required" : "密码不能为空",
				},
				"user_age" : {
					"required" : "年龄不能为空",
					"rangelength" : "年龄输入有误",
				},
				"user_idcard" : {
					"required" : "身份证号码不能为空",
					"rangelength" : "身份证长度为18位",
				},
				"user_phone" : {
					"required" : "电话不能为空",
					"digits" : "电话号码必须为数字",
				},
				"user_email" : {
					"required" : "邮箱不能为空",
					"email" : "邮箱格式不正确",
				},
				"user_address" : {
					"required" : "地址不能为空",
				}
			}
		})
	})
</script>

<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
body {
	background: rgb(254, 238, 189);
}

.error {
	padding-left: 20px;
	color: red;
}
</style>
</head>

<body>
	<h2>修改员工信息</h2>
	<div>
		<form action="<c:url value='/AdminUserServlet?method=updateUser'/>"
			method="post" id="updateuser-form" >
			<table>
				<tr>
					<td><img
						src="${pageContext.request.contextPath }/images/${loadUser.user_head }"
						 width="120px" height="120px" border="2px" /></td>
				</tr>
				<input type="hidden" name="user_id" value="${loadUser.user_id}" />
				<input type="hidden" name="user_head" value="${loadUser.user_head}" />
				<input type="hidden" name="user_status"
					value="${loadUser.user_status}" />
				<tr>
					<td>员工名称：</td>
					<td><input type="text" name="user_name"
						value="${loadUser.user_name }" /></td>
				</tr>
				<tr>
					<td>员工密码：</td>
					<td><input type="text" name="user_password"
						value="${loadUser.user_password }" /></td>
				</tr>

				<tr>
					<td>性别：</td>
					<td><select name="user_sex">
							<c:if test="${loadUser.user_sex eq 1 }">
								<option value="${loadUser.user_sex }" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;男&nbsp;&nbsp;&nbsp;</option>
								<option value="0">&nbsp;&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;</option>
							</c:if>
							<c:if test="${loadUser.user_sex eq 0 }">
								<option value="1">&nbsp;&nbsp;&nbsp;&nbsp;男&nbsp;&nbsp;&nbsp;</option>
								<option value="${loadUser.user_sex }" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;</option>
							</c:if>
					</select></td>
				</tr>
				<tr>
					<td>员工年龄：</td>
					<td><input type="text" name="user_age"
						value="${loadUser.user_age }" /></td>
				</tr>
				<tr>
					<td>身份证号：</td>
					<td><input type="text" name="user_idcard"
						value="${loadUser.user_idcard }" /></td>
				</tr>
				<tr>
					<td>手 机 号：</td>
					<td><input type="text" name="user_phone"
						value="${loadUser.user_phone }" /></td>
				</tr>
				<tr>
					<td>邮 箱 号：</td>
					<td><input type="text" name="user_email"
						value="${loadUser.user_email }" /></td>
				</tr>
				<tr>
					<td>家庭住址：</td>
					<td><input type="text" name="user_address"
						value="${loadUser.user_address }" /></td>
				</tr>
				<tr style="align-content: center; text-align: center;">
					<td><input type="submit" value="提交" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>