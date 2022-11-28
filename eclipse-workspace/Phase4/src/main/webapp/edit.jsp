<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	
String ID =request.getParameter("ID");
String pw=request.getParameter("pw");

	%>	 
<form action="edit_ok.jsp">	
<input type=hidden name="ID" value="<%=ID%>">
<input type=hidden name="pw" value="<%=pw%>">
<table> 
<tr>
		
		<th> Phone_Number : </th>
		<th><input type="text" id="Phone_Number" name="Phone_Number"
			size="20" placeholder=""></th> </tr>
			
		<tr>	
		<th> PW: </th>
		<th> <input type="password" id="pw" name="pw"
			size="20" placeholder=""></th> </tr> 
		<tr>
		<th> Name :</th> 
		<th> <input type="text" id="Name"  name="Name"
			size="20" placeholder=""></th> 
			</tr> 
		<tr>
		<th>Address : </th> 
		<th> <input type="text" id="Address" name="Address"
			size="20" placeholder=""></th> 
			
			</tr>
		<tr>	
		<th>Sex : </th>
		<th> <input type="checkbox" name="SEX" value="M" />M
<input type="checkbox" name="SEX" value="F" />F </th> </tr>
				<tr>	
		
	<th>	Account Number : </th>
	<th><input type="text" id="Account_Number" name="Account_Number"
			size="20" placeholder=""></th>
			</tr>
		<tr><th></th>  <th></th> </tr>	
	<tr>	<th> </th><th>	<input type="submit"
			value="회원 정보 수정" />
	 </th> 	</tr>
	</table>
	</form>		



</body>




</html>