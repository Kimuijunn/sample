<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String u_id = request.getParameter("userID");
	String u_pw = request.getParameter("userPW");
	String u_name = request.getParameter("userName");
	String u_birth = request.getParameter("userBirth");
	String u_gender = request.getParameter("userGender");
	String u_mail = request.getParameter("userMAIL");
	
	String sql = "INSERT INTO members(id, passwd, name, birth, gender, email) VALUES ('"
		    + u_id + "','" + u_pw + "','" + u_name + "','" + u_birth + "','" + u_gender + "','" + u_mail + "')";

	
 	String driverName="com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/odbo";
	String username = "root";
	String password = "123456";
	Connection conn = null;
	
	Class.forName(driverName);
	conn = DriverManager.getConnection(url, username, password);
	Statement sm = conn.createStatement();
	
	int count = sm.executeUpdate(sql);
	if (count == 1){
		out.println("회원 가입 성공!");
 		/* signupSucess.jsp 완성 되면 코드 수정
 		response.sendRedirect("../jsp/signupSucess.jsp");
 		*/
	} else{
		out.println("회원 가입 실패!");
		/* 
		response.sendRedirect("../jsp/signup.jsp");
		*/
	}
	sm.close();
	conn.close();
	%>
