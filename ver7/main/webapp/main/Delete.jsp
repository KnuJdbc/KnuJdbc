<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <jsp:useBean id="m" class="mpackage.Member" scope="request"/>
<jsp:useBean id="joinMember" class="mpackage.joinMember" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<style>
.bg {
	background-color: rgba(0, 0, 0, 0.4);
}
  body {
        height: 100vh;
        width: 100vw;
        background-image: url('img/animal.jpeg');
        background-repeat : no-repeat;
        background-size : cover;
}</style>
<meta charset="UTF-8">
<title>회원 탈퇴 완료</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="css/style_login.css">
</head>
<body>

<body class="img js-fullheight" style="background-image: url(images/animal.jpg);">
	<section class="ftco-section">
		<div class="container">
		<br><br><br><br><br><br>
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5 bg">
				<br>
				<%
				request.setCharacterEncoding("utf-8");
				String ID = request.getParameter("ID");
		     	m.setId(ID);
		        joinMember.delete(ID);
		        session.removeAttribute("id");
				%>
				
				<h2 class="heading-section">회원 탈퇴 완료. 이용해주셔서 감사합니다.</h2>
				 
				<button onclick="newPage()" class="btn btn-outline-light">메인 페이지로 </button>

  				<script>
    			function newPage() {
    	  			window.location.href = 'index.html'
    			}  
  				</script>
				<br><br>
				</div>
			</div>
		</div>
	</section>

	<script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>


</body>
</body>
</html>