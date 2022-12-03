<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<jsp:useBean id="Like" class="mpackage.Like" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String A_ID = request.getParameter("A_ID");
	String Name = request.getParameter("Name");	
	Object id = session.getAttribute("id");
	
	Like.change(Integer.valueOf(A_ID), String.valueOf(id));
	
	out.println("<script type=\"text/javascript\">");
	out.println("	location.href=\"deep_info.jsp?name="+ Name + "\";");
	out.println("</script>");
%>

</body>
</html>