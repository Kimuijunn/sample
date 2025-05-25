<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    String u_name = request.getParameter("userName");
    String u_mail = request.getParameter("userMAIL");

    String driver = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/odbo";
    String dbUser = "root";
    String dbPass = "123456";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName(driver);
        conn = DriverManager.getConnection(url, dbUser, dbPass);
        String sql = "SELECT id FROM members WHERE name = ? AND email = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, u_name);
        pstmt.setString(2, u_mail);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            String foundId = rs.getString("id");
%>
            <script>
                alert("아이디는: <%= foundId %> 입니다.");
                location.href = "../jsp/main.jsp";
            </script>
<%
        } else {
%>
            <script>
                alert("해당 정보로 등록된 아이디가 없습니다.");
                history.back();
            </script>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
%>
        <p>오류 발생: <%= e.getMessage() %></p>
<%
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception e) {}
        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }
%>
