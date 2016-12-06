<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	String departure = request.getParameter("departureResult");
	String arrival = request.getParameter("arrival");
	String departureDate = request.getParameter("departureDate");
	String departureTime = request.getParameter("departureTime");
	String busClass = request.getParameter("busClass");
	
	String[] departure_date = departureDate.split("-");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>버스 예매 시스템</title>
	<link type="text/css" rel="stylesheet" href="getSchedule.css"/>
</head>
<body>
	<table id="selectInfoTable">
		<tr class="trtd">
			<th class="trtd">출발지</th>
			<th class="trtd">도착지</th>
			<th class="trtd">출발날짜</th>
		</tr>
		<tr class="trtd">
			<td class="trtd"><%=departure%></td>
			<td class="trtd"><%=arrival%></td>
			<td class="trtd"><%=departure_date[0]%>년 <%=departure_date[1]%>월 <%=departure_date[2]%>일</td>
		</tr>
	</table>
	<table id="scheduleTable">
		<tr class="trtd">
			<th class="trtd">출발시간</th>
			<th class="trtd">버스등급</th>
			<th class="trtd">소요시간</th>
			<th class="trtd">가격</th>
			<th class="trtd">잔여좌석수</th>
		</tr>
	</table>
	
</body>
</html>