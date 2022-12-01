<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<jsp:useBean id="Like" class="mpackage.Like" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선택한 동물의 자세한 정보</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function() {
	$("#btn1").click( function() {
		if ($("#heart1").text() == '♥') {
			$("#heart1").text('♡');
		}
		else {
			$("#heart1").text('♥');
		}
	});
});
</script>

<style>
.heart {
	color: red;
}
.btn {
	border: none;
	background-color: inherit;
	font-size: 2em;
}
</style>

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
PreparedStatement pstmt;
ResultSet rs;

String animalName = request.getParameter("name");
// 여기부터
String sql = "SELECT I.img " +
			 "FROM ANIMAL A, ANI_IMG I " +
			 "WHERE A.Name = ? AND A.Animal_ID = I.A_ID";

try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,user,pass);
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, animalName);
	rs = pstmt.executeQuery();

	while (rs.next()) {
		out.println("<br>");
		out.println("<div style=\"text-align:center\">");
		out.println("<img src=\"" + rs.getString(1) +"\" width=300 height=300 style=\"text-align:center\"></img>");
		out.println("</div>");
		out.println("<br>");
	}

	
	sql = "SELECT DISTINCT A.Animal_ID AS ID, A.Name AS 이름, A.SN_ID AS 학명, A.Length AS 길이, " +
			 "A.Weight AS 무게, A.IUCN_ID AS IUCN위기레벨, I.IUCN_Status AS IUCN위기레벨등급 " +
			 "FROM ANIMAL A, IUCN_STATUS I, TAXONOMY T " +
			 "WHERE A.Name = ? AND A.IUCN_ID = I.IUCN_Status_ID";
	// 아마 여기까지?
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, animalName);
	rs = pstmt.executeQuery();
	ResultSetMetaData rsmd = rs.getMetaData();
	int cnt = rsmd.getColumnCount();

	while (rs.next()) {
		%> 
		
		<form action="like_process.jsp">
		<%
		int k = Like.isExist(rs.getInt(1), "second");

		if (k == 1) {
		%><input type=hidden name="A_ID" value="<%=rs.getInt(1)%>">
		<input type=hidden name="Name" value="<%=rs.getString(2)%>">
		<button id="btn1" class="btn" type="submit"><span id="heart1" class="heart">♥</span></button><%	
		}
		else {
		%><input type=hidden name="A_ID" value="<%=rs.getInt(1)%>">
		<input type=hidden name="Name" value="<%=rs.getString(2)%>">
		<button id="btn1" class="btn" type="submit"><span id="heart1" class="heart">♡</span></button><%
		}
		%>
		</form>
		
		<%
		out.println("<p style=\"text-align:center\">기본 정보</p>");
		out.println("<table border=\"1\" style=\"margin-left: auto; margin-right: auto;\">");
		
		for(int i =1;i<=cnt;i++) {
			out.println("<th>"+rsmd.getColumnName(i)+"</th>");
		}
		
		out.println("<tr>");
		out.println("<td>"+rs.getInt(1)+"</td>");
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("<td>"+rs.getString(3)+"</td>");
		out.println("<td>"+rs.getFloat(4)+"</td>");
		out.println("<td>"+rs.getFloat(5)+"</td>");
		out.println("<td>"+rs.getInt(6)+"</td>");
		out.println("<td>"+rs.getString(7)+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
	
	
	sql = "SELECT T.Kingdom_Name AS Kingdom, T.Phylum_Name AS Phylum, T.Class_Name AS Class, " +
			"T.Family_Name AS Family, T.Genus_Name AS Genus, T.Species_Name AS Species " +
			"FROM ANIMAL A, TAXONOMY T " +
			"WHERE A.Name = ? AND A.SN_ID = T.Scientific_Name";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, animalName);
	rs = pstmt.executeQuery();
	rsmd = rs.getMetaData();
	cnt = rsmd.getColumnCount();
	
	out.println("<p style=\"text-align:center\">TAXONOMY</p>");
	out.println("<table border=\"1\" style=\"margin-left: auto; margin-right: auto;\">");
	
	for(int i =1;i<=cnt;i++) {
		out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	}
	
	while (rs.next()) {
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("<td>"+rs.getString(3)+"</td>");
		out.println("<td>"+rs.getString(4)+"</td>");
		out.println("<td>"+rs.getString(5)+"</td>");
		out.println("<td>"+rs.getString(6)+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
	
	
	sql = "SELECT C.A_Continent AS 대륙 " +
			"FROM ANI_CONTINENT C, ANIMAL A " +
			"WHERE A.Name = ? and C.A_ID = A.Animal_ID";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, animalName);
	rs = pstmt.executeQuery();
	rsmd = rs.getMetaData();
	cnt = rsmd.getColumnCount();
	
	out.println("<p style=\"text-align:center\">대륙</p>");
	out.println("<table border=\"1\" style=\"margin-left: auto; margin-right: auto;\">");
	
	for(int i =1;i<=cnt;i++) {
		out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	}
	
	while (rs.next()) {
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
	
	
	sql = "SELECT U.A_Use AS 사용처 " +
			"FROM ANI_USE U, ANIMAL A " +
			"WHERE A.Name = ? and U.A_ID = A.Animal_ID";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, animalName);
	rs = pstmt.executeQuery();
	rsmd = rs.getMetaData();
	cnt = rsmd.getColumnCount();
	
	out.println("<p style=\"text-align:center\">사용처</p>");
	out.println("<table border=\"1\" style=\"margin-left: auto; margin-right: auto;\">");
	
	for(int i =1;i<=cnt;i++) {
		out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	}
	
	while (rs.next()) {
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
	
	
	sql = "SELECT F.A_Food AS 식성 " +
			"FROM ANI_FOOD F, ANIMAL A " +
			"WHERE A.Name = ? and F.A_ID = A.Animal_ID";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, animalName);
	rs = pstmt.executeQuery();
	rsmd = rs.getMetaData();
	cnt = rsmd.getColumnCount();
	
	out.println("<p style=\"text-align:center\">식성</p>");
	out.println("<table border=\"1\" style=\"margin-left: auto; margin-right: auto;\">");
	
	for(int i =1;i<=cnt;i++) {
		out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	}
	
	while (rs.next()) {
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
	
	
	sql = "SELECT T.A_Threats AS 위협 " +
			"FROM ANI_THREATS T, ANIMAL A " +
			"WHERE A.Name = ? and T.A_ID = A.Animal_ID";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, animalName);
	rs = pstmt.executeQuery();
	rsmd = rs.getMetaData();
	cnt = rsmd.getColumnCount();
	
	out.println("<p style=\"text-align:center\">위협</p>");
	out.println("<table border=\"1\" style=\"margin-left: auto; margin-right: auto;\">");
	
	for(int i =1;i<=cnt;i++) {
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
	pstmt.setString(1, animalName);
	rs = pstmt.executeQuery();
	rsmd = rs.getMetaData();
	cnt = rsmd.getColumnCount();
	
	out.println("<p style=\"text-align:center\">서식지</p>");
	out.println("<table border=\"1\" style=\"margin-left: auto; margin-right: auto;\">");
	
	for(int i =1;i<=cnt;i++) {
		out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	}
	
	while (rs.next()) {
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
	
	
	sql = "SELECT R.A_Region AS 지역 " +
			"FROM ANI_REGION R, ANIMAL A " +
			"WHERE A.Name = ? and R.A_ID = A.Animal_ID";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, animalName);
	rs = pstmt.executeQuery();
	rsmd = rs.getMetaData();
	cnt = rsmd.getColumnCount();
	
	out.println("<p style=\"text-align:center\">지역</p>");
	out.println("<table border=\"1\" style=\"margin-left: auto; margin-right: auto;\">");
	
	for(int i =1;i<=cnt;i++) {
		out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	}
	
	while (rs.next()) {
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
	
	
	sql = "SELECT A.Name AS 이름, R.URL AS link " +
			"FROM ANIMAL A, ABOUT B, ARTICLES R " +
			"WHERE EXISTS (SELECT * FROM ABOUT WHERE Animal_ID = A_ID) " +
			"AND B.URL_ID = R.URL_ID AND A.Animal_ID = B.A_ID AND A.Name = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, animalName);
	rs = pstmt.executeQuery();
	rsmd = rs.getMetaData();
	cnt = rsmd.getColumnCount();
	
	if (rs.isBeforeFirst()) {
		out.println("<p style=\"text-align:center\">article</p>");
		out.println("<table border=\"1\" style=\"margin-left: auto; margin-right: auto;\">");
		
		for(int i =1;i<=cnt;i++) {
			out.println("<th>"+rsmd.getColumnName(i)+"</th>");
		}
		
		while (rs.next()) {
			out.println("<tr>");
			out.println("<td>"+rs.getString(1)+"</td>");
			out.println("<td>"+rs.getURL(2)+"</td>");
			out.println("</tr>");
			out.println("</table>");
		}
	}
	else {
		out.println("</table>");
		out.println("<p style=\"text-align:center\">해당 동물에 대한 기사가 없습니다.</p>");
	}
	
	rs.close();
	pstmt.close();
	conn.close();
} catch (SQLException ex2) {
	//System.err.println("sql error = " + ex2.getMessage());
	//System.exit(1);
}
%>
<div style="text-align:center">
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
</body>
</html>