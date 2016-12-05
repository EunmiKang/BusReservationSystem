<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>버스 예매 시스템</title>
	<link type="text/css" rel="stylesheet" href="selectInfo.css"/>
	<script>
		function goMemberMain() {
			location.href = "memberMain.jsp";
		}
	</script>
</head>

<body>
	<h1 onclick="goMemberMain()">BUS TAJA</h1>
	<form action="getSchedule.jsp" method="post" id="selectInfoForm">
		<h2>승차권 예매</h2>
		<table id="selectInfoTable">
			<tr>
				<td class="left">출발지</td>
				<td>
					<select name="departure" form="selectInfoForm" class="right">
						<option value="ex">Ex</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="left">도착지</td>
				<td>
					<select name="arrival" form="selectInfoForm" class="right">
						<option value="ex">Ex</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="left">출발날짜</td>
				<td>
					<input type="date" name="departureDate" style="width:85%; height: 25px;"/>
				</td>
			</tr>
			<tr>
				<td class="left">출발시간</td>
				<td>
					<input type="time" name="departureTime" style="width:70%; height:25px;"/><span> 이후</span>
				</td>
			</tr>
			<tr>
				<td class="left">버스등급</td>
				<td>
					<select name="busClass" form="selectInfoForm" class="right">
						<option value="전체등급">전체등급</option>
						<option value="일반">일반</option>
						<option value="우등">우등</option>
						<option value="프리미엄">프리미엄</option>
					</select>
				</td>
			</tr>
			<tr>
				<td id="tdInquiryBtn" colspan="2">
					<input type="submit" id="inquiryBtn" value="조회"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>