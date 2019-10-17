<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>판매자 관리</title>
<link rel="stylesheet" type="text/css" href="../css/toggleBtn.css" />
<style>
.adDiv {
	display: inline-block;
	padding: 5px;
	height: 500px;
	width: 400px;
	margin: 10px;
}
#insertSeller{
	padding: 5px;
	width: 400px;
	margin-left: 10px;
	vertical-align : middle;
	text-align:right;
}
table {
	border: 1px solid black;
}

table td {
	border: 1px solid black;
	text-align:center
}
table th {
	border: 1px solid black;
	align: center;
}

#infoTable {
	border-collapse: separate;
	border-spacing: 10px 10px;
}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div>
		<h1>&nbsp;&nbsp; 판매자 관리</h1>
		<div id="insertSeller">
			<label for="sellerId">판매자 아이디</label>
			<input type="text" id="sellerId" name="sellerId">
			<button id="searchSeller">찾기</button>
		</div>
		<div id="insertSeller">	</div>
		<div class="adDiv">
			<!-- 간략한 판매자 정보를 출력하는 div -->
			<table>
				<tr>
					<th width="50px">번호</th>
					<th width="150px">아이디</th>
					<th width="100px">권한 여부</th>
					<th width="100px">적용</th>
				</tr>
				<tr>
					<td>1</td>
					<td>임시아이디</td>
				 	<% if(true) { %>		<!-- 판매자 권한이 Y상태면 left값이 5 N일 경우 0으로 생성 --> 
						<td>
							<span class="toggleBG" style="background: #0099ff;">
							<button id="example"class="toggleFG" style="left:40px;"></button>
							</span>
						</td>
					<%} %>
					<%-- else{%>
						<td>
							<span class="toggleBG">
							<button id="ex" class="toggleFG"></button>
							</span>
						</td>
						<%} %>  --%>
					<!-- <td>
						<span class="toggleBG">
						<button id="ex" class="toggleFG"></button>
						</span>
					</td>-->
					<td><input type="button" value="권한 적용" id="insertAuthor"></td> 
				</tr>
			</table>
		</div>
		<div class="adDiv">
			<!-- 판매자 상세 정보를 출력하는 div -->
			<%if(true) {%>
			<table id="infoTable">
				<tr>
					<td rowspan="5"><img src="../../sellerImg/examImg.png"
						width="150px" height="200px"></td>
					<td>업체명</td>
					<td>홍길동</td>
				</tr>
				<tr>
					<td>사업자번호</td>
					<td>123</td>
				</tr>
				<tr>
					<td>법인 번호</td>
					<td>1234465</td>
				</tr>
				<tr>
					<td>계좌 은행</td>
					<td>국민</td>
				</tr>
				<tr>
					<td>예금주</td>
					<td>홍길동</td>
				</tr>
				<tr>
					<td>계좌 번호</td>
					<td colspan="2">11111111111</td>
				</tr>
			</table>

			<%} %>
		</div>

	</div>
	<script>
		$(function() {
			$("#insertAuthor").click(function(){
				var sAuthor = parseInt($("#example").css("left"));
				if(sAuthor >0){
					alert("Y");
				}else{
					alert("N");
				}
			})
			
			// 토글버튼 클릭시 on, off 변경
			$(".toggleBG").click(function() {
				var toggleBG = $(this);
				var toggleFG = $(this).find('.toggleFG');
				var left = toggleFG.css('left');
				if (left == '40px') {
					toggleBG.css('background', '#CCCCCC');
					toggleActionStart(toggleFG, 'TO_LEFT');
				} else if (left == '0px') {
					toggleBG.css('background', '#0099ff');
					toggleActionStart(toggleFG, 'TO_RIGHT');
				}
			});
			
			$("#insertAuthor").click(function(){
				var toggleFG = $(this).find('.toggleFG');
				
				
			});
		});

		// 토글 버튼 이동 모션 함수
		function toggleActionStart(toggleBtn, LR) {
			// 0.01초 단위로 실행
			var intervalID = setInterval(function() {
				// 버튼 이동
				var left = parseInt(toggleBtn.css('left'));
				left += (LR == 'TO_RIGHT') ? 5 : -5;
				if (left >= 0 && left <= 40) {
					left += 'px';
					toggleBtn.css('left', left);
				}
			}, 10);
			setTimeout(function() {
				clearInterval(intervalID);
			}, 201);
		}
	</script>
</body>
</html>