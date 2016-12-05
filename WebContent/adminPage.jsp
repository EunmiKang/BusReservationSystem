<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> 관리자 페이지 </title>
	<link type="text/css" rel="stylesheet" href="adminPage.css"/>
</head>
<body>
	<form >
		<table id="addTable">
			<tr>
				<td class="left">출발지</td>
				<td>
					<input type="text" class="right" name="departure"/>
				</td>
				
				<td class="left">도착지</td>
				<td>
					<input type="text" class="right" name="arrival"/>
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
	</table>
</body>
</html>