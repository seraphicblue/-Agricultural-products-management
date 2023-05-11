<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<style>
 .switch{
 position:relative;
 display: inline-block;
 width : 60px;
 height : 34px;
 }

 .switch input{
 opacity: 0;
 width : 0;
 height: 0;
 }
 
 .slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}
</style>

<body>

	<form action="search2" method="GET">
		<div class="search2">
			<input type="text" name="keyword" placehodler="검색할 기업을 입력해주세요ㅕ">
			<input type="submit" value="search">
		</div>
	</form>
	<table border="1">
		<thead>
			<tr>
				<th>no.</th>
				<th>회사 이름</th>
				<th>회사 여부</th>
				<th>알림 설정</th>
				<th>삭제</th>
				<th>상태 변경</th>
			</tr>
			<c:forEach items="${maList}" var="management" varStatus="count">
				<tr>
					<td>${count.index+1} <input class ="userid" value="${management.userid}" hidden="hidden"></td>
					<td class="m_content">${management.m_content}</td>
					<td>${management.m_val}</td>
					<td >
					<label class= "switch">
					<input type="checkbox">
					<span class="slider round"></span>
					</label>
					</td>
					<td><button class="click">삭제</button></td>
  					<th><button class="click2">변경</button></th>
 				</tr>
			</c:forEach>
		</thead>
	</table>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(
				function() {
					$('.click').click(
							function() {
								var m_content = $(this).closest('tr').find(
										'.m_content').text();
								location.href = "/company/delete?m_content="
										+ m_content;

							});
				});
		
		$(document).ready(
				function(){
					$('.click2').click(
						function(){
							var m_content=$(this).closest('tr').find('.m_content').text();
							$.ajax({
							      type: 'POST',
							      url: '/company/check2',
							      data: {'m_content' : m_content },
							      success: function(result) {
							        if (result === true) {
							          location.href = "/company/update?m_content="+m_content;
							        } else {
							          location.href = "/company/update2?m_content="+m_content;
							        }
							      }
							      
							});
						});
				});
	
		$(document).ready(function() {
			  $('.switch input').change(function() {
			    var Checked = $(this).is(":checked");
			    var userid=$(this).closest('tr').find('.userid').val();
			    console.log("슬라이드 바 상태: " + Checked);
			    console.log(userid);
			    $.ajax({
			    	type: 'POST',
			    	url : '/company/switch',
			    	data: {Checked: Checked, 'userid' : userid},
			    	success: function(result){
			    		if(result == true){
			    			
			    			
			    		}else{
			    			
			    		}
			    	}
			    	
			    });
			  });
			});
	</script>
</body>
</html>