<%@page import="java.util.ArrayList"%>
<%@page import="DAO.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	List<RESERVATIONSTATUS> statusList = new ArrayList<>();
	
	String departure = request.getParameter("departureResult");
	String arrival = request.getParameter("arrival");
	String departureDate = request.getParameter("departureDate");
	
	String[] departure_date = departureDate.split("-");
	
	DAO dao = new DAO();
	
	RESERVATIONSTATUS reStatus = new RESERVATIONSTATUS(departure, arrival, departureDate);
	
	
	statusList = dao.returnStatusList2(reStatus);
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
				
				statusInfoStr = dao.showReStatus(statusList.get(i));
				str = statusInfoStr.split(" ");
				
				%>
				<tr>
					<td><input name = "departureTime_<%=i%>" class="scheduleData" type="text" readonly value="<%=str[0]%>"></td>
					<td><input name = "busclass_<%=i%>" class="scheduleData" type="text" readonly value="<%=str[1]%>"></td>
					<td><input name = "requiredtime_<%=i%>" class="scheduleData" type="text" readonly value="<%=str[2]%>"></td>
					<td><input name = "price_<%=i%>" class="scheduleData" type="text" readonly value="<%=str[3]%>"></td>
					<td><input name = "remainSeatNum_<%=i%>" class="scheduleData" type="text" readonly value="<%=str[4]%>"></td>
				</tr>
				<%
			}
			%>
	</table>
	
</body>
</html>