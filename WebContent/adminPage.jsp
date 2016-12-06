<%@page import="DAO.HOSTDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");
	String HOSTID = (String)session.getAttribute("ID");
	String HOSTPW = (String)session.getAttribute("PW");
	
	List<SCHEDULEINFO> scheduleInfoList = new ArrayList<>();
	List<FROMTODAO> fromToList = new ArrayList<>();
	List<TERMINALDAO> terminalList = new ArrayList<>();
	
	HOSTDAO hostDao = new HOSTDAO(HOSTID,HOSTPW);
	
	scheduleInfoList = hostDao.loadSchedule();
	fromToList = hostDao.loadDepartureTerminal();
	terminalList = hostDao.loadTerminal();
	String tmp[] = null;
	String gettmp = "000";
	String requiredTime = null;
	String scheduleInfoStr = null;
	String[] str = new String[6];
	String departure = (String) request.getParameter("departure");
	String arrival = (String) request.getParameter("arrival");
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> 관리자 페이지 </title>
	<link type="text/css" rel="stylesheet" href="adminPage.css"/>
	<script src="adminPage.js"></script>
</head>
<body>
	<h1>관리자 페이지</h1>
	<form id="testForm" action="adminPage.jsp" method="post">
	</form>
	<form id="testForm2" action="adminPage.jsp" method="post">
	</form>
	<form name="addScheduleForm" action="addSchedule.jsp" method="post">
		<table id="addTable">
			<tr>
				<td class="left">출발지</td>
				<td>
					<select id="departure" name="departure" form="testForm" class="right" onchange="testPlz()">
					<% 
						if(departure != null) {
							out.println("<option value=\"선택\">선택</option>");
							for(int i=0; i<fromToList.size(); i++){
								if(departure.equals(fromToList.get(i).getDepartureTerminal())) {
									out.println("<option value='"+fromToList.get(i).getDepartureTerminal()+"' selected>"
										+fromToList.get(i).getDepartureTerminal()+"</option>");
								}
								else {
									out.println("<option value='"+fromToList.get(i).getDepartureTerminal()+"'>"
										+fromToList.get(i).getDepartureTerminal()+"</option>");
								}
							}
						}
						else {
							out.println("<option value=\"선택\">선택</option>");
							for(int i=0; i<fromToList.size(); i++){
								out.println("<option value='"+fromToList.get(i).getDepartureTerminal()+"'>"
									+fromToList.get(i).getDepartureTerminal()+"</option>");
							}
						}
					%>
					</select>
					<input type="hidden" name="departure" form="testForm2" value="<%=departure%>"/>
					<input type="hidden" name="departureResult" value="<%=departure%>"/>
				</td>
				<td class="left">도착지</td>
				<td>
					<select name="arrival" form="testForm2" class="right" onchange="testPlz2()">
					<%
					if(departure != null) {
						for(int i=0; i<fromToList.size(); i++){
							if(departure.equals(fromToList.get(i).getDepartureTerminal())) {
								out.println("<option value=\"선택\">선택</option>");
								if(arrival != null) {
									for(int j=0; j<fromToList.get(i).getArrivalTerminalLIST().size(); j++) {
										if(arrival.equals(fromToList.get(i).getArrivalTerminalLIST().get(j).getARRIVALTERMINAL())) {
											out.println("<option value='"+fromToList.get(i).getArrivalTerminalLIST().get(j).getARRIVALTERMINAL()+"' selected>"
													+fromToList.get(i).getArrivalTerminalLIST().get(j).getARRIVALTERMINAL()+"</option>");	
										}
										else {
											out.println("<option value='"+fromToList.get(i).getArrivalTerminalLIST().get(j).getARRIVALTERMINAL()+"'>"
													+fromToList.get(i).getArrivalTerminalLIST().get(j).getARRIVALTERMINAL()+"</option>");		
										}
									}
								}
								else {
									for(int j=0; j<fromToList.get(i).getArrivalTerminalLIST().size(); j++) {
										out.println("<option value='"+fromToList.get(i).getArrivalTerminalLIST().get(j).getARRIVALTERMINAL()+"'>"
												+fromToList.get(i).getArrivalTerminalLIST().get(j).getARRIVALTERMINAL()+"</option>");
									}
								}
							}
						}
					}
					%>
					</select>
					<input type="hidden" name="arrivalResult" value="<%=arrival%>"/>
				</td>
				
				<td class="left">출발시간</td>
				<td>
					<input type="departureTime" class="right" name="departureTime" required/>
				</td>
				
				<td class="left">소요시간</td>
				<td>
					<%
						if(arrival != null) {
							if(departure != null) {
								for(int i=0; i<fromToList.size(); i++){
									if(departure.equals(fromToList.get(i).getDepartureTerminal())) {
										for(int j=0; j<fromToList.get(i).getArrivalTerminalLIST().size(); j++) {
											if(arrival.equals(fromToList.get(i).getArrivalTerminalLIST().get(j).getARRIVALTERMINAL())) {
												requiredTime = fromToList.get(i).getArrivalTerminalLIST().get(j).getREQUIREDTIME();
												//out.println(fromToList.get(i).getArrivalTerminalLIST().get(j).getREQUIREDTIME());
												out.println(requiredTime);
											}
										}
									}
								}
							}
						}
					%>
				</td>
				<input type="hidden" name="requiredTimeResult" value="<%=requiredTime%>"/>
				<td class="left">버스등급</td>
				<td>
					<select name="busClass" form="addScheduleForm" class="right">
					<%
					if(departure != null) {
						for(int i=0; i<terminalList.size(); i++){
							if(departure.equals(terminalList.get(i).getTerminalName())) {
								String tmpBusClass  = terminalList.get(i).getBusClass();
								tmp = tmpBusClass.split("");
								if(tmp[0].equals("1")) {
									gettmp = "100";
									out.println("<option value=\"일반\">일반</option>");
								}
								if(tmp[1].equals("1")) {
									gettmp = "010";
									out.println("<option value=\"우등\">우등</option>");
								}
								if(tmp[2].equals("1")) {
									gettmp = "001";
									out.println("<option value=\"프리미엄\">프리미엄</option>");
								}
							}
						}
					}
					%>
					</select>
				</td>
				<input type="hidden" name="busClassResult" value="<%=gettmp.toString()%>"/>
				<td class="left">가격</td>
				<td>
					<input type="text" class="right" name="price" required/>
				</td>
				
				<td>
					<input class= "btn" type="submit" value="배차등록"/>
				</td>
			</tr>
		</table>
	</form>
	<form name="deleteScheduleForm" action="deleteSchedule.jsp" method="post">
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
			int j=0;
			for(int i=0; i<scheduleInfoList.size(); i++)
			{
				
				scheduleInfoStr = hostDao.showSchedule(scheduleInfoList.get(i));
				str = scheduleInfoStr.split(" ");
				
				%>
				<tr>
					<td><input name = "departure_<%=j%>" type="text" value="<%=str[0]%>"></td>
					<td><input name = "arrival_<%=j%>" type="text" value="<%=str[1]%>"></td>
					<td><input name = "departuretime_<%=j%>" type="text" value="<%=str[2]%>"></td>
					<td><input name = "requiredtime_<%=j%>" type="text" value="<%=str[3]%>"></td>
					<td><input name = "busclass_<%=j%>" type="text" value="<%=str[4]%>"></td>
					<td><input name = "price_<%=j%>" type="text" value="<%=str[5]%>"></td>
					<input type="hidden" name = "selectIdx" value = "<%=j%>" >
					<td><input class = "btn" id="deleteBtn" type="submit" value="삭제"/>
				</tr>
				<%
				j++;
			}
			%>
			
		</table>
	</form>
</body>
</html>