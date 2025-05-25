<% page import="java.sql.*" %>
<%
	Connection Conn = null;
	String url = "jdbc:mysql://localhost:3306/odbo";
	String user = "root";
	String passwd = "123456";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, passwd);
%>
<%-- DB 연동용 입니다. --%>