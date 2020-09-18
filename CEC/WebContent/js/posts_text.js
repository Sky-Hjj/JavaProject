//function color_black(){
////document.getElementById("body_color").style.backgroundColor="red";
//document.body.style.backgroundImage="linear-gradient(120deg, #999999 0%, #333333 100%)";
//document.getElementById("white").style.color="white";
//document.getElementById("black").style.color="black";
////var x=document.getElementById("resetColor");  
////x.innerHTML=document.body.childNodes.item(0).nodeName;
//}
//function color_white(){
////document.getElementById("body_color").style.backgroundColor="red";
//document.body.style.backgroundImage="linear-gradient(120deg, #a1c4fd 0%, #c2e9fb 100%)";
//document.getElementById("black").style.color="black";
//document.getElementById("white").style.color="white";
////var x=document.getElementById("resetColor");  
////x.innerHTML=document.body.childNodes.item(0).nodeName;
//}
var count = 1;

function posts_text() {
	if(count % 2 != 0) {
		document.getElementById("text").style.height = "80px";
		document.getElementById("enter").style.display = "block";
		document.getElementById("posts_set").style.height = "120px";
		count++;
	} else {
		document.getElementById("text").style.height = "30px";
		document.getElementById("enter").style.display = "none";
		document.getElementById("posts_set").style.height = "30px";
		count=1;
	}

}

//function test() {
//	document.getElementById("text").style.height = "80px";
//	document.getElementById("enter").style.display = "block";
//	document.getElementById("posts_set").style.height = "120px";
//	//	document.getElementById("text").style.height = "30px";
//	//document.getElementById("posts_set").style.height = "35px";
//}

//$(document).ready(function(){
//	$("#text").click(function(){
//		$("#text").css("width","80px");
//		$("#enter").css("display","block");
//	});
////	$("#text").mouseout(function(){
////		#(this).css("height","30px");
////		$("#enter").css("display","none");
////	});
//});