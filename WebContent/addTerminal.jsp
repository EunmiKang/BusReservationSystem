<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String HOSTID = (String)session.getAttribute("ID");
	String HOSTPW = (String)session.getAttribute("PW");	
	boolean result = false;
	
	String terminalName = (String) request.getParameter("terminalName");
	String terminalAddress = (String) request.getParameter("terminalAddress");
	String terminalPhone = (String) request.getParameter("terminalPhone");
	
	HOSTDAO hostDao = new HOSTDAO(HOSTID,HOSTPW);
	
	result = hostDao.insertTerminal(terminalName, terminalAddress, terminalPhone);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

</head>
<body>
<%
	if(result == false){
		%>
		<script>
			alert("터미널 추가를 실패했습니다.");
			history.go(-1);	
		</script>
	<%	
	}
	else{
	%>
		<script>
			alert("터미널 추가를 성공했습니다.");
			location.replace("terminalManagement.jsp");
		</script>
	<%
	}
%>
</body>
</html>