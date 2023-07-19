<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String realFolder = "";
	String filename = "";
	String savefile = "img";
	ServletContext scontext = getServletContext();
	realFolder = scontext.getRealPath(savefile);
	System.out.println(realFolder);
	
	File saveDir = new File(realFolder);
	if (!saveDir.exists())
		saveDir.mkdirs();
	
	int maxPostSize = 1024 * 1024 * 5; // 5MB
	
	// Encoding setting
	String encoding = "UTF-8";
	
	
	FileRenamePolicy policy = new DefaultFileRenamePolicy();
	MultipartRequest mrequest = new MultipartRequest(request
											, realFolder
											, maxPostSize
											, encoding
											, policy);
	

	String task = Util.getParamNN(mrequest.getParameter("task"));
	String id = Util.getParamNN(mrequest.getParameter("id"));
	String productName = Util.getParamNN(mrequest.getParameter("productName"));
	String companyId = Util.getParamNN(mrequest.getParameter("companyId"));
	String price = Util.getParamNN(mrequest.getParameter("price"));
	String detail = Util.getParamNN(mrequest.getParameter("detail"));
	String imgName = Util.getParamNN(mrequest.getOriginalFileName("imgName"));
	String createDate = Util.getParamNN(mrequest.getParameter("createDate"));
	
	File uploadImg = mrequest.getFile("imgName");
	
	Connection conn = null;
	String callback = "";
	try {
		conn = Util.getConnection();
		PreparedStatement pstmt = null; 
		String sql = "";
		
		switch(task) {
		case "insert":
			sql = "INSERT INTO product VALUES (?, ?, ?, ?, ?, ?, to_date(?, 'YYYY-MM-DD'))";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, productName);
			pstmt.setString(3, companyId);
			pstmt.setString(4, price);
			pstmt.setString(5, detail);
			pstmt.setString(6, imgName);
			pstmt.setString(7, createDate);

			// 4) 실행
			pstmt.executeUpdate();
			%>
			<jsp:include page="product.jsp"></jsp:include>
			<%
			break;
		}
	} catch(Exception e){
		e.printStackTrace();
	}
%>