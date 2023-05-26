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
    <select id ="a_content">
    
   	<c:forEach var="priceData" items="${priceDataList}" varStatus="count">
    <option value = "${priceData.PUM_NM_A}" id = "${priceData.PAV_P_A}">${priceData.PUM_NM_A}</option>
    </c:forEach>
    </select>
    <input type="text" id ="a_val">
     
   <button class="click">제출</button>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    
    $(document).ready(function(){
    	$('.click').click(
				function() {
					var a_content = $('#a_content').val();
					var a_val = $('#a_val').val();
					var a_volum= parseInt($('#a_content option:selected').attr('id')/10);

					$.ajax({
					      type: 'POST',
					      url: '/company/inserta',
					      data: {'a_content':a_content, "a_val":a_val, "a_volum":a_volum},
					  	
					});
				
    });
});
    </script>
</body>
</html>