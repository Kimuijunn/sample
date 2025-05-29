<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 가입</title>
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
                alert("올바른 이메일 형식을 입력해주세요.");
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
    <p style="color:red; text-align:center; font-weight:bold;"><%= msg %></p>
<%
    }
%>

<form action="../process/signupProcess.jsp" name="user_info" method="post" onsubmit="return checkFun()">
    <fieldset style="width:250px;">
        <legend>회원 가입</legend><p>

        아이디 :<br>
        <input type="text" name="userID"
            value="<%= request.getParameter("userID") != null ? request.getParameter("userID") : "" %>"><br><br>

        비밀번호 :<br>
        <input type="password" name="userPW"
            value="<%= request.getParameter("userPW") != null ? request.getParameter("userPW") : "" %>"><br><br>

        이름 :<br>
        <input type="text" name="userName"
            value="<%= request.getParameter("userName") != null ? request.getParameter("userName") : "" %>"><br><br>

        생년월일 (예: 20000101) :<br>
        <input type="text" name="userBirth" maxlength="8"
            value="<%= request.getParameter("userBirth") != null ? request.getParameter("userBirth") : "" %>"><br><br>

        성별 :<br>
        <input type="radio" name="userGender" value="남자" checked> 남자
        <input type="radio" name="userGender" value="여자"> 여자<br><br>

        이메일 :<br>
        <input type="email" name="userMAIL"
            value="<%= request.getParameter("userMAIL") != null ? request.getParameter("userMAIL") : "" %>"><br><br>

        <hr>

        <div align="center">
            <input type="submit" value="가입하기">
            &nbsp;&nbsp;
            <input type="reset" value="다시작성">
        </div><br>
    </fieldset>
</form>

</body>
</html>
