
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Insert title here</title>
</head>
<body>
<div id="center">
    <a href="../qnalist" style="color: black; text-decoration: none;">
        <h1>게시글 목록</h1>
    </a>

    </div>
<form method="post" id="qnaupdate" action="/normal/qnaupdate" >
    <input type="hidden" name="_method" value="put">
    <table border="1">
        <tr>
            <td class="orange">제목</td>
            <td><input name="subject" value="${dto.subject }"/>
                <input name="qnaboardid" value="${dto.qnaboardid}" type="hidden">
            </td>
        </tr>
        <tr>
            <td class="orange">작성자</td>
            <td><input name="userid" value="${dto.userid}" readonly></td>
        </tr>
        <tr>
            <td class="orange">내용</td>
            <td><textarea name="content" cols="40" rows="10">${dto.content}</textarea></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="글 수정 완료">
            </td>
        </tr>
    </table>

</form>
</body>
</html>