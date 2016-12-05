<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	String departure = request.getParameter("departure");
	String arrival = request.getParameter("arrival");
	String departureDate = request.getParameter("departureDate");
	String departureTime = request.getParameter("departureTime");
	String busClass = request.getParameter("busClass");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>버스 예매 시스템</title>
</head>
<body>
	<%=departure%>
	<%=arrival%>
	<%=departureDate%>
	<%=departureTime%>
	<%=busClass%>
</body>
</html>