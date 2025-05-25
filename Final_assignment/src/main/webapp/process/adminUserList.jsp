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
	
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/odbo";
	String username = "root";
	String password = "123456";
	Connection conn = null;
	
	Class.forName(driverName);
	conn = DriverManager.getConnection(url, username, password);
	
	Statement sm = conn.createStatement();
	ResultSet rs = sm.executeQuery("SELECT id, name, birth, gender, email, signuptime FROM members");
	
	String str = "";
	int count = 1;
	
	while(rs.next()) {
		str += "유저 " + count + " : " + rs.getString("id") + " / " + rs.getString("name")
			+ " / " + rs.getString("birth") + " / " + rs.getString("gender") + " / "
			+ rs.getString("email") + " / " + rs.getString("signuptime") + "<br>";
		count++;
	}
	
	out.print("Home > 회원 가입 명단 <hr>");
	out.print(str);
	
	rs.close();
	sm.close();
	conn.close();
%>
	