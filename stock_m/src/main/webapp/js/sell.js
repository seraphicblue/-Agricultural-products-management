$(document).ready(function() {
	// input 값이 변경될 때마다 실행
	$('#s_volume, #price').on('input', function() {
		var s_volume_val = $('#s_volume').val();
		var price_val = $('#price').val();

		// 숫자가 아닌 경우
		if (!/^[0-9]*$/.test(s_volume_val) || !/^[0-9]*$/.test(price_val)) {
			// submit 버튼 동작하지 않도록 설정
			$('input[type=submit]').attr('disabled', 'disabled');
			alert('숫자만 입력해주세요.');
		} else {
			// submit 버튼 동작 가능하도록 설정
			$('input[type=submit]').removeAttr('disabled');
		}
	});
});


function check() {
	var selec = document.getElementById("scontent").selectedIndex;
	var arr = document.getElementById("scontent").options;
	var selectedOption = arr[selec].value;
	var selectedId = arr[selec].id;

	$.ajax({
		url: '/company/' + selectedId,
		type: 'get',
		dataType: 'text'
	})
		.done(function(response) {
			document.getElementById("s_volume").value = selectedOption;
			if (parseInt(response) > 0) {
				$.ajax({
					url: '/company/Vol/' + selectedId + '/' + selectedOption,
					type: 'get',
					dataType: 'text'
				})
					.done(function(response) {
						selectedOption = selectedOption - parseInt(response);
						document.getElementById("s_volume").value = selectedOption;
					})
			}
		})
	document.getElementById("val").value = selectedId;
}

function checkStock() {
	var scontent = document.getElementById("scontent").value;
	var price = parseInt(document.getElementById("price").value);
	var stock = parseInt(document.getElementById("s_volume").value);
	var select = parseInt(document.getElementById("scontent").value);
	var scontent = $("#scontent option:checked").text();
	console.log(scontent);
	document.getElementById("pname").value=scontent;
	
	if (scontent == "------------------") {
		alert("물품 정보를 선택해주세요.");

		return false;
	}

	else if (stock <= 0) {
		alert("재고 정보를 입력해주세요.");

		return false;
	}

	else if (stock > select) {
		alert("재고량을 넘는 입력입니다.");

		return false;
	}

	else if (price <= 0) {
		alert("가격 정보를 선택해주세요.");

		return false;
	}
	else {
		return true;
	}

}