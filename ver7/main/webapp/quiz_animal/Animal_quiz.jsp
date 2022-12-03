<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<jsp:useBean id="randomCreate" class="mpackage.randomCreate" scope="request"/>
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
  text-align: center;
  
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
<title>동물 퀴즈</title>
</head>
<body>

<section class="ftco-section">
		
		<div class="container">
			<nav class="navbar navbar-expand-lg ftco_navbar ftco-navbar-light" id="ftco-navbar">
		    <div class="container">
		    	<a class="navbar-brand" href="index.html">Endangerd Animal</a> 
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
		        	<li class="nav-item"><a href="../main/after_login.jsp" class="nav-link">Home</a></li>
		        <!-- <li class="nav-item"><a href="#" class="nav-link">All ANLIMALS</a></li> -->	
		         	<li class="nav-item"><a href="../search_animal/search.jsp" class="nav-link">All Animal</a></li>
		        	<li class="nav-item"><a href="../search_animal/search_img.jsp" class="nav-link">Images</a></li>
		        	<li class="nav-item"><a href="../search_animal/statistics.jsp" class="nav-link">Statistics</a></li>
		          <li class="nav-item"><a href="../search_animal/get_info.html" class="nav-link">Search</a></li>
		          <li class="nav-item active"><a href="./Animal_quiz.jsp" class="nav-link">Quiz</a></li>
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
			<h1 class="text-center latestitems">Animal QUIZ</h1>
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
	
	out.println("<div style=\"text-align:center\">");
	
	sql = "SELECT I.IMG " + 
		  "FROM ANIMAL A, ANI_IMG I " +
		  "WHERE A.name = ? AND A.animal_id = I.A_ID";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name[answer]);
	rs = pstmt.executeQuery();
	
	while(rs.next()) {
		out.println("<img src=\"" + rs.getString(1) +"\"></img>");
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
	out.println("<table>");
	
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
	
	out.println("<table>");
	
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
	
	out.println("<table>");
	
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
	
	out.println("<table>");
	
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
	out.println("<br>");
	
	out.println("<form method=\"get\" action=\"is_answer.jsp\">");
	out.println("<h1 class=\"text-center latestitems\">보기</h1>");
	out.println("<input type=hidden name=\"answer\" value=\""+ name[answer] +"\">");
	out.println("<div style=\"text-align:center\">");
	out.println("<div class=\"custom-control custom-radio\">" +
			  "<input type=\"radio\" id=\"customRadio1\" name=\"select\" class=\"custom-control-input\" value=\"" + name[0] + "\" checked>" +
	"<label class=\"custom-control-label\" for=\"customRadio1\">"+ name[0] + "</label>" +
	"</div>");
	out.println("<div class=\"custom-control custom-radio\">" +
			  "<input type=\"radio\" id=\"customRadio2\" name=\"select\" class=\"custom-control-input\" value=\"" + name[1] + "\">" +
	"<label class=\"custom-control-label\" for=\"customRadio2\">" + name[1] + "</label>" +
	"</div>");
	out.println("<div class=\"custom-control custom-radio\">" +
			  "<input type=\"radio\" id=\"customRadio3\" name=\"select\" class=\"custom-control-input\" value=\"" + name[2] + "\">" +
	"<label class=\"custom-control-label\" for=\"customRadio3\">" + name[2] + "</label>" +
	"</div>");
	out.println("<div class=\"custom-control custom-radio\">" +
			  "<input type=\"radio\" id=\"customRadio4\" name=\"select\" class=\"custom-control-input\" value=\"" + name[3] + "\">" +
	"<label class=\"custom-control-label\" for=\"customRadio4\">" + name[3] + "</label>" +
	"</div>");
	out.println("<div class=\"custom-control custom-radio\">" +
			  "<input type=\"radio\" id=\"customRadio5\" name=\"select\" class=\"custom-control-input\" value=\"" + name[4] + "\">" +
	"<label class=\"custom-control-label\" for=\"customRadio5\">" + name[4] + "</label>" +
	"</div>");
	
	out.println("<br>");
	out.println("<input class=\"btn btn-primary\" type=\"submit\" value=\"정답 확인\">");
	out.println("</div>");
	out.println("<br><br>");
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