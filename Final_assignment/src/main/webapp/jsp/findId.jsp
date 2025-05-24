<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
    <script>
    function checkForm() {
        var userName = document.findForm.userName.value;
        var userMAIL = document.findForm.userMAIL.value;

        var emailPattern = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;

        if (userName.trim() === "") {
            alert("이름을 입력해주세요.");
            document.findForm.userName.focus();
            return false;
        }

        if (!emailPattern.test(userMAIL)) {
            alert("올바른 이메일 형식을 입력해주세요.");
            document.findForm.userMAIL.focus();
            return false;
        }

        return true;
    }
    </script>
</head>
<body>

    <div align="center">
        <form action="findAccountProcess.jsp" method="post" name="findForm" onsubmit="return checkForm()">
            <fieldset style="width:300px">
                <legend>아이디 찾기</legend><br>

                이름 : <br>
                <input type="text" name="userName" style="width:100%; height:30px;"><br><br>

                이메일 : <br>
                <input type="email" name="userMAIL" style="width:100%; height:30px;"><br><br>

                <input type="submit" value="아이디 찾기">
            </fieldset>
        </form>

        <p>
            <a href="login.jsp">로그인</a> |
            <a href="signup.jsp">회원가입</a>
        </p>
    </div>

</body>
</html>
