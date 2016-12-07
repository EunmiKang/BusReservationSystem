<%@page import="java.util.ArrayList"%>
<%@page import="DAO.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%
	String USERID = (String)session.getAttribute("ID");
	String USERPW = (String)session.getAttribute("PW");
	
	USERDAO userDao = new USERDAO(USERID,USERPW);
	
	List<RESERVATIONINFO> reservationInfoList = new ArrayList<>();

	reservationInfoList = userDao.returnReservationList(USERID);
	String reservationInfoStr = null;
	String[] str = new String[5];
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> 버스 예매 시스템 </title>
	<link type="text/css" rel="stylesheet" href="reservationHistory.css"/>
	<link type="text/css" rel="stylesheet" href="adminPage.css"/>
	<script>
		function gohome() {
			location.href="memberMain.jsp";
		}
	</script>
</head>
<body>
	<h1>예매 내역</h1>
	<button class="btn_r" onclick="gohome()">HOME</button>
	<table id="scheduleTable">
		<tr>
			<th>출발지</th>
			<th>도착지</th>
			<th>출발날짜</th>
			<th>출발시간</th>
			<th>좌석번호</th>
		</tr>
		<%
			for(int i=0; i<reservationInfoList.size(); i++)
			{
				
				reservationInfoStr = userDao.showReservationInfo(reservationInfoList.get(i));
				str = reservationInfoStr.split(" ");
				
				%>
				<form action="selectSeat.jsp" method="post">
				<tr>
					<td><input name = "departure_<%=i%>" class="scheduleData" type="text" readonly value="<%=str[0]%>"></td>
					<td><input name = "arrival_<%=i%>" class="scheduleData" type="text" readonly value="<%=str[1]%>"></td>
					<td><input name = "departureDate_<%=i%>" class="scheduleData" type="text" readonly value="<%=str[2]%>"></td>
					<td><input name = "departureTime_<%=i%>" class="scheduleData" type="text" readonly value="<%=str[3]%>"></td>
					<td><input name = "seatNum_<%=i%>" class="scheduleData" type="text" readonly value="<%=str[4]%>"></td>
					<input type="hidden" name = "selectIdx" value = "<%=i%>" >
					<td><input class = "btn" id="deleteBtn" type="submit" value="예매 취소"/></td>
				</tr>
				</form>
				<%
			}
			%>
	</table>
</body>
</html>