<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<form action="search2" method="GET">
		<div class="search2">
			<input type="text" name="keyword" placehodler="검색할 기업을 입력해주세요ㅕ">
			<input type="submit" value="search">
		</div>
	</form>
	<table border="1">
		<thead>
			<tr>
				<th>no.</th>
				<th>회사 이름</th>
				<th>회사 여부</th>
				<th>삭제</th>
				<th>상태 변경</th>
			</tr>
			<c:forEach items="${maList}" var="management" varStatus="count">
				<tr>
					<td>${count.index+1}</td>
					<td class="m_content">${management.m_content}</td>
					<td>${management.m_val}</td>

					<td><button class="click">삭제</button></td>
					<th><button class="click2">변경</button>
				</tr>
			</c:forEach>
		</thead>
	</table>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(
				function() {
					$('.click').click(
							function() {
								var m_content = $(this).closest('tr').find(
										'.m_content').text();
								location.href = "/company/delete?m_content="
										+ m_content;

							});
				});
		
		$(document).ready(
				function(){
					$('.click2').click(
						function(){
							var m_content=$(this).closest('tr').find('.m_content').text();
							console.log(m_content);
							$.ajax({
							      type: 'POST',
							      url: '/company/check2',
							      data: {'m_content' : m_content },
							      success: function(result) {
							        if (result === 1) {
							          location.href = "/company/update?m_content="+m_content;
							        } else {
							          location.href = "/company/update2?m_content="+m_content;
							        }
							      }
							      
							});
						});
				});
	</script>
</body>
</html>