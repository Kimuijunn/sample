<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.File, java.nio.file.Paths, java.sql.*, jakarta.servlet.annotation.MultipartConfig, jakarta.servlet.http.Part" %>
<%@ page import="jakarta.servlet.ServletException" %>
<%
    // 한글 인코딩
    request.setCharacterEncoding("UTF-8");

    // 폼 데이터 수신
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    // DB 연결 정보
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

        // INSERT 쿼리 실행
        String sql = "INSERT INTO posts(title, content, views, rec_count) VALUES(?, ?, 0, 0)";
        pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        pstmt.setString(1, title);
        pstmt.setString(2, content);
        pstmt.executeUpdate();

        rsKeys = pstmt.getGeneratedKeys();
        if (rsKeys.next()) {
            postId = rsKeys.getInt(1);
        }
		//postDetail 완성 시 코드 바꾸기
        //response.sendRedirect(request.getContextPath() + "/jsp/postDetail.jsp?postId=" + postId);
        response.sendRedirect("../jsp/postList.jsp");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("게시글 등록 중 오류 발생: " + e.getMessage());
    } finally {
        if (rsKeys != null) try { rsKeys.close(); } catch (Exception ignored) {}
        if (pstmt != null) try { pstmt.close(); } catch (Exception ignored) {}
        if (conn != null) try { conn.close(); } catch (Exception ignored) {}
    }
%>