<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");

    String author = (String) session.getAttribute("userId");
    if (author == null) {
        response.sendRedirect(request.getContextPath() + "/jsp/main.jsp");
        return;
    }

    String postId = request.getParameter("postId");
    String commentText = request.getParameter("comment");

    String driver = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/odbo?serverTimezone=UTC";
    String dbUser = "root";
    String dbPass = "123456";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName(driver);
        conn = DriverManager.getConnection(url, dbUser, dbPass);

        String sql = "INSERT INTO comments(post_id, author, comment_text, created_at) VALUES(?, ?, ?, NOW())";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(postId));
        pstmt.setString(2, author);
        pstmt.setString(3, commentText);
        pstmt.executeUpdate();

        response.sendRedirect(request.getContextPath() + "/jsp/postDetail.jsp?postId=" + postId);
    } catch (Exception e) {
        e.printStackTrace();
        out.println("댓글 저장 중 오류가 발생했습니다: " + e.getMessage());
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (Exception ignored) {}
        if (conn != null) try { conn.close(); } catch (Exception ignored) {}
    }
%>
