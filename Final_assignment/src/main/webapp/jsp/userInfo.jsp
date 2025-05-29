<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%
    // 세션에서 사용자 정보 가져오기
    String userId = (String) session.getAttribute("userId");
    String userPw = (String) session.getAttribute("userPW");   
    String userName = (String) session.getAttribute("userName");
    String userBirth = (String) session.getAttribute("userBirth");
    String userGender = (String) session.getAttribute("userGender");
    String userEmail = (String) session.getAttribute("userMAIL");
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
        .btn-back {
            background-color: #4CAF50;
            color: white;
        }
        .btn-delete {
            background-color: #f44336;
            color: white;
            margin-left: 10px;
        }
    </style>
    <script>
        function confirmDelete() {
            if (confirm("정말로 회원 탈퇴하시겠습니까? 탈퇴 시 복구할 수 없습니다.")) {
                location.href = "<%= request.getContextPath() %>/process/deleteUser.jsp";
            }
        }
    </script>
</head>
<body>

<div class="container">
    <h2>내 정보</h2>

    <form>
        <label for="userID">아이디</label>
        <input type="text" name="userID" id="userID" value="<%= userId %>" readonly>

        <label for="userPW">비밀번호</label>
        <input type="text" name="userPW" id="userPW" value="<%= userPw %>" readonly>

        <label for="userName">이름</label>
        <input type="text" name="userName" id="userName" value="<%= userName %>" readonly>

        <label for="userBirth">생년월일</label>
        <input type="text" name="userBirth" id="userBirth" value="<%= userBirth %>" readonly>

        <label for="userGender">성별</label>
        <input type="text" name="userGender" id="userGender" value="<%= userGender %>" readonly>

        <label for="userMAIL">이메일</label>
        <input type="email" name="userMAIL" id="userMAIL" value="<%= userEmail %>" readonly>

        <div class="buttons">
            <input type="button" value="뒤로가기" class="btn-back" onclick="history.back();">
            <input type="button" value="회원 탈퇴" class="btn-delete" onclick="confirmDelete();">
        </div>
    </form>
</div>

</body>
</html>
