//跑动的次数
var count = 0;
//动画的执行方向
var isgo = false;
//定义计时器对象
var timer;

window.onload = function() {
	/*获取ul元素*/
	var ul_img = document.getElementsByClassName("ul_img")[0];
	//获取所有的li图片元素
	var li_img = document.getElementsByClassName("li_img");
	//获取控制方向的箭头元素
	var arrow = document.getElementsByClassName("arrow");
	//获取所有按钮元素
	var div_btn = document.getElementsByClassName("div_btn");
	div_btn[0].style.backgroundColor = "#fff";
	div_btn[0].style.color = "#cea861";
	div_btn[0].style.borderBottom = "2px solid #cea861";

	/*定义计时器，控制图片移动*/
	showtime();

	function showtime() {
		timer = setInterval(function() {
			if(isgo == false) {
				count++;
				ul_img.style.transform = "translate(" + -840 * count + "px)";
				if(count >= li_img.length - 1) {
					count = li_img.length - 1;
					isgo = true;
				}
			} else {
				count--;
				ul_img.style.transform = "translate(" + -840 * count + "px)";
				if(count <= 0) {
					count = 0;
					isgo = false;
				}
			}

			for(var i = 0; i < div_btn.length; i++) {
				div_btn[i].style.backgroundColor = "#E3E3E3";				
				div_btn[i].style.color = "#495057";
			    div_btn[i].style.borderBottom = "none";
			}

			div_btn[count].style.backgroundColor = "#fff";
			div_btn[count].style.color = "#cea861";
			div_btn[count].style.borderBottom = "2px solid #cea861";

		}, 4000)
	}

	//鼠标悬停在底部按钮的操作
	for(var b = 0; b < div_btn.length; b++) {
		div_btn[b].index = b;
		div_btn[b].onmouseover = function() {

			clearInterval(timer);

			for(var a = 0; a < div_btn.length; a++) {
				div_btn[a].style.backgroundColor = "#E3E3E3";				
				div_btn[a].style.color = "#495057";
			    div_btn[a].style.borderBottom = "none";
			}
			div_btn[this.index].style.backgroundColor = "#fff";
			div_btn[this.index].style.color = "#cea861";
			div_btn[this.index].style.borderBottom = "2px solid #cea861";
			//让count值对应
			//为了控制方向
			if(this.index == 3) {
				isgo = true;
			}
			if(this.index == 0) {
				isgo = false;
			}
			count = this.index;
			ul_img.style.transform = "translate(" + -840 * this.index + "px)";
		}
		div_btn[b].onmouseout = function() {
			//添加计时器
			showtime();
		}
	}
}

//点赞次数
var num = 0;
function onLike(){
	if( num % 2 == 0){
		num++;
		document.getElementById("click-num").innerText = num;
		alert("点赞成功！");
	}else{
		num--;
	    document.getElementById("click-num").innerText = num;
	    alert("您已经取消赞！");
	}
}
