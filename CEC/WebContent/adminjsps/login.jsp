<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--
	作者：zhx
	时间：2018-10-30
	描述：结合 bootst 开发响应式布局
-->
<html lang="zh-CN">
	<!--</html>用于bootstrap 使用到的元素 需要将页面设置为 HTML5 文档类型-->

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!--在移动设备浏览器上，通过为视口（viewport） user-scalable=no 可以禁用其缩放（zooming）功能-->
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>企业员工交流平台</title>
		<!--
        	作者：offline
        	时间：2018-10-30
        	描述：Normalize.css 增强跨浏览器表现的一致性
        -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admincss/Normalize.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admincss/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admincss/styles.css" />
	</head>

	<body style="background:#f9f9f9;">
		<div id="page_head"></div>
		<!--
        	作者：offline
        	时间：2018-10-30 class="container"  id="login_Box"
        	描述：.container 类用于固定宽度并支持响应式布局的容器。
        -->

		<div class="container" id="login_Box">
			<h3 style="font-family: '新宋体';">你好，请登录</h3>
			<p style="color: red; text-align:center;padding-top:20px;">${loginError}</p><br>
			<form action="${pageContext.request.contextPath }/LoginServlet?method=login" method="post">
				<input type="text" name="name" placeholder="用户名" class="form-control" /><br />
				<input type="password" name="pwd" placeholder="口令" class="form-control" />
				<div class="login_checkbox">
					
				</div>
				<input type="submit" value="登 录" class="btn btn-primary btn-lg btn-block" />
			</form>
			<span class="login_bottom">企业员工交流平台</span>
		</div>
	</body>

</html>