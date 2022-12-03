<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
}



</style>
<meta charset="UTF-8">
<title>정답 확인</title>
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
				String answer = request.getParameter("answer");
				String select = request.getParameter("select");
				
				if (answer.equals(select)) {
					out.println("<h2 class=\"heading-section\">정답입니다!</h2>");
				}
				else {
					out.println("<h2 class=\"heading-section\">오답입니다...</h2>");
					out.println("<h3 class=\"heading-section\">정답 : " + answer + "</h3>");
				}
				%>
				<form action="./Animal_quiz.jsp">
				<button type="submit" class="btn btn-outline-light">다시 풀기</button>
				</form>
				<br>
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