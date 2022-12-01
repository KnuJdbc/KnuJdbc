<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>회원 관리</h1>
<%
	String serverIP = "localhost";
	String strSID = "orcl";
	String portNum = "1521";
	String user = "university";
	String pass = "comp322";
	String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
	Connection conn = null;
	PreparedStatement ps;
	ResultSet rs;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,user,pass);
	// String query = "SELECT Phone_Number, Name, Donation FROM ACCOUNT ORDER BY Donation";
	// ps = conn.prepareStatement(query);
	// rs = ps.executeQuery();
%>
<h2>회원 이름 검색</h2>
<h3>검색 결과</h3>
<%
	StringBuffer sb = new StringBuffer();
	sb.append("SELECT Phone_Number, Name, Donation ");
	sb.append("FROM ACCOUNT ");
	sb.append("WHERE Name = ?");
	String sql = sb.toString();
	ps = conn.prepareStatement(sql);
		 
	String name = request.getParameter("name");
	
	ps.setString(1, name);
	
	rs = ps.executeQuery();
	
	out.println("<table border=\"1\">");
	ResultSetMetaData rsmd = rs.getMetaData();
	int cnt = rsmd.getColumnCount();
	for(int i = 1; i<=cnt; i++) {
		out.println("<th>" + rsmd.getColumnName(i) + "</th>");
	}
	while(rs.next()) {
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("<td>"+rs.getString(3)+"</td>");
		out.println("</tr>");		
	}	
	out.println("</table>");
%>
<br>
<h3>열람 정보</h3>
<%
	sb = new StringBuffer();
	sb.append("SELECT ACCOUNT.Name, ACCOUNT.ID, WATCHING.Favorite, ANIMAL.Name ANIMAL_Name, ANIMAL.Animal_ID ");
	sb.append("FROM ACCOUNT, WATCHING, ANIMAL ");
	sb.append("WHERE AC_ID = ID AND A_ID = Animal_ID AND ACCOUNT.Name = ? ORDER BY Animal_ID");
	sql = sb.toString();
	ps = conn.prepareStatement(sql);
	
	ps.setString(1, name);
	
	rs = ps.executeQuery();
	
	out.println("<table border=\"1\">");
	rsmd = rs.getMetaData();
	cnt = rsmd.getColumnCount();
	for(int i = 1; i<=cnt; i++) {
		out.println("<th>" + rsmd.getColumnName(i) + "</th>");
	}
	while(rs.next()) {
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("<td>"+rs.getString(3)+"</td>");
		out.println("<td>"+rs.getString(4)+"</td>");
		out.println("<td>"+rs.getString(5)+"</td>");
		out.println("</tr>");		
	}	
	out.println("</table>");
%>
</body>
</html>