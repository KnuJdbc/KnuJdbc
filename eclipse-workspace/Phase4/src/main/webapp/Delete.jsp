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
     m.setId(ID);
       joinMember.delete(ID);
       

  %>
회원 탈퇴 완료. 이용해주셔서 감사합니다.
<button onclick="newPage()">메인 페이지로 </button>

  <script>
    function newPage() {
    	  window.location.href = 'main.jsp'
	

    }  
  </script>

</body>
</html>