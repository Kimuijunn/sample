<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    String userName = (String) session.getAttribute("userName");
    String userEmail = (String) session.getAttribute("userMAIL");
    String userId = (String) session.getAttribute("userId");

    String jdbcDriver = "com.mysql.cj.jdbc.Driver";
    String dbUrl = "jdbc:mysql://localhost:3306/odbo?useSSL=false&serverTimezone=Asia/Seoul";
    String dbUser = "root";
    String dbPass = "123456";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName(jdbcDriver);
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);

        String sql = "SELECT post_id, title, created_at, views FROM posts ORDER BY post_id DESC";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자유 게시판</title>
</head>
<body>

<h1 style="text-align: center;">자유 게시판</h1>

<!-- 사용자 정보 -->
<div>
    <p><strong><%= userName %></strong> 님</p>
    <p><%= userEmail %></p>
    <p>
        <a href="userInfo.jsp">내 정보</a>
        <a href="logout.jsp">로그아웃</a>
        <% if ("admin".equals(userId)) { %>
            <a href="../process/adminUserList.jsp">회원 정보 확인</a>
        <% } %>
    </p>
</div>

<!-- 검색창 -->
<form action="postList.jsp" method="get">
    <input type="text" name="search" placeholder="검색어 입력">
    <input type="submit" value="검색">
</form>

<!-- 게시글 목록 테이블 -->
<table border="1" width="100%" cellpadding="10" cellspacing="0">
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성일</th>
        <th>조회수</th>
    </tr>
    <%
        while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt("post_id") %></td>
        <td><a href="postDetail.jsp?postId=<%= rs.getInt("post_id") %>"><%= rs.getString("title") %></a></td>
        <td><%= rs.getTimestamp("created_at") %></td>
        <td><%= rs.getInt("views") %></td>
    </tr>
    <%
        }
    %>
</table>

<!-- 글쓰기 버튼 -->
<p style="text-align: right;">
    <a href="postForm.jsp">글쓰기</a>
</p>

</body>
</html>
<%
    } catch (Exception e) {
        out.println("DB 오류 발생: " + e.getMessage());
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>
