<%@ page language="java" import ="java.sql.*" import = "java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html id="all_background">
<head>
<title>MyDairy</title>

<meta charset="utf-8">


<script language="javaScript">
   function change_background(that){
  that.style.backgroundImage ="url(image1.jpg)";
   }
   function change2_background(that){
  that.style.backgroundImage ="url(image3.jpg)";
   }
   
 </script>
 
 
</head>


<style type="text/css">
/* 화면 전환 클래스 */
      .black_overlay {
   display: none;
   position: absolute; /* css 중앙 정렬  */
   top: 0%;
   left: 0%;
   width: 100%;
   height: 1500px;
   background-color: black;
   z-index: 1001; /* z 축 같은건가? */
   -moz-opacity: 0.8;
   opacity: .80; /* 투명도 */
   filter: alpha(opacity=80);
}
        .white_content {
   display: none;
   position: absolute;
   top: 25%;
   left: 15%;
   width: 70%;
   height: 70%;
   padding: 16px;
   border: 16px solid orange;
   background-color: white;
   z-index: 1002;
   overflow: auto;
}


textarea { /* 메인 부분 효과 */
   margin-left: 10px;
   font-family: HY엽서L;
   background-color: #ECF8E0;
   border: 5px groove #3ff1b5;
}

</style>
fun
<body>
            <!-- 일기쓰기를 누르면 나타나는 창 -->
            <p> <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">효과보기</a></p> 
            <div id="light" class="white_content">
            <textarea placeholder="content" class="main_area"
               name="content container" cols="150" rows="50"></textarea>
               
               <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">닫기</a></div>
               
               <div id="fade" class="black_overlay"></div>
</body>
</html>