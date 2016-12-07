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
	String[] departure_time = departureTime.split(":");
	String busClass = request.getParameter("busclass_" + index);
	String seatInfo = request.getParameter("seatInfo_" + index);
	String[] seatInfoArray = seatInfo.split("");
	String price = request.getParameter("price_" + index);
	
	session.setAttribute("S_departureTime", departureTime);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> 버스 예매 시스템 </title>
	<link type="text/css" rel="stylesheet" href="getSchedule.css"/>
	<script>
		var selectNum = 0;
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
		
		function showSeatInfo(seat) {
		    var seatClass = plz.getAttribute('class');
			if(seatClass == "seat0") {
				
			}
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
			<div id="div3">
				<table id="numberTable">
					<tr>
						<th colspan="2">매수</th>
					</tr>
					<tr>
						<td class="left">어른</td>
						<td>
							<input id="checkA" type="number" min="0" max="3"/>명
						</td>
					</tr>
					<tr>
						<td class="left">중고생</td>
						<td>
							<input id="checkB" type="number" min="0" max="3"/>명
						</td>
					</tr>
					<tr>
						<td class="left">아동</td>
						<td>
							<input id="checkC" type="number" min="0" max="3"/>명
						</td>
					</tr>
					<tr>
						<td>
							<button id="numberBtn" onclick="check()">확인</button>
						</td>
					</tr>
				</table>
			</div>
			<div id="div4">
				<table id="priceTable">
					<tr>
						<th colspan="2">가격</th>
					<tr>
						<td class="left">어른</td>
						<td>
							<input id="p1" type="text" readonly/>원
						</td>
					</tr>
					<tr>
						<td class="left">중고생</td>
						<td>
							<input id="p2" type="text" readonly/>원
						</td>
					</tr>
					<tr>
						<td class="left">아동</td>
						<td>
							<input id="p3" type="text" readonly/>원
						</td>
					</tr>
					<tr>
						<td id="pTotal" class="left">합계</td>
						<td>
							<input id="totalPrice" name="totalPrice" type="text" readonly/></span>원
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="div5">
			<%
				if(busClass.equals("일반")) {
					%>
					<table id="seatTable">
						<tr>
							<td rowspan="2" class="seatText">출입문</td>
							<td id="4" class="seat<%=seatInfoArray[3]%>" onclick="showSeatInfo(this)">4</td>
							<td id="8" class="seat<%=seatInfoArray[7]%>" onclick="showSeatInfo(this)">8</td>
							<td id="12" class="seat<%=seatInfoArray[11]%>" onclick="showSeatInfo(this)">12</td>
							<td id="16" class="seat<%=seatInfoArray[15]%>" onclick="showSeatInfo(this)">16</td>
							<td id="20" class="seat<%=seatInfoArray[19]%>" onclick="showSeatInfo(this)">20</td>
							<td id="24" class="seat<%=seatInfoArray[23]%>" onclick="showSeatInfo(this)">24</td>
							<td id="28" class="seat<%=seatInfoArray[27]%>" onclick="showSeatInfo(this)">28</td>
						</tr>
						<tr>
							<td id="3" class="seat<%=seatInfoArray[2]%>" onclick="showSeatInfo(this)">3</td>
							<td id="7" class="seat<%=seatInfoArray[6]%>" onclick="showSeatInfo(this)">7</td>
							<td id="11" class="seat<%=seatInfoArray[10]%>" onclick="showSeatInfo(this)">11</td>
							<td id="15" class="seat<%=seatInfoArray[14]%>" onclick="showSeatInfo(this)">15</td>
							<td id="19" class="seat<%=seatInfoArray[18]%>" onclick="showSeatInfo(this)">19</td>
							<td id="23" class="seat<%=seatInfoArray[22]%>" onclick="showSeatInfo(this)">23</td>
							<td id="27" class="seat<%=seatInfoArray[26]%>" onclick="showSeatInfo(this)">27</td>
						</tr>
						<tr class="emptyRow"></tr>
						<tr>
							<td rowspan="2" class="seatText">운전석</td>
							<td id="2" class="seat<%=seatInfoArray[1]%>" onclick="showSeatInfo(this)">2</td>
							<td id="6" class="seat<%=seatInfoArray[5]%>" onclick="showSeatInfo(this)">6</td>
							<td id="10" class="seat<%=seatInfoArray[9]%>" onclick="showSeatInfo(this)">10</td>
							<td id="14" class="seat<%=seatInfoArray[13]%>" onclick="showSeatInfo(this)">14</td>
							<td id="18" class="seat<%=seatInfoArray[17]%>" onclick="showSeatInfo(this)">18</td>
							<td id="22" class="seat<%=seatInfoArray[21]%>" onclick="showSeatInfo(this)">22</td>
							<td id="26" class="seat<%=seatInfoArray[25]%>" onclick="showSeatInfo(this)">26</td>
						</tr>
						<tr>
							<td id="1" class="seat<%=seatInfoArray[0]%>" onclick="showSeatInfo(this)">1</td>
							<td id="5" class="seat<%=seatInfoArray[4]%>" onclick="showSeatInfo(this)">5</td>
							<td id="9" class="seat<%=seatInfoArray[8]%>" onclick="showSeatInfo(this)">9</td>
							<td id="13" class="seat<%=seatInfoArray[12]%>" onclick="showSeatInfo(this)">13</td>
							<td id="17" class="seat<%=seatInfoArray[16]%>" onclick="showSeatInfo(this)">17</td>
							<td id="21" class="seat<%=seatInfoArray[20]%>" onclick="showSeatInfo(this)">21</td>
							<td id="25" class="seat<%=seatInfoArray[24]%>" onclick="showSeatInfo(this)">25</td>
						</tr>
					</table>
					<%
				}
				else if(busClass.equals("우등")) {
					%>
					<table class="seatTable">
						<tr>
							<td class="seatText">출입문</td>
							<td id="3" class="seat<%=seatInfoArray[2]%>" onclick="showSeatInfo(this)">3</td>
							<td id="6" class="seat<%=seatInfoArray[5]%>" onclick="showSeatInfo(this)">6</td>
							<td id="9" class="seat<%=seatInfoArray[8]%>" onclick="showSeatInfo(this)">9</td>
							<td id="12" class="seat<%=seatInfoArray[11]%>" onclick="showSeatInfo(this)">12</td>
							<td id="15" class="seat<%=seatInfoArray[14]%>" onclick="showSeatInfo(this)">15</td>
							<td id="18" class="seat<%=seatInfoArray[17]%>" onclick="showSeatInfo(this)">18</td>
							<td id="21" class="seat<%=seatInfoArray[20]%>" onclick="showSeatInfo(this)">21</td>
						</tr>
						<tr class="emptyRow"></tr>
						<tr>
							<td rowspan="2" class="seatText">운전석</td>
							<td id="2" class="seat<%=seatInfoArray[1]%>" onclick="showSeatInfo(this)">2</td>
							<td id="5" class="seat<%=seatInfoArray[4]%>" onclick="showSeatInfo(this)">5</td>
							<td id="8" class="seat<%=seatInfoArray[7]%>" onclick="showSeatInfo(this)">8</td>
							<td id="11" class="seat<%=seatInfoArray[10]%>" onclick="showSeatInfo(this)">11</td>
							<td id="14" class="seat<%=seatInfoArray[13]%>" onclick="showSeatInfo(this)">14</td>
							<td id="17" class="seat<%=seatInfoArray[16]%>" onclick="showSeatInfo(this)">17</td>
							<td id="20" class="seat<%=seatInfoArray[19]%>" onclick="showSeatInfo(this)">20</td>
						</tr>
						<tr>
							<td id="1" class="seat<%=seatInfoArray[0]%>" onclick="showSeatInfo(this)">1</td>
							<td id="4" class="seat<%=seatInfoArray[3]%>" onclick="showSeatInfo(this)">4</td>
							<td id="7" class="seat<%=seatInfoArray[6]%>" onclick="showSeatInfo(this)">7</td>
							<td id="10" class="seat<%=seatInfoArray[9]%>" onclick="showSeatInfo(this)">10</td>
							<td id="13" class="seat<%=seatInfoArray[12]%>" onclick="showSeatInfo(this)">13</td>
							<td id="16" class="seat<%=seatInfoArray[15]%>" onclick="showSeatInfo(this)">16</td>
							<td id="19" class="seat<%=seatInfoArray[18]%>" onclick="showSeatInfo(this)">19</td>
						</tr>
					</table>
					<%
				}
				else if(busClass.equals("프리미엄")){
					%>
					<table class="seatTable">
						<tr>
							<td class="seatText">출입문</td>
							<td id="2" class="seat<%=seatInfoArray[1]%>" onclick="showSeatInfo(this)">2</td>
							<td id="4" class="seat<%=seatInfoArray[3]%>" onclick="showSeatInfo(this)">4</td>
							<td id="6" class="seat<%=seatInfoArray[5]%>" onclick="showSeatInfo(this)">6</td>
							<td id="8" class="seat<%=seatInfoArray[7]%>" onclick="showSeatInfo(this)">8</td>
							<td id="10" class="seat<%=seatInfoArray[9]%>" onclick="showSeatInfo(this)" >10</td>
							<td id="12" class="seat<%=seatInfoArray[11]%>" onclick="showSeatInfo(this)">12</td>
							<td id="14" class="seat<%=seatInfoArray[13]%>" onclick="showSeatInfo(this)">14</td>
						</tr>
						<tr class="emptyRow"></tr>
						<tr>
							<td class="seatText">운전석</td>
							<td id="1" class="seat<%=seatInfoArray[0]%>" onclick="showSeatInfo(this)">1</td>
							<td id="3" class="seat<%=seatInfoArray[2]%>" onclick="showSeatInfo(this)">3</td>
							<td id="5" class="seat<%=seatInfoArray[4]%>" onclick="showSeatInfo(this)">5</td>
							<td id="7" class="seat<%=seatInfoArray[6]%>" onclick="showSeatInfo(this)">7</td>
							<td id="9" class="seat<%=seatInfoArray[8]%>" onclick="showSeatInfo(this)">9</td>
							<td id="11" class="seat<%=seatInfoArray[10]%>" onclick="showSeatInfo(this)">11</td>
							<td id="13" class="seat<%=seatInfoArray[12]%>" onclick="showSeatInfo(this)">13</td>
						</tr>
					</table>
					<%
				}
			%>
			<table id="selectSeatInfoTable">
				<tr>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
				</tr>
			</table>
			<input type="submit" value="확인"/>
		</div>
	</div>
	<input id="selectSeat1" name="seatInfo1" type="hidden"/>
	<input id="selectSeat2" name="seatInfo2" type="hidden"/>
	<input id="selectSeat3" name="seatInfo3" type="hidden"/>
</body>
</html>