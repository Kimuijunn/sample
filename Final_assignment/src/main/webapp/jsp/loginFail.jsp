<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 실패</title>
    <style>
        fieldset {
            width: 400px;
            text-align: center;
            padding: 30px;
        }
        .title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .error-msg {
            color: red;
            font-weight: bold;
            font-size: 16px;
            margin-bottom: 25px;
        }
        .btn {
            width: 100%;
            height: 45px;
            background-color: #4CAF50;
            color: white;
            border: none;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div align="center">
    <fieldset>
        <div class="title">로그인 실패</div>
        <p class="error-msg">아이디 또는 비밀번호가 올바르지 않습니다.</p>

        <form action="main.jsp" method="get">
            <input type="submit" class="btn" value="다시 로그인하기">
        </form>
    </fieldset>
</div>

</body>
</html>
