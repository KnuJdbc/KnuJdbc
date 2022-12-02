<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<style>
</style>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
<link href="css/style_image.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto:200,300,400,500,600,700" rel="stylesheet">

	<link rel="stylesheet" href="css/style_header.css">



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	jQuery(document).ready(function($) {
		$(".clickable").click(function() {
			window.location = $(this).data("href");
		});
	});
</script>
</head>
<body>
<!-- HEADER =============================-->
	

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
		        	 	<li class="nav-item"><a href="./search.jsp" class="nav-link">All Animal</a></li>
		        <!-- <li class="nav-item"><a href="#" class="nav-link">All ANLIMALS</a></li> -->	
		        	<li class="nav-item active"><a href="./search_img.jsp" class="nav-link">Images</a></li>
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
						 IMAGE
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
	<div class="row">
<!-- 
<div style="text-align:center">
<font size="6">동물 with 이미지</font>
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

String sql = "SELECT A.Name, I.IMG " +
			 "FROM ANIMAL A, ANI_IMG I " +
			 "WHERE A.Animal_ID = I.A_ID " +
			 "ORDER BY A.Name";

try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,user,pass);
	stmt = conn.createStatement();
	
	rs = stmt.executeQuery(sql);
	
	int i = 0;
	
	while (rs.next()) {
		
		
		
		
		
		out.println("<div class=\"clickable\" data-href=\"./deep_info.jsp?name=" + rs.getString(1) + "\">");
		
		
		
		
		out.println("		<div class=\"col-md-4\">                                                                                       "
				+"		<div class=\"productbox\">                                                                                     "
				+"			<div class=\"fadeshop\">                                                                                   "
			                                                                                           
				+"				<span class=\"maxproduct\"><img src="+rs.getString(2)+" alt=\"\"></span>                                 "
				+"			</div>                                                                                                   "
				+"			<div class=\"product-details\">                                                                            "
				+"				<a href=\"#\">                                                                                         "
				+"				<h1>"+rs.getString(1)+"</h1>                                                                           "
				+"				</a>                                                                                                 "

				+"			</div>                                                                                                   "
				+"		</div>                                                                                                       "
				+"	</div> ");
		//out.println("<p style=\"text-align:center\">"+rs.getString(1)+"</p>");
		out.println("</div>");
		
		//out.println("<br><br>");
		i++;
	}
	
	rs.close();
	stmt.close();
	conn.close();
} catch (SQLException ex2) {
	////System.err.println("sql error = " + ex2.getMessage());
	//System.exit(1);
}
%>

</div>
</div>
</section>

<!-- CALL TO ACTION =============================-->

<!-- FOOTER =============================-->
<div class="footer text-center">
<div class="container">
	<div class="row">
		<p class="footernote">
			 Connect with Scorilo
		</p>
		<ul class="social-iconsfooter">
			<li><a href="#"><i class="fa fa-phone"></i></a></li>
			<li><a href="#"><i class="fa fa-facebook"></i></a></li>
			<li><a href="#"><i class="fa fa-twitter"></i></a></li>
			<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
			<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
		</ul>
		<p>
			 &copy; 2017 Your Website Name<br/>
			Scorilo - Free template by <a href="https://www.wowthemes.net/">WowThemesNet</a>
		</p>
	</div>
</div>
</div>

<!-- Load JS here for greater good =============================-->
<script src="js/jquery-.js"></script>
<script src="js/bootstrap4.min.js"></script>
<script src="js/anim.js"></script>
<script>
//----HOVER CAPTION---//	  
jQuery(document).ready(function ($) {
	$('.fadeshop').hover(
		function(){
			$(this).find('.captionshop').fadeIn(150);
		},
		function(){
			$(this).find('.captionshop').fadeOut(150);
		}
	);
});
</script>

</body>
</html>