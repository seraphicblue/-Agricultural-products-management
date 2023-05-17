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
	<form action="search" method="GET">
		<div class="search">
			<input type="text" name="keyword" placehodler="검색할 기업을 입력해주세요ㅕ">
			<button>검색</button>
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
					<th>추가</th>
				</tr>

				<c:forEach items="${mList}" var="user" varStatus="count">
					<tr>
						<td>${count.index+1}</td>
						<td class="username">${user.username}</td>
						<td>${user.gender}</td>
						<td>${user.age}</td>
						<td><button class="click">추가</button></td>
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
			$(".click").click(function() {				
				var username = $(this).parent().siblings('.username').text();
				$.ajax({
				      type: 'POST',
				      url: '/company/check',
				      data: {'username':username},
				      success: function(result) {
				        if (result === false) {
				          alert('이미 추가된 업체입니다.');
				        } else {
				          location.href = "/company/insert?id=" + username;
				        }
				      }
				      
				});
			});	
		});
	</script>
</body>
</html>