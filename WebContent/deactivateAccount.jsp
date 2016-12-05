<%@page import="DAO.USERDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String ID = (String)session.getAttribute("ID");
	String PW = (String)session.getAttribute("PW");
	boolean result=false;
	USERDAO userdao = new USERDAO(ID,PW);
	result = userdao.deactivateAccount();
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%

	if(result == false)
	{
		%>
		<script>
			alert("회원탈퇴에 실패하였습니다.");
			location.href = "memberInfo.jsp";
		</script>
		<%	
	}
	else
	{
		session.invalidate();//세션 정보 제거 
		%>
		<script>
			alert("회원탈퇴에 성공하였습니다.");
			location.href = "main.html";
		</script>
		<%
	}
	%>
</body>
</html>