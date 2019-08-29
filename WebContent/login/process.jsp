<%@page import="java.sql.ResultSet"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");
// username, email, password, confirm-password
  String name = request.getParameter("username");
  String email = request.getParameter("email");
  String password = request.getParameter("password");
  String cp = request.getParameter("confirm-password");
  


Connection conn=null;
Boolean connect = false;
Boolean isLogin = false;
	
try{
	 Context init = new InitialContext();
	   DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/kndb");
	   conn = ds.getConnection();
	
	   String sql = "SELECT * FROM users WHERE email = ? AND pw = ?";	
	   PreparedStatement pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, name);
	   pstmt.setString(2, password);
	   
		ResultSet rs = pstmt.executeQuery();			
		
		if (rs.next()) {			
			System.out.println(rs.getString("name"));
			System.out.println("동무 반갑습네다!");
			isLogin = true; // 데이터가 있으면 true 변경
					
		} else {			
			System.out.println("아디가 없어간 패스워드가 틀렸습니다. 확인하세요!");		
		}
		
    connect = true;
    conn.close();
}catch(Exception e){
    connect = false;
    e.printStackTrace();
    
}
%>
<%
if(connect==true){%>
    연결되었습니다.<br>
<%}else{ %>
    연결에 실패하였습니다.
<%}
   
// String regName ="김팔몬";
 //  String regPw = "HAHA";
  // boolean isLogin = false;
   //if(name.equals(regName)&& password.equals(regPw)){
	//   System.out.println("로그인 성공");
	  // isLogin = true;
  // }else {
	//   System.out.println("로그인 실패");
  // }
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