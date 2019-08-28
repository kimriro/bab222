<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
Connection conn=null;
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:knDB";
	
Boolean connect = false;
	
try{
	String sql = "INSERT INTO USERS (NAME, PW, EMAIL) VALUES (?, ?, ?)";
    Class.forName(driver);
    conn=DriverManager.getConnection(url,"knuser","system"); //자신의 아이디와 비밀번호
    PreparedStatement stmt = conn.prepareStatement(sql);
   // stmt.setString(1, "name");
   // stmt.setString(2, "pw");
   // stmt.setString(3, "email");
    stmt.setString(1, "김슬기");
    stmt.setString(2, "5678");
    stmt.setString(3, "aa@naver.com");
    
    stmt.executeUpdate();
    connect = true;
    conn.close();
}catch(Exception e){
    connect = false;
    e.printStackTrace();
}
%>
<%
if(connect==true){%>
    연결되었습니다.
<%}else{ %>
    연결에 실패하였습니다.
<%}%> 
</body>
</html>