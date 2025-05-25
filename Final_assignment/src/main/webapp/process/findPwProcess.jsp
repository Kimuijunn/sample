<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    String u_id = request.getParameter("userID");
    String u_mail = request.getParameter("userMAIL");

    String driverName = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/odbo";
    String username = "root";
    String password = "123456";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName(driverName);
        conn = DriverManager.getConnection(url, username, password);

        String sql = "SELECT passwd FROM members WHERE id = ? AND email = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, u_id);
        pstmt.setString(2, u_mail);

        rs = pstmt.executeQuery();

        if (rs.next()) {
            String foundPw = rs.getString("passwd");
%>
            <script>
                alert("비밀번호는: <%= foundPw %> 입니다.");
                location.href = "../jsp/main.jsp";
            </script>
<%
        } else {
%>
            <script>
                alert("해당 정보로 등록된 계정이 없습니다.");
                history.back();
            </script>
<%
        }

    } catch (Exception e) {
%>
        <p>오류 발생: <%= e.getMessage() %></p>
<%
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception e) {}
        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }
%>
