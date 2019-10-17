<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
	.nav{
		display:inline-block;
		border-radius:5px;
		width:auto;
		height:auto;
	}
	#login{
		background:url('<%=request.getContextPath()%>/images/login.png') no-repeat;
		background-size: cover; 
		background-repeat: no-repeat; 
		background-position: center;
		border: 0px;
		height: 75px;
		width : 100px;
	}
	#menuBtn{
		background:url('<%=request.getContextPath()%>/images/menubtn.png') no-repeat;
		background-size: 80%; 
		background-repeat: no-repeat; 
		background-position: center;
		border: 0px;
		height: 75px;
		width : 75px;
	}
	#signUp{
		background:url('<%=request.getContextPath()%>/images/signup2.png') no-repeat;
		background-size: cover; 
		background-position: center;
		
		border: 0px;
		height: 75px;
		width : 100px;
	}
	#inlineUl li{
		display:inline;
	}
	#rightMenu{
		align:right;
	}
	#menu{
		width: 200px; 
		height:calc(100% - 150px); 
		position: fixed; 
		top: 130px; 
		left: -320px; 
		z-index: 10; 
		border: 1px solid red; 
		background-color: black; 
		text-align: center; 
		transition: All 0.2s ease;
		padding-left: 20px;
		padding-right: 20px;
		padding-top: 50px;
	}
	
	#menu.open{
		left:0px;
	}
</style>
</head>
<body>
	<!-- header역할을 하며 로그인, 회원가입, 메뉴바를 열수 있는 버튼을 생성 -->
	<div style="width:1200px; min-width:1200px;">
		<div class="nav" align="left" >
			<input id="menuBtn" type="button">
		</div>
		<div class="nav" align="center">
			<img id="logo" src="<%=request.getContextPath()%>/images/logo.png" height='75' width="300">
		</div>
		<div class="nav" id="rightMenu" align="right">
			<ul id="inlineUl">
				<li><input id="login" type="button" style="align:right;"></li>
				<li><input id="signUp" type="button" style="align:right;"></li>
			</ul>
		</div>
		<hr>
	</div>
	<!-- 슬라이드 형식으로 버튼 클릭시 도출되는 메뉴바 -->
	<div id="menu">

	</div>

	<script>
		$(function(){
			$("#menuBtn").click(function(){
				if($("#menu").hasClass("open")){ //class에 open이 없을 시 open클래스 추가 있을 시 삭제
					$("#menu").removeClass("open");
				}else{
					$("#menu").addClass("open");
				}
			});
			$menuDiv = $("#menu");
			if(false){	// 로그인 시 메뉴바 구성 변경
				var list = ["Home", "마이페이지", "상품 게시판", "장바구니", "FAQ", "1:1 고객 문의"];
			}else{
				var list = ["Home", "로그인", "상품 게시판", "장바구니", "FAQ", "1:1 고객 문의"];
				for(var i=0; i<list.length; i++){
					var $btn = $("<button>").css({"width":"150px", 
													 "height": "50px", 
													 "margin":"10px"});
					$btn.attr("id","before"+i);
					$btn.html(list[i]);
					
					$menuDiv.append($btn);
				}
			}
			// 나중에 수정 부분
			$("#before0").click(function(){
				alert($(this).attr("id"));
			});
			$("#before1").click(function(){
				alert($(this).attr("id"));
			});
			$("#before2").click(function(){
				alert($(this).attr("id"));
			});
			$("#before3").click(function(){
				alert($(this).attr("id"));
			});
			$("#before4").click(function(){
				alert($(this).attr("id"));
			});
			$("#before5").click(function(){
				alert($(this).attr("id"));
			});
			
			
		});
		
		$(document).click(function(event){	// 메뉴바를 제외한 부분 클릭시 메뉴바 닫힘
			if(!($("#menu").is(event.target) || $("#menuBtn").is(event.target)|| $("#menu").children().is(event.target))){
				if($("#menu").hasClass("open")){ //class에 open이 없을 시 open클래스 추가 있을 시 삭제
					$("#menu").removeClass("open");
				}
			}
		});
		
		
	
	</script>
</body>
</html>