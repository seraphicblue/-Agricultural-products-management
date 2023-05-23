var uri = 'ws://' + document.location.host + '/websocket';
var socket = new WebSocket(uri);

socket.onopen = function(event) {
	console.log("WebSocket is open now.");
};

socket.onmessage = function(event) {
	console.log("WebSocket message received:", event.data);

	const newWindow = window.open('', 'New Window', "top=1000,left=1500,width=400,height=100");

	// 창에 표시할 내용 작성

	const content = '<h3>' + event.data + " 재고가 위험치에 도달했습니다" + '</h3>';

	// 새 창에 내용 삽입
	newWindow.document.write(content);

	// 창 닫기 버튼 추가
	newWindow.document.write("<br><button onclick='window.close()'>Close</button>");
};

socket.onclose = function(event) {
	console.log("WebSocket is closed now.");
};

function sendMessage() {


	var message = "";
	var command = document.getElementById('command').value;//식별 정보
	var userid = ""; //판매자 아이디
	var param = document.getElementById('fina').value; //반복 횟수
	var pname = "";// 상품 이름
	
	var text;
	console.log("anchor1")
	for (var i = 1; i <= param; i++) {
		console.log("anchor2")
		userid = document.getElementById('h' + i + 'suserid').value; //판매자 아이디
		message = document.getElementById('h' + i + 'sno').value; //재고 번호
		pname = document.getElementById('h' + i + 'name').value; //물건 이름
		$.ajax({
			url: '/broadstock',
			type: 'get',
			data: { sno: parseInt(message), userid: userid },
			dataType: 'text',
			success: function(data) {				
					if(userid == data){
						text = "/" + command + '_' + userid + '_' + message + '_' + pname;
					}
					console.log(text);
					socket.send(text);
			}
		});
	}


	/**/

	/*$.ajax({
		url: '/broadstock',
		type: 'get',
		data: { sno: parseInt(message), userid: userid },
		dataType: 'text',
		success: function(data) {
			for (var i = 0; i < data.length; i++) {
						text = "/" + command + '_' + userid + '_' + data[i];
						socket.send(text);
					}
		}
	
	});*/
}