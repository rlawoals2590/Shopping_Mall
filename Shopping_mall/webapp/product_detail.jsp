<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	Connection conn = null;
	PreparedStatement pstmt = null; 
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="Stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<style type="text/css">
    	.h1-atag:hover {
    		color: white;
    		text-decoration: none;
    	}
    </style>
<title>상품 목록</title>
</head>
<body>
	<nav><jsp:include page="nav.jsp"></jsp:include></nav>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">상품 정보</h1>
		</div>
	</div>
	<%
	String productId = Util.getParamNN(request.getParameter("id"));
	
	try{
		conn = Util.getConnection();
		String sql = "select imgpath, COMPANYID, PRODUCTNAME, DETAIL, ID,  to_char(createdate, 'yyyy-mm-dd') as CREATEDATE, to_char(PRICE, 'L999,999,999,999') as PRICE from product WHERE ID = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<img src="/img/<%=rs.getString("imgpath")%>"
					style="width: 100%" />
			</div>
			<div class="col-md-8">
				<h4><b>[<%=rs.getString("COMPANYID")%>] <%=rs.getString("PRODUCTNAME")%></b></h4>
				<p><%=rs.getString("DETAIL")%>
				<p><b>상품코드 : </b><span class="badge badge-danger"> <%=rs.getString("ID")%></span>
				<p><b>생산일</b> : <%=rs.getString("CREATEDATE")%>
				<h4><%=rs.getString("PRICE")%>원</h4>
			</div>
		</div>
		<hr>
	</div>
	<%
			}
		} catch(Exception e){
			e.printStackTrace();
		}
	%>
</body>
</html>