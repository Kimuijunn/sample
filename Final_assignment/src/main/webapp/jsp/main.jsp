<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <style>
        fieldset {
            width: 400px;
            text-align: left;
            padding: 20px;
        }
        .title {
            text-align: center;
            font-weight: bold;
            font-size: 24px;
            margin-bottom: 20px;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            height: 40px;
            margin-top: 5px;
            margin-bottom: 20px;
            font-size: 16px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            height: 45px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            font-weight: bold;
            font-size: 16px;
            border-radius: 5px;
        }
        .link-group {
            text-align: center;
            margin-top: 20px;
        }
        .link-group a {
            color: #555;
            text-decoration: none;
            margin: 0 10px;
            font-size: 14px;
        }
        .link-group a:hover {
            text-decoration: underline;
        }
        .success-msg {
            color: green;
            text-align: center;
            font-weight: bold;
            margin-bottom: 15px;
        }
    </style>
    <script>
        function checkLogin() {
            var userID = document.user_info.userID.value;
            var userPW = document.user_info.userPW.value;

            var idPattern = /^[a-zA-Z0-9]{4,16}$/;
            var pwPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;

            if (!idPattern.test(userID)) {
                alert("아이디는 영문자와 숫자로 4~16자까지 입력 가능합니다.");
                document.user_info.userID.focus();
                return false;
            }

            if (!pwPattern.test(userPW)) {
                alert("비밀번호는 영문자, 숫자, 특수문자를 포함한 8~16자로 입력해주세요.");
                document.user_info.userPW.focus();
                return false;
            }

            return true;
        }
    </script>
</head>
<body>

<%
    String msg = request.getParameter("msg");
    if ("success".equals(msg)) {
%>
    <p class="success-msg">회원 가입 성공!</p>
<%
    }
%>

    <div align="center">
        <form action="loginProcess.jsp" name="user_info" method="post" onsubmit="return checkLogin()">
            <fieldset>
                <div class="title">로그인</div>

                <label for="userID">아이디 :</label><br>
                <input type="text" name="userID" id="userID"><br>

                <label for="userPW">비밀번호 :</label><br>
                <input type="password" name="userPW" id="userPW"><br>

                <input type="submit" value="로그인">
            </fieldset>
        </form>

        <div class="link-group">
            <a href="findId.jsp">아이디 찾기</a> |
            <a href="findPw.jsp">비밀번호 찾기</a> |
            <a href="signup.jsp">회원가입</a>
        </div>
    </div>

</body>
</html>
