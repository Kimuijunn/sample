<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String userId = (String) session.getAttribute("userId");
	String sql = "DELETE FROM members WHERE id = ?";
	
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/odbo";
	String username = "root";
	String password = "123456";
	Connection conn = null;
	
	Class.forName(driverName);
	conn = DriverManager.getConnection(url, username, password);
	PreparedStatement sm = conn.prepareStatement(sql);
	sm.setString(1, userId);
	
	int count = sm.executeUpdate();
	
	if (count == 1){
		session.invalidate();
		response.sendRedirect("../jsp/deleteSuccess.jsp");
	} else {
		response.sendRedirect("../jsp/deleteFail.jsp");
	}
	sm.close();
	conn.close();
%>
