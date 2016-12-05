<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="DAO.*" %>
<%@ page import="java.sql.*" %>


<%
	request.setCharacterEncoding("UTF-8");
	String ID = request.getParameter("ID");
	String PW = request.getParameter("PW");
	
	USERDAO userDAO = new USERDAO(ID, PW);
	int result = userDAO.userLogin();
	if(result == 0){
		%>
		<script>
			alert("존재하지 않는 ID입니다.");
			location.href = "main.html";
		</script>
		<%	
	}else if(result == 2){
		%>
		<script>
			alert("비밀번호가 틀렸습니다.");
			location.href = "main.html";
		</script>
		<%	
	}else if(result == 3){
		%>
	<script>
		location.href = "adminPage.jsp";
	</script>
	<%	
	}else//로그인 성공시
	{
		//session 등록
		session.setAttribute("ID", ID);
		session.setAttribute("PW", PW);
		//response.sendRedirect("memberMain.jsp");
		%>
		<script>
			location.href = "memberMain.jsp";
		</script>
		<%	
	}
%>