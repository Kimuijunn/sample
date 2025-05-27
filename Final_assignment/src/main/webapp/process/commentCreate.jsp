<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ page import="java.sql.*" %>
<%
    // 한글 인코딩
    request.setCharacterEncoding("UTF-8");

    // 세션에서 로그인한 사용자 ID 가져오기
    String author = (String) session.getAttribute("loginUserID");
    if (author == null) {
        // 로그인되지 않은 경우, 로그인 페이지로 이동
        response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
        return;
    }

    // 폼에서 전송된 값
    String postId = request.getParameter("postId");
    String commentText = request.getParameter("comment");

    // DB 연결 정보
    String driver = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/odbo?serverTimezone=UTC";
    String dbUser = "root";
    String dbPass = "123456";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName(driver);
        conn = DriverManager.getConnection(url, dbUser, dbPass);

        // 댓글 저장 쿼리
        String sql = "INSERT INTO comments(post_id, author, comment_text, created_at) VALUES(?, ?, ?, NOW())";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(postId));
        pstmt.setString(2, author);
        pstmt.setString(3, commentText);
        pstmt.executeUpdate();

        // 댓글 등록 후 상세 페이지로 리다이렉트
        response.sendRedirect(request.getContextPath() + "/jsp/postDetail.jsp?postId=" + postId);
    } catch (Exception e) {
        e.printStackTrace();
        out.println("댓글 저장 중 오류가 발생했습니다: " + e.getMessage());
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (Exception ignored) {}
        if (conn != null) try { conn.close(); } catch (Exception ignored) {}
    }
%>
