<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>답글 작성</title>
    <style>
        .orange{background-color: orange;}
        table{border-collapse: collapse;}
    </style>
</head>
<body>
<div id="center">
    <a href="../qnalist" style="color: black; text-decoration: none;">
        <h1>게시글 목록</h1>
    </a>
</div>
<form method="post" action="/normal/comment/${qna.qnaboardid}">
    <table border="1">
        <tr>
            <td class="orange">제목</td>
            <td><input name="subject" value="RE: ${qna.subject}" readonly/></td>
        </tr>
        <tr>
            <td class="orange">작성자</td>
            <td><input name="userid" value="${user.userid}" readonly></td>
        </tr>
        <tr>
            <td class="orange">내용</td>
            <td><textarea name="content" cols="40" rows="10"></textarea></td>
        </tr>

        <tr>
            <td colspan="2" align="center">
                <c:choose>
                    <c:when test="${qna.secret eq true}">
                        <input class="form-check-input" type="checkbox" name="secret" id="secret" checked="checked" disabled="disabled">
                    </c:when>
                    <c:otherwise>
                        <input class="form-check-input" type="checkbox" name="secret" id="secret" checked="checked">
                    </c:otherwise>
                </c:choose>
                <label class="form-check-label">비밀답글 설정</label>
                <input type="submit" value="답글 등록">
            </td>
        </tr>

    </table>
</form>
</body>
</html>
