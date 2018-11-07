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
 font-family: ����;
 border:2px dotted #AC58FA;
 border-radius:8px;
}
 
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 
 
<title>Calender</title>
 
<script language="javascript" type="text/javascript">
var today = new Date(); // ���� ��¥//������ ��ǻ�͸� ��������
//today �� Date��ü�� �־��� //ex)5��  
function prevCalendar() {
 
 
 today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
 buildCalendar(); // ���� �� 
}
 
function nextCalendar() {
 
 
 today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
 buildCalendar();
}
 
function buildCalendar() {// ���� ��fur
 var nMonth = new Date(today.getFullYear(), today.getMonth(), 1);  // �̹� ���� ù° ��
 var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0); // �̹� ���� ������ ��
 var tblCalendar = document.getElementById("calendar");     // ���̺� �޷��� ���� ���̺�
 var tblCalendarYM = document.getElementById("calendarYM");    // yyyy�� m�� ����� ��
 tblCalendarYM.innerHTML = today.getFullYear() + "�� " + (today.getMonth() + 1) + "��";  // yyyy�� m�� ���
// ���� ���̺� �ѷ��� ��, ĭ ����
 
 
 while (tblCalendar.rows.length > 2) {
  tblCalendar.deleteRow(tblCalendar.rows.length - 1);
 }
 var row = null;
 row = tblCalendar.insertRow();
 var cnt = 0;
// 1���� ���۵Ǵ� ĭ�� ���߾� ��
 for (i=0; i<nMonth.getDay(); i++) {
  cell = row.insertCell();
  cnt = cnt + 1;
 }
 
 for (i=1; i<=lastDate.getDate(); i++) { 
  cell = row.insertCell();
  cell.innerHTML = i;
  cnt = cnt + 1;
  if (cnt%7 == 0)// 1������ 7�� �̹Ƿ�
   row = calendar.insertRow();// �� �߰�
 }
 
}
 
</script>
 
</head>
<body>
<table id="calendar" boarder="3" align="center">
 <tr>
     <td><label onclick="prevCalendar()"><</label></td>
        <td colspan="5" align="center" id="calendarYM">yyyy�� m��</td>
        <td><label onclick="nextCalendar()">>
           
        </label></td>
    </tr>
    <tr>
     <td align="center">��</td>
     <td align="center">��</td>
     <td align="center">ȭ</td>
     <td align="center">��</td>
     <td align="center">��</td>
     <td align="center">��</td>
     <td align="center">��</td>
   </tr>
 
 
</table>
<script language="javascript" type="text/javascript">
buildCalendar();
</script>
</body>
</html>

