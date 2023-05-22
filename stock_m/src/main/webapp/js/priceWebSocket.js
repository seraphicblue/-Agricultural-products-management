var uri = 'ws://' + document.location.host + '/websocket';
var socket = new WebSocket(uri);

socket.onopen = function(event) {
	console.log("WebSocket is open now.");
};

socket.onmessage = function(event) {
	
	console.log("WebSocket message received:", event.data);

	const newWindow = window.open('', 'New Window', "top=1000,left=1500,width=400,height=100");

	// 창에 표시할 내용 작성

	const content = '<h3>' + event.data + "님 가격에 도달했습니다" + '</h3>';

	// 새 창에 내용 삽입
	newWindow.document.write(content);

	// 창 닫기 버튼 추가 
	newWindow.document.write("<br><button onclick='window.close()'>Close</button>");
};

socket.onclose = function(event) {
	console.log("WebSocket is closed now.");
};

function sendMessage() {
	var message = document.getElementById('val').value;
	var command = document.getElementById('command').value;
	var userid = document.getElementById('userid').value;
	var param = document.getElementById('param').value;
	var text;

	$.ajax({
		url: '/broadprice',
		type: 'get',
		data: { sno: parseInt(message), userid: userid },
		dataType: 'text',
		success: function(data) {
			$.ajax({
				url: '/broadCprice',
				type: 'get',
				data: { pno: parseInt(data), param: param },
				dataType: 'json',
				success: function(data) {
					message = data;
					for (var i = 0; i < data.length; i++) {
						text = "/" + command + '_' + userid + '_' + data[i];
						socket.send(text);
					}


				}

			})
		}

	});
}