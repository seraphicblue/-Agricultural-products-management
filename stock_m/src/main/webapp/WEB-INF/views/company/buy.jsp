<!--
	Date    : 2023.05.06
	name    : sell
	type    : jsp
	ver     : 1.0
	conect  : SabController
	content : 관리 시스템 물품 판매 등록 페이지
	writer  : 김재영
	api     : x
  -->
  
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>구매 페이지</title>
</head>
<body>
<form action="insert" method="post" id="buyform">
	<table>
		<tr><td><h2>발주</h2></td></tr>
		<tr>
		<td>상품명</td>
		<td><select>
			<option>--------------------</option>
			<c:forEach items="${npList}" var="np">
						<option>${np.scontent}</option>
			</c:forEach>
		</select></td>
		</tr>
		<tr><td>가격</td><td><input name="price" id="price"></td></tr>
		<tr><td>수량</td><td><input name="s_volume" id="s_volume"></td></td></tr>
		<input type="button" id="ck_b" value="인증 확인">
	</table>
</form>

</body>
</html>