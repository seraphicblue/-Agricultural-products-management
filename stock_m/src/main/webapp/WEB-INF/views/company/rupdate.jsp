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
	background-color: orange;
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
<form method="post" id="updateform" action="/company/confirm" >
<input type="hidden" name="_method" value="put">
	
		<h1>수정화면</h1>
			<table>
				<tr>
					<th>날짜</th>
					<th>거래번호</th>
					<th>물품번호</th>
					<th>금액</th>
						
				
					<tr>
					<td><fmt:formatDate value="${sell.sdate}" dateStyle="short"  readonly/></td>
					<td><input name="sno" value="${sell.sno}"> </td>
						<td><input name="pno" value="${sell.pno }"></td>
						<td><input name="scount" value="${sell.scount }"></td>
					</tr>
					<tr>
			<td colspan="2" align="center">
				<input type="button" id="save" value="글 수정 완료"> 
			</td>
		</tr>
				</table>
				</form>

</body>
</html>