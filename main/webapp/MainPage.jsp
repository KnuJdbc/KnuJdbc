<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Phase - 4</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	jQuery(document).ready(function($) {
		$(".clickable-row").click(function() {
			window.location = $(this).data("href");
		});
	});
</script>
</head>
<body>
<%
	String ID =request.getParameter("ID");
	String pw =request.getParameter("pw");
	
%>

<div style="margin:30% auto; text-align:center">
<font size="5">멸종 위기종</font>

<br><br>
<form action="./search.jsp">
<button type="submit">동물 보기</button>
</form>
<br>

<form action="./get_info.html">
<button type="submit">동물 검색</button>
</form>
<br>

<form action="./statistics.jsp">
<button type="submit">동물 통계</button>
</form>
</div>
<div style="margin:30% auto; text-align:center">
<font size="5">내 정보</font>

<br><br>
<form name="user_form" method=post action="edit.jsp" onsubmit='info_chk()'>
<input type=hidden name="ID" value="<%=ID%>">
<input type=hidden name="pw" value="<%=pw%>">
<input type='submit' value='회원 정보 수정'>
 <br>
 <br>
</form>
<button onclick="newPage()">회원탈퇴 </button>
 <script>
    function newPage() {
    	document.forms["user_form"].action='Delete.jsp';
    	document.forms["user_form"].submit();
    	//window.location.href = 'Delete.jsp'
    }  
  </script>
</form>
</body>
</html>