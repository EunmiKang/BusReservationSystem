<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>버스 예매 시스템</title>
	<link type="text/css" rel="stylesheet" href="selectInfo.css"/>
</head>

<body>
	<h1>BUS TAJA</h1>
	<form action="selectInfo.jsp" method="post" id="selectInfoForm">
		<h2>승차권 예매</h2>
		<table>
			<tr>
				<td class="left">출발지</td>
				<td>
					<select name="departure" form="selectInfoForm" class="right">
						<option value="ex">Ex</option> <!--그 여기는 jsp쓰던지해야돼-->
					</select>
				</td>
			</tr>
			<tr>
				<td class="left">도착지</td>
				<td>
					<select name="arrival" form="selectInfoForm" class="right">
						<option value="ex">Ex</option> <!--그 여기는 jsp쓰던지해야돼-->
					</select>
				</td>
			</tr>
			<tr>
				<td class="left">출발날짜</td>
				<td>
					<input type="date" style="width:85%; height: 25px;"/>
				</td>
			</tr>
			<tr>
				<td class="left">출발시간</td>
				<td>
					<input style="width:70%; height:25px;"/><span> 이후</span>
				</td>
			</tr>
			<tr>
				<td class="left">버스등급</td>
				<td>
					<select name="busClass" form="selectInfoForm" class="right">
						<option value="ex">Ex</option> <!--그 여기는 jsp쓰던지해야돼-->
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