

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
  <head>
  <style>
  body {
        height: 100vh;
        width: 100vw;
        background-image: url('img/animal.jpeg');
        background-repeat : no-repeat;
        background-size : cover;
      }</style>
  	<title>join</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="css/style_login.css">

	</head>
	<body class="img js-fullheight" style="background-image: url(images/animal.jpg);">
	<%
	
String ID =request.getParameter("ID");
String pw=request.getParameter("pw");
	%>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section"> Edit Profile </h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
		      	<form action="edit_ok.jsp" class="signin-form">
		      		
	            <div class="form-group">
	              <input type=hidden name="ID" value="<%=ID%>">
	              <input id="password-field" type="password" name="pw" class="form-control" placeholder="Password" required>
	             
	            </div>
	             <div class="form-group">
	                             <input type="text" id="Name"  name="Name" class="form-control" placeholder="Username" />
	             
	            </div>
	             <div>
                <input type="text" id="Address" name="Address" class="form-control" placeholder="Address" />
           
              </div>
              <div>
                <input type="text" id="Phone_Number" name="Phone_Number" class="form-control" placeholder="Phone Number" />
 
              </div>
              
              <div>
                <input type="text" id="Account_Number" name="Account_Number"class="form-control" placeholder="Account Number" >
              </div> </br>
	             <div class="form-check">
  <input class="form-check-input" type="radio" name="Sex" id="M" checked value="M">
  <label class="form-check-label" for="M">
    Male
  </label> 
</div> 
<div class="form-check">
  <input class="form-check-input" type="radio" name="Sex" id="F" value="F">
  <label class="form-check-label" for="F">
    Female
  </label>
</div></br>
	            <div class="form-group">
	            	<button type="submit" class="form-control btn btn-primary submit px-3">Edit</button>
	            </div>
	             </form>
	
	         
		      </div>
				</div>
			</div>
		</div>
	</section>

	<script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>

	</body>
</html>










