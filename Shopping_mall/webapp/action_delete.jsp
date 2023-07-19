<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String productId = Util.getParamNN(request.getParameter("id"));
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		conn = Util.getConnection();
		String sql = "DELETE FROM product WHERE id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		pstmt.executeUpdate();
		
		response.sendRedirect("product.jsp");
	}catch(Exception e){
		e.printStackTrace();
	}
%>
