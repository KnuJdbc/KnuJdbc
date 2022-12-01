<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동물 찾기</title>
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

<div style="text-align:center">
<font size="6">동물들의 정보</font>
<br><br>
<form action="./MainPage.jsp">
<button type="submit">메인으로</button>
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

String sql = "SELECT A.Name AS 이름, A.SN_ID AS 학명, I.IUCN_Status AS IUCN위기레벨등급 " +
			 "FROM ANIMAL A, IUCN_STATUS I " +
			 "WHERE A.IUCN_ID = I.IUCN_Status_ID " +
			 "ORDER BY A.Name";

try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,user,pass);
	stmt = conn.createStatement();
	
	rs = stmt.executeQuery(sql);
	ResultSetMetaData rsmd = rs.getMetaData();
	int cnt = rsmd.getColumnCount();
	
	out.println("<table border=\"1\" style=\"margin-left: auto; margin-right: auto;\">");
	
	for(int i =1;i<=cnt;i++){
		out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	}

	while (rs.next()) {
		out.println("<tr class=\"clickable-row\" data-href=\"./deep_info.jsp?name=" + rs.getString(1) + "\">");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("<td>"+rs.getString(3)+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
	
	rs.close();
	stmt.close();
	conn.close();
} catch (SQLException ex2) {
	//System.err.println("sql error = " + ex2.getMessage());
	//System.exit(1);
}
%>
</body>
</html>