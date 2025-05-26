<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 작성</title>
    <style>
        .container {
            width: 700px;
            margin: 50px auto;
            font-family: sans-serif;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
        }
        form {
            border: 1px solid #ccc;
            padding: 30px;
            border-radius: 8px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-top: 20px;
        }
        input[type="text"], input[type="file"], textarea {
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        textarea {
            height: 200px;
            resize: vertical;
        }
        .buttons {
            text-align: right;
            margin-top: 25px;
        }
        .buttons input, .buttons a {
            padding: 10px 15px;
            margin-left: 10px;
            font-size: 14px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
        .btn-submit {
            background-color: #4CAF50;
            color: white;
        }
        .btn-cancel {
            background-color: #ccc;
            color: #333;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>게시글 작성</h2>

    <form action="../process/postCreate.jsp" method="post" enctype="multipart/form-data">
        <label for="title">제목</label>
        <input type="text" name="title" id="title" required>

        <label for="content">내용</label>
        <textarea name="content" id="content" required></textarea>

        <label for="uploadFile">이미지 첨부</label>
        <input type="file" name="uploadFile" id="uploadFile" accept="image/*">

        <div class="buttons">
            <input type="submit" value="등록" class="btn-submit">
            <a href="postList.jsp" class="btn-cancel">목록으로</a>
        </div>
    </form>
</div>

</body>
</html>
