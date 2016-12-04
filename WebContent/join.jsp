<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.io.*" %>
<%@ page import="DAO.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> 버스 예매 시스템 </title>
</head>
<body>
	
</body>
</html>

<% 
	request.setCharacterEncoding("UTF-8");

	/* join.html에서 넘긴 parameter들 받아옴 */
	String ID = request.getParameter("ID");
	String PW = request.getParameter("PW");
	String name = request.getParameter("nameInput");
	String phoneNum = request.getParameter("PhoneNum");
	
	
	USERDAO userDAO = new USERDAO(ID, PW, name, phoneNum, "0", "0");
	if(userDAO.userJoin() == false){
		%>
		<script>
			alert("이미 존재하는 ID입니다.");
			location.href = "join.html";
		</script>
		<%	
	}else
		%>
		<script>
			alert("회원가입을 성공했습니다.");
			location.href = "main.html";
		</script>
		<%
%>