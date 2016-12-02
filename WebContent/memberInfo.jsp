<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>버스 예매 시스템</title>
	<link type="text/css" rel="stylesheet" href="memberInfo.css"/>
	<script src="memberInfo.js"></script>
</head>

<body>
	<h1>BUS TAJA</h1>
	<form id="memberInfoForm" action="memberInfoModify.jsp" method="post">
		<h2>회원 정보 조회</h2>
		<table>
			<tr>
				<td class="left">아이디</td>
				<td class="right">
					<!--jsp 사용해서 아이디 가져오기 - jsp로 바꿔 이파일-->
				</td>
			</tr>
			<tr>
				<td class="left">비밀번호</td>
				<td>
					<input type="password" class="right"/><!--jsp 사용해서 비밀번호 가져오기-->
				</td>
			</tr>
			<tr>
				<td class="left">이름</td>
				<td class="right">
					<!--jsp 사용해서 이름 가져오기-->
				</td>
			</tr>
			<tr>
				<td class="left">전화번호</td>
				<td>
					<input type="text" class="right"/><!--jsp 사용해서 전화번호 가져오기-->
				</td>
			</tr>
			<tr>
				<td class="left">포인트</td>
				<td class="right">
					<!--jsp 사용해서 포인트 가져오기-->
				</td>
			</tr>
			<tr>
				<td class="tdBtn">
					<input type="button" class="btn" value="회원 탈퇴" onclick="withdrawal()"/>
				</td>
				<td class="tdBtn">
					<input type="submit" class="btn" value="회원 정보 수정"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>