<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%
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
    <script>
        function confirmDelete() {
            if (confirm("정말로 회원 탈퇴하시겠습니까? 탈퇴 시 복구할 수 없습니다.")) {
                location.href = "<%= request.getContextPath() %>/process/deleteUserProcess.jsp";
            }
        }
    </script>
</head>
<body>

<h2>내 정보</h2>

<form>
    <p>
        <label for="userID">아이디</label><br>
        <input type="text" name="userID" id="userID" value="<%= userId %>" readonly>
    </p>

    <p>
        <label for="userPW">비밀번호</label><br>
        <input type="text" name="userPW" id="userPW" value="<%= userPw %>" readonly>
    </p>

    <p>
        <label for="userName">이름</label><br>
        <input type="text" name="userName" id="userName" value="<%= userName %>" readonly>
    </p>

    <p>
        <label for="userBirth">생년월일</label><br>
        <input type="text" name="userBirth" id="userBirth" value="<%= userBirth %>" readonly>
    </p>

    <p>
        <label for="userGender">성별</label><br>
        <input type="text" name="userGender" id="userGender" value="<%= userGender %>" readonly>
    </p>

    <p>
        <label for="userMAIL">이메일</label><br>
        <input type="email" name="userMAIL" id="userMAIL" value="<%= userEmail %>" readonly>
    </p>

    <p>
        <input type="button" value="뒤로가기" onclick="history.back();">
        <input type="button" value="회원 탈퇴" onclick="confirmDelete();">
    </p>
</form>

</body>
</html>
