<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
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


<div>
    <form action="../process/findIdProcess.jsp" method="post" name="findIdForm" onsubmit="return checkForm()">
        <fieldset style="width:250px;">
            <legend>아이디 찾기</legend><p>

            이름 :<br>
            <input type="text" name="userName"><br><br>

            이메일 :<br>
            <input type="email" name="userMAIL"><br><br>

            <input type="submit" value="아이디 찾기">
        </fieldset>
    </form>

    <p>
        <a href="main.jsp">로그인</a> |
        <a href="signup.jsp">회원가입</a>
    </p>
</div>

</body>
</html>
