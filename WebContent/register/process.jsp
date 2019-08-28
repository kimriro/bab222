<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
   // 한글 깨짐 방지 
    request.setCharacterEncoding("UTF-8");
 // username, email, password, confirm-password
   String name = request.getParameter("username");
   String email = request.getParameter("email");
   String password = request.getParameter("password");
   String cp = request.getParameter("confirm-password");
    System.out.println(name);
    System.out.println(email);
    System.out.println(password);
    System.out.println(cp);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register/process.jsp</title>
</head>
<body>
회원가입 처리<br>
이름:<%= name %><br>
이메일:<%= email %><br>
회원 가입 처리가 되었슴둥.<br>
<a href="../sign.jsp"> 로그인 하기</a>
</body>
</html>