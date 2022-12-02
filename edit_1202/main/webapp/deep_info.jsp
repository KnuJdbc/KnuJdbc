<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta name="generator" content="">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
<link href="css/style_image.css" rel="stylesheet">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="css/style_table.css">

	<link rel="stylesheet" href="css/style_header.css">
<link href="https://fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto:200,300,400,500,600,700" rel="stylesheet">

<style>

@font-face {
    font-family: 'NanumSquareNeo-Variable';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

table {
  border: 1px #a39485 solid;
  font-size: .9em;
  box-shadow: 0 2px 5px rgba(0,0,0,.25);
  width: 100%;
  border-collapse: collapse;
  border-radius: 5px;
  overflow: hidden;
}

th {
  text-align: left;
  
}
  
thead {
  font-weight: bold;
  color: #fff;
  background: #73685d;
}
  
 td, th {
  padding: 1em .5em;
  vertical-align: middle;
}
  
 td {
  border-bottom: 1px solid rgba(0,0,0,.1);
  background: #fff;
}

a {
  color: #73685d;
}
  
 @media all and (max-width: 768px) {
    
  table, thead, tbody, th, td, tr {
    display: block;
  }
  
  th {
    text-align: right;
  }
  
  table {
    position: relative; 
    padding-bottom: 0;
    border: none;
    box-shadow: 0 0 10px rgba(0,0,0,.2);
  }
  
  thead {
    float: left;
    white-space: nowrap;
  }
  
  tbody {
    overflow-x: auto;
    overflow-y: hidden;
    position: relative;
    white-space: nowrap;
  }
  
  tr {
    display: inline-block;
    vertical-align: top;
  }
  
  th {
    border-bottom: 1px solid #a39485;
  }
  
  td {
    border-bottom: 1px solid #e5e5e5;
  }
  
  
  }
</style>
<meta charset="UTF-8">
<title>선택한 동물의 자세한 정보</title>
</head>
<body>

<section class="ftco-section">
		
		<div class="container">
			<nav class="navbar navbar-expand-lg ftco_navbar ftco-navbar-light" id="ftco-navbar">
		    <div class="container">
		    	<a class="navbar-brand" href="index.html">ALL Endangerd Animal</a> 
		    	<div class="social-media order-lg-last">
		    		<p class="mb-0 d-flex">
		    			<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-facebook"><i class="sr-only">Facebook</i></span></a>
		    			<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-twitter"><i class="sr-only">Twitter</i></span></a>
		    			<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-instagram"><i class="sr-only">Instagram</i></span></a>
		    			<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-dribbble"><i class="sr-only">Dribbble</i></span></a>
		    		</p>
	        </div>
		      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
		        <span class="fa fa-bars"></span> Menu
		      </button>
		      <div class="collapse navbar-collapse" id="ftco-nav">
		        <ul class="navbar-nav ml-auto mr-md-3">
		        	<li class="nav-item active"><a href="./after_login.jsp" class="nav-link">Home</a></li>
		        <!-- <li class="nav-item"><a href="#" class="nav-link">All ANLIMALS</a></li> -->	
		         	<li class="nav-item active"><a href="./search.jsp" class="nav-link">All Animal</a></li>
		        	<li class="nav-item"><a href="./search_img.jsp" class="nav-link">Images</a></li>
		        	<li class="nav-item"><a href="./statistics.jsp" class="nav-link">Statistics</a></li>
		          <li class="nav-item"><a href="./get_info.html" class="nav-link">Search</a></li>
		        </ul>
		      </div>
		    </div>
		  </nav>
    <!-- END nav -->
  </div>

	</section>
<header class="item header margin-top-0">

<div class="wrapper">
	<nav role="navigation" class="navbar navbar-white navbar-embossed navbar-lg navbar-fixed-top">
	<div class="container">
	
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center">
				<div class="text-pageheader">
					<div class="subtext-image" data-scrollreveal="enter bottom over 1.7s after 0.1s">
						 Information
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</header>
<section class="item content">
<div class="container toparea">
	<div class="underlined-title">
		<div class="editContent">
			<h1 class="text-center latestitems">info</h1>
		</div>
		<div class="wow-hr type_short">
			<span class="wow-hr-h">
			<i class="fa fa-star"></i>
			<i class="fa fa-star"></i>
			<i class="fa fa-star"></i>
			</span>
		</div>
	</div>
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
	
	
	out.println("<table>");
	
	for(int i =1;i<=cnt;i++) {
		out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	}

	while (rs.next()) {
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
	
	
	out.println("<table>");
	
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
	

	out.println("<table>");
	
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
	

	out.println("<table>");
	
	for(int i =1;i<=cnt;i++) {
		out.println("</br><th>"+rsmd.getColumnName(i)+"</th>");
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
	
	
	out.println("<table>");
	
	for(int i =1;i<=cnt;i++) {
		out.println("</br><th>"+rsmd.getColumnName(i)+"</th>");
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
	
	
	out.println("<table>");
	
	for(int i =1;i<=cnt;i++) {
		out.println("</br><th>"+rsmd.getColumnName(i)+"</th>");
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
	
	
	out.println("<table>");
	
	for(int i =1;i<=cnt;i++) {
		out.println("</br><th>"+rsmd.getColumnName(i)+"</th>");
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
	
	
	out.println("<table>");
	
	for(int i =1;i<=cnt;i++) {
		out.println("</br><th>"+rsmd.getColumnName(i)+"</th>");
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
		
		out.println("</br><table> 기사");
		
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


</div>
</section>
</body>
</html>