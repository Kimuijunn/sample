<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%
    session.invalidate(); // 세션 초기화
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 탈퇴 완료</title>
    <style>
        body {
            font-family: sans-serif;
            text-align: center;
            margin-top: 100px;
        }
        .message {
            font-size: 20px;
            margin-bottom: 20px;
        }
        a {
            text-decoration: none;
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="message">회원 탈퇴가 정상적으로 완료되었습니다.</div>
    <a href="<%= request.getContextPath() %>/jsp/main.jsp">메인으로 이동</a>
</body>
</html>
