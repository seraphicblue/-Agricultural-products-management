<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>글쓰기</title>
    <style>
        .orange{background-color: #7fad39;}
        table{border-collapse : collapse;}
    </style>
</head>

<body>
<div id="center">
    <a href="qnalist" style="color: black; text-decoration: none;">
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
                <c:choose>
                    <c:when test="${user.role ne 'admin'}">
                        <input class="form-check-input" type="checkbox" name="secret" id="secret" checked="checked" hidden>
                                        
                    </c:when>
                    <c:otherwise>
                        <input class="form-check-input" type="checkbox" name="secret" id="secret">
                        <label class="form-check-label">비밀글 설정</label>
                    </c:otherwise>
                </c:choose>

                <input type="submit" value="새글 등록">
            </td>
        </tr>
        
    </table>

</form>

</body>
</html>