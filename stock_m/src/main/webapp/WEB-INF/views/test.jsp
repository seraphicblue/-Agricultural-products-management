<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WebSocket Example</title>
</head>
<body>
	<input type="hidden" name="command" id="command" value="price"> 
        
	<h1>가격 알림</h1>
	<div>
		<label for="val">Message:</label> <input type="text" id="val" /> <br>
		<label for="userid">UserId : </label> <input type="text" id="userid" />


		<br> <label for="param">Param : </label> <input type="text"
			id="param" />
		<button onclick="sendMessage()">Send</button>
	</div>



	<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../../js/webSocket.js"></script>


</body>
</html>
