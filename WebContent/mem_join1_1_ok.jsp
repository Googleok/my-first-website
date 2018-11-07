
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
%>
<% request.setCharacterEncoding("utf-8"); %> 
<%

// 단계1: JDBC 드라이버 로드
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

// 단계2: 커넥션 객체 생성
	String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=JSP_Book;user=JSP;password=00";
	Connection con = DriverManager.getConnection(connectionURL);

// 단계3: PreparedStatement 객체 생성
	PreparedStatement pstmt = null;
	
// 단계4: 폼에서 입력한 값을 받아서 각각의 메모리 변수에 저장
	String suserid = request.getParameter("userid");
	String susernm = request.getParameter("usernm");
	String spasswd = request.getParameter("passwd");
	String sbirth = request.getParameter("year") + request.getParameter("month")+request.getParameter("day");
	String sphone = request.getParameter("phone");
	String saddr = request.getParameter("addr");
	String smail = request.getParameter("mail1")+"@"+request.getParameter("mail2");
	String smailrcv = request.getParameter("mailrcv");
	if(smailrcv != null && smailrcv.equals("on"))
		smailrcv ="Y";		//수신을 동의함 (체크함)
	else
		smailrcv = "N";		//수신을 체크하지 않음	
	String sgender = request.getParameter("gender");
	String sjob = request.getParameter("job");
	String sintro = request.getParameter("intro").replace("\r\n", "<br>");
// 단계5 : PreparedStateme 객체로 실행할 SQL문 생성
	String SQL = "insert into members(userid, usernm, passwd, birth, phone,addr,mail, mailrcv, gender, jobcd, intro) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	pstmt = con.prepareStatement(SQL);

// 단계6 : PreparedStatement 객체로 실행할 SQL 문의 ? 위치에 각각의 값을 세팅
	pstmt.setString(1, suserid);
	pstmt.setString(2, susernm);
	pstmt.setString(3, spasswd);
	pstmt.setString(4, sbirth);
	pstmt.setString(5, sphone);
	pstmt.setString(6, saddr);
	pstmt.setString(7, smail);
	pstmt.setString(8, smailrcv);
	pstmt.setString(9, sgender);
	pstmt.setString(10, sjob);
	pstmt.setString(11, sintro);

// 단계 7 : PreparedStatament 객체 실행
	pstmt.executeUpdate();
// 단계8 : 객체 종료
	pstmt.close();
	con.close();
	response.sendRedirect("mem_login.jsp");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 회원가입 </title>
</head>
<body>

</body>
</html>