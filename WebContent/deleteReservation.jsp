<%@page import="java.util.ArrayList"%>
<%@page import="DAO.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String ID = (String) session.getAttribute("ID");
	String PW = (String) session.getAttribute("PW");
	
	String selectIdx = request.getParameter("selectIdx");
	
	String departure = request.getParameter("departure_"+selectIdx);
	String arrival = request.getParameter("arrival_"+selectIdx);
	String departureDate = request.getParameter("departureDate_"+selectIdx);
	String departureTime = request.getParameter("departureTime_"+selectIdx);
	String seatInfo = request.getParameter("seatNum_"+selectIdx);

	USERDAO userDao = new USERDAO(ID,PW);
	
	
%>
<%@ page import="java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예매 취소</title>
</head>
<body>
<%
	if(userDao.deleteFunc(ID, departure ,arrival , departureDate, departureTime, seatInfo)&&
	userDao.rollBackPoint(ID)&&
	userDao.rollBackSeat(departure, arrival, departureDate, departureTime, seatInfo)){
	%>
	<script>
		alert("삭제되었습니다.");
		location.href = "reservationHistory.jsp";
	</script>
	<%		
	}else{
		%>
		<script>
		alert("삭제를 실패했습니다.");
		history.go(-1);
		</script>
		<%	
	}
%>	
</body>
</html>