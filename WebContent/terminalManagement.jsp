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
	String terminalInfoStr = null;
	String[] str = new String[4];
	
	List<TERMINALDAO> terminalList = new ArrayList<>();
	
	HOSTDAO hostDao = new HOSTDAO(HOSTID, HOSTPW);
	
	terminalList = hostDao.loadTerminal();
	
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="adminPage.css"/>
<script>
function goAdd() {
location.href = "addTerminal.html";
}
</script>
</head>
<body>
<button class="btn" onclick="goAdd()">터미널 추가</button>
<table id="scheduleTable">

			<tr>
				<th>터미널</th>
				<th>터미널 주소</th>
				<th>터미널 전화번호</th>
				<th>터미널 등급</th>
			</tr>
			
			<%
			int j=0;
			
			for(int i=0; i<terminalList.size(); i++)
			{
				
				terminalInfoStr = hostDao.showTerminalList(terminalList.get(i));
				str = terminalInfoStr.split(":");
				
				%>
				
				
				
				<form action="changeTerminalInfo.jsp" method="post">
				<tr>
					<td><input name = "terminal_<%=j%>" type="text" readonly value="<%=str[0]%>"></td>
					<td><input name = "address_<%=j%>" type="text" readonly value="<%=str[1]%>"></td>
					<td><input name = "phone_<%=j%>" type="text" readonly value="<%=str[2]%>"></td>
					<td><input name = "busClasses_<%=j%>" type="text" readonly value="<%=str[3]%>"></td>
					<input type="hidden" name = "selectIdx" value = "<%=j%>">
					<td><input class = "btn" id="changeBtn" type="submit" value="수정"/></td>
					<td><input class = "btn" id="deleteBtn" formaction="deleteTerminal.jsp"type="submit" value="삭제"/></td>
				</tr>
				</form>
				<%
				j++;
			}
			%>
		</table>
</body>


</html>