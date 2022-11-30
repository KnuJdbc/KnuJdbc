<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통계</title>
</head>
<body>
<div style="text-align:center">
<font size="6">동물들의 통계</font>
<br><br>
<form action="./MainPage.jsp">
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

String sql = "SELECT F.A_Food AS 식성, AVG(A.Length) AS 평균길이, AVG(A.Weight) AS 평균무게, COUNT(*) AS 수 "
			+ "FROM ANI_FOOD F, ANIMAL A "
			+ "WHERE F.A_ID = A.Animal_ID "
			+ "GROUP BY F.A_Food";

try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,user,pass);
	stmt = conn.createStatement();
	
	rs = stmt.executeQuery(sql);
	ResultSetMetaData rsmd = rs.getMetaData();
	int cnt = rsmd.getColumnCount();
	
	out.println("<p style=\"text-align:center\">동물 식성 관련 통계</p>");
	out.println("<table border=\"1\" style=\"margin-left: auto; margin-right: auto;\">");
	
	for(int i =1;i<=cnt;i++){
		out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	}
	double d;
	
	while (rs.next()) {
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		d = Math.round(rs.getFloat(2) * 100.0)/100.0;
		out.println("<td>"+ d +"</td>");
		d = Math.round(rs.getFloat(3) * 100.0)/100.0;
		out.println("<td>"+ d +"</td>");
		out.println("<td>"+rs.getInt(4)+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
	
	
	sql = "SELECT IUCN_Status AS IUCN위기레벨등급, Num_Ani AS 수 "
			+ "FROM ( SELECT IUCN_ID, COUNT(*) Num_Ani FROM ANIMAL GROUP BY IUCN_ID) A, "
			+ "IUCN_STATUS B WHERE A.IUCN_ID = B.IUCN_Status_ID";
	
	rs = stmt.executeQuery(sql);
	rsmd = rs.getMetaData();
	cnt = rsmd.getColumnCount();
	
	out.println("<br>");
	out.println("<p style=\"text-align:center\">IUCN별 관련 통계</p>");
	out.println("<table border=\"1\" style=\"margin-left: auto; margin-right: auto;\">");
	
	for(int i =1;i<=cnt;i++){
		out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	}
	
	while (rs.next()) {
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("<td>"+rs.getInt(2)+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
	
	
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