<%@page import="java.util.ArrayList"%>
<%@page import="DAO.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String ID = (String)session.getAttribute("ID");
	String PW = (String)session.getAttribute("PW");
	String departure = (String)session.getAttribute("S_departure");
	String arrival = (String)session.getAttribute("S_arrival");
	String departureDate = (String)session.getAttribute("S_departureDate");
	String departureTime = (String)session.getAttribute("S_departureTime");
	String seatStr1 = request.getParameter("seatInfo1");
	String seatStr2 = request.getParameter("seatInfo2");
	String seatStr3 = request.getParameter("seatInfo3");
	String price = request.getParameter("totalPrice");
	DAO dao = new DAO();
	USERDAO userDao = new USERDAO(ID, PW);
	int curpoint=0;
	String[] seatL1 = new String[2];
	String[] seatL2= new String[2];
	String[] seatL3 = new String[2];
	String str11="";
	String str12="";
	String str21="";
	String str22="";
	String str31="";
	String str32="";
	if(seatStr1!=null || seatStr2!=null || seatStr3 != null){
	if(seatStr1!=""){
		seatL1 = seatStr1.split("/");
		str11 = seatL1[0];
		str12 = dao.returnSeatInfo(seatL1[1]);
	}
	if(seatStr2!=""){
		seatL2 = seatStr2.split("/");
		str21 = seatL2[0];
		str22 = dao.returnSeatInfo(seatL2[1]);
	}
	if(seatStr3!=""){
		seatL3 = seatStr3.split("/");
		str31 = seatL3[0];
		str32 = dao.returnSeatInfo(seatL3[1]);
	}
	}
	curpoint = Integer.parseInt(userDao.returnCurPoint(userDao));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link type="text/css" rel="stylesheet" href="adminPage.css"/>
	<title>결제진행</title>
	<script>
	var a=0;
	function priceCheck(){
		var price = Number(document.getElementById("_price_").value);
		var usepoint = Number(document.getElementById("_point_").value);
		if(Number(document.getElementById("_point_").value) < 1000){
			document.getElementById("_point_").value = "0";
			a=1;
			alert("포인트는 1000점 이상부터 사용 가능합니다.");		
			return ;
		}
		if(Number(document.getElementById("_point_").value) >= usepoint){
			if(Number(document.getElementById("_usingpoint_").value < Number(document.getElementById("_point_").value))){
				document.getElementById("_point_").value = "0";	
				a=1;
				alert("사용할 수 없는 포인트 액수입니다.");
			}
			else
				document.getElementById("_payprice_").value = price - usepoint;
		}else{	
			document.getElementById("_payprice_").value = price;	
		}
	}
	
	function check(){
		if(a==1){
			alert("결제금액을 확인해 주세요");
			history.go(-1);	
		}
		else{
			location.href = "payment.jsp";
		}
	}
	</script>
	
</head>
<body>
	
			<h1> 결제하기 </h1>
			
			<div id="div4" style="display: inline-block; text-align:center;">
			
			<div class="div10">
			<table id="terminalBusClassTable">
				<tr>
					<td class="left" colspan="2"> 출발지 </td>
					<td></td>
					<td>
						<input class="inputClass" type='text' readonly value="<%=departure%>">
					</td>
				</tr>
				<tr>
					<td  class="left" colspan="2"> 도착지  </td>
					<td></td>
					<td>
						<input class="inputClass" type='text' readonly value="<%=arrival%>">
					</td>
				</tr>
				<tr>
					<td class="left" colspan="2"> 출발날짜 </td>
					<td></td>
					<td>
						<input class="inputClass" type='text' readonly value="<%=departureDate%>">
					</td>
				</tr>
				<tr>
					<td class="left" colspan="2"> 출발시간 </td>
					<td></td>
					<td>
						<input class="inputClass" type='text' readonly value="<%=departureTime%>">
					</td>
				</tr>
				<tr>
					<td class="left" colspan="2"> 가격 </td>
					<td></td>
					<td>
						<input class="inputClass" type='text' readonly value="<%=price %>">
					</td>
				</tr>
			</table>
			</div>
			
			<div class="div10">
			
			<table>
			<tr>
				<td></td>
				<th>좌석번호</th>
				<td></td>
				<th>정보</th>	
			</tr>
				<tr>
					<td class="left">  </td>
					<td><input class="inputClass" id="seat11" type='text' readonly value="<%=str11%>"></td>
					<td class="left">  </td>
					<td><input class="inputClass" id="seat12" type='text' readonly value="<%=str12%>"></td>
				</tr>
				<tr>
					<td class="left">  </td>
					<td><input class="inputClass" id="seat21" type='text' readonly value="<%=str21%>"></td>
					<td class="left">  </td>
					<td><input class="inputClass" id="seat22" type='text' readonly value="<%=str22%>"></td>
				</tr>
				<tr>
					<td class="left">  </td>
					<td><input class="inputClass" id="seat31" type='text' readonly value="<%=str31%>"></td>
					<td class="left">  </td>
					<td><input class="inputClass" id="seat32" type='text' readonly value="<%=str32%>"></td>
				</tr>
			</table>
			</div>
			
			<div class="div10">
				<form action="progressPayment.jsp" method="post">
				<table>
					<tr>
						<td class="left" >가격</td>
						<td><input class="inputClass" id="_price_" type='text' readonly value="<%=price%>"></td>
					</tr>
					<tr>
						<td class="left" >현재 포인트</td>
						<td><input class="inputClass" id="_usingpoint_" type='text' readonly value="<%=curpoint%>"></td>
					</tr>
					<tr>
						<td class="left" >사용 할 포인트</td>
						<td><input class="inputClass" id="_point_" name="_point_" type='number' onchange="priceCheck()" value="0"></td>
					</tr>
					<tr>
						<td class="left" >결제금액</td>
						<td><input id="_payprice_" class="inputClass" type='text' readonly value="<%=price%>"></td>
					</tr>
					<tr>
					<td class="left">티켓팅</td>
					<td>
						<select name="ticketing" name="_ticketing_" form="" class="right">
						<option value='현장발권'>현장 발권</option>
						<option value='e-티켓'>e - 티켓</option>
					</tr>
					<tr>
					<td></td>
					<td><input class = "btn" id="paymentBtn" type="submit" onclick = "check()" value="결제"/></td>
				</table>
				</form>
			</div>
			
		</div>
		
	</body>
</html>