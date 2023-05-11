<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SSE Example</title>
</head>
<body>
	<div>안녕하세요</div>
    <div id="sse-data"></div>

    <script type="text/javascript">
        const source = new EventSource("/sse");

        source.addEventListener('message', function(event) {
            console.log('Received event: ', event);
            document.getElementById('sse-data').innerText = event.data;
        });
    </script>
</body>
</html>