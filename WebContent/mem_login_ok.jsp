<%@page import="java.net.URLEncoder"%>
<%@page import="com.sun.xml.internal.bind.v2.runtime.output.Encoded"%>
<%@ page language="java" import="java.sql.*" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("utf-8"); %> 
<%

	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=JSP_Book;user=JSP;password=00";
	Connection con = DriverManager.getConnection(connectionURL);
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String suserid = request.getParameter("userid");
	String spasswd = request.getParameter("passwd");
	
	String SQL = "select usernm from members where userid = ? and passwd = ?";
	pstmt = con.prepareStatement(SQL);
	
	pstmt.setString(1, suserid);
	pstmt.setString(2, spasswd);
	
	rs = pstmt.executeQuery();
	
	if(rs.next() == true && suserid !=null){
		session.setAttribute("suserid", suserid);
		session.setAttribute("susernm", rs.getString(1));
		session.setMaxInactiveInterval(60*60);
		String encValue = URLEncoder.encode(suserid,"utf-8");
		out.print(rs.getString(1)+"님의 로그인이 성공되었습니다.");
		response.sendRedirect("mainActivity.jsp?puserid="+encValue);
	}
	else{
		out.print("로그인을 실패하였습니다.");
		response.sendRedirect("mem_login.jsp");
	}
	pstmt.close();
	rs.close();
	con.close();

%>

<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>