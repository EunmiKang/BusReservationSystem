<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="myPackage.DAO" %>


<%
	request.setCharacterEncoding("UTF-8");
	/* main.html에서 넘긴 parameter들 받아옴 */
	String ID = request.getParameter("ID");
	String PW = request.getParameter("PW");
	DAO dao = new DAO();
	dao.createConn();
	dao.conn = dao.getConn();		// 데이터베이스 연결 정보 취득
	dao.meta = dao.getDBMD(dao.conn);	// 데이터베이스 메타정보 취득
	try {
		System.out.println(dao.meta.getTimeDateFunctions());
		System.out.println(dao.meta.getUserName());
	} catch (Exception e) {
		System.out.println("[*]	메타정보 출력 오류 발생: \n" + e.getMessage());
	}
	
%>