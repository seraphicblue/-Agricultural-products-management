<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<form action="search" method="GET">
		<div class="search">
			<input type="text" name="keyword" placehodler="검색할 기업을 입력해주세요ㅕ">
			<input type="submit" value="search">
		</div>
	</form>
	<table border="1">
		<thead>
			<tr>
				<th>no.</th>
				<th>회사 명</th>
				<th>회사 홈페이지</th>
				<th>사업자 번호</th>
				<th>추가</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${UList}" var="user" varStatus="count">
					<tr>
						<td>${count.index+1}</td>
						<td class="username">${user.username}</td>
						<td>${user.gender}</td>
						<td>${user.age}</td>
						<td><button class="click">추가</button></td>
					</tr>
				</c:forEach>
		</tbody>
	</table>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	$(document).ready(function() {
		$(".click").click(function() {				
			var username = $(this).parent().siblings('.username').text();
			alert(username);
			$.ajax({
			      type: 'POST',
			      url: '/company/check',
			      data: {'username':username},
			      success: function(result) {
			        if (result === false) {
			          alert('중복된 값이 존재합니다.');
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