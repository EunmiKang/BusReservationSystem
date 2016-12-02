<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	/* main.html에서 넘긴 parameter들 받아옴 */
	String ID = request.getParameter("ID");
	String PW = request.getParameter("PW");
	
	/* 넘겨받은 ID가 존재하는지 안하는지 확인 - 디비어케씀..★ */
	
%>