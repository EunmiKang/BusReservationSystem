<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>버스 예매 시스템</title>
	<link type="text/css" rel="stylesheet" href="memberMain.css"/>
	<script src="memberMain.js"></script>
</head>
<body>
	<table id="memberMainForm">
		<tr>
			<td id="tdLogoutBtn" colspan="3">
				<input id="logoutBtn" type="button" value="logout"/>
			</td>
		</tr>
		<tr>
			<td class="tdBtn">
				<input type="button" class="btn" value="예매" onclick="reservation()"/>
			</td>
			<td class="tdBtn">
				<input type="button" class="btn" value="예매내역조회" onclick="reservationHistoryInquiry()"/>
			</td>
			<td class="tdBtn">
				<input type="button" class="btn" value="회원정보조회" onclick="memberInfoInquiry()"/>
			</td>
		</tr>
	</table>
</body>
</html>