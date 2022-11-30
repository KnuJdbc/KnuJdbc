<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="m" class="mpackage.Member" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<form action="login.jsp">
<table>
<tr>
<td> <label for="ID">ID</label> </td>
<td> <input type="text" id="ID" name="ID"
			size="20" placeholder=""></td>
			</tr>
			
			<tr>
			
			<td> <label for="pw">PW</label> </td>
<td> <input type="password" id="pw" name="pw"
			size="20" placeholder=""></td>
			</tr>





</table>
<input type="submit" value="LOGIN"> 
</form>

<button onclick="newPage()">회원가입 </button>

  <script>
    function newPage() {
    	  window.location.href = 'join.jsp'
	

    }  
  </script>



</body>
</html>