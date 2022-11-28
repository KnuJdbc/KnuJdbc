<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="r" class="w mpackage.Memb" scope="request"/>
<jsp:useBean id="r joinMemb" class="w mpackage.joinMemb" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

      <% 
      request.setCharacterEncoding("utf-8");
		
		String ID = request.getParameter("ID");
		String Account_Number= request.getParameter("Account_Number");
		String Address= request.getParameter("Address");
		String Name= request.getParameter("Name");
		String pw= request.getParameter("pw");
		String Sex= request.getParameter("Sex");
		String Phone_Number= request.getParameter("Phone_Number");
		
     m.setId(ID);
  	m.setAccountNumber(Account_Number);
  	m.setAddress(Address);
  	m.setName(Name);
  	m.setPw_1(pw);
  	m.setSex(Sex);
  	m.setPhoneNumber(Phone_Number);
       joinMember.join(m);

  %>


</body>
</html>