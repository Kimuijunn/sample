<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
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
        input[type="email"] {
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
        .error-msg {
            color: red;
            text-align: center;
            font-weight: bold;
            margin-bottom: 15px;
        }
    </style>
    <script>
        function checkForm() {
            var userName = document.findIdForm.userName.value;
            var userMAIL = document.findIdForm.userMAIL.value;

            var emailPattern = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;

            if (userName.trim() === "") {
                alert("이름을 입력해주세요.");
                document.findIdForm.userName.focus();
                return false;
            }

            if (!emailPattern.test(userMAIL)) {
                alert("올바른 이메일 형식을 입력해주세요.");
                document.findIdForm.userMAIL.focus();
                return false;
            }

            return true;
        }
    </script>
</head>
<body>

<%
    String msg = (String) request.getAttribute("msg");
    if (msg != null) {
%>
    <p class="error-msg"><%= msg %></p>
<%
    }
%>

    <div align="center">
        <form action="../process/findIdProcess.jsp" method="post" name="findIdForm" onsubmit="return checkForm()">
            <fieldset>
                <div class="title">아이디 찾기</div>

                <label for="userName">이름 :</label><br>
                <input type="text" name="userName" id="userName"><br>

                <label for="userMAIL">이메일 :</label><br>
                <input type="email" name="userMAIL" id="userMAIL"><br>

                <input type="submit" value="아이디 찾기">
            </fieldset>
        </form>

        <div class="link-group">
            <a href="main.jsp">로그인</a> |
            <a href="signup.jsp">회원가입</a>
        </div>
    </div>

</body>
</html>
