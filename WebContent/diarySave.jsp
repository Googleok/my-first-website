
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %> 
<%
	String userid = request.getParameter("puserid");
	
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=JSP_Book;user=JSP;password=00";
	Connection con = DriverManager.getConnection(connectionURL);
	PreparedStatement pstmt = null;
	 
    Date today = new Date();
    SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
    String str=date.format(today);
    
	String smemo = request.getParameter("memo").replace("\r\n", "<br>");
// 단계5 : PreparedStateme 객체로 실행할 SQL문 생성
	String SQL = "insert into memo2(userid, memo, date) values(?, ?, ?)";
	pstmt = con.prepareStatement(SQL);
// 단계6 : PreparedStatement 객체로 실행할 SQL 문의 ? 위치에 각각의 값을 세팅
	pstmt.setString(1, userid);
	pstmt.setString(2, smemo);
	pstmt.setString(3, str);
	
// 단계 7 : PreparedStatament 객체 실행
	pstmt.executeUpdate();
// 단계8 : 객체 종료
	pstmt.close();
	con.close();
	
	response.sendRedirect("mainActivity.jsp");
	
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title> 회원가입 </title>
</head>
<body>
	저장완료
</body>
</html>