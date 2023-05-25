<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>글 상세보기</title>
</head>
<body>
<div id="center">
    <a href="../qnalist" style="color: black; text-decoration: none;">
        <h1>게시글 목록</h1>
    </a>
</div>
<table border="1">
    <tr><td>제목</td><td>${dto.subject}</td></tr>
    <tr><td>작성자</td><td>${dto.userid}</td></tr>
    <tr><td>내용</td><td>${dto.content}</td></tr>
    <tr><td>등록일</td><td><fmt:formatDate value="${dto.regdate}" dateStyle="long"/></td></tr>
    <tr><td>조회수</td><td>${dto.readcount}</td></tr>
    <tr>
        <td colspan="2" align="right">
            <c:if test="${user.userid == dto.userid}">
                <a href="/normal/qnaupdate/${dto.qnaboardid}">글 수정</a>
                <a id="${dto.qnaboardid}" href="#" class="delete-link">글 삭제</a>
            </c:if>
            <a href="/normal/comment/${dto.qnaboardid}">답글 작성</a>
            <a href="../qnalist">목록 이동</a>
        </td>
    </tr>
</table>

<!-- 답글 표시 -->
<table border="1">
    <thead>
        <tr>
            <th>답글 제목</th>
            <th>작성자</th>
            <th>내용</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="comment" items="${commentList}">
            <tr>
                <td>${comment.subject}</td>
                <td>${comment.userid}</td>
                <td>${comment.content}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(function(){
        $(".delete-link").click(function(){
            let qnaboardid = $(this).attr("id");
            $.ajax({
                url: "/normal/qnadelete/" + qnaboardid,
                method: "DELETE"
            }).done(function(){
                location.href = "/normal/qnalist";
            });
            return false;
        });
    });
</script>
</body>
</html>