<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원가입 </title>
</head>

<body>
<form name="frm1" action="mem_join1_1_ok.jsp" method="post">
<table width="700" border = "1">
<tr align = left>
	<td> 아이디 </td>
	<td> <input type="text" NAME="userid" size=10 maxlength="10"></td>
</tr>

<tr align = left>
	<td> 이름 </td>
	<td>  <input type="text" name="usernm" size=10 maxlength="10"></td>
</tr>

<tr align = left>
	<td> 비밀번호 </td>
	<td> <input type="password" name="passwd" size=10 maxlength=10></td>
</tr>

<tr align = left>
	<td> 비밀번호확인 </td>
	<td> <input type="password" name="passwd" size=10 maxlength=10></td>
</tr>

<tr align = left>
	<td> 생년월일 </td>
	<td> <input type="text" name="year" size =4 maxlength="4">
	<select name="month">
			<option value="">월</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
			</select>
			<input type = "text" name = "day" size =2 maxlength=""></td>
</tr>
<tr align = left>
	<td> 전화번호 </td>
	<td> <input type="text" name="phone" size =11 maxlength="14"></td>
</tr>

<tr align = left>
	<td> 주소 </td>
	<td> <input type="text" name="addr" size =30 maxlength="50"></td>
</tr>

<tr align = left>
	<td> 이메일 </td>
	<td> <input type="text" name="mail1" size=13 maxlength=20> @ <input type = "text" name ="mail2" size =13 maxlength="20"> 
</tr>

<tr align = left>
	<td> 메일수신여부 </td>
	<td> <input type="checkbox" name="mail_yn" value="Y"></td>
</tr>

<tr align = left>
	<td> 성별 </td>
	<td> 남 <input type="radio" name="gender" value="1">
		 여 <input type="radio" name="gender" value="2"></td>
</tr>

<tr align = left>
	<td> 직업 </td>
	<td> <select name="job">
			<option value="">==직업을 선택하세요==</option>
			<option value="1">학생</option>
			<option value="2">회사원</option>
			<option value="3">군인</option>
			<option value="9">기타</option>
		</select></td>
</tr>

<tr align = left>
	<td> 자기소개 </td>
	<td> <textarea name="intro" rows="5" cols="70"></textarea></td>
</tr>
</table>
<input type="submit" value="가입하기">
</form>

</body>
</html>