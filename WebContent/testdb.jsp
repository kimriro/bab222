<%@page import="java.sql.ResultSet"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
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
Boolean connect = false;
	
try{
	 Context init = new InitialContext();
	   DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/kndb");
	   conn = ds.getConnection();
	
	   String sql = "SELECT * FROM users WHERE email = ? AND pw = ?";	
	   PreparedStatement pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, "a@a.com");
	   pstmt.setString(2, "3");
	   
		ResultSet rs = pstmt.executeQuery();			
		
		if (rs.next()) {			
			System.out.println(rs.getString("name"));		
			System.out.println(rs.getString("pw"));		
			System.out.println(rs.getString("email"));		
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
    연결되었습니다.
<%}else{ %>
    연결에 실패하였습니다.
<%}%> 
</body>
</html>