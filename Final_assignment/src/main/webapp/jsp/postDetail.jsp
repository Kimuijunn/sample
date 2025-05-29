<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");

    int postId = 0;
    try {
        postId = Integer.parseInt(request.getParameter("postId"));
    } catch (NumberFormatException e) {
        out.println("잘못된 게시글 번호입니다.");
        return;
    }

    String jdbcDriver = "com.mysql.cj.jdbc.Driver";
    String dbUrl = "jdbc:mysql://localhost:3306/odbo?useSSL=false&serverTimezone=Asia/Seoul";
    String dbUser = "root";
    String dbPass = "123456";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String title = "", content = "", imageName = "";
    int views = 0;
    Timestamp createdAt = null;

    try {
        Class.forName(jdbcDriver);
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);

        // 조회수 증가
        String updateSql = "UPDATE posts SET views = views + 1 WHERE post_id = ?";
        pstmt = conn.prepareStatement(updateSql);
        pstmt.setInt(1, postId);
        pstmt.executeUpdate();
        pstmt.close();

        // 게시글 가져오기
        String sql = "SELECT title, content, image_name, views, created_at FROM posts WHERE post_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, postId);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            title = rs.getString("title");
            content = rs.getString("content").replaceAll("\n", "<br>");
            imageName = rs.getString("image_name");
            views = rs.getInt("views");
            createdAt = rs.getTimestamp("created_at");
        } else {
            out.println("해당 게시글을 찾을 수 없습니다.");
            return;
        }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세보기</title>
    <style>
        .container { width: 800px; margin: 0 auto; font-family: sans-serif; }
        .title { font-size: 24px; font-weight: bold; margin-bottom: 10px; }
        .info { color: gray; margin-bottom: 20px; }
        .content { font-size: 16px; line-height: 1.6; margin-bottom: 30px; }
        .image { margin: 15px 0; }
        .back-button {
            display: inline-block;
            padding: 8px 15px;
            background-color: #4CAF50;
            color: white;
            border-radius: 5px;
            text-decoration: none;
        }
        .comment-box {
            border-top: 1px solid #ccc;
            padding-top: 20px;
            margin-top: 40px;
        }
        textarea { width: 100%; padding: 10px; font-size: 14px; }
        input[type="submit"] {
            margin-top: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            cursor: pointer;
        }
        .comment {
            margin-top: 20px;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="title"><%= title %></div>
    <div class="info">작성일: <%= createdAt %> | 조회수: <%= views %></div>

    <% if (imageName != null && !imageName.isEmpty()) { %>
        <div class="image">
            <img src="upload/images/<%= imageName %>" alt="첨부 이미지" width="400">
        </div>
    <% } %>

    <div class="content"><%= content %></div>

    <a href="postList.jsp" class="back-button">목록으로</a>

    <!-- 댓글 작성 폼 -->
    <div class="comment-box">
        <h3>댓글 작성</h3>
        <form action="<%= request.getContextPath() %>/process/commentCreate.jsp" method="post">
            <input type="hidden" name="postId" value="<%= postId %>">
            <textarea name="comment" rows="4" placeholder="댓글을 입력하세요" required></textarea><br>
            <input type="submit" value="댓글 작성">
        </form>

        <!-- 댓글 목록 출력 -->
        <h3>댓글 목록</h3>
        <%
            PreparedStatement commentStmt = null;
            ResultSet commentRs = null;

            String commentSql = "SELECT author, comment_text, created_at FROM comments WHERE post_id = ? ORDER BY comment_id ASC";
            commentStmt = conn.prepareStatement(commentSql);
            commentStmt.setInt(1, postId);
            commentRs = commentStmt.executeQuery();

            while (commentRs.next()) {
        %>
            <div class="comment">
                <strong><%= commentRs.getString("author") %></strong> 
                (<%= commentRs.getTimestamp("created_at") %>)<br>
                <%= commentRs.getString("comment_text").replaceAll("\n", "<br>") %>
            </div>
        <%
            }

            if (commentRs != null) try { commentRs.close(); } catch (SQLException e) {}
            if (commentStmt != null) try { commentStmt.close(); } catch (SQLException e) {}
        %>
    </div>
</div>
</body>
</html>
<%
    } catch (Exception e) {
        out.println("오류 발생: " + e.getMessage());
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>
