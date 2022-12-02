<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정답?</title>
</head>
<body>

<%
	String answer = request.getParameter("answer");
	String select = request.getParameter("select");
	
	if (answer.equals(select)) {
		out.println("<h1>정답입니다!</h1>");
	}
	else {
		out.println("<h1>틀렸습니다</h1>");
		out.println("<h3>정답 : " + answer + "</h3>");
	}
%>
<form action="./Animal_quiz.jsp">
<button type="submit">다시 풀기</button>
</form>
</body>
</html>