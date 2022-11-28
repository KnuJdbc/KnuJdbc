<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="join_ok.jsp">	
<!-- 
		ID: <input type="text" id="ID" name="ID"
			size="20" placeholder=""><br />
		Phone_Number :<input type="text" id="Phone_Number" name="Phone_Number"
			size="20" placeholder=""><br />
		PW: <input type="password" id="pw" name="pw"
			size="20" placeholder=""><br />
		Name : <input type="text" id="Name"  name="Name"
			size="20" placeholder=""><br />
		Address :  <input type="text" id="Address" name="Address"
			size="20" placeholder=""><br />
		Sex (M/F):  <input type="text" id="Sex" name="Sex"
			size="20" placeholder=""><br />
		Account Number : <input type="text" id="Account_Number" name="Account_Number"
			size="20" placeholder=""><br />
		<input type="submit"
			value="회원 가입" /><br />
	</form>		
 -->
		
<table> 
<tr>

		<th> ID: </th>
		<th><input type="text" id="ID" name="ID"
			size="20" placeholder=""></th> </tr>
<tr>

		<tr>	
		<th> PW: </th>
		<th> <input type="password" id="pw" name="pw"
			size="20" placeholder=""></th> </tr> 
		<th> Phone Number : </th>
		<th><input type="text" id="Phone_Number" name="Phone_Number"
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
		<th> <input type="checkbox" name="Sex" value="M" />M
<input type="checkbox" name="Sex" value="F" />F </th> </tr>
				<tr>	
		
	<th>	Account Number : </th>
	<th><input type="text" id="Account_Number" name="Account_Number"
			size="20" placeholder=""></th>
			</tr>
		<tr><th></th>  <th></th> </tr>	
	<tr>	<th> </th><th>	<input type="submit"
			value="회원 가입" />
	 </th> 	</tr>
	</table>
	</form>		


</body>




</html>