var uri = 'ws://' + document.location.host + '/websocket';
var socket = new WebSocket(uri);

socket.onopen = function(event) {
	console.log("WebSocket is open now.");
	if (document.getElementById('command').value == "All") {
		console.log(uid.value);
		messageCount = countMessage(uid.value);
	}
};

socket.onmessage = function(event) {
	var arr = event.data.split('_');
	var sep = arr[0];
	var content = arr[1];
	var sentUserid = arr[2];
	var targetSno = arr[3];
	var contents = "";
	var count;

	if (document.getElementById('command').value == "All") {
		if (sep == 'S') {
			contents = content + " 재고 수치 도달";
			document.getElementById('position1').textContent = contents;
			document.getElementById('position1').style.color = "#FF0000";
		}

		else if (sep == 'P') {
			contents = content + "가격 도달";
			document.getElementById('position2').textContent = contents;
			document.getElementById('position2').style.color = "#FF0000";
		}

		else if (sep == 'L') {
			document.getElementById('position2').textContent = content + "한도 도달";
		}

		stockMessage(sentUserid, contents + "_" + targetSno);

	}
	else {
		console.log("WebSocket message received:" + content);
		const newWindow = window.open('', 'New Window', "top=1000,left=1500,width=400,height=100");
		if (sep == 'P') {
			contents = '<h3>' + "(" + content + ")가 가격에 도달했습니다" + '</h3>';
		}

		else if (sep == 'S') {
			contents = '<h3>' + content + " 재고량이 위험 수치에 도달했습니다" + '</h3>';
		}
		else if (sep == 'L') {
			contents = '<h3>' + content + " 한도가 위험 수치에 도달했습니다" + '</h3>';
		}

		// 새 창에 내용 삽입
		newWindow.document.write(contents);

		// 창 닫기 버튼 추가 
		newWindow.document.write("<br><button onclick='window.close()'>Close</button>");

	}

};


socket.onclose = function(event) {
	console.log("WebSocket is closed now.");
};

function sendMessage() {

	if (document.getElementById('command').value == "price" || document.getElementById('command').value == "All") {

		var message = document.getElementById('val').value;
		var userid = document.getElementById('uid').value;
		var param = document.getElementById('price').value;
		var textTarget = document.getElementById('scontent')[document.getElementById('scontent').selectedIndex].textContent;
		var text;

		$.ajax({
			url: '/broadprice',
			type: 'get',
			data: { sno: parseInt(message) },
			dataType: 'text',
			success: function(data) {
				/*const newWindow = window.open('', 'New Window', "top=1000,left=1500,width=400,height=100");
							contents = '<h3>' +"메세지 : "+message+"데이터 : "+data+"파람 : "+param +"1차 도달했습니다" + '</h3>';
							newWindow.document.write(contents);*/
				$.ajax({
					url: '/broadCprice',
					type: 'get',
					data: { pno: parseInt(data), param: param },
					dataType: 'json',
					success: function(data) {
						message = data;
						for (var i = 0; i < data.length; i++) {
							text = "/" + "price" + '_' + userid + '_' + data[i] + '_' + textTarget;

							socket.send(text);
						}


					}

				})
			}

		});
	}
	else if (document.getElementById('command').value == "stock") {
		var message = "";
		var userid = "";
		var param = document.getElementById('fina').value; //반복 횟수
		var pname = "";// 상품 이름

		var text = "";

		for (var i = 1; i <= param; i++) {
			userid = document.getElementById('h' + i + 'suserid').value; //판매자 아이디
			message = document.getElementById('h' + i + 'sno').value; //재고 번호
			pname = document.getElementById('h' + i + 'name').value; //물건 이름
			$.ajax({
				url: '/broadstock',
				type: 'get',
				data: { sno: message, userid: userid },
				dataType: 'text',
				success: function(data) {
					if (data != 0) {
						/*const newWindow = window.open('', 'New Window', "top=1000,left=1500,width=400,height=100");
						contents = '<h3>' + "데이터 : " + data + "1차 도달했습니다" + '</h3>';
						newWindow.document.write(contents);*/
						for (var i = 1; i <= param; i++) {
							userid = document.getElementById('h' + i + 'suserid').value; //판매자 아이디
							message = document.getElementById('h' + i + 'sno').value; //재고 번호
							pname = document.getElementById('h' + i + 'name').value; //물건 이름
							if (data == message) {
								/*const newWindow = window.open('', 'New Window', "top=1000,left=1500,width=400,height=100");
								contents = '<h3>' + "메세지 : " + message + "데이터 : " + data + "1차 도달했습니다" + pname + '</h3>';
								newWindow.document.write(contents);*/
								text = "/" + "stock" + '_' + userid + '_' + message + '_' + pname;
								socket.send(text);
							}

						}
					}
				}
			})
		}
	}
}

function stockMessage(uid, text) {
	$.ajax({
		url: '/stockmessage',
		type: 'get',
		data: { userid: uid, content: text },
		success: function() {
			$.ajax({
				url: '/countmessage',
				type: 'get',
				data: { userid: uid },
				dataType: 'text',
				success: function(data) {
					count = data;
					document.getElementById('position4').textContent = count;
				}
			});
		}
	});
}

function countMessage(uid) {
	$.ajax({
		url: '/countmessage',
		type: 'get',
		data: { userid: uid },
		dataType: 'text',
		success: function(data) {
			count = data;
			document.getElementById('position4').textContent = count;
		}
	});
}

