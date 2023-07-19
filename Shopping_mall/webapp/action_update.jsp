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
	
	
	String id = Util.getParamNN(mrequest.getParameter("id"));
	String productName = Util.getParamNN(mrequest.getParameter("productName"));
	String companyId = Util.getParamNN(mrequest.getParameter("companyId"));
	String price = Util.getParamNN(mrequest.getParameter("price"));
	String detail = Util.getParamNN(mrequest.getParameter("detail"));
	String imgName = Util.getParamNN(mrequest.getOriginalFileName("imgName"));
	String createDate = Util.getParamNN(mrequest.getParameter("createDate"));
	
	File uploadImg = mrequest.getFile("imgName");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		conn = Util.getConnection();
		
		System.out.println(imgName);
		if(imgName != ""){
			String sql = "UPDATE product SET PRODUCTNAME = ?, COMPANYID = ?, PRICE = ?, DETAIL = ?, IMGPATH = ?, CREATEDATE = ? WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productName);
			pstmt.setString(2, companyId);
			pstmt.setString(3, price);
			pstmt.setString(4, detail);
			pstmt.setString(5, imgName);
			pstmt.setString(6, createDate);
			pstmt.setString(7, id);
			pstmt.executeUpdate();
		}else {
			String sql = "UPDATE product SET PRODUCTNAME = ?, COMPANYID = ?, PRICE = ?, DETAIL = ?, CREATEDATE = ? WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productName);
			pstmt.setString(2, companyId);
			pstmt.setString(3, price);
			pstmt.setString(4, detail);
			pstmt.setString(5, createDate);
			pstmt.setString(6, id);
			pstmt.executeUpdate();
		}
		response.sendRedirect("modification.jsp?edit=update");
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>
