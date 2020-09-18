<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!--在移动设备浏览器上，通过为视口（viewport） user-scalable=no 可以禁用其缩放（zooming）功能-->
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Normalize.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user_update.css" />
		<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.validate.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#upuser-form").validate({
		rules : {
			"user_name" : {
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
	</head>
<style type="text/css">

.error {
	padding-left: 20px;
	color: red;
}
</style>
	<body>
		<div id="page_head">
			<div style="width: 680px; margin: 0 auto;">
			<img src="${pageContext.request.contextPath}/images/${sessionScope.user.user_head}" width="36px" height="36px" style="border-radius: 18px;" />
			<a href="<c:url value='/UserServlet?method=myhome&user_id=${sessionScope.user.user_id}'/>">${sessionScope.user.user_name}</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="<c:url value='/PostsServlet?method=findNewPosts'/>">首页</a>
			</div>
		</div>

		<div class="userinfo_set">
			<h3 style="font-family: '新宋体';">修改个人信息</h3>
			<a class="return" href="<c:url value='/UserServlet?method=myhome&user_id=${sessionScope.user.user_id}'/>">返回</a>
			<hr />
			<form method="post" action="<c:url value='/UserServlet?method=updateUser'/>" id="upuser-form">
				
				<table align="center">
					<tr>
						<td>名称：</td>
						<td>
						<input type="hidden" name="user_id" value="${loadUser.user_id}"/>
						<input type="hidden" name="user_head" value="${loadUser.user_head}"/>
							<input name="user_name" type="text" class="form-control" value="${loadUser.user_name }" />
						</td>
					</tr>
					
					<tr>
						<td>性别：</td>
						<td>
							<select name="user_sex">
							<c:if test="${loadUser.user_sex eq 1 }">
								<option value="${loadUser.user_sex }" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;男&nbsp;&nbsp;&nbsp;</option>
								<option value="0">&nbsp;&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;</option>
							</c:if>
							<c:if test="${loadUser.user_sex eq 0 }">
								<option value="1">&nbsp;&nbsp;&nbsp;&nbsp;男&nbsp;&nbsp;&nbsp;</option>
								<option value="${loadUser.user_sex }" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;</option>
							</c:if>
							</select>
						</td>
					</tr>
					
					<tr>
						<td>年龄：</td>
						<td >
							<input name="user_age" type="text" class="form-control" value="${loadUser.user_age }"/>
						</td>
					</tr>
					
					<tr>
						<td>身份证号：</td>
						<td>
							<input name="user_idcard" type="text" class="form-control" value="${loadUser.user_idcard }"/>
							</td>
					</tr>
					
					<tr>
						<td>手机号：</td>
						<td>
							<input name="user_phone" type="text" class="form-control" value="${loadUser.user_phone }"/>
						</td>
					</tr>
					
					<tr>
						<td>邮箱：</td>
						<td>
							<input name="user_email" type="text" class="form-control" value="${loadUser.user_email }"/>
						</td>
					</tr>
					<tr>
						<td>地址：</td>
						<td>
							<textarea name="user_address" rows="4" cols="40" style="border: 1px solid #CCCCCC; border-radius: 4px;">${loadUser.user_address }</textarea>
						</td>
					</tr>
					
					<!-- <tr>
						<td>修改密码：</td>
						<td>
							<input name="user_age" type="text" class="form-control"/>
						</td>
					</tr> -->
					
					<tr>
						<td>
							<input type="submit" value="确认" class="btn btn-primary btn-lg btn-block" />
						</td>
					</tr>
					
				</table>
			</form>
		</div>
	</body>

</html>