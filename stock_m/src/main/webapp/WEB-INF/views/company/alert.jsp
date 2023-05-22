<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>가격 입력창</title>
<style>
	.orange{background-color: orange;}
	table{border-collapse : collapse;}
</style>
</head>
<body>
<form method="post" id="alert">
	<table border="1">
		
		<tr>
			<td class="orange">작성자</td>
			<td><input name="userid" /></td>
		</tr>
			<td colspan="2" align="center">
				<input type="button" id="save" value="새글 등록"> 
			</td>
		</tr>
	</table>

</form>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
function pricealert(){
	  
	  var brsearch = ${brsearch};
	  var brparam = ${brparam};
	  var pno =${pno};
	  var price = ${price};
	  
	        if(brsearch==pno&&brparam==price){
	        	alert('이름을 입력해주세요.');

	        }
	      
	       
	    } 

    </script>

</body>
</html>
