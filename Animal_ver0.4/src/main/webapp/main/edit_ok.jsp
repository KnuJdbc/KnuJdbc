<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <jsp:useBean id="m" class="mpackage.Member" scope="request"/>
<jsp:useBean id="joinMember" class="mpackage.joinMember" scope="request"/>
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
       joinMember.edit(m);

  %>
  회원 정보 수정 완료.
  	<form action="after_login.jsp" class="signin-form">
  	   <input type=hidden name="ID" value="<%=ID%>">
  	    <input type=hidden name="pw" value="<%=pw%>">
  	    <button type=submit> 메인으로 </button>
  	</form>
 
  
</body>
</html>