<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>도소매 가격</title>
</head>
<body>
    <h1>도소매 가격</h1>
    <div>
    재고 추가
    </div>
    <div>
    작물 종류
    </div>
    <select id ="s_content">
    
   	<c:forEach var="priceData" items="${priceDataList}" varStatus="count">
    <option value = "${priceData.PUM_NM_A}" id = "${(count.index)*100}">${priceData.PUM_NM_A}</option>
    </c:forEach>
    </select>
    
   <button class="click">제출</button>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    
    $(document).ready(function(){
    	$('.click').click(
				function() {
					function rand(min, max) {
						  return Math.floor(Math.random() * (max - min + 1)) + min;
						}
					var s_content = $('#s_content').val();
					var s_val = rand(1,5)*100;
					alert(s_val+s_content);
				});
    });
    </script>
</body>
</html>