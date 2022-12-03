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
String ID_1 =request.getParameter("ID");
String pw_1=request.getParameter("pw");
out.println("ID: " + ID_1 + "<br>");
out.println("나이: " + pw_1 + "<br>");
int check = joinMember.login(ID_1, pw_1);

if(check == -1 ){ %>
<p> 등록 되어있지 않은 회원 입니다. </p>
<button onclick="newPage()">회원 가입 </button>

  <script>
    function newPage() {
    	  window.location.href = 'join.jsp'
	

    }  </script>
		
<% 	
return; } 
else if(check == 1) { %>
	<script>
	location.href="../admin/Admin.html";
	</script>
<%
}
else if(check == 0) { 
	session.setAttribute("id", ID_1); 
%>
	<script>
	location.href="after_login.jsp?ID=<%=ID_1%>+&pw=<%=pw_1%>";
	</script>
<%
}%>

</body>
</html>