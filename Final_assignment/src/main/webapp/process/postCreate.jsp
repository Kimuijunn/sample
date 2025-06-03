<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");

    String title = request.getParameter("title");
    String content = request.getParameter("content");

    String driver = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/odbo?serverTimezone=UTC";
    String dbUser = "root";
    String dbPass = "123456";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rsKeys = null;
    int postId = 0;

    try {
        Class.forName(driver);
        conn = DriverManager.getConnection(url, dbUser, dbPass);

        String sql = "INSERT INTO posts(title, content, views, rec_count) VALUES(?, ?, 0, 0)";
        pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        pstmt.setString(1, title);
        pstmt.setString(2, content);
        pstmt.executeUpdate();

        rsKeys = pstmt.getGeneratedKeys();
        if (rsKeys.next()) {
            postId = rsKeys.getInt(1);
        }

        response.sendRedirect(request.getContextPath() + "/jsp/postDetail.jsp?postId=" + postId);

    } catch (Exception e) {
        e.printStackTrace();
        out.println("게시글 등록 중 오류가 발생했습니다.");
    } finally {
        if (rsKeys != null) try { rsKeys.close(); } catch (Exception ignored) {}
        if (pstmt != null) try { pstmt.close(); } catch (Exception ignored) {}
        if (conn != null) try { conn.close(); } catch (Exception ignored) {}
    }
%>
