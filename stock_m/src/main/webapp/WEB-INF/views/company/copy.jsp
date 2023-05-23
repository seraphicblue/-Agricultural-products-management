<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!--  bList begin end count pageNum totalPages -->
<title>글 목록</title>
<style>
#center {
	width: 700px;
	margin-left: auto;
	margin-right: auto;
}

table {
	border: 1px solid black;
	width: 700px;
	border-collapse: collapse;
}

th {border: 1px solid black;
	background-color: orange;
	width: 150px;
}
td{border: 1px solid black;}
a {
	margin: 10px auto;
}

#page {
	text-align: center;
}
</style>
</head>
<body>
<div align="left"><button type="button" id="btnstock">재고/장부관리</button></div>
<div align="left"><button type="button" id="btnmanage">관심/유의업체관리</button>	</div>
<div align="left"><button type="button" id="btnsellbuy">구매/판매</button>	</div>
<div align="left"><button type="button" id="btnalert">알람 설정</button></div>		
		
	<div id="center">
		<h1>재고장부 관리</h1>
       <c:if test="${count != 0 }">
       <form action="/company/rupdate" >
			<table>
				<tr><th></th>
					<th>날짜</th>
					<th>거래번호</th>
					<th><div id="search" align="center">
	                    <form action="search">
		                  <select name="searchn">
			                <option value="0">전체</option>
			                <option value="1">구매</option>
			                <option value="2">판매</option>
		                  </select>
	                     </form>	
                    </div></th>
                    <th>상품명</th>
					<th>금액</th>
					<th>관리버튼</th>
						
				<c:forEach items="${sellList}" var="sell">
				
					<tr>
					<td>
                      <input type="checkbox" id="test_check" name="test_check" value="${sell.sno}">          
                  </td>
					<td><fmt:formatDate value="${sell.sdate}" dateStyle="short"/></td>
						<td><input type="text" id="sno_${sell.sno}" value="${sell.sno}" name="sno" readonly></td><!-- 상세보기 -->
						<td>판매</td>
						<td><input type="text" id="pno_${sell.sno}" value="${sell.pno}" name="pno" readonly></td>
						<td><input type="text" id="price_${sell.sno}" value="${sell.price}" name="price" readonly></td>
						<td><button type="button" id="${sell.sno}" onclick="up(this)">수정</button>
                            <button type="button" id="${sell.sno}" onclick="dc(this)">삭제</button></td>
					</tr>
				
				</c:forEach>
				<button type="submit"> 통합수정</button>
				
				<button onclick="delcheckit()">통합삭제</button>
				
			</table>
			</form>
			<div id="page">
				<c:if test="${begin > pageNum }"><!-- 앞번호들이존재한다면 -->
					<a href="list?p=${begin-1 }">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="list?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="list?p=${end+1}">[다음]</a>
				</c:if>
			</div>

		</c:if>
		<c:if test="${count == 0 }">
	아직 입력한 글이 없습니다.
</c:if>
<div id="search" align="center">
	<form action="search">
		<select name="searchn">
			<option value="0">제목</option>
			<option value="1">내용</option>
			<option value="2">작성자</option>
		</select>
		<input type="text" name="search" size="15" maxlength="50" /> 
		<input type="submit" value="검색" />
	</form>	
</div>

<script src="https://code.jquery.com/jquery-2.2.4.min.js" ></script>
<script type="text/javascript">

function up(button){
    var sno = button.id.toString().split("_"); 
    console.log(sno);
    //document.getElementById("sno_" + sno).removeAttribute("readonly");
    document.getElementById("pno_" + sno).removeAttribute("readonly");
    document.getElementById("price_" + sno).removeAttribute("readonly"); 
        
}
	function dc(obj){
		var params = {
				sno : obj.getAttribute("id")
        };
		$.ajax({
		      type: "GET",
		      url: "/company/rdelete",
		      data: params,
		   
		      
		    }).done(function(){
		    	document.location.reload();
 
		})
	}
	
	  function delcheckit(obj) {
	    var checkboxes = document.querySelectorAll('input[name="test_check"]:checked');
	    var selectedItems = [];

	    checkboxes.forEach(function (checkbox) {
	      selectedItems.push(checkbox.value);
	    });
	    $.ajax({
	    	  type: "GET",
	    	  url: "/company/rcheckdelete",
	    	  data: { selectedItems: selectedItems },
	    	}).done(function() {
	    	  document.location.reload();
	    	});
	    
	  } 
	
	  function upcheckit(button) {
		 
		   
		    var checkboxes = document.querySelectorAll('input[name="test_check"]:checked');
		    var selectedItems = [];
		  
		   
		   
		    checkboxes.forEach(function (checkbox) {
		      selectedItems.push(checkbox.value);
		      
		    });
		    $.ajax({
		    	  type: "GET",
		    	  url: '/company/rcheckupdate',
		    	  data:  { selectedItems: selectedItems },
		                      
		    	}).done(function() {
		    	  document.location.reload();
		    	});
		    
		  }
	  
	/*    function upcheck(obj){
		 
		   function up(button){
			    var sno = button.id.toString().split("_"); 
			    console.log(sno);
			    //document.getElementById("sno_" + sno).removeAttribute("readonly");
			    document.getElementById("pno_" + sno).removeAttribute("readonly");
			    document.getElementById("price_" + sno).removeAttribute("readonly"); 
			    
			    //var checkboxes = document.querySelectorAll('input[name="test_check"]:checked');
			    var pno = document.getElementById("D_"+sno).value();
			    console.log(pno);
			    var selectedItems = [];

			    pno.forEach(function (checkbox) {
			      selectedItems.push(checkbox.value);
			    }); 
			    
			    $.ajax({
				      type: "GET",
				      url: "/company/rupdate",
				      data:  {selectedItems : selectedItems }
				   
				      
				    }).done(function(){
				    	document.location.reload();
		 
				})
			}
		   
			
		   
	   } */
		
	

	
	
</script>
</div>
</body>
</html>
	
