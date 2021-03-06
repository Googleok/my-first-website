<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style type="text/css">
td {
 width: 60px;
 height: 60px;
 text-align: center;
 font-size: 20px;
 font-family: 바탕;
 border:2px dotted #AC58FA;
 border-radius:8px;
}
 
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 
 
<title>Calender</title>
 
<script language="javascript" type="text/javascript">
var today = new Date(); // 오늘 날짜//지신의 컴퓨터를 기준으로
//today 에 Date객체를 넣어줌 //ex)5일  
function prevCalendar() {
 
 
 today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
 buildCalendar(); // 현재 달 
}
 
function nextCalendar() {
 
 
 today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
 buildCalendar();
}
 
function buildCalendar() {// 현재 달fur
 var nMonth = new Date(today.getFullYear(), today.getMonth(), 1);  // 이번 달의 첫째 날
 var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0); // 이번 달의 마지막 날
 var tblCalendar = document.getElementById("calendar");     // 테이블 달력을 만들 테이블
 var tblCalendarYM = document.getElementById("calendarYM");    // yyyy년 m월 출력할 곳
 tblCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월";  // yyyy년 m월 출력
// 기존 테이블에 뿌려진 줄, 칸 삭제
 
 
 while (tblCalendar.rows.length > 2) {
  tblCalendar.deleteRow(tblCalendar.rows.length - 1);
 }
 var row = null;
 row = tblCalendar.insertRow();
 var cnt = 0;
// 1일이 시작되는 칸을 맞추어 줌
 for (i=0; i<nMonth.getDay(); i++) {
  cell = row.insertCell();
  cnt = cnt + 1;
 }
 
 for (i=1; i<=lastDate.getDate(); i++) { 
  cell = row.insertCell();
  cell.innerHTML = i;
  cnt = cnt + 1;
  if (cnt%7 == 0)// 1주일이 7일 이므로
   row = calendar.insertRow();// 줄 추가
 }
 
}
 
</script>
 
</head>
<body>
<table id="calendar" boarder="3" align="center">
 <tr>
     <td><label onclick="prevCalendar()"><</label></td>
        <td colspan="5" align="center" id="calendarYM">yyyy년 m월</td>
        <td><label onclick="nextCalendar()">>
           
        </label></td>
    </tr>
    <tr>
     <td align="center">일</td>
     <td align="center">월</td>
     <td align="center">화</td>
     <td align="center">수</td>
     <td align="center">목</td>
     <td align="center">금</td>
     <td align="center">토</td>
   </tr>
 
 
</table>
<script language="javascript" type="text/javascript">
buildCalendar();
</script>
</body>
</html>

