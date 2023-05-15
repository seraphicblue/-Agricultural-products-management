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
    <div></div>
    ${priceData}
   	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   
    	<script type="text/javascript">
    	
    	let url = "http://www.garak.co.kr/publicdata/dataOpen.do?id=3436&passwd=rhksflgo12!&dataid=data4&pagesize=10&pageidx=1&portal.templet=false&p_ymd=20230515&p_jymd=20230508&d_cd=2&p_jjymd=20220515&p_pos_gubun=1&pum_nm=";
    	
    	
    	$.ajax({
			url : url,
			dataType: "json"
		}).done(function(json) {
			console.log(json);
			//$("div").append();
		})
    	
    	
    	</script>
</body>
</html>