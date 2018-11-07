<%@ page language="java" import ="java.sql.*" import = "java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("utf-8"); %> 
<%
	String in_userid = request.getParameter("puserid");

	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=JSP_Book;user=JSP;password=00";
	Connection con = DriverManager.getConnection(connectionURL);
	PreparedStatement pstmt = null;
	ResultSet rs =null;
	
	String SQL = "select * from members where userid = ?";
	pstmt = con.prepareStatement(SQL);
	pstmt.setString(1, in_userid); 
	rs = pstmt.executeQuery();
	
	if(rs.next() == false){
		out.print("등록되지 않은 회원입니다.");
	}
	else
	{
		String usernm = rs.getString("usernm");
		String passwd = rs.getString("passwd");
		String mailrcv = rs.getString("mailrcv");
		String birth = rs.getString("birth");
		String phone = rs.getString("phone");
		String addr = rs.getString("addr");
		String mail = rs.getString("mail");
		if(mailrcv == null) mailrcv ="N";
		String gender = rs.getString("gender");
		if(gender == null) gender ="";
		String job = rs.getString("jobcd");
		if(job == null) job ="";
		String intro = rs.getString("intro");
		if( intro != null) intro =intro.replace("<br>", "\r\n");

%>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<h3> 회원 정보 변경 </h3>

<body>
<form name = "frm1" action="mem_upd1_4_ok.jsp?" method = "post">
<table  width="500" border="1" >

	<TR>
		<TD WIDTH = "40%" ALIGN = "left" > 아이디 </TD>
		<TD WIDTH = "80%" ALIGN = "left" >
			<input type = "text" size =15 maxlength="10" name = "userid" value="<%= in_userid%>" ReadOnly>
		</TD>
	</TR>
	
	<tr align = left>
		<td> 비밀번호 </td>
		<td> <input type="password" name="passwd" size=10 maxlength=10 value="<%= passwd%>"></td>
	</tr>

	<tr align = left>
		<td> 비밀번호확인 </td>
		<td> <input type="password" name="passwd" size=10 maxlength=10 value="<%= passwd%>"></td>
	</tr>
	
	<TR>
		<TD WIDTH = "40%" ALIGN ="left"> 이름 </TD>
		<TD WIDTH = "80%" ALIGN = "left" >
			<input type = "text" size =15 maxlength="10" name = "usernm" value="<%= usernm %>" >
		</TD>
	</TR>
	
	<TR>
		<TD WIDTH = "40%" ALIGN ="left"> 생일 </TD>
		<TD WIDTH = "60%" ALIGN = "left" >
			<input type = "text" name = "birth" value="<%= birth %>" >
		</TD>
	</TR>
	
	<TR>
		<TD WIDTH = "40%" ALIGN ="left"> 전화번호 </TD>
		<TD WIDTH = "60%" ALIGN = "left" >
			<input type = "text" name = "phone" value="<%= phone %>" >
		</TD>
	</TR>
	
	<tr align = left>
		<td> 주소 </td>
		<td> <input type="text" name="addr" size =30 maxlength="50" value="<%= addr%>"></td>
	</tr>
	
	<TR>
		<TD WIDTH = "40%" ALIGN ="left"> 이메일 </TD>
		<TD WIDTH = "60%" ALIGN = "left" >
			<input type = "text" name = "mail" value="<%= mail %>" >
		</TD>
	</TR>
	
	<TR>
		<TD WIDTH = "40%" ALIGN ="left"> 메일수신여부 </TD>
		<TD WIDTH = "60%" ALIGN = "left" >
			동의함 <input type = "checkbox" name = "mailrcv" <% if (mailrcv.equals("Y")) out.print (" checked"); %> >
		</TD>
	</TR>
	<TR>
		<TD WIDTH = "40%" ALIGN ="left"> 성별 </TD>
		<TD WIDTH = "60%" ALIGN = "left">
			 남<input type = "radio" name = "gender" value="1" <% if (gender.equals("1")) out.print (" checked"); %> >
			 여<input type = "radio" name = "gender" value="2" <% if (gender.equals("2")) out.print (" checked"); %> >
		</TD>
	</TR>
	
	<TR>
		<TD WIDTH = "40%" ALIGN = "left">직업</TD>
		<TD WIDTH = "60%" ALIGN = "left">
			<SELECT NAME="job">
				<option value="">==직업을 선택하세요==</option>
				<option value="1" <% if (job.equals("1")) out.print (" selected"); %>>학생 </option>
				<option value="2" <% if (job.equals("2")) out.print (" selected"); %>>직장인 </option>
				<option value="3" <% if (job.equals("3")) out.print (" selected"); %>>군인 </option>
				<option value="9" <% if (job.equals("9")) out.print (" selected"); %>>기타 </option>
			</SELECT>
		</TD>
	</TR>
	<TR>
		<TD WIDTH = "40%" ALIGN ="left"> 자기소개 </TD>
		<TD WIDTH = "60%" ALIGN = "left">
			<textarea name="intro" rows="5" cols="50"><%= intro %></textarea>
		</TD>
	</TR>
	
	<TR>
		<TD WIDTH = "100%" ALIGN ="center" colspan="2">
			<input type="submit" value="변경" >
		</TD>
	</TR>
</table>
</form>
</body>
<%
}
%>
</html>