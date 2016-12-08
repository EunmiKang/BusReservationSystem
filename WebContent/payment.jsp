<%@page import="java.util.ArrayList"%>
<%@page import="DAO.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String departure = (String)session.getAttribute("S_departure");
	String arrival = (String)session.getAttribute("S_arrival");
	String departureDate = (String)session.getAttribute("S_departureDate");
	String departureTime = (String)session.getAttribute("S_departureTime");
	String seatStr1 = request.getParameter("seatInfo1");
	String seatStr2 = request.getParameter("seatInfo2");
	String seatStr3 = request.getParameter("seatInfo3");
	String price = request.getParameter("totalPrice");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link type="text/css" rel="stylesheet" href="adminPage.css"/>
	<title>결제진행</title>
</head>
<body>
	<div id="div3">
			<h3> 결제하기 </h3>
			<form id="terminalBusClassForm" action="addBusClass.jsp" method="post">
				<table id="terminalBusClassTable">
					<tr>
						<td class="left"> 출발지 </td>
						<td>
							<input type='text' readonly value="<%=departure%>">
						</td>
					</tr>
					<tr>
						<td class="left"> 도착지  </td>
						<td>
							<input type='text' readonly value="<%=arrival%>">
						</td>
					</tr>
					<tr>
						<td class="left"> 출발날짜 </td>
						<td>
							<input type='text' readonly value="<%=departureDate%>">
						</td>
					</tr>
					<tr>
						<td class="left"> 출발시간 </td>
						<td>
							<input type='text' readonly value="<%=departureTime%>">
						</td>
					</tr>
					<tr>
						<td class="left"> 좌석 </td>
						<td>
							<input type='text' readonly value="<%=arrival%>">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>