<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<title>가격 입력창</title>
<style>
	.orange{background-color: orange;}
	table{border-collapse : collapse;}
</style>
</head>
<body>
<form method="post" id="rinsert">
	<table border="1">
		
		<tr>
			<td class="orange">작성자</td>
			<td><input name="userid" /></td>
		</tr>
		<tr>
			<td class="orange">상품 품번</td>
			<td><input name="rlimit" /></td>
		</tr>
		<tr>
			<td class="orange">가격</td>
			<td><input name="bsum"/></td>
		</tr>
		<tr>
			<td class="orange">가격</td>
			<td><input name="ssuum"/></td>
		</tr>
		<tr>
			<td class="orange">가격</td>
			<td><input name="profit"/></td>
		</tr>
		<tr>
			<td class="orange">가격</td>
			<td><input name="margine"/></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="입력"> 
			</td>
		</tr>
	</table>
</form>
</body>
</html>
