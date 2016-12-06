<%@page import="DAO.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String ID = (String)session.getAttribute("ID");
	String PW = (String)session.getAttribute("PW");
	String userInfo = null;
	USERDAO userDao = new USERDAO(ID,PW);
	userInfo = userDao.selectUserInfo();
	String[] info = userInfo.split(":");
	//out.print(info[0]);
%>
<html>
<head>
	<meta charset="UTF-8">
	<title>버스 예매 시스템</title>
	<link type="text/css" rel="stylesheet" href="memberInfo.css"/>
	<script src="memberInfo.js"></script>
</head>

<body>
	<h1 onclick="gotoMemberMain()">BUS TAJA</h1>
	<form id="memberInfoForm" action="changeUserSetting.jsp" method="post">
		<h2>회원 정보 조회</h2>
		<table>
			<tr>
				<td class="left">아이디</td>
				<td class="right unchangeable">
					<%=info[0]%>
				</td>
			</tr>
			<tr>
				<td class="left">비밀번호</td>
				<td>
					<input type="text" class="right" name="PW" value="<%=info[1]%>"/>
				</td>
			</tr>
			<tr>
				<td class="left">이름</td>
				<td class="right unchangeable">
				<%=info[2] %>
				</td>
			</tr>
			<tr>
				<td class="left">전화번호</td>
				<td>
					<input type="text" class="right" name="phoneNum" value="<%=info[3]%>"/>
				</td>
			</tr>
			<tr>
				<td class="left">포인트</td>
				<td class="right unchangeable">
					<%=info[4] %>
				</td>
			</tr>
			<tr>
				<td class="tdBtn">
					<input type="button" class="btn" value="회원 탈퇴" onclick="deactivateAccount()"/>
				</td>
				<td class="tdBtn">
					<input type="submit" class="btn" value="회원 정보 수정"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>