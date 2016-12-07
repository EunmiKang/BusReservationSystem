<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String departure = (String) session.getAttribute("S_departure");
	String arrival = (String) session.getAttribute("S_arrival");
	String departureDate = (String) session.getAttribute("S_departureDate");
	String[] departure_date = departureDate.split("-");
	String index = request.getParameter("selectIdx");
	String departureTime = request.getParameter("departureTime_" + index);
	String[] departure_time = departureDate.split(":");
	String busClass = request.getParameter("busclass_" + index);
	String seatInfo = request.getParameter("seatInfo_" + index);
	String price = request.getParameter("price_" + index);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> 버스 예매 시스템 </title>
	<link type="text/css" rel="stylesheet" href="getSchedule.css"/>
	<script>
		function check() {
			var check = 0;
			var check1 = document.getElementById("checkA").value;
			var check2 = document.getElementById("checkB").value;
			var check2 = document.getElementById("checkC").value;

			for(var i=1; i<=3; i++) {
				var checkIndex = "check" + i;
				if(checkIndex == '0') {
					checkIndex = 0;
				}
				else if(checkIndex == '1') {
					checkIndex = 1;
				}
				else if(checkIndex == '2') {
					checkIndex = 2;
				}
				else if(checkIndex == '3') {
					checkIndex = 3;
				}
			}
			
			check = check1 + check2 + check3;
			
			if(check==0) {
				alert("최소 1매는 선택해주세요.");
			}
			else if(check>3) {
				alert("3매까지만 예약할 수 있습니다.");
			}
			else {
				cal(check1, check2, check3);
			}
		}
		
		function cal(c1, c2, c3) {
			
		}
	</script>
</head>
<body>
	<table id="selectInfoTable">
		<tr class="trtd">
			<th class="trtd">출발지</th>
			<th class="trtd">도착지</th>
			<th class="trtd">출발날짜</th>
			<th class="trtd">출발시간</th>
		</tr>
		<tr class="trtd">
			<td class="trtd"><%=departure%></td>
			<td class="trtd"><%=arrival%></td>
			<td class="trtd"><%=departure_date[0]%>년 <%=departure_date[1]%>월 <%=departure_date[2]%>일</td>
			<td class="trtd"><%=departure_time[0] %>시 <%=departure_time[1] %>분</td>
		</tr>
	</table>
	<div id="div1">
		<div id="div2">
			<table>
				<tr>
					<th colspan="2">매수</th>
				</tr>
				<tr>
					<td class="left">어른</td>
					<td>
						<input id="checkA" type="number" min="0" max="3"/> 명
					</td>
				</tr>
				<tr>
					<td class="left">중고생</td>
					<td>
						<input id="checkB" type="number" min="0" max="3"/> 명
					</td>
				</tr>
				<tr>
					<td class="left">아동</td>
					<td>
						<input id="checkC" type="number" min="0" max="3"/> 명
					</td>
				</tr>
				<tr>
					<td>
						<button id="numberBtn" onclick="check()">확인</button>
					</td>
				</tr>
			</table>
		</div>
		<div id="div3">
			<table id="">
				<tr>
					<th colspan="2">가격</th>
				<tr>
					<td class="left">어른</td>
					<td>
						<span id="p1"></span>원
					</td>
				</tr>
				<tr>
					<td class="left">중고생</td>
					<td>
						<span id="p2"></span>원
					</td>
				</tr>
				<tr>
					<td class="left">아동</td>
					<td>
						<span id="p3"></span>원
					</td>
				</tr>
				<tr>
					<td id="pTotal" class="left">합계</td>
					<td>
						<span id="total_price"></span>원
					</td>
				</tr>
			</table>
		</div>
		<div id="div4">
			<%
				if(busClass.equals("1")) {	//일반
					%>
					<table>
					
					</table>
					<%
				}
				else if(busClass.equals("2")) {	//우등
					%>
					<table>
					
					</table>
					<%
				}
				else if(busClass.equals("4")){	//프리미엄
					%>
					<table>
					
					</table>
					<%
				}
			%>
		</div>
	</div>
	<input id="selectSeat1" name="seatInfo1" type="hidden"/>
	<input id="selectSeat2" name="seatInfo2" type="hidden"/>
	<input id="selectSeat3" name="seatInfo3" type="hidden"/>
</body>
</html>