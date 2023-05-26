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
    <a href="../list" style="color: black; text-decoration: none;">
        <h1>게시글 목록</h1>
    </a>

    </div>
<table border="1">
    <tr><td>제목</td><td>${dto.subject}</td>
    <tr><td>작성자</td><td>${dto.userid}</td>
    <tr><td>내용</td><td>${dto.content}</td>
    <tr><td>등록일</td><td><fmt:formatDate value="${dto.regdate }" dateStyle="long"/></td>
    <tr><td>조회수</td><td>${dto.readcount}</td>
    <tr><td colspan="2" align="right">
        <c:if test="${user.userid == dto.userid}">
            <a href="/normal/update/${dto.boardno}">글 수정 </a>
            <a id="${dto.boardno}" href="#">글 삭제</a>
        </c:if>
        <a href="../list">목록 이동</a>
    </td></tr>
</table>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(function(){
        $("a[id]").click(function(){
            let boardno = $(this).attr("id");
            $.ajax({url:"/normal/delete", data:"boardno="+boardno, method:"delete"}
            ).done(function(){
                location.href="/normal/list";
            })
            return false;
        })//click
    })//ready

</script>
</body>
</html>
