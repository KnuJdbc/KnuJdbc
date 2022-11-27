<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ManageAccount</title>
</head>
<body>
<h1>회원 관리</h1>
<%
	String serverIP = "localhost";
	String strSID = "orcl";
	String portNum = "1521";
	String user = "anumalDB";
	String pass = "ajdajd55";
	String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
	Connection conn = null;
	PreparedStatement ps;
	ResultSet rs;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,user,pass);
	String query = "SELECT Phone_Number, Name, Donation FROM ACCOUNT ORDER BY Donation";
	ps = conn.prepareStatement(query);
	rs = ps.executeQuery();
%>
<h3>회원 검색</h3>
	<form name = "form" action = "SearchAccount.jsp" method = "get">
		<input type="text" name="name"><br/>
		<input type="reset" value="Reset">
		<input type="submit" value="Submit"><br>	
	</form>
	<br>
<h3>회원 목록</h3>
<%
	out.println("<table border=\"1\">");
	ResultSetMetaData rsmd = rs.getMetaData();
	int cnt = rsmd.getColumnCount();
	for(int i =1;i<=cnt;i++){
		out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	}
	while(rs.next()){
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("<td>"+rs.getString(3)+"</td>");
		out.println("</tr>");		
	}
	out.println("</table>");
	rs.close();
	ps.close();
	conn.close();
%>
</body>
</html>