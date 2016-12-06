<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String hostID = (String) session.getAttribute("ID") ;
	String hostPW = (String) session.getAttribute("PW");
	String terminal = request.getParameter("terminal_b");
	String selectedBusClass = request.getParameter("busClass_b");
	int busClass = Integer.parseInt(selectedBusClass);
	
	HOSTDAO hostDao = new HOSTDAO(hostID, hostPW);
	
	if(hostDao.addBusClass()) {	//success add
		%>
		<script>
			alert(<%=terminal%> + " 터미널에 " + <%=selectedBusClass%> + " 버스  등급을 등록하였습니다.");
			location.replace("adminPage.jsp");
		</script>
		<%
	}
	else {	//fail add
		%>
		<script>
			alert("이미 추가 되어있는 버스 등급입니다.");
			location.replace("adminPage.jsp");
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