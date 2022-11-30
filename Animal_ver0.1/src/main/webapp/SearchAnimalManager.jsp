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
%>
<h2>관리 동물 검색</h2>
<h3>검색 결과</h3>
<%
	StringBuffer sb = new StringBuffer();
	sb.append("SELECT admin.id, admin.name, COUNT (*) as num_ani ");
	sb.append("FROM ((admin JOIN manages ON id = ad_id ) JOIN animal ON a_id = animal_id) ");
	sb.append("GROUP BY admin.id, admin.name ");
	sb.append("HAVING admin.id = ? ");
		
	String sql = sb.toString();
	ps = conn.prepareStatement(sql);
	
	String id = request.getParameter("manager_ID");
	
	ps.setString(1, id);			
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
		out.println("<td>"+rs.getInt(3)+"</td>");
		out.println("</tr>");		
	}	
	out.println("</table>");
%>
</body>
</html>