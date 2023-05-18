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

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>판매 페이지</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../../../js/sell.js"></script>
<script src="../../js/webSocket.js"></script>

</head>
<body>
	<form action="sell" method="post" id="sellform" onsubmit="return checkStock();">
		<input type="hidden" name="sno" id="val" value=0>
		<input type="hidden" name="pname" id="pname">
		<input type="hidden" name="command" id="command" value="price">
		

		<table>
			<tr>
				<td><h2>판매</h2></td>
			</tr>
			<tr>
				<td>상품명</td>
				<td><select id="scontent" onchange="check()" >
						<option>--------------------</option>
						<c:forEach items="${npList}" var="np">
							<option value="${np.s_volume}" id="${np.sno}">${np.scontent}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input name="price" id="price" value=0></td>
			</tr>
			<tr>
				<td>수량</td>
				<td><input name="p_count" id="s_volume" value=0></td>
			</tr>
		</table>
		<input type="submit" value="판매">


	</form>
</body>
</html>
