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

// html  부분에서 사용
Boolean isLogin = false;
String hello = "";  //DB에서 받아온 이름을 html부분에서 출력

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
			hello=rs.getString("name");
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
 <b style = "color: tomato;"><%=hello%></b> 동무 반갑습네다!<br>
아이디:<%= name %><br>
비밀번호: <%= password %><br>

<a href = "https://www.youtube.com/channel/UCYU84yvT4mndu19FSpUnP7Q"> 김팔몬 유튜브 </a><br>
<a href = "http://bj.afreecatv.com/chfhd1994/post/31650117"> 김팔몬 아프리카 TV</a><br>
<a href = "https://www.twitch.tv/qhalqha"> 김팔몬 트위치 TV</a><br>

<% } else {%>
<script> alert("로그인 실패");
location.href="../sign.jsp";</script>
<% }%>
</body>
</html>