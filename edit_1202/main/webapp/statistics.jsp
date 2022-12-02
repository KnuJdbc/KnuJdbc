<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
<link href="css/style_image.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto:200,300,400,500,600,700" rel="stylesheet">

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
<title>통계</title>
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
		         	<li class="nav-item"><a href="./search.jsp" class="nav-link">All Animal</a></li>
		        	<li class="nav-item"><a href="./search_img.jsp" class="nav-link">Images</a></li>
		        	<li class="nav-item active"><a href="./statistics.jsp" class="nav-link">Statistics</a></li>
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
						Statistics
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
			<h1 class="text-center latestitems">Statistics</h1>
		</div>
		<div class="wow-hr type_short">
			<span class="wow-hr-h">
			<i class="fa fa-star"></i>
			<i class="fa fa-star"></i>
			<i class="fa fa-star"></i>
			</span>
		</div>
	</div>


<!-- 
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
<br> -->

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
	out.println("<table>");
	
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
	out.println("<table>");
	
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
	//System.err.println("sql error = " + ex2.getMessage());
//	System.exit(1);
}
%>

</div>
	<script src="js/jquery2.min.js"></script>
  <script src="js/popper2.js"></script>
  <script src="js/bootstrap2.min.js"></script>
  <script src="js/main2.js"></script>

</section>
</body>
</html>