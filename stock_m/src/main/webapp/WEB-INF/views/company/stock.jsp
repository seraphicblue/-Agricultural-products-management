<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>adminstock을 이용해 stock에 정보를 저장</title>
</head>
<body>

	<table border="1">
		<thead>
			<tr>
				<th>no</th>
				<th>재고 번호</th>
				<th>수량</th>
				<th>재고 물품</th>
				<th>가격</th>
				<th>총가격</th>
				<th>추가</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" begin="1" end="5">
				<tr>
					<td>${i}</td>
					<td class="s_val"></td>
					<td><input type="text" class="s_volume" onchange="changeprice(this)"></td>
					<td>
						<select class="select_option" onchange="selectedoption(this)">
							<option value="">선택하세요</option>
							<c:forEach items="${adminstockList}" var="option">
								<option value="${option.acontent}"
									data-volume="${option.a_volume}" data-val="${option.a_val}">${option.acontent}</option>
							</c:forEach>
						</select>
					</td>
					<td class="selectedvolume"></td>
					<td class="selectedprice"></td>
					<td><button class="click">추가</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		function selectedoption(selectElement) {
			var selectedOption = selectElement.options[selectElement.selectedIndex];
			var selectedVolume = selectedOption.getAttribute("data-volume");
			var selectedVal = selectedOption.getAttribute("data-val");
			var s_volume = selectElement.parentNode.parentNode.getElementsByClassName("s_volume")[0].value;
			var selectedPrice = selectElement.parentNode.parentNode.getElementsByClassName("selectedvolume")[0];
			var totalPrice = selectElement.parentNode.parentNode.getElementsByClassName("selectedprice")[0];

			selectElement.parentNode.parentNode.getElementsByClassName("s_volume")[0].value = '0';

			if (!isNaN(parseInt(selectedPrice.textContent) * s_volume)) {
				totalPrice.textContent = parseInt(selectedPrice.textContent) * s_volume;
			} else {
				totalPrice.textContent = 0;
			}

			selectedPrice.textContent = selectedVolume;
			selectElement.parentNode.parentNode.getElementsByClassName("s_val")[0].textContent = selectedVal;
		}

		function changeprice(selectElement) {
			var s_volume = parseInt(selectElement.value);
			var selectedPrice = selectElement.parentNode.parentNode.getElementsByClassName("selectedvolume")[0];
			var totalPrice = selectElement.parentNode.parentNode.getElementsByClassName("selectedprice")[0];

			if (!isNaN(s_volume) && s_volume >= 0) {
				totalPrice.textContent = parseInt(selectedPrice.textContent) * s_volume;
			} else {
				alert("수량은 양수만 입력이 가능합니다");
				selectElement.value = "";
			}
		}

		$(document).ready(function() {
			$('.click').click(function() {
				var scontent = $(this).closest('tr').find('.select_option').val();
				var selectedPrice = $(this).closest('tr').find('.selectedprice').text();
				var s_volume = $(this).closest('tr').find('.s_volume').val();
				var s_val = parseInt($(this).closest('tr').find('.s_val').text());

				$.ajax({
					type: 'POST',
					url: '/company/checks',
					data: {
						's_price': selectedPrice,
						'scontent': scontent,
						's_volume': s_volume,
						's_val': s_val
					},
					success: function(result) {
						if (result == true) {
							location.reload();
						} else {
							alert("한도 부족입니다.");
							location.reload();
						}
					}
				});
			});
		});
	</script>
</body>
</html>