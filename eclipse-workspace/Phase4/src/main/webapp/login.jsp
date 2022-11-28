<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*"%>
     <jsp:useBean id="m" class="mpackage.Member" scope="request"/>
<jsp:useBean id="joinMember" class="mpackage.joinMember" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

  <%
  
String ID =request.getParameter("ID");
String pw=request.getParameter("pw");
int check = joinMember.login(ID, pw);

if(check == -1 ){ %>
<p> 등록 되어있지 않은 회원 입니다. </p>
<button onclick="newPage()">회원 가입 </button>

  <script>
    function newPage() {
    	  window.location.href = 'join.jsp'
	

    }  </script>
		
<% 	
return; } 
	%>



<form name="user_form" method=post action="edit.jsp" onsubmit='info_chk()'>
<input type=hidden name="ID" value="<%=ID%>">
<input type=hidden name="pw" value="<%=pw%>">
<input type='submit' value='회원 정보 수정'>
 

</form>
<button onclick="newPage()">회원탈퇴 </button>
 <script>
    function newPage() {
    	
    	document.forms["user_form"].action='Delete.jsp';
    	document.forms["user_form"].submit();
    	//window.location.href = 'Delete.jsp'
			

    }  
  </script>


</body>
</html>