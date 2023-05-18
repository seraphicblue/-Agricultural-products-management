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
				<th>수량</th>
				<th>재고 물품</th>
				<th>가격</th>
				<th>총가격</th>
				<th>추가</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="text" id ="s_volume" onchange="changeprice(this)"></td>
				<td><select onchange="selectedoption(this)">
						<c:forEach items="${adminstockList}" var="option">
							<option value="${option.acontent}"
								data-volume="${option.a_volume}">${option.acontent}</option>
						</c:forEach>
				</select></td>
				<td id="selectedvolume"></td>
				<td id ="selectedprice"></td>
				<td><button class="click">추가</button></td>
			</tr>
		</tbody>
	</table>
	</form>
	 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		function selectedoption(selectElement) {
			var selectedvolume = selectedoption.getAttribute("data-volume");
			var s_volume = document.getElementById("s_volume").value;
			document.getElementById("selectedvolume").textContent
			document.getElementById("selectedprice").textContent = document.getElementById("selectedvolume").textContent*s_volume;
		}
		
		function changeprice(selectElement){
			var s_volume = document.getElementById("s_volume").value;
			if(!isNaN(s_volume)&& s_volume >= 0){
			document.getElementById("selectedprice").textContent = document.getElementById("selectedvolume").textContent*s_volume;
			}else{
				alert("수량은 양수만 입력이 가능합니다");
				$("#s_volume").empty();
				document.getElementById("s_volume").value = "";
			}
		}
		
		window.addEventListener('DOMContentLoaded', function() {
			var selectElement = document.querySelector('select');
			var selectedoption = selectElement.options[selectElement.selectedIndex];
			var selectedvolume = selectedoption.getAttribute("data-volume");
			document.getElementById("selectedvolume").textContent = selectedvolume;
		});
		
		$(document).ready(function(){
	    	$('.click').click(
					function() {
						var selectElement = document.querySelector('select');
						var scontent = selectElement.options[selectElement.selectedIndex].value;
						var s_price = parseInt(document.getElementById("selectedprice").textContent);
						var s_volume = document.getElementById("s_volume").value;
						$.ajax({
						      type: 'POST',
						      url: '/company/checks',
						      
						      data: {'s_price': s_price, 'scontent': scontent, 's_volume': s_volume},
						      success: function(result) {
						        if (result == true) {
						          location.href = "/company/inserts?scontent="
										+ scontent+"&s_volume="+s_volume;
						        } else {
						          alert("현재 남은 한도보다 많습니다.");
						        }
						      }
						      
						});
					
	    });
	});
	</script>
</body>
</html>