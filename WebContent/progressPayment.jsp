<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.*" %>
    
<%
	request.setCharacterEncoding("UTF-8");
	String ID = (String) session.getAttribute("ID");
	String PW = (String) session.getAttribute("PW");
	String departure = (String) session.getAttribute("S_departure");
	String arrival = (String) session.getAttribute("S_arrival");
	String departureDate = (String) session.getAttribute("S_departureDate");
	String departureTime = (String) session.getAttribute("S_departureTime");
	String busClass = (String) session.getAttribute("S_busClass");
	String seatInfo = (String) session.getAttribute("S_seatInfo");
	String usePoint = request.getParameter("_point_");
	String ticketingWay = request.getParameter("_ticketing_");
	
	USERDAO userDAO = new USERDAO(ID, PW);
	if(userDAO.registrationReservation(ID,
			PW,
			departure,
			arrival,
			departureDate,
			departureTime,
			seatInfo,
			usePoint,
			ticketingWay)) {
		if(userDAO.updatePoint(ID, usePoint)) {
			if(userDAO.updateSeat(departure, arrival, departureDate, departureTime, busClass, seatInfo)) {
				%>
				<script>
					alert("예매 되었습니다.");
					location.href = "reservationHistory.jsp";
				</script>
				<%
			}
			else {
				%>
				<script>
					alert("예매를 실패하였습니다.");
					history.go(-1);
				</script>
				<%
			}
		}
		else {
			%>
			<script>
				alert("예매를 실패하였습니다.");
				history.go(-1);
			</script>
			<%
		}
			
	}
	else {
		%>
		<script>
			alert("예매를 실패하였습니다.");
			history.go(-1);
		</script>
		<%
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>버스 예매 시스템</title>
</head>
<body>
	
</body>
</html>