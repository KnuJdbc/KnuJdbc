



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="m" class="mpackage.Member" scope="request"/>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  </head>
  <body>
  
  
  

<form action="login.jsp">


 <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">ID</label>

    <input type="text" class="form-control" id="ID" aria-describedby="emailHelp">
    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" class="form-control" id="pw">
 </div>
 <!--   
  <div class="mb-3 form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Check me out</label>
  </div> -->
  <button type="submit" class="btn btn-outline-secondary">LOGIN</button>
<!-- 
<table>
<tr>
<td> <label for="ID">ID</label> </td>
<td> <input type="text" id="ID" name="ID"
			size="20" placeholder=""></td>
			</tr>
			
			<tr>
			
			<td> <label for="pw">PW</label> </td>
<td> <input type="password" id="pw" name="pw"
			size="20" placeholder=""></td>
			</tr>





</table>
<input type="submit" value="LOGIN">  -->
</form>
<!--
<button onclick="newPage()">회원가입 </button>

  <script>
    function newPage() {
    	  window.location.href = 'join.jsp'
	

    }  
  </script>
-->  
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
  </body>
</html>


