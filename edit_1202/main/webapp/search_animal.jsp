<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@500&family=Montserrat:wght@200&family=Nanum+Gothic&display=swap');
body { 
 font-family : font-family: 'Montserrat', sans-serif;
}
</style>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
<link href="css/style_image.css" rel="stylesheet">
	<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="css/style_table.css">

	<link rel="stylesheet" href="css/style_header.css">
	
	
	
<link href="https://fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto:200,300,400,500,600,700" rel="stylesheet">

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
		        	<li class="nav-item active"><a href="./after_login.jsp" class="nav-link">Home</a></li>
		        	<li class="nav-item active"><a href="./search.jsp" class="nav-link">All Animal</a></li>
		        <!-- <li class="nav-item"><a href="#" class="nav-link">All ANLIMALS</a></li> -->	
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
			<h1 class="text-center latestitems">Result</h1>
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
String SN = request.getParameter("SN");
String CNT = request.getParameter("CONTINENT");
String S_YEAR = request.getParameter("S_YEAR");
String E_YEAR = request.getParameter("E_YEAR");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String USE = request.getParameter("USE");
out.println(" <section class=\"ftco-section\">"
+		"<div class=\"container\">"
+    " <div class=\"row justify-content-center\"> "
+	"<div class=\"col-md-6 text-center mb-5\">"
+	"	<h2 class=\"heading-section\">  </h2>"
+	"</div>"
+"</div>");
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
		
		out.println("<div class=\"row\">"
		+"	<div class=\"col-md-12\">"
		+	"	<div class=\"table-wrap\">"
		+		"	<table class=\"table table-responsive-xl\">"
		+			"  <thead>"
		+			  "  <tr>"
		+			    "	<th>&nbsp;</th>"
		+			    "	<th>이름</th>"
		+			      "<th>학명</th>"
		+			     " <th>&nbsp;</th>"
		+			    "</tr>"
		+			 " </thead>"
		+			 " <tbody> ");
		
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
		out.println("<td>" +
		"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">    "   +
		"<span aria-hidden=\"true\"><i class=\"fa fa-close\"></i></span>                     "   +
		"</button>                                                                       "   +
		"</td>                                                                         "   +
		"</tr> ");}
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
			
			out.println("<div class=\"row\">"
					+"	<div class=\"col-md-12\">"
					+	"	<div class=\"table-wrap\">"
					+		"	<table class=\"table table-responsive-xl\">"
					+			"  <thead>"
					+			  "  <tr>"
					+			    "	<th>&nbsp;</th>"
					+			    "	<th>이름</th>"
					+			      "<th>학명</th>"
					+			     " <th>&nbsp;</th>"
					+			    "</tr>"
					+			 " </thead>"
					+			 " <tbody> ");
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
			out.println("<td>" +
			"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">    "   +
			"<span aria-hidden=\"true\"><i class=\"fa fa-close\"></i></span>                     "   +
			"</button>                                                                       "   +
			"</td>                                                                         "   +
			"</tr> ");}
		break;
	case 3:
		sql = "SELECT A.Name AS 이름, A.IUCN_ID AS IUCN위기레벨 " +
				"FROM ANI_USE U, ANIMAL A " +
				"WHERE U.A_Use = ? and U.A_ID = A.Animal_ID";
			
		//	String USE = request.getParameter("USE");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, USE);
			rs = pstmt.executeQuery();
			
			out.println("<div class=\"row\">"
					+"	<div class=\"col-md-12\">"
					+	"	<div class=\"table-wrap\">"
					+		"	<table class=\"table table-responsive-xl\">"
					+			"  <thead>"
					+			  "  <tr>"
					+			    "	<th>&nbsp;</th>"
					+			    "	<th>이름</th>"
					+			      "<th>IUCN위기레벨</th>"
					+			     " <th>&nbsp;</th>"
					+			    "</tr>"
					+			 " </thead>"
					+			 " <tbody> ");
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
			out.println("<td>" +
			"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">    "   +
			"<span aria-hidden=\"true\"><i class=\"fa fa-close\"></i></span>                     "   +
			"</button>                                                                       "   +
			"</td>                                                                         "   +
			"</tr> ");}
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
			
			out.println("<div class=\"row\">"
					+"	<div class=\"col-md-12\">"
					+	"	<div class=\"table-wrap\">"
					+		"	<table class=\"table table-responsive-xl\">"
					+			"  <thead>"
					+			  "  <tr>"
					+			    "	<th>&nbsp;</th>"
					+			    "	<th>이름</th>"
					+			      "<th>link</th>"
					+			     " <th>&nbsp;</th>"
					+			    "</tr>"
					+			 " </thead>"
					+			 " <tbody> ");
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
			out.println("<td><a href=\""+ rs.getString(2) + "\">link</a></td>");
			out.println("<td>" +
			"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">    "   +
			"<span aria-hidden=\"true\"><i class=\"fa fa-close\"></i></span>                     "   +
			"</button>                                                                       "   +
			"</td>                                                                         "   +
			"</tr> ");}
		break;
	}
	
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
	pstmt.close();
	conn.close();
} catch (SQLException ex2) {
	//System.err.println("sql error = " + ex2.getMessage());
	//System.exit(1);
}
%></div>
</body>
</html>