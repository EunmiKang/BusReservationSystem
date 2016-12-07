<%@page import="java.util.ArrayList"%>
<%@page import="DAO.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");
	String HOSTID = (String)session.getAttribute("ID");
	String HOSTPW = (String)session.getAttribute("PW");
	
	List<SCHEDULEINFO> scheduleInfoList = new ArrayList<>();
	List<FROMTODAO> fromToList = new ArrayList<>();
	List<TERMINALDAO> terminalList = new ArrayList<>();
	List<String> VIPList = new ArrayList<>();
	
	HOSTDAO hostDao = new HOSTDAO(HOSTID,HOSTPW);
	
	
	scheduleInfoList = hostDao.loadSchedule();
	fromToList = hostDao.loadDepartureTerminal();
	terminalList = hostDao.loadTerminal();
	VIPList = hostDao.getVIPMembers();
	
	String tmp[] = null;
	String gettmp = "000";
	String requiredTime = null;
	String scheduleInfoStr = null;
	String price = null;
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
	<script>
		function goTerminal() {
			location.href="terminalManagement.jsp";
		}
		
		function logout() {
			location.href="logout.jsp";
		}
	</script>
</head>
<body>
	<h1>관리자 페이지</h1>
	<button class="btn_r" onclick="logout()">Logout</button>
	<button class="btn_r" onclick="goTerminal()">터미널 관리</button>
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
					<input type="time" class="right" name="departureTime" required/>
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
												out.println(requiredTime);
											}
										}
									}
								}
							}
						}
					%>
					<input type="hidden" name="requiredTimeResult" value="<%=requiredTime%>"/>
				</td>
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
					<input type="hidden" name="busClassResult" value="<%=gettmp.toString()%>"/>
				</td>
				<td>
					<%
						if(arrival != null) {
							if(departure != null) {
								for(int i=0; i<fromToList.size(); i++){
									if(departure.equals(fromToList.get(i).getDepartureTerminal())) {
										for(int j=0; j<fromToList.get(i).getArrivalTerminalLIST().size(); j++) {
											if(arrival.equals(fromToList.get(i).getArrivalTerminalLIST().get(j).getARRIVALTERMINAL())) {
												price = fromToList.get(i).getArrivalTerminalLIST().get(j).getPRICE();
											}
										}
									}
								}
							}
						}
					%>
					<input type="hidden" class="right" name="price" value="<%=price%>"/>
				</td>
				
				<td>
					<input class= "btn" type="submit" value="배차등록"/>
				</td>
			</tr>
		</table>
	</form>
	
	<div id="div1">
		<div id="div2">
			<h3>VIP 회원 조회</h3>
			<table id="VIPMemberTable">
					<tr>
						<th>사용자 ID</th>
						<th>누적 포인트</th>
					</tr>
				<%
				String[] str2 = new String[2];
				for(int i=0; i<VIPList.size(); i++)
				{
					str2 = VIPList.get(i).split(":");
					%>
					<tr>
						<td class="data"><%= str2[0]%></td>
						<td class="data"><%= str2[1]%></td>
					</tr>
					<%
				}
				%>
				</table>
		</div>
		<div id="div3">
			<h3> 버스 등급 추가/삭제 </h3>
			<form id="terminalBusClassForm" action="addBusClass.jsp" method="post">
				<table id="terminalBusClassTable">
					<tr>
						<td class="left"> 터미널 </td>
						<td>
							<select name="terminal_b" form="terminalBusClassForm" class="right">
							<% 
								for(int i=0; i<terminalList.size(); i++) {
									out.println("<option value='" + terminalList.get(i).getTerminalName() + "'>"
													+ terminalList.get(i).getTerminalName() + "</option>");
								}
							%>
							</select>
						</td>
					</tr>
					<tr>
						<td class="left"> 버스 등급 </td>
						<td>
							<select name="busClass_b" form="terminalBusClassForm" class="right"> 
								<option value="0">일반</option>
								<option value="1">우등</option>
								<option value="2">프리미엄</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<input type="submit" class="btn_b" value="추가"/>
						</td>
						<td>
							<input type="submit" class="btn_b" value="삭제" formaction="deleteBusClass.jsp"/>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<h3 id="scheduleH3">배차 정보</h3>
	<table id="scheduleTable">
		<tr id="tRheader">
			<th>출발지</th>
			<th>도착지</th>
			<th>출발시간</th>
			<th>소요시간</th>
			<th>버스등급</th>
			<th>가격</th>
			<th></th>
		</tr>
		
		<%
		int j=0;
		for(int i=0; i<scheduleInfoList.size(); i++)
		{
			
			scheduleInfoStr = hostDao.showSchedule(scheduleInfoList.get(i));
			str = scheduleInfoStr.split(" ");
			
			%>
			<form action="deleteSchedule.jsp" method="post">
			<tr>
				<td><input name = "departure_<%=j%>" class="scheduleData" type="text" readonly value="<%=str[0]%>"></td>
				<td><input name = "arrival_<%=j%>" class="scheduleData" type="text" readonly value="<%=str[1]%>"></td>
				<td><input name = "departuretime_<%=j%>" class="scheduleData" type="text" readonly value="<%=str[2]%>"></td>
				<td><input name = "requiredtime_<%=j%>" class="scheduleData" type="text" readonly value="<%=str[3]%>"></td>
				<td><input name = "busclass_<%=j%>" class="scheduleData" type="text" readonly value="<%=str[4]%>"></td>
				<td><input name = "price_<%=j%>" class="scheduleData" type="text" readonly value="<%=str[5]%>"></td>
				<input type="hidden" name = "selectIdx" value = "<%=j%>" >
				<td><input class = "btn" id="deleteBtn" type="submit" value="삭제"/></td>
			</tr>
			</form>
			<%
			j++;
		}
		%>
	</table>
</body>
</html>