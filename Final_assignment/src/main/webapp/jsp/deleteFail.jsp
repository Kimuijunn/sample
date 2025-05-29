<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 탈퇴 실패</title>
    <style>
        body {
            font-family: sans-serif;
            text-align: center;
            margin-top: 100px;
        }
        .message {
            font-size: 20px;
            margin-bottom: 20px;
            color: red;
        }
        a {
            text-decoration: none;
            background-color: #ccc;
            color: #333;
            padding: 10px 20px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="message">회원 탈퇴 중 오류가 발생했습니다.<br>다시 시도해 주세요.</div>
    <a href="<%= request.getContextPath() %>/jsp/userInfo.jsp">내 정보로 돌아가기</a>
</body>
</html>
