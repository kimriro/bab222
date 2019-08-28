<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
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
   
   // 아이디와 패스워드 체크 
   String regName ="김팔몬";
   String regPw = "HAHA";
   boolean isLogin = false;
   if(name.equals(regName)&& password.equals(regPw)){
	   System.out.println("로그인 성공");
	   isLogin = true;
   }else {
	   System.out.println("로그인 실패");
   }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login/process.jsp</title>
</head>
<body>
로그인 완료<br>

<% if(isLogin){%>
<script> alert("로그인 성공");</script>
아이디:<%= name %><br>
비밀번호: <%= password %><br>
<% } else {%>
<script> alert("로그인 실패");
location.href="../sign.jsp";</script>
<% }%>
</body>
</html>