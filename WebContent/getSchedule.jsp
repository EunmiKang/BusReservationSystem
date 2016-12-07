<%@page import="java.util.ArrayList"%>
<%@page import="DAO.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String USERID = (String)session.getAttribute("ID");
	String USERPW = (String)session.getAttribute("PW");

	
	
	List<RESERVATIONSTATUS> statusList = new ArrayList<>();
	
	String departure = request.getParameter("departureResult");
	String arrival = request.getParameter("arrival");
	String departureDate = request.getParameter("departureDate");
	String departureTime = request.getParameter("departureTime");
	String busClass = request.getParameter("busClass");
	
	session.setAttribute("S_departure", departure);
	session.setAttribute("S_arrival", arrival);
	session.setAttribute("S_departureDate", departureDate);
	
	String[] departure_date = departureDate.split("-");
	
	USERDAO userDao = new USERDAO(USERID,USERPW);
	
	RESERVATIONSTATUS reStatus = new RESERVATIONSTATUS(departure, arrival, departureDate, departureTime, busClass, null, null, null, null);
	
	statusList = userDao.returnStatusList(reStatus);
	String statusInfoStr = null;
	String[] str = new String[6];
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>버스 예매 시스템</title>
	<link type="text/css" rel="stylesheet" href="getSchedule.css"/>
	<link type="text/css" rel="stylesheet" href="adminPage.css"/>
	<script>
		function goback() {
			history.go(-1);	
		}
	</script>
</head>
<body>
	<button class="btn_r" onclick="goback()">BACK</button>
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
			<th class="trtd"></th>
		</tr>
			<%
			for(int i=0; i<statusList.size(); i++)
			{
				
				statusInfoStr = userDao.showReStatus(statusList.get(i));
				str = statusInfoStr.split(" ");
				
				%>
				<form action="selectSeat.jsp" method="post">
				<tr>
					<td><input name = "departureTime_<%=i%>" class="scheduleData" type="text" readonly value="<%=str[0]%>"></td>
					<td><input name = "busclass_<%=i%>" class="scheduleData" type="text" readonly value="<%=str[1]%>"></td>
					<td><input name = "requiredtime_<%=i%>" class="scheduleData" type="text" readonly value="<%=str[2]%>"></td>
					<td><input name = "price_<%=i%>" class="scheduleData" type="text" readonly value="<%=str[3]%>"></td>
					<td><input name = "remainSeatNum_<%=i%>" class="scheduleData" type="text" readonly value="<%=str[4]%>"></td>
					<input type="hidden" name = "seatInfo_<%=i%>" value="<%=str[5]%>">
					
					<input type="hidden" name = "selectIdx" value = "<%=i%>" >
					<td><input class = "btn" id="deleteBtn" type="submit" value="예약"/></td>
				</tr>
				</form>
				<%
			}
			%>
	</table>
	
</body>
</html>