<%@page import="DAO.HOSTDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String HOSTID = (String)session.getAttribute("ID");
	String HOSTPW = (String)session.getAttribute("PW");
	
	List<SCHEDULEINFO> scheduleInfoList = new ArrayList<>();
	List<FROMTODAO> fromToList = new ArrayList<>();
	
	HOSTDAO hostDao = new HOSTDAO(HOSTID,HOSTPW);
	
	scheduleInfoList = hostDao.loadSchedule();
	fromToList = hostDao.loadDepartureTerminal();
	String scheduleInfoStr = null;
	String[] str = new String[6];
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> 관리자 페이지 </title>
	<link type="text/css" rel="stylesheet" href="adminPage.css"/>
	<script src="adminPage.js"></script>
</head>
<body>
	<form name = "addScheduleForm">
		<table id="addTable">
			<tr>
				<td class="left">출발지</td>
				<td>
					<select id ="departure"name="departure" form="addScheduleForm" class="right">
					<%
						for(int i=0; i<fromToList.size(); i++){
							out.println("<option value='"+i+"'>"
									+fromToList.get(i).getDepartureTerminal()+"</option>");
						}
					%>
					
					</select>
					<input type="hidden" id = "departureresult" name="folderName" value="">
				</td>
				<script>
					document.getElementById("departure").value;
				</script>
				<td class="left">도착지</td>
				<td>
					<select name="arrival" form="addScheduleForm" class="right">
					<%
						for(int i=0; i<fromToList.size(); i++){
							
							out.println("<option value='"+i+"'>"
									+fromToList.get(i).getDepartureTerminal()+"</option>");
						}
					%>
					</select>
				</td>
				
				<td class="left">출발시간</td>
				<td>
					<input type="text" class="right" name="departureTime"/>
				</td>
				
				<td class="left">소요시간</td>
				<td>
					<input type="text" class="right" name="requiredTime"/>
				</td>
				
				<td class="left">버스등급</td>
				<td>
					<input type="text" class="right" name="busClass"/>
				</td>
				
				<td class="left">가격</td>
				<td>
					<input type="text" class="right" name="price"/>
				</td>
				
				<td>
					<input type="submit" value="등록"/>
				</td>
			</tr>
		</table>
	</form>
	
	<table id="scheduleTable">
		<tr>
			<th>출발지</th>
			<th>도착지</th>
			<th>출발시간</th>
			<th>소요시간</th>
			<th>버스등급</th>
			<th>가격</th>
		</tr>
		
		<%
		for(int i=0; i<scheduleInfoList.size(); i++)
		{
			scheduleInfoStr = hostDao.showSchedule(scheduleInfoList.get(i));
			str = scheduleInfoStr.split(":");
			%>
			<input type="hidden" id = "addText1" name="folderName" value="<%=str[0]%>">
			<input type="hidden" id = "addText2" name="folderName" value="<%=str[1]%>">
			<input type="hidden" id = "addText3" name="folderName" value="<%=str[2]%>">
			<input type="hidden" id = "addText4" name="folderName" value="<%=str[3]%>">
			<input type="hidden" id = "addText5" name="folderName" value="<%=str[4]%>">
			<input type="hidden" id = "addText6" name="folderName" value="<%=str[5]%>">
			add();
			<%
		}
		%>
	</table>
</body>
</html>