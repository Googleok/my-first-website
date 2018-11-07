<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
	background-image: url("sky2.jpg");
}

@media screen and (max-width: 400px) {
	body {
		background-image: url("sky2.jpg");
	}
	h2 {
		color: white;
		text-align:center;
		font-size: 40px;
	}
}
@media screen and (max-width: 600px) {
	body {
		background-image: url("sky2.jpg");
	}
	h2 {
		color: white;
		text-align:center;
		font-size: 40px;
	}
}


@media screen and (min-width: 801px) {
	body {
		background-image: url("sky3.jpg");
	}
	h2 {
		color: white;
		text-align:center;
		font-size: 100px;
	}
	table {
		margin-left: 700px;
		margin-top: 150px;
	}
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<h2>Calendiary</h2>
<body>
	<form name="frm1" action="mem_login_ok.jsp" method="post">
		<table width=300 >
			<tr align=left style="color: white;">
				<td>아이디</td>
				<td><input type="text" NAME="userid" size=20 maxlength="20" ></td>
			</tr>
			<tr align=left style="color: white;">
				<td>비밀번호</td>
				<td><input type="password" name="passwd" size=20 maxlength=20></td>
			</tr>
			<tr>
				<td width="100%" align="center" colspan="2">
				<input type="submit" value="Login"></td>
			</tr>
		</table>
			<br><a href="mem_join1_1.jsp" style="margin-left: 820px; color: white; ">회원가입</a>
	</form>
</body>
</html>