<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DAO.*"%>
<%
	String ID = (String)session.getAttribute("ID");
	String PW = (String)session.getAttribute("PW");
	String changePW = request.getParameter("PW");
	String changephoneNum = request.getParameter("phoneNum");
	
	
	
	String userInfo=null;
	USERDAO userDao = new USERDAO(ID,PW);
	userInfo = userDao.selectUserInfo();
	String[] info = userInfo.split(":");
	//ID, PW, NAME, PHONENUM, CURRENTPOINT

	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if((info[1].equals(changePW) && info[3].equals(changephoneNum)))
	{
		%>
			<script>
			alert("변경된 정보가 없습니다.");
				history.go(-1);	
			</script>
		<%	
	}
	else{
		userDao.changeUserSetting(changePW, changephoneNum);
		session.setAttribute("PW", changePW);
		%>
			<script>
				alert("회원정보가 변경되었습니다.");
				location.replace("memberInfo.jsp");
			</script>
		<%
	}
%>
</body>
</html>