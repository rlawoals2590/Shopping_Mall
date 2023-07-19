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
<title>상품 수정</title>
</head>
<body>
	<nav><jsp:include page="nav.jsp"></jsp:include></nav>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">상품 수정</h1>
		</div>
	</div>
	<%
	String productId = Util.getParamNN(request.getParameter("id"));
	try {
		conn = Util.getConnection();
		String sql = "select imgpath, COMPANYID, PRODUCTNAME, DETAIL, ID,  to_char(createdate, 'yyyy-mm-dd') as CREATEDATE, PRICE from product WHERE ID = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
	%>
	<div class="container">
		<div class="row" style="text-align: center;">
		<div class="col-md-5">
				<img src="/img/<%=rs.getString("imgpath")%>" alt="image"
					style="width: 100%" />
			</div>
			<div class="col-md-7">
				<form name="newProduct" action=action_update.jsp
					class="form-horizontal" method="post" enctype="multipart/form-data">
					<input type="hidden" name="task" value="insert">
					<div class="form-group row">
						<label class="col-sm-2">상품코드</label>
						<div class="col-sm-3">
							<input type="text" id="id" name="id" class="form-control"
								value='<%=rs.getString("ID") %>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상품명</label>
						<div class="col-sm-3">
							<input type="text" id="productName" name="productName" class="form-control"
								value='<%=rs.getString("PRODUCTNAME") %>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">브랜드명</label>
						<div class="col-sm-3">
							<input type="text" id="companyId" name="companyId"
								class="form-control" value='<%=rs.getString("COMPANYID") %>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">가격</label>
						<div class="col-sm-3">
							<input type="text" name="price" class="form-control"
								value='<%=rs.getString("PRICE") %>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상세정보</label>
						<div class="col-sm-5">
							<textarea name="detail" cols="50" rows="2"
								class="form-control" placeholder="100자 이상 적어주세요"><%=rs.getString("DETAIL") %></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">이미지</label>
						<div class="col-sm-5">
							<input type="file" name="imgName" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">생산일</label>
						<div class="col-sm-3">
							<input type="text" name="createDate" class="form-control"
								value='<%=rs.getString("CREATEDATE") %>'>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10 ">
							<input type="submit" class="btn btn-primary" value="수정">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%
			}
		} catch(Exception e){
			e.printStackTrace();
		}
	%>
</body>
</html>