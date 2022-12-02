<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<jsp:useBean id="randomCreate" class="mpackage.randomCreate" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동물 퀴즈</title>
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
Statement stmt;
PreparedStatement pstmt;
ResultSet rs;
int ani_cnt = 0;
int answer = -1;

String sql = "SELECT COUNT(*) FROM ANIMAL";

try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,user,pass);
	stmt = conn.createStatement();
	
	rs = stmt.executeQuery(sql);
	
	while(rs.next()) {
		ani_cnt = rs.getInt(1);
	}

	int n[] = randomCreate.rand_num(ani_cnt + 1);
	
	answer = (int)(Math.random() * 5);
	
	String[] name = new String[5];
	
	
	sql = "SELECT name " +
		  "FROM ANIMAL " + 
		  "WHERE animal_id in (" + n[0] + ", " + n[1] + ", " + n[2] + ", " + n[3] + ", " + n[4] + ")";
	
	rs = stmt.executeQuery(sql);
	
	int i = 0;
	while(rs.next()) {
		name[i++] = rs.getString(1);
	}
	
	out.println("<div style=\"text-align:center; border-bottom: 1px solid black\">");
	
	sql = "SELECT I.IMG " + 
		  "FROM ANIMAL A, ANI_IMG I " +
		  "WHERE A.name = ? AND A.animal_id = I.A_ID";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name[answer]);
	rs = pstmt.executeQuery();
	
	while(rs.next()) {
		out.println("<img src=\"" + rs.getString(1) +"\" width=300 height=300></img>");
	}
	
	
	sql = "SELECT DISTINCT A.Length AS 길이, A.Weight AS 무게, A.IUCN_ID AS IUCN위기레벨, I.IUCN_Status AS IUCN위기레벨등급 " +
			 "FROM ANIMAL A, IUCN_STATUS I, TAXONOMY T " +
			 "WHERE A.Name = ? AND A.IUCN_ID = I.IUCN_Status_ID";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name[answer]);
	rs = pstmt.executeQuery();
	ResultSetMetaData rsmd = rs.getMetaData();
	int cnt = rsmd.getColumnCount();
	
	out.println("<p style=\"text-align:center\">기본 정보</p>");
	out.println("<table border=\"1\" style=\"margin-left: auto; margin-right: auto;\">");
	
	for(i =1;i<=cnt;i++) {
		out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	}
	
	while(rs.next()) {
		out.println("<tr>");
		out.println("<td>"+rs.getFloat(1)+"</td>");
		out.println("<td>"+rs.getFloat(2)+"</td>");
		out.println("<td>"+rs.getInt(3)+"</td>");
		out.println("<td>"+rs.getString(4)+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
	
	
	sql = "SELECT F.A_Food AS 식성 " +
			"FROM ANI_FOOD F, ANIMAL A " +
			"WHERE A.Name = ? and F.A_ID = A.Animal_ID";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name[answer]);
	rs = pstmt.executeQuery();
	rsmd = rs.getMetaData();
	cnt = rsmd.getColumnCount();
	
	out.println("<p style=\"text-align:center\">식성</p>");
	out.println("<table border=\"1\" style=\"margin-left: auto; margin-right: auto;\">");
	
	for(i =1;i<=cnt;i++) {
		out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	}
	
	while (rs.next()) {
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
	
	
	sql = "SELECT C.A_Continent AS 대륙 " +
			"FROM ANI_CONTINENT C, ANIMAL A " +
			"WHERE A.Name = ? and C.A_ID = A.Animal_ID";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name[answer]);
	rs = pstmt.executeQuery();
	rsmd = rs.getMetaData();
	cnt = rsmd.getColumnCount();
	
	out.println("<p style=\"text-align:center\">대륙</p>");
	out.println("<table border=\"1\" style=\"margin-left: auto; margin-right: auto;\">");
	
	for(i = 1;i<=cnt;i++) {
		out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	}
	
	while (rs.next()) {
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
	
	
	sql = "SELECT H.A_Habitats AS 서식지 " +
			"FROM ANI_HABITATS H, ANIMAL A " +
			"WHERE A.Name = ? and H.A_ID = A.Animal_ID";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name[answer]);
	rs = pstmt.executeQuery();
	rsmd = rs.getMetaData();
	cnt = rsmd.getColumnCount();
	
	out.println("<p style=\"text-align:center\">서식지</p>");
	out.println("<table border=\"1\" style=\"margin-left: auto; margin-right: auto;\">");
	
	for(i =1;i<=cnt;i++) {
		out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	}
	
	while (rs.next()) {
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
	
	out.println("</div>");
	
	out.println("<form method=\"get\" action=\"is_answer.jsp\">");
	out.println("<p>동물 Quiz</p>");
	out.println("<input type=hidden name=\"answer\" value=\""+ name[answer] +"\">");
	
	out.println("<label><input type=\"radio\" name=\"select\" value=\"" + name[0] + "\" checked>" + name[0] + "</label>");
	out.println("<label><input type=\"radio\" name=\"select\" value=\"" + name[1] + "\">" + name[1] + "</label>");
	out.println("<label><input type=\"radio\" name=\"select\" value=\"" + name[2] + "\">" + name[2] + "</label>");
	out.println("<label><input type=\"radio\" name=\"select\" value=\"" + name[3] + "\">" + name[3] + "</label>");
	out.println("<label><input type=\"radio\" name=\"select\" value=\"" + name[4] + "\">" + name[4] + "</label>");
	out.println("<p><input type=\"submit\" value=\"정답을 선택 후 클릭해주세요\"></p>");
	out.println("</form>");
	
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