<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");

    // 세션에서 사용자 이름, 이메일, ID 가져오기
    String userName = (String) session.getAttribute("userName");
    String userEmail = (String) session.getAttribute("userMAIL");
    String userId = (String) session.getAttribute("userId");

    // DB 연결 정보
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
    <style>
        body { font-family: sans-serif; }
        .container { width: 900px; margin: 0 auto; }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
            margin-bottom: 30px;
        }
        .title { font-size: 28px; font-weight: bold; }
        .user-box {
            border: 1px solid #ccc;
            padding: 15px 20px;
            border-radius: 8px;
            width: 250px;
        }
        .user-box p { margin: 5px 0; font-size: 14px; }
        .user-box .buttons {
            margin-top: 10px;
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }
        .user-box .buttons a {
            text-decoration: none;
            padding: 5px 10px;
            background-color: #4CAF50;
            color: white;
            border-radius: 5px;
            font-size: 13px;
        }
        .search-bar {
            text-align: right;
            margin-bottom: 15px;
        }
        .search-bar input[type="text"] {
            height: 30px;
            padding: 5px;
            font-size: 14px;
        }
        .search-bar input[type="submit"] {
            height: 34px;
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 0 12px;
            cursor: pointer;
            font-weight: bold;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table th, table td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }
        table th { background-color: #f8f8f8; }
        .btn-write {
            float: right;
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            font-weight: bold;
            border-radius: 5px;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="container">

    <div class="header">
        <div class="title">자유 게시판</div>
        <div class="user-box">
            <p><strong><%= userName %></strong> 님</p>
            <p><%= userEmail %></p>
            <div class="buttons">
                <a href="userInfo.jsp">내 정보</a>
                <a href="logout.jsp">로그아웃</a>
                <% if ("admin".equals(userId)) { %>
                    <a href="../process/adminUserList.jsp" style="background-color: #FF9800;">회원 정보 확인</a>
                <% } %>
            </div>
        </div>
    </div>

    <form action="postList.jsp" method="get" class="search-bar">
        <input type="text" name="search" placeholder="검색어 입력">
        <input type="submit" value="검색">
    </form>

    <table>
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

    <a href="postForm.jsp" class="btn-write">글쓰기</a>
</div>
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
