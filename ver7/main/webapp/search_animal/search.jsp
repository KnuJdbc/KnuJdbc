<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*, java.lang.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@500&family=Montserrat:wght@200&family=Nanum+Gothic&display=swap');
body { 
 font-family : font-family: 'Montserrat', sans-serif;
}
</style>
<meta charset="UTF-8">
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

<title>동물 찾기</title>
	
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

<section class="ftco-section">
		
		<div class="container">
			<nav class="navbar navbar-expand-lg ftco_navbar ftco-navbar-light" id="ftco-navbar">
		    <div class="container">
		    	<a class="navbar-brand" href="../main/index.html">Endangerd Animal</a> 
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
		        	 	<li class="nav-item active"><a href="./search.jsp" class="nav-link">All Animal</a></li>
		        <!-- <li class="nav-item"><a href="#" class="nav-link">All ANLIMALS</a></li> -->	
		        	<li class="nav-item"><a href="./search_img.jsp" class="nav-link">Images</a></li>
		        	<li class="nav-item"><a href="./statistics.jsp" class="nav-link">Statistics</a></li>
		          <li class="nav-item"><a href="./get_info.html" class="nav-link">Search</a></li>
		          <li class="nav-item"><a href="../quiz_animal/Animal_quiz.jsp" class="nav-link">Quiz</a></li>
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
			<h1 class="text-center latestitems">All Animal</h1>
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


String status= "waiting";

Connection conn = null;
Statement stmt;
ResultSet rs;

String sql = "SELECT A.Name AS 이름, A.SN_ID AS 학명, I.IUCN_Status AS IUCN위기레벨등급 " +
"FROM ANIMAL A, IUCN_STATUS I " +
"WHERE A.IUCN_ID = I.IUCN_Status_ID " +
"ORDER BY A.Name";

try {
Class.forName("oracle.jdbc.driver.OracleDriver");
conn = DriverManager.getConnection(url,user,pass);
stmt = conn.createStatement();

rs = stmt.executeQuery(sql);
ResultSetMetaData rsmd = rs.getMetaData();
int cnt = rsmd.getColumnCount();

out.println(" <section class=\"ftco-section\">"
+		"<div class=\"container\">"
+    " <div class=\"row justify-content-center\"> "
+	"<div class=\"col-md-6 text-center mb-5\">"
+	"	<h2 class=\"heading-section\">  </h2>"
+	"</div>"
+"</div>"

+"<div class=\"row\">"
+"	<div class=\"col-md-12\">"
+	"	<div class=\"table-wrap\">"
+		"	<table class=\"table table-responsive-xl\">"
+			"  <thead>"
+			  "  <tr>"
+			    "	<th>&nbsp;</th>"
+			    "	<th>이름</th>"
+			      "<th>학명</th>"
+			      "<th>IUCN 위기 레벨 등급</th>"
+			     " <th>&nbsp;</th>"
+			    "</tr>"
+			 " </thead>"
+			 " <tbody> ");

//for(int i =1;i<=cnt;i++){
//	out.println("<th>"+rsmd.getColumnName(i)+"</th>");
//}
                                                           



while (rs.next()) {
	out.println("<tr class=\"clickable-row\" data-href=\"./deep_info.jsp?name=" + rs.getString(1) + "\">");
	out.println("<td>                                             "   +
			"<label class=\"checkbox-wrap checkbox-primary\">                                  "   +
			"<input type=\"checkbox\" checked>                                                 "   +
			"<span class=\"checkmark\"></span>                                                 "   +
			"</label>                                                                        "   +
			"</td>                                                                           "   +
			"<td class=\"d-flex align-items-center\">                                          "   +
			"<div class=\"img\"style=\"background-image: url(images/person_1.jpg);\"></div>     "   +
			"<div class=\"pl-3 email\">                                                        ");
	
	                                                         

		     
	
//out.println("<tr class=\"clickable-row\" data-href=\"./deep_info.jsp?name=" + rs.getString(1) + "\">");
out.println("<span>"+rs.getString(1)+"</span> </div>  </td>   ");
out.println("<td>"+rs.getString(2)+"</td>");

if (rs.getString(3).contains("Cr") || rs.getString(3).contains("Vu") || rs.getString(3).contains("ex") || rs.getString(3).contains("Ex") )
{
	status = "red";	}
else if (rs.getString(3).contains("Le") )
{
	status ="active";
	}
else 
{
	status ="waiting";
}




out.println("<td class=\"status\"><span class=\""+ status +"\">"+rs.getString(3)+"</span></td>" );
out.println("<td>" +
"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">    "   +
"<span aria-hidden=\"true\"><i class=\"fa fa-close\"></i></span>                     "   +
"</button>                                                                       "   +
"</td>                                                                         "   +
"</tr> ");}

out.println(
"</tbody>                                      "
+"</table>                                      "
+"</div>                                        "
+"</div>                                        "
+"</div>                                        "
+"</div>                                        "
+"</section>                                    "
+"                                              "
+"<script src=\"js/jquery1.min.js\"></script>     "
+"<script src=\"js/popper1.js\"></script>         "
+"<script src=\"js/bootstrap1.min.js\"></script>  "
+"<script src=\"js/main1.js\"></script>           ");


		
		

rs.close();
stmt.close();
conn.close();
} catch (SQLException ex2) {
//System.err.println("sql error = " + ex2.getMessage());
//System.exit(1);
}
%>
</div>
	<script src="js/jquery2.min.js"></script>
  <script src="js/popper2.js"></script>
  <script src="js/bootstrap2.min.js"></script>
  <script src="js/main2.js"></script>

</body>
</html>