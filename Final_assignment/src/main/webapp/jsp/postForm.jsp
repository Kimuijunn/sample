<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 작성</title>
</head>
<body>

<h2>게시글 작성</h2>

<form action="../process/postCreate.jsp" method="post" enctype="multipart/form-data">
    <label for="title">제목:</label><br>
    <input type="text" name="title" id="title" required><br><br>

    <label for="content">내용:</label><br>
    <textarea name="content" id="content" rows="10" cols="60" required></textarea><br><br>

    <label for="uploadFile">이미지 첨부:</label><br>
    <input type="file" name="uploadFile" id="uploadFile" accept="image/*"><br><br>

    <input type="submit" value="등록">
    <a href="postList.jsp">목록으로</a>
</form>

</body>
</html>
