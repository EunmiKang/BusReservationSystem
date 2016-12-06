<%@page import="java.util.ArrayList"%>
<%@page import="DAO.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String HOSTID = (String)session.getAttribute("ID");
	String HOSTPW = (String)session.getAttribute("PW");	
	boolean result = false;

	String idx = (String) request.getParameter("selectIdx");
	String departure = (String) request.getParameter("departure_"+idx);
	String arrival = (String) request.getParameter("arrival_"+idx);
	String departureTime = (String) request.getParameter("departuretime_"+idx);
	String requiredTime = (String) request.getParameter("requiredtime_"+idx);
	String busclass = (String) request.getParameter("busclass_"+idx);
	String price = (String) request.getParameter("price_"+idx);
	
	//DAO dao = new DAO();
	HOSTDAO hostDao = new HOSTDAO(HOSTID,HOSTPW);
	
	result = hostDao.deleteSchedule(departure, arrival, departureTime);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	if(result == true){
	%>
	<script>
		alert("배차 삭제를 성공했습니다.");
		location.href = "adminPage.jsp";
	</script>
	<%
	}else{
	%>
	<script>
		alert("배차 삭제를 실패했습니다.");
		history.go(-1);
	</script>
	<%
	}
	%>
</body>
</html>