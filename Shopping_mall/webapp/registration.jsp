<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("UTF-8");

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String id = "";
//String callback = "";
try {
	conn = Util.getConnection();
	stmt = conn.createStatement();
	String sql = "SELECT (id + 1) id FROM product order by id desc";	
	
	rs = stmt.executeQuery(sql);
	if(!rs.next()){
		id = "100001";
	}else{
		id = Util.getParamNN(rs.getString("id"));	
	}
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="Stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <title>상품 등록</title>
    <style type="text/css">
    	.h1-atag:hover {
    		color: white;
    		text-decoration: none;
    	}
    </style>
	<script type="text/javascript" src="check.js?v=2"></script>
</head>
<body>
<nav><jsp:include page="nav.jsp"></jsp:include></nav>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3" style="font-size: 45px">상품 등록</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" style="text-align: center;">
			<div class="col-md-7">
				<form name="newProduct" action=action_insert.jsp
					class="form-horizontal" method="post" enctype="multipart/form-data">
					<input type="hidden" name="task" value="insert">
					<div class="form-group row">
						<label class="col-sm-2">상품코드</label>
						<div class="col-sm-3">
							<input type="text" id="id" name="id" class="form-control"
								value='<%=id %>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상품명</label>
						<div class="col-sm-3">
							<input type="text" id="productName" name="productName" class="form-control"
								value=''>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">브랜드명</label>
						<div class="col-sm-3">
							<input type="text" id="companyId" name="companyId"
								class="form-control" value=''>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">가격</label>
						<div class="col-sm-3">
							<input type="text" id="price" name="price" class="form-control"
								value=''>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상세정보</label>
						<div class="col-sm-5">
							<textarea id="detail" name="detail" cols="50" rows="2"
								class="form-control" placeholder="100자 이상 적어주세요"></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">이미지</label>
						<div class="col-sm-5">
							<input type="file" id="imgName" name="imgName" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">생산일</label>
						<div class="col-sm-3">
							<input type="text" id="createDate" name="createDate" class="form-control"
								value=''>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10 ">
							<input type="submit" class="btn btn-primary" value="등록" onclick="return checkData();">
							<input type="reset" class="btn btn-primary" value="다시쓰기" onclick="return resetData();">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<footer><jsp:include page="footer.jsp"></jsp:include></footer>
</html>
<%
} catch(Exception e) {
	e.printStackTrace();
}
%>