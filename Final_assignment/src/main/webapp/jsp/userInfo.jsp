<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 세션에서 사용자 정보 가져오기 (예시)
    String userId = (String) session.getAttribute("userId");
    String userName = (String) session.getAttribute("userName");
    String userBirth = (String) session.getAttribute("userBirth");
    String userGender = (String) session.getAttribute("userGender");
    String userEmail = (String) session.getAttribute("userMAIL");

    if (userId == null) userId = "";
    if (userName == null) userName = "";
    if (userBirth == null) userBirth = "";
    if (userGender == null) userGender = "남자";
    if (userEmail == null) userEmail = "";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내 정보</title>
    <style>
        .container {
            width: 500px;
            margin: 50px auto;
            font-family: sans-serif;
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
        }
        form {
            border: 1px solid #ccc;
            padding: 30px;
            border-radius: 8px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-top: 20px;
        }
        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            margin-top: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .buttons {
            text-align: right;
            margin-top: 30px;
        }
        .buttons input {
            padding: 10px 15px;
            font-weight: bold;
            font-size: 14px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-save {
            background-color: #4CAF50;
            color: white;
        }
        .btn-cancel {
            background-color: #ccc;
            color: #333;
            margin-left: 10px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>내 정보</h2>

    <form action="../process/userUpdate.jsp" method="post">
        <label for="userID">아이디</label>
        <input type="text" name="userID" id="userID" value="<%= userId %>" readonly>

        <label for="userPW">비밀번호 (수정 가능)</label>
        <input type="password" name="userPW" id="userPW" required>

        <label for="userName">이름</label>
        <input type="text" name="userName" id="userName" value="<%= userName %>" readonly>

        <label for="userBirth">생년월일</label>
        <input type="text" name="userBirth" id="userBirth" value="<%= userBirth %>" readonly>

        <label for="userGender">성별</label>
        <input type="text" name="userGender" id="userGender" value="<%= userGender %>" readonly>

        <label for="userMAIL">이메일</label>
        <input type="email" name="userMAIL" id="userMAIL" value="<%= userEmail %>" readonly>

        <div class="buttons">
            <input type="submit" value="비밀번호 수정" class="btn-save">
            <input type="button" value="취소" class="btn-cancel" onclick="history.back();">
        </div>
    </form>
</div>

</body>
</html>
