<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%
    session.invalidate(); // 세션 초기화
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 탈퇴 완료</title>
</head>
<body>

<h2>회원 탈퇴가 정상적으로 완료되었습니다.</h2>

<p>
    <a href="<%= request.getContextPath() %>/jsp/main.jsp">메인으로 이동</a>
</p>

</body>
</html>
