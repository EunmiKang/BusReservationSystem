<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@page import="DAO.*"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	String departure = (String) request.getParameter("departure");
	DAO dao = new DAO();
	List<FROMTODAO> fromToList = new ArrayList<>();
	fromToList = dao.loadDepartureTerminal();
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>버스 예매 시스템</title>
	<link type="text/css" rel="stylesheet" href="busInquiry.css"/>
	<script>
		function goMain() {
			location.href = "main.html";
		}
		
		function testPlz() {
			document.getElementById("testForm").submit();
		}
	</script>
</head>

<body>
	<h1 onclick="goMain()">BUS TAJA</h1>
	<form id="testForm" action="busInquiry.jsp" method="post">
	</form>
	<form action="resultBusInquiry.jsp" method="post" id="busInquiryForm">
		<h2>배차 조회</h2>
		<table id="infoTable">
			<tr>
				<td class="left">출발지</td>
				<td>
					<select id="departure" name="departure" form="testForm" required class="right" onchange="testPlz()">
					<% 
						if(departure != null) {
							out.println("<option value=\"선택\">선택</option>");
							for(int i=0; i<fromToList.size(); i++){
								if(departure.equals(fromToList.get(i).getDepartureTerminal())) {
									out.println("<option value='"+fromToList.get(i).getDepartureTerminal()+"' selected>"
										+fromToList.get(i).getDepartureTerminal()+"</option>");
								}
								else {
									out.println("<option value='"+fromToList.get(i).getDepartureTerminal()+"'>"
										+fromToList.get(i).getDepartureTerminal()+"</option>");
								}
							}
						}
						else {
							out.println("<option value=\"선택\">선택</option>");
							for(int i=0; i<fromToList.size(); i++){
								out.println("<option value='"+fromToList.get(i).getDepartureTerminal()+"'>"
									+fromToList.get(i).getDepartureTerminal()+"</option>");
							}
						}
					%>
					</select>
					<input type="hidden" name="departureResult" value="<%=departure%>">
				</td>
			</tr>
			<tr>
				<td class="left">도착지</td>
				<td>
					<select name="arrival" form="busInquiryForm"  required class="right">
					<%
					if(departure != null) {
						out.println("<option value=\"선택\">선택</option>");
						for(int i=0; i<fromToList.size(); i++){
							if(departure.equals(fromToList.get(i).getDepartureTerminal())) {
								for(int j=0; j<fromToList.get(i).getArrivalTerminalLIST().size(); j++) {
									out.println("<option value='"+fromToList.get(i).getArrivalTerminalLIST().get(j).getARRIVALTERMINAL()+"'>"
											+fromToList.get(i).getArrivalTerminalLIST().get(j).getARRIVALTERMINAL()+"</option>");	
								}
							}
						}
					}
					%>
					</select>
				</td>
			</tr>
			<tr>
				<td class="left">출발날짜</td>
				<td>
					<input type="date" name="departureDate" required style="width:85%; height: 25px;"/>
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