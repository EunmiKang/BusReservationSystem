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
	
	curpoint = Integer.parseInt(userDao.returnCurPoint(userDao));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link type="text/css" rel="stylesheet" href="adminPage.css"/>
	<title>결제진행</title>
	<script>
	function priceCheck(){
		var price = Number(document.getElementById("_price_").value);
		var usepoint = Number(document.getElementById("_point_").value);
		if(Number(document.getElementById("_point_").value) < 1000){
			alert("포인트는 1000점 이상부터 사용 가능합니다.");		
			return ;
		}
		if(Number(document.getElementById("_point_").value) >= usepoint){
			if(Number(document.getElementById("_usingpoint_").value < Number(document.getElementById("_point_").value)))
				alert("사용할 수 없는 포인트 액수입니다.");
			else
				document.getElementById("_payprice_").value = price - usepoint;
		}else{	
			document.getElementById("_payprice_").value = price;	
		}
	}
	</script>
</head>
<body onload= "check()">
	
			<h1> 결제하기 </h1>
			<div id="div4">
			<div id ="div5">
			<table id="terminalBusClassTable">
				<tr>
					<td class="left" colspan="2"> 출발지 </td>
					<td></td>
					<td>
						<input type='text' readonly value="<%=departure%>">
					</td>
				</tr>
				<tr>
					<td class="left" colspan="2"> 도착지  </td>
					<td></td>
					<td>
						<input type='text' readonly value="<%=arrival%>">
					</td>
				</tr>
				<tr>
					<td class="left" colspan="2"> 출발날짜 </td>
					<td></td>
					<td>
						<input type='text' readonly value="<%=departureDate%>">
					</td>
				</tr>
				<tr>
					<td class="left" colspan="2"> 출발시간 </td>
					<td></td>
					<td>
						<input type='text' readonly value="<%=departureTime%>">
					</td>
				</tr>
				<tr>
					<td class="left" colspan="2"> 가격 </td>
					<td></td>
					<td>
						<input type='text' readonly value="<%=price %>">
					</td>
				</tr>
			</table>
			</div>
			<div>
			<table>
			<tr>
				<td></td>
				<th>좌석번호</th>
				<td></td>
				<th>정보</th>	
			</tr>
				<tr>
					<td class="left">  </td>
					<td><input id="seat11" type='text' readonly value="<%=str11%>"></td>
					<td class="left">  </td>
					<td><input id="seat12" type='text' readonly value="<%=str12%>"></td>
				</tr>
				<tr>
					<td class="left">  </td>
					<td><input id="seat21" type='text' readonly value="<%=str21%>"></td>
					<td class="left">  </td>
					<td><input id="seat22" type='text' readonly value="<%=str22%>"></td>
				</tr>
				<tr>
					<td class="left">  </td>
					<td><input id="seat31" type='text' readonly value="<%=str31%>"></td>
					<td class="left">  </td>
					<td><input id="seat32" type='text' readonly value="<%=str32%>"></td>
				</tr>
			</table>
			</div>
			<div>
			<table>
				<tr>
					<td class="left" >가격</td>
					<td><input id="_price_" type='text' readonly value="<%=price%>"></td>
				</tr>
				<tr>
					<td class="left" >현재 포인트</td>
					<td><input id="_usingpoint_" type='text' readonly value="<%=curpoint%>"></td>
				</tr>
				<tr>
					<td class="left" >사용 할 포인트</td>
					<td><input id="_point_" type='number' onchange="priceCheck()" value="0"></td>
				</tr>
				<tr>
					<td class="left" >결제금액</td>
					<td><input id="_payprice_" type='text' readonly value="<%=price%>"></td>
				</tr>
				
			</table>
		</div>
	</div>
</body>
</html>