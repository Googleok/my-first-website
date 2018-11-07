<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" import="java.sql.*" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("utf-8"); %> 
<%
	String userid = (String)session.getAttribute("suserid");
	
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=JSP_Book;user=JSP;password=00";
	Connection con = DriverManager.getConnection(connectionURL);
	PreparedStatement pstmt = null;
	int n=0;
	
	String suserid = request.getParameter("userid");
	String spasswd = request.getParameter("passwd");
	String susernm = request.getParameter("usernm");
	String sbirth = request.getParameter("birth");
	String sphone = request.getParameter("phone");
	String saddr = request.getParameter("addr");
	String smail = request.getParameter("mail");
	String smailrcv = request.getParameter("mailrcv");
	if(smailrcv != null && smailrcv.equals("on"))
		smailrcv ="Y";		//수신을 동의함 (체크함)
	else
		smailrcv = "N";		//수신을 체크하지 않음	
	String sgender = request.getParameter("gender");
	String sjob = request.getParameter("job");
	String sintro = request.getParameter("intro").replace("\r\n", "<br>");
	// 단계5 : PreparedStateme 객체로 실행할 SQL문 생성
	String SQL = "update members set ";
	SQL = SQL + "usernm	= ? ";
	SQL = SQL + ",birth	= ? ";
	SQL = SQL + ",phone	= ? ";
	SQL = SQL + ",addr	= ? ";
	SQL = SQL + ",mail	= ? ";
	SQL = SQL + ",mailrcv= ? ";
	SQL = SQL + ",gender	= ? ";
	SQL = SQL + ",jobcd	= ? ";
	SQL = SQL + ",intro	= ? ";
	SQL = SQL + "where userid= ? and passwd = ?";
	pstmt = con.prepareStatement(SQL);
	
	pstmt.setString(1, susernm);
	pstmt.setString(2, sbirth);
	pstmt.setString(3, sphone);
	pstmt.setString(4, saddr);
	pstmt.setString(5, smail);
	pstmt.setString(6, smailrcv);
	pstmt.setString(7, sgender);
	pstmt.setString(8, sjob);
	pstmt.setString(9, sintro);
	pstmt.setString(10, suserid);
	pstmt.setString(11, spasswd);
	n=pstmt.executeUpdate();
	pstmt.close();
	con.close();
	response.sendRedirect("mainActivity.jsp");
%>

<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>