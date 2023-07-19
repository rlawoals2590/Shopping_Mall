<%@ page import="DBPKG.Util" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
 	request.setCharacterEncoding("utf-8");
 	
	Statement stmt = null;
	Connection conn1 = null;
	
	conn1 = Util.getConnection();
	stmt = conn1.createStatement();
	String sql = "SELECT imgpath FROM product";
	
	ResultSet rs = stmt.executeQuery(sql);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
<%
	while(rs.next()){
%>
	<p><%=rs.getString("imgpath") %></p>
	<img src="/img/<%=rs.getString("imgpath") %>"/>
<%
	}
%>
<p>test</p>
</body>
</html>