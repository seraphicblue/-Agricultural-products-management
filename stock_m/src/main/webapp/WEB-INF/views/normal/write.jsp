<!--
Date    : 2023.05.06
name    : Boardwrite.jsp
type    : Board
ver     : 1.0
conect  : BoardController
content : 글 작성
writer  : 최우영
api     : x
-->
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>글쓰기</title>
    <style>
        .orange{background-color: orange;}
        table{border-collapse : collapse;}
    </style>
</head>
<body>
<div id="center">
    <a href="list" style="color: black; text-decoration: none;">
        <h1>게시글 목록</h1>
    </a>

    </div>
<form method="post" id="writeform">
    <table border="1">
        <tr>
            <td class="orange">제목</td>
            <td><input name="subject"/></td>
        </tr>
        <tr>
            <td class="orange">작성자</td>
            <td><input name="userid" value=${user.userid} readonly></td>
        </tr>
        <tr>
            <td class="orange">내용</td>
            <td><textarea name="content" cols="40" rows="10"></textarea></td>
        </tr>

        <tr>    
            <td colspan="2" align="center"> 
            <input class="form-check-input" type="checkbox" name="secret" id="secret">
   			<label class="form-check-label">비밀글 설정</label>
                <input type="submit" value="새글 등록">
            </td>
        </tr>
    </table>

</form>

</body>
</html>