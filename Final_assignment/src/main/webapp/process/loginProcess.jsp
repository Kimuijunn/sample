<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");

    String u_id = request.getParameter("userID");
    String u_pw = request.getParameter("userPW");

    String driver = "com.mysql.cj.jdbc.Driver";
    String url    = "jdbc:mysql://localhost:3306/odbo";
    String dbUser = "root";
    String dbPass = "123456";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName(driver);
        conn = DriverManager.getConnection(url, dbUser, dbPass);

        String sql = "SELECT id, name, email, birth, gender FROM members WHERE id = ? AND passwd = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, u_id);
        pstmt.setString(2, u_pw);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            session.setAttribute("userId", rs.getString("id"));
            // 비밀번호 추가!
            session.setAttribute("userPW", u_pw);
            session.setAttribute("userName", rs.getString("name"));
            session.setAttribute("userMAIL", rs.getString("email"));
            session.setAttribute("userBirth", rs.getString("birth"));
            session.setAttribute("userGender", rs.getString("gender"));

            response.sendRedirect(request.getContextPath() + "/jsp/postList.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/jsp/loginFail.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect(request.getContextPath() + "/jsp/loginFail.jsp");
    } finally {
        if (rs != null)    try { rs.close();    } catch (Exception ignored) {}
        if (pstmt != null) try { pstmt.close(); } catch (Exception ignored) {}
        if (conn != null)  try { conn.close();  } catch (Exception ignored) {}
    }
%>
