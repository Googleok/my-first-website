<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%
	String userid = (String) session.getAttribute("suserid");
	String encValue = URLEncoder.encode(userid, "utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<title>달력 스크립트</title>
<meta charset="utf-8">
<style>
body{
   background-color:#DFDBF9;
}
</style>

<style> 
        .black_overlay{ 
            display: none; 
            position: absolute; 
            top: 0%; 
            left: 0%; 
            width: 100%; 
            height: 1500px; 
            background-color:black; 
            z-index:1001; 
            -moz-opacity: 0.8; 
            opacity:.50; 
            filter: alpha(opacity=80); 
        } 
        .white_content { 
            display: none; 
            position: absolute; 
            top: 25%; 
            left: 25%; 
            width: 50%; 
            height: 50%; 
            padding: 16px; 
            border: 5px solid #FFB6AE; 
            background-color:white; 
            z-index:1002; 
            overflow: auto; 
        } 
    </style> 


<style> 
td {text-decoration:none;text-color:black } 
font {text-decoration:none; line-height:80%;} 
A:link,A:active,A:visited{text-decoration:none;color:#C6E2FF;} 
A:hover {text-decoration:none;color:#FF9F95} 
</style> 


<link rel="STYLESHEET" type="text/css" href="board_style.css">
<SCRIPT> 

    var monthName=new Array("1월","2월","3월","4월","5월","6월","7월", 
    "8월","9월","10월","11월","12월") 
    var monthDays=new Array(31,28,31,30,31,30,31,31,30,31,30,31) 
    var now=new Date; 
    var nowd=now.getDate() 
    var nowm=now.getMonth() 
    var nowy=now.getFullYear();
    function showCalendar(day,month,year) 
    { 
  if ((year%4==0||year%100==0)&&(year%400==0)) monthDays[1]=29; 
  else monthDays[1]=28 //leap year test 
  
  var firstDay=new Date(year,month,1).getDay() 
  var calStr="<table border=0 cellpadding=40 cellspacing=1 align=center bgcolor=#FFE4E1>" //border-color

  calStr+="<tr bgcolor=#FFE4E1><td colspan=7>"  //year-color

  calStr+="<table border=0 cellpadding=0 cellspacing=0 align=center width=100% )>" 
  calStr+="<td><font size='3'><a href='javascript:;' onClick='nowm--; if (nowm<0) { nowy--; nowm=11; } showCalendar(nowd,nowm,nowy)' title='이전 월'> <<</a></font></td>" 
  calStr+="<td align=center ><font size='7' font color='#FFB6AE'>"+monthName[month].toUpperCase()+" "+year+"년</font></td>" 
  calStr+="<td align=right><font size='3'><a href='javascript:;'  onClick='nowm++; if (nowm>11) { nowy++; nowm=0; } showCalendar(nowd,nowm,nowy)' title='다음 월'> >></a></font></td>" 
  calStr+="</tr></table>" 
 
  calStr+="</td></tr>"  

  calStr+="<tr align=center bgcolor='#c6e7ea'>"  //day-color
  calStr+="<th><font color='#FF9F95' size='3'>일</font></th>" 
  calStr+="<th><font color='white' size='3'>월</font></th>" 
  calStr+="<th><font color='white' size='3'>화</font></th>" 
  calStr+="<th><font color='white' size='3'>수</font></th>" 
  calStr+="<th><font color='white' size='3'>목</font></th>" 
  calStr+="<th><font color='white' size='3'>금</font></th>" 
  calStr+="<th><font color='#99BDE4' size='3'>토</font></th>" 
  calStr+="</tr>"  

  var dayCount=1 

  calStr+="<tr bgcolor=white >" 

  for (var i=0;i<firstDay;i++) calStr+="<td> "  //공백 
  for (var i=0;i<monthDays[month];i++) 
  { 

  if(dayCount==nowd) { 
  calStr+="<td align=center bgcolor='#FFE4E1'><font size='3'><b>" // 오늘 날짜일때 배경색 지정,글자 진하게 

  } else { 

  calStr+="<td align=center><font size='3'>"  // 오늘 날짜가 아닐때 배경색 지정 
  } 

  calStr+="<a href=jabascript:void(0) onclick =document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'>" // 링크설정 

  calStr+=dayCount++  // 날짜 
  
  calStr+="</a>" 

  if(dayCount==nowd) { 

  calStr+="</b  >" // 오늘 날짜일때 글자 진하게 

  } 
  else { 
  calStr+=""  // 오늘 날짜가 글자 진하게 안함 
  } 
        calStr+="</font>" 
  if ((i+firstDay+1)%7==0&&(dayCount<monthDays[month]+1)) calStr+="<tr bgcolor=white>" 
  } 
  var totCells=firstDay+monthDays[month] 
  for (var i=0;i<(totCells>28?(totCells>35?42:35):28)-totCells;i++) calStr+="<td> " 
  calStr+="</table><BR>" 
  calendar.innerHTML=calStr 
    } 

</SCRIPT> 

</head>

<body id="target">

<a href="mem_upd1_1.jsp?puserid=<%=encValue%>" style="color: white; margin-left: 1600px">마이페이지</a>
<a href="mem_logout.jsp" style="color: white; margin-left: 1600px">로그아웃</a>
<SPAN ID=calendar STYLE="position:relative;"></SPAN> 
<script language="JavaScript" type="text/JavaScript"> 
showCalendar(nowd,nowm,nowy);
document.getElementById('target').className='march';
</script> 
   <div id="light" class="white_content">
            <a href = "javascript:void(0)" style="color: red; margin-left: 800px;"
                onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'" >닫기</a>
         
         <form action="diarySave.jsp?puserid=<%=encValue%>" method="post">
            <textarea placeholder="content" class="main_area" 
               name="memo" cols="125" rows="24" style="resize:none;"></textarea>
            <input type="submit" value="저장">      
         </form>
   </div>
   <div id="fade" class="black_overlay"></div>


</body>

</html>