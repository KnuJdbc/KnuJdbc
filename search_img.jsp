<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image_and_Name</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	jQuery(document).ready(function($) {
		$(".clickable").click(function() {
			window.location = $(this).data("href");
		});
	});
</script>
</head>
<body>

<div style="text-align:center">
<font size="6">동물 with 이미지</font>
<br><br>
<form action="./main.html">
<button type="submit">메인으로</button>
</form>
<br>
<form action="./search.jsp">
<button type="submit">모든 동물</button>
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
<br>

<%
String serverIP = "localhost";
String strSID = "orcl";
String portNum = "1521";
String user = "university";
String pass = "comp322";
String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;

Connection conn = null;
Statement stmt;
ResultSet rs;

String sql = "SELECT A.Name, I.IMG " +
			 "FROM ANIMAL A, ANI_IMG I " +
			 "WHERE A.Animal_ID = I.A_ID " +
			 "ORDER BY A.Name";

try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,user,pass);
	stmt = conn.createStatement();
	
	rs = stmt.executeQuery(sql);
	
	int i = 0;
	
	while (rs.next()) {
		out.println("<div class=\"clickable\" data-href=\"./deep_info.jsp?name=" + rs.getString(1) + "\" style=\"text-align:center; border-bottom: 1px solid black\">");
		out.println("<img src=\"" + rs.getString(2) +"\" width=300 height=300></img>");
		out.println("<p style=\"text-align:center\">"+rs.getString(1)+"</p>");
		out.println("</div>");
		out.println("<br><br>");
		i++;
	}
	
	rs.close();
	stmt.close();
	conn.close();
} catch (SQLException ex2) {
	System.err.println("sql error = " + ex2.getMessage());
	System.exit(1);
}
%>
</body>
</html>