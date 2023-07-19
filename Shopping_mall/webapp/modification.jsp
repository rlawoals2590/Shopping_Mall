<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	Connection conn = null;
	Statement stmt = null;
	
	String edit = request.getParameter("edit");
%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="Stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<meta charset="UTF-8">
	<title>상품 수정</title>
	<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 상를 삭제합니다.") == true)
			location.href = "./action_delete.jsp?id=" + id;
		else
			return;
	}
</script>
<style type="text/css">
    	.h1-atag:hover {
    		color: white;
    		text-decoration: none;
    	}
    </style>
</head>
<body>
	<nav><jsp:include page="nav.jsp"></jsp:include></nav>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3" style="font-size: 45px">상품 수정</h1>
		</div>
	</div>
	<div class="container">
	<%
		try {
			conn = Util.getConnection();
			stmt = conn.createStatement();
			String sql = "select imgpath, COMPANYID, PRODUCTNAME, DETAIL, ID, to_char(PRICE, 'L999,999,999,999') as PRICE from product";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
	%>
		<div class="row">
			<div class="col-md-3" align="center">	
				<img src="/img/<%=rs.getString("imgpath")%>"
					style="width: 50%">
			</div>
			<div class="col-md-7">
				<p><h5><b>[<%=rs.getString("COMPANYID")%>] <%=rs.getString("PRODUCTNAME")%></b></h5>
				<p style="padding-top: 5px"><%=rs.getString("DETAIL").substring(0, 10)%>...
				<p><%=rs.getString("PRICE")%>원
			</div>
			<div class="col-md-2" style="padding-top: 70px">
				<a href="./product_update.jsp?id=<%=rs.getString("ID")%>"
					class="btn btn-success" role="button">수정 &raquo;</a>
				<a href="#" onclick="deleteConfirm('<%=rs.getString("ID")%>')"
					class="btn btn-danger" role="button">삭제 &raquo;</a>
			</div>
		</div>
	<%
			}
		} catch(Exception e){
			e.printStackTrace();
		}
	%>
	</div>
</body>
<footer><jsp:include page="footer.jsp"></jsp:include></footer>
</html>