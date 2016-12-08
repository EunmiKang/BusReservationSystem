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
	session.setAttribute("S_busClass", busClass);
	String seatInfo = request.getParameter("seatInfo_" + index);
	session.setAttribute("S_seatInfo", seatInfo);
	String[] seatInfoArray = seatInfo.split("");
	String price = request.getParameter("price_" + index);
	
	float tmp1 = Float.parseFloat(price);
	float tmp2 = tmp1 * (float)0.8;
	String price2 = Integer.toString((int)tmp2);
	
	tmp1 = Float.parseFloat(price);
	tmp2 = tmp1 * (float)0.6;
	String price3 = Integer.toString((int)tmp2);
	
	session.setAttribute("S_departureTime", departureTime);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> 버스 예매 시스템 </title>
	<link type="text/css" rel="stylesheet" href="getSchedule.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script>
		var selectNum=0;	//선택한 매수
		var selectSeatNum=0;		//선택한 자리수
		var selectSeatNo;
		var num1=0;	//선택어른수
		var num2=0;	//선택중고생수
		var num3=0;	//선택아동수
		var select1=0;	//선택어른좌석수
		var select2=0;	//선택중고생좌석수
		var select3=0;	//선택아동좌석수
		
		function check() {
			var check = 0;
			var check1 = document.getElementById("checkA").value;
			var check2 = document.getElementById("checkB").value;
			var check3 = document.getElementById("checkC").value;
			
			if(check1 == "0") {
				num1 = 0;
			}
			else if(check1 == "1") {
				num1 = 1;
			}
			else if(check1 == "2") {
				num1 = 2;
			}
			else if(check1 == "3") {
				num1 = 3;
			}
			
			if(check2 == "0") {
				num2 = 0;
			}
			else if(check2 == "1") {
				num2 = 1;
			}
			else if(check2 == "2") {
				num2 = 2;
			}
			else if(check2 == "3") {
				num2 = 3;
			}
			
			if(check3 == "0") {
				num3 = 0;
			}
			else if(check3 == "1") {
				num3 = 1;
			}
			else if(check3 == "2") {
				num3 = 2;
			}
			else if(check3 == "3") {
				num3 = 3;
			}
			
			check = num1 + num2 + num3;
			
			if(check==0) {
				alert("최소 1매는 선택해주세요.");
			}
			else if(check>3) {
				alert("3매까지만 예약할 수 있습니다.");
				document.getElementById("checkA").value = "0";
				document.getElementById("checkB").value = "0";
				document.getElementById("checkC").value = "0";
			}
			else {
				selectNum = check;
				alert("좌석을 선택해주세요.");
				var totalPrice = (<%=price%> * check1) +  (<%=price2%> * check2) + (<%=price3%> * check3);
				document.getElementById("totalPrice").value = totalPrice;
			}
		}
		
		function showSeatInfo(seat) {
		    var seatClass = seat.getAttribute('class');
			if(selectNum==0) {
				alert("매수를 먼저 선택해주세요.");
			}
			else if(selectSeatNum == selectNum) {
				document.getElementById("selectSeatInfoTable").style.visibility = "hidden";
				alert("이미 선택하신 매수만큼의 좌석을 모두 선택하셨습니다.");
			}
			else {
				if(seatClass == "seat0") {
					//document.getElementById("selectSeatInfoTable").style.display = "block";
					document.getElementById("selectSeatInfoTable").style.visibility = "visible";
					selectSeatNo = seat.getAttribute('id');
				}	
			}
		}
		
		function saveInfo() {
			if(selectSeatNum == selectNum) {
				document.getElementById("selectSeatInfoTable").style.visibility = "hidden";
				alert("이미 선택하신 매수만큼의 좌석을 모두 선택하셨습니다.");
			} else {
				//var age = document.getElementsByName("age")[0].value;
				//var sex = document.getElementsByName("sex")[0].value;
				var age = $(":input:radio[name='age']:checked").val();
				var sex = $(":input:radio[name='sex']:checked").val();
				
				var value = selectSeatNo + "/";
				if(sex=="여성") {
					if(age=="어른") {
						if(select1==num1) {	//선택한 어른 매수만큼 어른의 좌석은 다 선택함 - 어른 좌석 더 추가 못함
							alert("더이상 어른 좌석은 선택할 수 없습니다.");
						}
						else {	//어른 좌석 추가 선택 가능
							value += "1";
							selectSeatNum++;	//선택한 총 좌석 수 증가
							select1++;	//선택한 어른 좌석수 증가
							var hiddenId = "selectSeat" + selectSeatNum;
							document.getElementById(hiddenId).value = value;
							document.getElementById(selectSeatNo).className = "selectedSeat";
						}
					}
					else if(age=="중고생") {
						if(select2==num2) {	//선택한 중고생 매수만큼 중고생 좌석은 다 선택함 - 중고생 좌석 더 추가 못함
							alert("더이상 중고생 좌석은 선택할 수 없습니다.");
						}
						else {	//중고생 좌석 추가 선택 가능
							value += "2";
							selectSeatNum++;	//선택한 총 좌석 수 증가
							select2++;	//선택한 중고샏 좌석수 증가
							var hiddenId = "selectSeat" + selectSeatNum;
							document.getElementById(hiddenId).value = value;
							document.getElementById(selectSeatNo).className = "selectedSeat";
						}
					}
					else if(age=="아동") {
						if(select3==num3) {	//선택한 아동 매수만큼 아동 좌석은 다 선택함 - 아동 좌석 더 추가 못함
							alert("더이상 아동 좌석은 선택할 수 없습니다.");
						}
						else {	//아동 좌석 추가 선택 가능
							value += "3";
							selectSeatNum++;	//선택한 총 좌석 수 증가
							select3++;	//선택한 아동 좌석수 증가
							var hiddenId = "selectSeat" + selectSeatNum;
							document.getElementById(hiddenId).value = value;
							document.getElementById(selectSeatNo).className = "selectedSeat";
						}
					}
				}
				else if(sex=="남성") {
					if(age=="어른") {
						if(select1==num1) {	//선택한 어른 매수만큼 어른의 좌석은 다 선택함 - 어른 좌석 더 추가 못함
							alert("더이상 어른 좌석은 선택할 수 없습니다.");
						}
						else {	//어른 좌석 추가 선택 가능
							value += "4";
							selectSeatNum++;	//선택한 총 좌석 수 증가
							select1++;	//선택한 어른 좌석수 증가
							var hiddenId = "selectSeat" + selectSeatNum;
							document.getElementById(hiddenId).value = value;
							document.getElementById(selectSeatNo).className = "selectedSeat";
						}
					}
					else if(age=="중고생") {
						if(select2==num2) {	//선택한 중고생 매수만큼 중고생 좌석은 다 선택함 - 중고생 좌석 더 추가 못함
							alert("더이상 중고생 좌석은 선택할 수 없습니다.");
						}
						else {	//중고생 좌석 추가 선택 가능
							value += "5";
							selectSeatNum++;	//선택한 총 좌석 수 증가
							select2++;	//선택한 중고샏 좌석수 증가
							var hiddenId = "selectSeat" + selectSeatNum;
							document.getElementById(hiddenId).value = value;
							document.getElementById(selectSeatNo).className = "selectedSeat";
						}
					}
					else if(age=="아동") {
						if(select3==num3) {	//선택한 아동 매수만큼 아동 좌석은 다 선택함 - 아동 좌석 더 추가 못함
							alert("더이상 아동 좌석은 선택할 수 없습니다.");
						}
						else {	//아동 좌석 추가 선택 가능
							value += "6";
							selectSeatNum++;	//선택한 총 좌석 수 증가
							select3++;	//선택한 아동 좌석수 증가
							var hiddenId = "selectSeat" + selectSeatNum;
							document.getElementById(hiddenId).value = value;
							document.getElementById(selectSeatNo).className = "selectedSeat";
						}
					}
				}
				
				document.getElementById("selectSeatInfoTable").style.visibility = "hidden";
			}
		}
		
		function finalCheck() {
			if(selectNum > selectSeatNum) {
				alert("좌석을 덜 선택하셨습니다.");
			}
			else {
				document.getElementById('selectSeatForm').submit();
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
			<td class="trtd"><%=departure_time[0]%>시 <%=departure_time[1]%>분</td>
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
							<input class="leftData" id="checkA" type="number" value="0" min="0" max="3"/>명
						</td>
					</tr>
					<tr>
						<td class="left">중고생</td>
						<td>
							<input class="leftData" id="checkB" type="number" value="0" min="0" max="3"/>명
						</td>
					</tr>
					<tr>
						<td class="left">아동</td>
						<td>
							<input class="leftData" id="checkC" type="number" value="0" min="0" max="3"/>명
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<button class="btn" onclick="check()">확인</button>
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
							<input class="leftData" id="p1" type="text" value="<%=price %>" readonly/>원
						</td>
					</tr>
					<tr>
						<td class="left">중고생</td>
						<td>
							<input class="leftData" id="p2" type="text" value="<%=price2 %>" readonly/>원
						</td>
					</tr>
					<tr>
						<td class="left">아동</td>
						<td>
							<input class="leftData" id="p3" type="text" value="<%=price3 %>" readonly/>원
						</td>
					</tr>
					<tr id="pTotal">
						<td id="totalText" class="left">합계</td>
						<td>
							<form id="selectSeatForm" action="payment.jsp" method="post">
							<input class="leftData" id="totalPrice" name="totalPrice" type="text" readonly/>원
							<input id="selectSeat1" name="seatInfo1" type="hidden"/>
							<input id="selectSeat2" name="seatInfo2" type="hidden"/>
							<input id="selectSeat3" name="seatInfo3" type="hidden"/>
							</form>
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
			<input id="submitBtn" type="submit" value="확인" onclick="finalCheck()"/>
		</div>
		<div id="div6">
			<table id="selectSeatInfoTable">
				<tr>
					<td><input type="radio" name="age" value="어른" checked> 어른</td>
					<td><input type="radio" name="age" value="중고생"> 중고생</td>
					<td><input type="radio" name="age" value="아동"> 아동</td>
					<td rowspan="2">
						<input type="button" class="btn" value="확인" onclick="saveInfo()"/>
					</td>
				</tr>
				<tr>
					<td><input type="radio" name="sex" value="여성" checked> 여성</td>
					<td><input type="radio" name="sex" value="남성"> 남성</td>
				</tr>
			</table>
			</div>
	</div>
</body>
</html>