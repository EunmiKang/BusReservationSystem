﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> 버스 예매 시스템 </title>
	<link type="text/css" rel="stylesheet" href="join.css"/>
</head>

<body>
	<h1>BUS TAJA</h1>
	<div id="joinForm">
		<h2> 회원 가입 </h2>
		<!-- 회원가입 form - ID, PW, 이름, 전화번호를 입력 -->
		<form action="join.jsp" method="post">
			<table>
				<tr>
					<td class="left">아이디</td>
					<td>
						<input type="text" name="ID" class="right"/>
					</td>
				</tr>
				<tr>
					<td class="left">비밀번호</td>
					<td>
						<input type="password" name="PW" class="right"/>
					</td>
				</tr>
				<tr>
					<td class="left"> 이 름 </td>
					<td>
						<input type="text" name="nameInput" class="right"/>
					</td>
				</tr>
				<tr>
					<td class="left"> 전화번호 </td>
					<td>
						<input type="text" name="PhoneNum" class="right" placeholder="ex)000-0000-0000"/>
					</td>
				</tr>
					
				<!-- 가입 버튼 -->
				<tr>
					<td colspan="2">
						<input id="joinBtn" type="submit" value="Join Us"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>