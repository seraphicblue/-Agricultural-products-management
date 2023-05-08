<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>검색 결과</title>
</head>
<body>
	<form action="search">
		<div class="search">
			<input type="text" name="keyword" placehodler="검색할 기업을 입력해주세요ㅕ">
			<input type="submit" value="search">
		</div>
	</form>
	<div id="center">
		<h1>${keyword}로검색한결과입니다.</h1>

		<c:if test="${count != 0 }">
			<table border="1">
				<tr>
					<th>no.</th>
					<th>회사 명</th>
					<th>회사 홈페이지</th>
					<th>사업자 번호</th>
				</tr>
				<c:forEach items="${mList}" var="user">
					<tr>
						<td>${user.mno}</td>
						<td>${user.userid}</td>
						<td>${user.m_val}</td>
						<td>${user.m_content}</td>
					</tr>
				</c:forEach>
			</table>

		</c:if>
		<c:if test="${count == 0 }">
		검색 조건에 맞는 글이 없습니다.
		</c:if>

	</div>
</body>
</html>