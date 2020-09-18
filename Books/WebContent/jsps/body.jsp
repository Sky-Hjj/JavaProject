<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>主页</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/index.css" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.0.js" ></script>
</head>

<body>


<div class="content">
 <div class="middle">
    <script type="text/javascript">
	$(document).ready(function() {
		var length,
			currentIndex = 0,
			interval,
			hasStarted = false, //是否已经开始轮播
			t = 3000; //轮播时间间隔
		length = $('.slider-panel').length;
		
		//将除了第一张图片隐藏
		$('.slider-panel:not(:first)').hide();
		//将第一个slider-item设为激活状态
		$('.slider-item:first').addClass('slider-item-selected');
		//隐藏向前、向后翻按钮
		$('.slider-page').hide();
		
		//鼠标上悬时显示向前、向后翻按钮,停止滑动，鼠标离开时隐藏向前、向后翻按钮，开始滑动
		$('.slider-panel, .slider-pre, .slider-next').hover(function() {
			stop();
			$('.slider-page').show();
		}, function() {
			$('.slider-page').hide();
			start();
		});
		
		$('.slider-item').hover(function(e) {
			stop();
			var preIndex = $(".slider-item").filter(".slider-item-selected").index();
			currentIndex = $(this).index();
			play(preIndex, currentIndex);
		}, function() {
			start();
		});
		
		$('.slider-pre').unbind('click');
		$('.slider-pre').bind('click', function() {
			pre();
		});
		$('.slider-next').unbind('click');
		$('.slider-next').bind('click', function() {
			next();
		});
		
		/**
		 * 向前翻页
		 */
		function pre() {
			var preIndex = currentIndex;
			currentIndex = (--currentIndex + length) % length;
			play(preIndex, currentIndex);
		}
		/**
		 * 向后翻页
		 */
		function next() {
			var preIndex = currentIndex;
			currentIndex = ++currentIndex % length;
			play(preIndex, currentIndex);
		}
		/**
		 * 从preIndex页翻到currentIndex页
		 * preIndex 整数，翻页的起始页
		 * currentIndex 整数，翻到的那页
		 */
		function play(preIndex, currentIndex) {
			$('.slider-panel').eq(preIndex).fadeOut(500)
				.parent().children().eq(currentIndex).fadeIn(1000);
			$('.slider-item').removeClass('slider-item-selected');
			$('.slider-item').eq(currentIndex).addClass('slider-item-selected');
		}
		
		/**
		 * 开始轮播
		 */
		function start() {
			if(!hasStarted) {
				hasStarted = true;
				interval = setInterval(next, t);
			}
		}
		/**
		 * 停止轮播
		 */
		function stop() {
			clearInterval(interval);
			hasStarted = false;
		}
		
		//开始轮播
		start();
	});
</script>
<div class="slider">
		<ul class="slider-main">
			<li class="slider-panel">
				<a><img alt="" title="" src="${pageContext.request.contextPath }/images/index1.jpg"></a>
			</li>
			<li class="slider-panel">
				<a ><img alt="" title="" src="${pageContext.request.contextPath }/images/index2.jpg"></a>
			</li>
			<li class="slider-panel">
				<a ><img alt="" title="" src="${pageContext.request.contextPath }/images/index3.jpg"></a>
			</li>
			<li class="slider-panel">
				<a ><img alt="" title="" src="${pageContext.request.contextPath }/images/index4.jpg"></a>
			</li>
		</ul>
		<div class="slider-extra">
			<ul class="slider-nav">
				<li class="slider-item">1</li>
				<li class="slider-item">2</li>
				<li class="slider-item">3</li>
				<li class="slider-item">4</li>
			</ul>
			<div class="slider-page">
				<a class="slider-pre" href="javascript:;;">&lt;</a>
				<a class="slider-next" href="javascript:;;">&gt;</a>
			</div>
		</div>
	</div>

  
    <p class="title">畅销商品</p>
   
    <div class="salegoods">
    <c:forEach items="${hotBookList }" var="hot">
     <dl>
        <dt><a href="<c:url value='/BookServlet?method=load&bid=${hot.bid }'/>"target="_parent"><img src="${pageContext.request.contextPath }/images/${hot.image}"/></a></dt>
        <dd>
        <a href="<c:url value='/BookServlet?method=load&bid=${hot.bid }'/>"target="_parent">
        <span class="disc">
        <strong>${hot.bname }</strong>
        <span class="price"> &yen;${hot.price }</span>
        </span>
        </a>
        </dd>
      </dl>
       </c:forEach>
     </div>
   
    
    
    
    <p class="title">新品上市</p>
    <div class="newgoods">
    <c:forEach items="${newBookList }" var="newb">
      <dl>
        <dt><a href="<c:url value='/BookServlet?method=load&bid=${newb.bid }'/>"target="_parent"><img src="${pageContext.request.contextPath }/images/${newb.image}" /></a></dt>
        <dd>
        <a href="<c:url value='/BookServlet?method=load&bid=${newb.bid }'/>"target="_parent">
        <span class="disc">
      	<strong>${newb.bname}</strong>
        <span class="price">&yen;${newb.price}</span>
        </span>
        </a>
        </dd>
      </dl>
      </c:forEach>
    </div>
   </div>
</div>
 
 
 
  

</body>
</html>
