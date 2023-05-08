<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!--
   Date    : 2023.05.06
   name    : management
   type    : jsp
   ver     : 1.0
   conect  : managment searchjsp
   content : 유의 업체 검색결과 사이트
   writer  : 고상원
   api     : x
  -->
  
<title>검색 결과</title>
</head>
<body>
	<form action="search2" method="GET">
		<div class="search2">
			<input type="text" name="keyword" placehodler="검색할 기업을 입력해주세요ㅕ">
			<button>검색</button>
		</div>
	</form>
	<div id="center">
		<h1>${keyword}로검색한결과입니다. 222222</h1>
		<c:if test="${count != 0 }">
			<table border="1">
				<tr>
					<th>no.</th>
					<th>내 아이디</th>
					<th>회사 여부</th>
					<th>회사 이름</th>
					<th> 삭제</th>
				</tr>
				
				<c:forEach items="${dList}" var="management" varStatus="count">
					<tr>
						<td>${count.index+1}</td>
						<td >${management.userid}</td>
						<td>${management.m_val}</td>
						<td class="m_content">${management.m_content}</td>
						<td><button class="click">삭제</button></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<c:if test="${count == 0 }">
		검색 조건에 맞는 글이 없습니다.
		</c:if>
	
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	$(document).ready(function() {
	    $('.click').click(function() {
	    	var m_content = $(this).closest('tr').find('.m_content').text();
	        location.href="/company/delete?m_content="+m_content;
	    	
	    });
	});
	</script>
</body>
</html>