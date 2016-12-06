<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	String departure = (String) request.getParameter("departureResult");
	String arrival = (String) request.getParameter("arrival");
	String departureTime = (String) request.getParameter("departureTime");
	String busClass = (String) request.getParameter("busClass");
	String price = (String) request.getParameter("price");
	
	
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> 버스 예매 시스템 </title>
</head>
<body>
	
</body>
</html>