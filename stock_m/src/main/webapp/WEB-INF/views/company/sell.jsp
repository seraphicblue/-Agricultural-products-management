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

</head>
<body>
	<form action="sell" method="post" id="sellform" onsubmit="return checkStock();">
	<input type="hidden" name="sno" id="sno" value=0>
	
		<table>
			<tr>
				<td><h2>판매</h2></td>
			</tr>
			<tr>
				<td>상품명</td>
				<td><select id="scontent" onchange="check()" name="pname">
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
				<td><input name="p_count" id="s_volume" value=0> 
				</td>
			</tr>
		</table>
		<input type="submit" value="판매">
		<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
			function check() {
				var selec = document.getElementById("scontent").selectedIndex;
				var arr = document.getElementById("scontent").options;
				var selectedOption = arr[selec].value;
				var selectedId = arr[selec].id;
				
				$.ajax({
					  url: '/company/'+selectedId,
					  type: 'get',
					  dataType: 'text'
					  })
					  .done(function(response){
						  document.getElementById("s_volume").value =selectedOption;
						  if(parseInt(response)>0){
							  $.ajax({
								  url: '/company/Vol/'+selectedId,
								  type: 'get',
								  dataType: 'text'
								  })
								  .done( function(response){
									  selectedOption=selectedOption-parseInt(response);
									  document.getElementById("s_volume").value =selectedOption;
									  })
								  }
						  })
				document.getElementById("sno").value = selectedId;
			}
			
			function checkStock() {
				var scontent = document.getElementById("scontent").value;
				var price = parseInt(document.getElementById("price").value);
				var stock = parseInt(document.getElementById("s_volume").value);
				var select = parseInt(document.getElementById("scontent").value);
				if (scontent == "------------------") {
					alert("물품 정보를 선택해주세요.");
					return false;
				}
				
				if (stock <= 0) {
					alert("재고 정보를 입력해주세요.");
					return false;
				}
				
				if (stock > select) {
					alert("재고량을 넘는 입력입니다.");
					return false;
				}
				
				if (price <=0) {
					alert("가격 정보를 선택해주세요.");
					return false;
				}
				
				return true;
			}
		</script>
	</form>
</body>
</html>
