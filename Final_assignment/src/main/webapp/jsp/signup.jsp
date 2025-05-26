<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 가입</title>
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
        input[type="password"],
        input[type="email"] {
            width: 100%;
            height: 40px;
            margin-top: 5px;
            margin-bottom: 20px;
            font-size: 16px;
            box-sizing: border-box;
        }
        input[type="radio"] {
            margin-right: 5px;
            font-size: 16px;
        }
        .btn-submit {
            width: 45%;
            height: 45px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            font-weight: bold;
            font-size: 16px;
            border-radius: 5px;
        }
        .btn-reset {
            width: 45%;
            height: 45px;
            background-color: #ccc;
            color: black;
            border: none;
            cursor: pointer;
            font-weight: bold;
            font-size: 16px;
            border-radius: 5px;
        }
        .error-msg {
            color: red;
            text-align: center;
            font-weight: bold;
            margin-bottom: 15px;
        }
    </style>
    <script>
        function checkFun() {
            var userID = document.user_info.userID.value;
            var userPW = document.user_info.userPW.value;
            var userBirth = document.user_info.userBirth.value;
            var userEmail = document.user_info.userMAIL.value;

            var idPattern = /^[a-zA-Z0-9]{4,16}$/;
            var pwPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
            var birthPattern = /^[0-9]{8}$/;
            var emailPattern = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;

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

            if (!birthPattern.test(userBirth)) {
                alert("생년월일은 숫자 8자리로 입력해주세요. (예: 20000101)");
                document.user_info.userBirth.focus();
                return false;
            }

            if (!emailPattern.test(userEmail)) {
                alert("올바른 이메일 형식을 입력해주세요. (예: user@example.com)");
                document.user_info.userMAIL.focus();
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
        <form action="../process/signupProcess.jsp" name="user_info" method="post" onsubmit="return checkFun()">
            <fieldset>
                <div class="title">회원 가입</div>

                <label for="userID">아이디 :</label><br>
                <input type="text" name="userID" id="userID"
                    value="<%= request.getParameter("userID") != null ? request.getParameter("userID") : "" %>"><br>

                <label for="userPW">비밀번호 :</label><br>
                <input type="password" name="userPW" id="userPW"
                    value="<%= request.getParameter("userPW") != null ? request.getParameter("userPW") : "" %>"><br>

                <label for="userName">이름 :</label><br>
                <input type="text" name="userName" id="userName"
                    value="<%= request.getParameter("userName") != null ? request.getParameter("userName") : "" %>"><br>

                <label for="userBirth">생년월일 (8자리, 예: 20000101) :</label><br>
                <input type="text" name="userBirth" id="userBirth" maxlength="8"
                    value="<%= request.getParameter("userBirth") != null ? request.getParameter("userBirth") : "" %>"><br>

                <label>성별 :</label><br>
                <input type="radio" name="userGender" value="남자" checked> 남자
                <input type="radio" name="userGender" value="여자"> 여자<br><br>

                <label for="userMAIL">이메일 :</label><br>
                <input type="email" name="userMAIL" id="userMAIL"
                    value="<%= request.getParameter("userMAIL") != null ? request.getParameter("userMAIL") : "" %>"><br>

                <div style="text-align: center; margin-top: 20px;">
                    <input type="submit" value="가입하기" class="btn-submit">
                    <input type="button" value="다시 작성" class="btn-reset"
                        onclick="window.location.href='${pageContext.request.contextPath}/jsp/signup.jsp'">
                </div>
            </fieldset>
        </form>
    </div>
</body>
</html>
