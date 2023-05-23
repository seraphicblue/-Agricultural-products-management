<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!--  bList begin end count pageNum totalPages -->
<title>글 목록</title>
<style>
#center {
	width: 700px;
	margin-left: auto;
	margin-right: auto;
}

table {
	border: 1px solid black;
	width: 700px;
	border-collapse: collapse;
}

th {border: 1px solid black;
	background-color: yellow;
	width: 150px;
}
td{border: 1px solid black;}
a {
	margin: 10px auto;
}

#page {
	text-align: center;
}
</style>
</head>
<body>
	<div id="center">
		<h1>장부확인</h1>
			<div id="search" align="right">
	<form action="search">
		<input type="text" name="search" size="15" maxlength="50" /> 
		<input type="submit" value="거래 검색" />
	</form>	
</div>
		

		<c:if test="${count != 0 }">
			<table>
				<tr>
					<th>장부번호</th>
					<th>한도</th>
					<th>업체아이디</th>
					<th>구매액</th>
					<th>판매액</th>
				</tr>
				<c:forEach items="${rlist}" var="revenue">
					<tr>
						<td><a href ="content/${revenue.rno}">${revenue.rno}</a></td><!-- 상세보기 -->
						<td>${revenue.userid }</td>
						<%-- <td><fmt:formatDate value="${revenue.regdate }" dateStyle="short"/> </td> --%>
						<td>${revenue.rlimit }</td>
						<td>${revenue.bsum }</td>
						<td>${revenue.ssuum }</td>
					</tr>
				</c:forEach>
			</table>
			<div id="page">
				<c:if test="${begin > pageNum }"><!-- 앞번호들이존재한다면 -->
					<a href="list?p=${begin-1 }">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="list?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="list?p=${end+1}">[다음]</a>
				</c:if>
			</div>

		</c:if>
		<c:if test="${count == 0 }">
	아직 입력한 글이 없습니다.
</c:if>
</div>
</body>
</html>
