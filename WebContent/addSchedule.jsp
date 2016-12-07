<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String HOSTID = (String)session.getAttribute("ID");
	String HOSTPW = (String)session.getAttribute("PW");	
	boolean result = false;
	float tempPrice=0;
	String departure = (String) request.getParameter("departureResult");
	String arrival = (String) request.getParameter("arrivalResult");
	String departureTime = (String) request.getParameter("departureTime");
	String requiredTime = (String) request.getParameter("requiredTimeResult");
	String busClass = (String) request.getParameter("busClassResult");
	String price = (String) request.getParameter("price");
	
	//DAO dao = new DAO();
	HOSTDAO hostDao = new HOSTDAO(HOSTID,HOSTPW);
	//String scheduleNo, String fK_departureTerminal, String fK_arrivalTerminal, String fk_busNo,
	//String departureTime, String remainingSeatsNum, String price, String requiredTime
	SCHEDULEINFO SINFO = new SCHEDULEINFO("", departure,arrival,hostDao.returnBusNo(busClass),
											departureTime,
											price,requiredTime);
	
	result = hostDao.insertSchedule(SINFO);
	
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> 버스 예매 시스템 </title>
</head>
<body>
	<%
	if(result == true){
	%>
	<script>
		alert("배차등록에 성공했습니다.");
		location.href = "adminPage.jsp";
	</script>
	<%
	}else{
	%>
	<script>
		alert("배차등록에 실패했습니다.");
		history.go(-1);
	</script>
	<%
	}
	%>
</body>
</html>