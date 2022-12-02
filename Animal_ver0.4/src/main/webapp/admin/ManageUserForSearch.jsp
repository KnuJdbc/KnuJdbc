<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Simple Responsive Admin</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
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
     
           
          
    <div id="wrapper">
         <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="adjust-nav">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="Admin.html">
                        <img src="assets/img/04-2.png" />
                    </a>
                </div>
              
                 <span class="logout-spn" >
                  <a href="#" style="color:#fff;">LOGOUT</a>  

                </span>
            </div>
        </div>
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
 					<li>
                        <a href="Admin.html" ><i class="fa fa-desktop "></i>Dash Board</a>
                    </li>                
 					<li>
 					    <li class="active-link">
                        <a href="ManageUserForShow.jsp" ><i class="fa fa-bar-chart-o "></i>Manage User</a>
                    </li>                 
                    <li>
                        <a href="ManageAnimalForShow.jsp"><i class="fa fa-table "></i>Manage Animal</a>
                    </li>
                </ul>
            </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>Manage User </h2>   
                    </div>
                </div>              
                 <!-- /. ROW  -->
                <hr />
<h4>검색 결과</h4>
<%
	StringBuffer sb = new StringBuffer();
	sb.append("SELECT Phone_Number, Name, Donation ");
	sb.append("FROM ACCOUNT ");
	sb.append("WHERE Name = ?");
	String sql = sb.toString();
	ps = conn.prepareStatement(sql);
		 
	String name = request.getParameter("name");
	
	ps.setString(1, name);
	
	rs = ps.executeQuery();%>
	<table class="table table-striped table-bordered table-hover">
<%
	ResultSetMetaData rsmd = rs.getMetaData();
	int cnt = rsmd.getColumnCount();
	for(int i = 1; i<=cnt; i++) {
		out.println("<th>" + rsmd.getColumnName(i) + "</th>");
	}
	while(rs.next()) {
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("<td>"+rs.getString(3)+"</td>");
		out.println("</tr>");		
	}	
	out.println("</table>");
%>
<hr/>
<h4>열람 정보</h4>
<%
	sb = new StringBuffer();
	sb.append("SELECT ACCOUNT.Name, ACCOUNT.ID, WATCHING.Favorite, ANIMAL.Name ANIMAL_Name, ANIMAL.Animal_ID ");
	sb.append("FROM ACCOUNT, WATCHING, ANIMAL ");
	sb.append("WHERE AC_ID = ID AND A_ID = Animal_ID AND ACCOUNT.Name = ? ORDER BY Animal_ID");
	sql = sb.toString();
	ps = conn.prepareStatement(sql);
	
	ps.setString(1, name);
	
	rs = ps.executeQuery();%>
	<table class="table table-striped table-bordered table-hover">
<%
	rsmd = rs.getMetaData();
	cnt = rsmd.getColumnCount();
	for(int i = 1; i<=cnt; i++) {
		out.println("<th>" + rsmd.getColumnName(i) + "</th>");
	}
	while(rs.next()) {
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("<td>"+rs.getString(3)+"</td>");
		out.println("<td>"+rs.getString(4)+"</td>");
		out.println("<td>"+rs.getString(5)+"</td>");
		out.println("</tr>");		
	}	
	out.println("</table>");
%>
    
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
    <div class="footer">
      
    
             <div class="row">
                <div class="col-lg-12" >
                    &copy;  2022 knu.ac.kr 
                </div>
        </div>
        </div>
          

     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
    
   
</body>
</html>
