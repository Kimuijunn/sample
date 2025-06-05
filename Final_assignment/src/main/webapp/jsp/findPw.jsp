<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
    <script>
        function checkPwForm() {
            var userID = document.findPwForm.userID.value;
            var userMAIL = document.findPwForm.userMAIL.value;

            var idPattern = /^[a-zA-Z0-9]{4,16}$/;
            var emailPattern = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;

            if (!idPattern.test(userID)) {
                alert("아이디는 영문자와 숫자로 4~16자까지 입력 가능합니다.");
                document.findPwForm.userID.focus();
                return false;
            }

            if (!emailPattern.test(userMAIL)) {
                alert("올바른 이메일 형식을 입력해주세요.");
                document.findPwForm.userMAIL.focus();
                return false;
            }

            return true;
        }
    </script>
</head>
<body>


<div>
    <form action="../process/findPwProcess.jsp" method="post" name="findPwForm" onsubmit="return checkPwForm()">
        <fieldset style="width:250px;">
            <legend>비밀번호 찾기</legend><p>

            아이디 :<br>
            <input type="text" name="userID"><br><br>

            이메일 :<br>
            <input type="email" name="userMAIL"><br><br>

            <input type="submit" value="비밀번호 찾기">
        </fieldset>
    </form>

    <p>
        <a href="main.jsp">로그인</a> |
        <a href="signup.jsp">회원가입</a>
    </p>
</div>

</body>
</html>
