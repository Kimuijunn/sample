<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
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
    <p>회원 가입 성공!</p>
<%
    }
%>

<div>
    <form action="../process/loginProcess.jsp" name="user_info" method="post" onsubmit="return checkLogin()">
        <fieldset style="width:230px">
            <legend>로그인</legend>

            <label for="userID">아이디 :</label><br>
            <input type="text" name="userID" id="userID"><br><br>

            <label for="userPW">비밀번호 :</label><br>
            <input type="password" name="userPW" id="userPW"><br><br>

            <input type="submit" value="로그인">
        </fieldset>
    </form>

    <p>
        <a href="findId.jsp">아이디 찾기</a> |
        <a href="findPw.jsp">비밀번호 찾기</a> |
        <a href="signup.jsp">회원가입</a>
    </p>
</div>

</body>
</html>
