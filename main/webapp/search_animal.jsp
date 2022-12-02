<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>








<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조건에 맞는 동물들</title>
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
<font size="6">검색한 동물 정보</font>
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
String SN = request.getParameter("SN");
String CNT = request.getParameter("CONTINENT");
String S_YEAR = request.getParameter("S_YEAR");
String E_YEAR = request.getParameter("E_YEAR");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String USE = request.getParameter("USE");



String temp = request.getParameter("num");
 int num = Integer.parseInt(temp);

try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,user,pass);
	ResultSetMetaData rsmd;
	String sql;
	int cnt;
	
	switch(num) {
	case 1:
		sql = "select name AS 이름, SN_ID AS 학명 " +
			  "from animal " +
			  "where SN_ID=( select Scientific_Name " + 
			  "                from TAXONOMY " +
			  "                where Scientific_Name= ?)";
		
	//	String SN = request.getParameter("SN");
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, SN);
		rs = pstmt.executeQuery();
		rsmd = rs.getMetaData();
		cnt = rsmd.getColumnCount();
		
		out.println("<table border=\"1\" style=\"margin-left: auto; margin-right: auto;\">");
		
		for(int i =1;i<=cnt;i++){
			out.println("<th>"+rsmd.getColumnName(i)+"</th>");
		}

		while (rs.next()) {
			out.println("<tr class=\"clickable-row\" data-href=\"./deep_info.jsp?name=" + rs.getString(1) + "\">");
			out.println("<td>"+rs.getString(1)+"</td>");
			out.println("<td>"+rs.getString(2)+"</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		break;
	case 2:
		sql = "SELECT name AS 이름, sn_id AS 학명 " +
				"from  ANIMAL " +
				"where  animal_id in (SELECT animal_id " +
				"                            from  ANI_CONTINENT " +
				"                            where a_id = animal_id " +
				"                            and a_continent= ?)";
			
		//	String CNT = request.getParameter("CONTINENT");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, CNT);
			rs = pstmt.executeQuery();
			rsmd = rs.getMetaData();
			cnt = rsmd.getColumnCount();
			
			out.println("<table border=\"1\" style=\"margin-left: auto; margin-right: auto;\">");
			
			for(int i =1;i<=cnt;i++){
				out.println("<th>"+rsmd.getColumnName(i)+"</th>");
			}

			while (rs.next()) {
				out.println("<tr class=\"clickable-row\" data-href=\"./deep_info.jsp?name=" + rs.getString(1) + "\">");
				out.println("<td>"+rs.getString(1)+"</td>");
				out.println("<td>"+rs.getString(2)+"</td>");
				out.println("</tr>");
			}
			out.println("</table>");
		break;
	case 3:
		sql = "SELECT A.Name AS 이름, A.IUCN_ID AS IUCN위기레벨 " +
				"FROM ANI_USE U, ANIMAL A " +
				"WHERE U.A_Use = ? and U.A_ID = A.Animal_ID";
			
		//	String USE = request.getParameter("USE");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, USE);
			rs = pstmt.executeQuery();
			rsmd = rs.getMetaData();
			cnt = rsmd.getColumnCount();
			
			out.println("<table border=\"1\" style=\"margin-left: auto; margin-right: auto;\">");
			
			for(int i =1;i<=cnt;i++){
				out.println("<th>"+rsmd.getColumnName(i)+"</th>");
			}

			while (rs.next()) {
				out.println("<tr class=\"clickable-row\" data-href=\"./deep_info.jsp?name=" + rs.getString(1) + "\">");
				out.println("<td>"+rs.getString(1)+"</td>");
				out.println("<td>"+rs.getString(2)+"</td>");
				out.println("</tr>");
			}
			out.println("</table>");
		break;
	case 4:
		sql = "select A.Name AS 이름, R.url AS link " +
				"from articles R, ABOUT B, ANIMAL A " +
				"where R.url_id in (select about.url_id " + 
				"                from about " +
				"                where record between ? and ? " +
				"                ) AND R.URL_ID = B.URL_ID AND B.A_ID = A.Animal_ID";
			
		//	String S_YEAR = request.getParameter("S_YEAR");
		//	String E_YEAR = request.getParameter("E_YEAR");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, S_YEAR);
			pstmt.setString(2, E_YEAR);
			rs = pstmt.executeQuery();
			rsmd = rs.getMetaData();
			cnt = rsmd.getColumnCount();
			
			out.println("<table border=\"1\" style=\"margin-left: auto; margin-right: auto;\">");
			
			for(int i =1;i<=cnt;i++){
				out.println("<th>"+rsmd.getColumnName(i)+"</th>");
			}

			while (rs.next()) {
				out.println("<tr class=\"clickable-row\" data-href=\"./deep_info.jsp?name=" + rs.getString(1) + "\">");
				out.println("<td>"+rs.getString(1)+"</td>");
				out.println("<td>"+rs.getString(2)+"</td>");
				out.println("</tr>");
			}
			out.println("</table>");
		break;
	}
	
	rs.close();
	pstmt.close();
	conn.close();
} catch (SQLException ex2) {
	//System.err.println("sql error = " + ex2.getMessage());
	//System.exit(1);
}

%>
</body>
</html>