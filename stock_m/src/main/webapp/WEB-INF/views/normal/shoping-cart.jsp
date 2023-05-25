<%-- 
   Date    : 2023.05.22
   name    : shoping-cart
   type    : form
   ver     : 6.0
   conect  : MarketController
   content : 장바구니 페이지
   writer  : 김기덕
   api     : x
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">
<!-- col-lg-6클래스 태그 css스타일 특정 영역 차지 크기  -->
<head>
    <meta charset="UTF-8">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="../../market/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../../market/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../../market/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../../market/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../../market/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../../market/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../../market/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../../market/css/style.css" type="text/css">
</head>

<body>
<input type="hidden" name="command" id="command" value="stock"> 
<!-- Header Section Begin --> <%-- ------------------------- 다른 페이지들과 공통부분 시작 ------------------------- --%>
    <header class="header">
       
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="/normal/market"><img src="../../market/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li>
                                <div class="header__top__right__auth">
                                    <a href="/logout"><i class="fa fa-user"></i> 로그아웃</a>
                                </div>
                            </li>
                            <li><a href="/normal/cart/${userid}"><i class="fa fa-shopping-bag"></i> <span id="ccount">${ccount}</span></a></li>
                        </ul>
                        <div class="header__cart__price">총 액: <span id="cprice">${cprice}원</span></div>
                    </div>
                </div>
            </div>            
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>전체 분류</span>
                        </div>
                        <ul>
                            <li><a href="/normal/p_val?p_val=100">식량작물</a></li>
                            <li><a href="/normal/p_val?p_val=200">채소류</a></li>
                            <li><a href="/normal/p_val?p_val=300">특용작물</a></li>
                            <li><a href="/normal/p_val?p_val=400">과일류</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="/normal/search">
                                
                                <input type="text" placeholder="검색할 상품명" name="pname">
                                <button type="submit" class="site-btn">검색</button>
                            </form>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End --> <%-- ------------------------- 다른 페이지들과 공통부분 끝 ------------------------- --%>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../../market/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                	<%-- 장바구니 페이지의 중단부에 토마토 부분 --%>
                    <div class="breadcrumb__text">
                        <h2>장바구니</h2>
                        <div class="breadcrumb__option">
                            <a href="/normal/market">홈</a>
                            <span>장바구니</span>
                            <%-- MarketController에서 받은 userid를 받아놓은 부분 --%>
                            <input id="userid" value="${userid}" hidden="hidden">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">상품</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>총액</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            
                            <%-- 해당 유저 cart테이블에 저장된 상품 정보를 반복문으로 출력 --%>
                            <c:forEach items="${cart}" var="cart" varStatus="status">	
                                <tr>
                                    <td class="shoping__cart__item">
                                        <a href="../details/${cart.product_pno}">
                                        <img src="" id="h${status.count}img" alt="">
                                        <h5>${cart.name}</h5>
                                        </a>
                                    </td>
                                    <td class="shoping__cart__price" id="${cart.product_pno}price">
                                        ${cart.price}원
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty1">
                                            <span class="dec qtybtn" id="${cart.product_pno} -" onclick="vi('${cart.product_pno} -')">-</span>
                                                <input type="text" class="count" value="${cart.count}" id="${cart.product_pno}" onchange="cchange(this)">                                                
                                            <span class="inc qtybtn" id="${cart.product_pno} +" onclick="vi('${cart.product_pno} +')">+</span>
                                            	<input id="${cart.product_pno}oldcount" value="${cart.count}" hidden="hidden">
                                            </div> 
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total" id="${cart.product_pno}total">
                                        ${cart.price*cart.count}원                                        
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close" id="${cart.product_pno} delete" onclick="dcart(this)"></span>
                                    </td> 
                                </tr>
                                
                                <%-- 해당 상품의 판매자 userid, 판매자 장부정보, 판매수량, 재고수량 등 받아놓은 부분 --%> <%-- 이부분을 효율적으로 바꿀 방법 찾는중 --%>
                                <input id="h${status.count}suserid" value="${cart.userid}" hidden="hidden"><!-- 상품 판매자 유저 아이디  -->
                                <input id="h${status.count}sno" value="${cart.sno}" hidden="hidden"> <!-- 상품 stocknum -->
                                <input id="h${status.count}pno" value="${cart.product_pno}" hidden="hidden"><!--상품 productnum  -->
                                <input id="h${status.count}price" value="${cart.price}" hidden="hidden"><!--상품 product가격  -->
                                <input id="h${status.count}bcount" value="${cart.count}" name="${cart.product_pno}bcount" hidden="hidden"><!--페이지내에 카운트 횟수 저장용-->
                                <input id="h${status.count}s_volume" value="${cart.s_volume}" hidden="hidden"><!--stock재고량-->
                                <input id="h${status.count}p_count" value="${cart.p_count}" hidden="hidden"><!--product상품 등록량-->
                                <input id="h${status.count}ssum" value="${cart.ssum}" hidden="hidden"><!--revenue테이블 저장용 판매 총합-->
                                <input id="h${status.count}profit" value="${cart.profit}" hidden="hidden"><!--revenue테이블 현 자본금 -->
                                <input id="h${status.count}name" value="${cart.name}" hidden="hidden"><!--상품이름-->
                                <c:set var="total" value="${total + cart.price*cart.count}"/><!--현재 상품 총합 계산값  -->
                                <c:set var="fina" value="${status.count}"/><!--상품 총 카운트 (상품 갯수) -->
                                
                            </c:forEach>                          
                                <input id="fina" value="${fina}" hidden="hidden">
                                <input id="uid" value="${uid}" hidden="hidden">
                            </tbody>                            
                        </table>                        
                        
                        <script>
                        window.onload = function(){
                        	var fin = "${fina}"; 
                    		for(var i = 1; i < parseInt(fin)+1; i++){
                            	console.log(document.getElementById("h"+i+"name").value);
                    			if(document.getElementById("h"+i+"name").value == "감자"){
                    				document.getElementById("h"+i+"img").setAttribute("src", "../../market/img/cart/potato.jpg");
                    			}else if(document.getElementById("h"+i+"name").value == "양파"){
                    				document.getElementById("h"+i+"img").setAttribute("src", "../../market/img/cart/onion.jpg");
                    			}else if(document.getElementById("h"+i+"name").value == "가지"){
                    				document.getElementById("h"+i+"img").setAttribute("src", "../../market/img/cart/eggplant.jpg");
                    			}else if(document.getElementById("h"+i+"name").value == "토마토"){
                    				document.getElementById("h"+i+"img").setAttribute("src", "../../market/img/cart/tomato.jpg");
                    			}else if(document.getElementById("h"+i+"name").value == "당근"){
                    				document.getElementById("h"+i+"img").setAttribute("src", "../../market/img/cart/carrot.jpg");
                    			}else if(document.getElementById("h"+i+"name").value == "사과"){
                    				document.getElementById("h"+i+"img").setAttribute("src", "../../market/img/cart/apple.jpg");
                    			}else if(document.getElementById("h"+i+"name").value == "바나나"){
                    				document.getElementById("h"+i+"img").setAttribute("src", "../../market/img/cart/banana.jpg");
                    			}else if(document.getElementById("h"+i+"name").value == "배추"){
                    				document.getElementById("h"+i+"img").setAttribute("src", "../../market/img/cart/cabbage.jpg");
                    			}else if(document.getElementById("h"+i+"name").value == "고추"){
                    				document.getElementById("h"+i+"img").setAttribute("src", "../../market/img/cart/chilipepper.jpg");
                    			}else if(document.getElementById("h"+i+"name").value == "포도"){
                    				document.getElementById("h"+i+"img").setAttribute("src", "../../market/img/cart/grape.jpg");
                    			}else if(document.getElementById("h"+i+"name").value == "메론"){
                    				document.getElementById("h"+i+"img").setAttribute("src", "../../market/img/cart/melon.jpg");
                    			}else if(document.getElementById("h"+i+"name").value == "호박"){
                    				document.getElementById("h"+i+"img").setAttribute("src", "../../market/img/cart/pumpkin.jpg");
                    			}else if(document.getElementById("h"+i+"name").value == "딸기"){
                    				document.getElementById("h"+i+"img").setAttribute("src", "../../market/img/cart/strawberry.jpg");
                    			}else if(document.getElementById("h"+i+"name").value == "수박"){
                    				document.getElementById("h"+i+"img").setAttribute("src", "../../market/img/cart/watermelon.jpg");
                    			}
                    		}
                        }
                       		<%-- 장바구니에 +,-버튼 클릭시 발생하는 이벤트 상품수 증감 --%>
                        	function vi(obj){
                        		var str = obj;
                        		let idc = str.split(' ');
                        		if(idc[1] == '+'){
                        			document.getElementById(idc[0]).value=parseInt(document.getElementById(idc[0]).value)+parseInt(1);   
                        			
                        			document.getElementById("total").textContent = parseInt(document.getElementById("total").textContent) + parseInt(document.getElementById(idc[0]+"price").textContent)+"원";
                        			document.getElementsByName(idc[0] + "bcount")[0].value = document.getElementById(idc[0]).value;
                        		}else if(idc[1] == '-'){
                        			if(parseInt(document.getElementById(idc[0]).value) > 0){
                        				document.getElementById(idc[0]).value=parseInt(document.getElementById(idc[0]).value)-parseInt(1);
                        				document.getElementById("total").textContent = parseInt(document.getElementById("total").textContent) - parseInt(document.getElementById(idc[0]+"price").textContent)+"원";
                        				document.getElementsByName(idc[0] + "bcount")[0].value = document.getElementById(idc[0]).value;
                        			}else {
                        				parseInt(document.getElementById(idc[0]).value) = 0;
                        				document.getElementsByName(idc[0] + "bcount")[0].value = 0;
                        			}   
                        			
                        		}
                        		document.getElementById(idc[0]+"total").textContent = parseInt(document.getElementById(idc[0]).value) * parseInt(document.getElementById(idc[0]+"price").textContent)+"원";                       	
                        		document.getElementById(idc[0]+"oldcount").value = document.getElementById(idc[0]).value;
                        		document.getElementById("total").textContent = document.getElementById("total").textContent;
                        		
                        		//console.log(document.getElementById("total").textContent)
                        		var params = {
										userid : $("#userid").val()
					                    , count : document.getElementById(idc[0]).value
					                    , product_pno : parseInt(idc[0])
					            };                        		
                        		$.ajax({
                        			type:"get",
                        			url: "../countchange",
                        			data: params
                        		});
                        		
              
                    		}
                        	
                        	<%-- +,-버튼을 사용하지 않고 상품수를 직접입력시 상품수의 변화가 생길시 발생하는 이벤트 --%>
                        	function cchange(obj){ 
                        		
                        		var inputValue = $(obj).val();
                        		  
                        		if (/^\d+$/.test(inputValue) || inputValue < 0) {
                        		    // 입력된 값이 숫자인 경우
                        		    // 원하는 작업을 수행하세요.
                        		  
                        		var oid = obj.getAttribute("id")
                        		var ocount = document.getElementById(oid+"oldcount").value;
                        		var ncount = obj.value;
                        		var id = obj.getAttribute("id"); 
                        		
                       			if(ncount >= 0) {                      				
                       				document.getElementById(id+"total").textContent = parseInt(ncount) * parseInt(document.getElementById(id+"price").textContent)+"원";
                       			}else if(ncount < 0){
                       				ncount = 1;
                       				document.getElementById(id+"total").textContent = parseInt(document.getElementById(id+"price").textContent) +"원";
                       			}
                       			if(document.getElementById(id+"total").textContent == "NaN원"){   				
                       				document.getElementById(id+"total").textContent = parseInt(document.getElementById(id+"price").textContent) +"원";
                       			}
                       			document.getElementById(id).value = ncount; 
                       			document.getElementById("total").textContent = parseInt(document.getElementById("total").textContent) + parseInt(document.getElementById(id+"price").textContent)*(ncount - ocount) +"원";
                       			document.getElementById(oid+"oldcount").value = ncount;
                       			document.getElementById("total").textContent = document.getElementById("total").textContent;
                       			var fin = "${fina}"; 
                        		for(var i = 1; i < parseInt(fin)+1; i++){
                        			document.getElementById("h"+i+"bcount").value = ncount
                        		}                        			
                        		
                        		var params = {
										userid : $("#userid").val()
					                    , count : ncount
					                    , product_pno : obj.getAttribute("id")
					            };                        	
                        		
                        		$.ajax({
                        			type:"get",
                        			url: "../countchange",
                        			data: params
                        		});
                        		} else {
                          		   // 입력된 값이 숫자가 아닌 경우
                          		   alert("1이상의 숫자만 입력해주세요!");
                          		   $(obj).val(""); // 입력된 값을 비워줍니다.
                          		}
                        	}
                        	
                        	<%-- 상품 오른쪽 X를 클릭시 발생하는 이벤트 해당상품 삭제 --%>
                        	function dcart(obj){
                        		if(confirm('상품을 장바구니에서 삭제하시겠습니까?')){
                        			var str = obj.getAttribute("id");
                            		let idc = str.split(' ');
                            		var params = {
    										userid : $("#userid").val()
    					                    , product_pno : idc[0]
    					            };                        	
                            		
                            		$.ajax({
                            			type:"get",
                            			url: "../delete",
                            			data: params
                            		});
                            		location.reload();
    							}else{
    								return false
    							}                        		
                        	}
                        </script>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                	<%-- 계속 쇼핑하기 클릭시 상품으로 등록된 모든 상품의 정보를 shop-grid로 이동해 출력 --%>
                    <div class="shoping__cart__btns">
                        <a href="/normal/search?pname="  class="primary-btn cart-btn cart-btn-right">계속 쇼핑하기</a>
                        
                    </div>
                </div>

                <div class="col-lg-12">
                    <div class="shoping__checkout">
                    	<%-- 장바구니에 담긴 모든 상품 총액 출력 --%>
                        <h5>장바구니 총액</h5>
                        <ul>
                            <li>총액 <span id="total" >                            
                            <c:if test="${total eq null}">0원</c:if> 
                            <c:if test="${total ne null}"><c:out value="${total}"/>원</c:if>
                            </span></li>
                        </ul>
                        <a href="#" class="primary-btn" onclick="checkout()">구매</a>
                    </div>
                </div>
                
                <%-- 구매버튼 클릭시 발생하는 이벤트 결제완료시 해당 유저의 장바구니 상품을 모두 삭제 및 해당상품 판매자의 장부, 판매,구매 정보에 반영 --%>
                <script>         
                	function checkout(){
                		
                		if(confirm('구매하시겠습니까?')){
                			if(${ccount} == 0){
                				alert("구매할 상품이 없습니다. 장바구니에 상품을 추가해주세요.");
                				return false;
                			}
                			var fin = "${fina}"; 
                    		for(var i = 1; i < parseInt(fin)+1; i++){
                    			if(parseInt(document.getElementById("h"+i+"bcount").value) <= 0){
                    				alert(document.getElementById("h"+i+"name").value + "의 구매 수량을 1개 이상으로 해주세요.");                    				
                    				return false;
                    			}
                    			if(parseInt(document.getElementById("h"+i+"p_count").value) < parseInt(document.getElementById("h"+i+"bcount").value)){
                    				alert("준비된 상품갯수를 초과했습니다.");
                    				alert(document.getElementById("h"+i+"name").value + "의 남은 수량은 " + document.getElementById("h"+i+"p_count").value+"개 입니다.");
                    				return false;
                    			}
                    		}
							if(confirm('결제 완료')){
								var params = {
										userid : $("#userid").val()
					            };                        		 
                        		$.ajax({
                        			type:"get",
                        			url: "../checkout",
                        			data: params
                        		});//결제완료
                        		
                        		function getFormatDate(date){
                        		    var year = date.getFullYear();              //yyyy
                        		    var month = (1 + date.getMonth());          //M
                        		    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
                        		    var day = date.getDate();                   //d
                        		    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
                        		    return  year + '' + month + '' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
                        		}
                        		
                        		
                        		
                        		var now = new Date()
                        		now = getFormatDate(now); 
                        		for(var i = 1; i < parseInt(fin)+1; i++){
                        			var buy = {
                        					userid : $("#userid").val()
                        					, suserid : document.getElementById("h"+i+"suserid").value
        				                    , bcount : document.getElementById("h"+i+"bcount").value
        				                    , sno : document.getElementById("h"+i+"sno").value
        				                    , pno : document.getElementById("h"+i+"pno").value
        				                    , price : document.getElementById("h"+i+"price").value
        				                    , bdate : now
        				                    , s_volume : document.getElementById("h"+i+"s_volume").value
        				                    , p_count : document.getElementById("h"+i+"p_count").value
        				                    , ssum : document.getElementById("h"+i+"ssum").value
        				                    , profit : document.getElementById("h"+i+"profit").value
                        			};
                        			(function(i) {
                			            	$.ajax({
                			            		type:"post"
                			            		,url: "../addbuy"
                			            		,data: buy
                			            		,success:function(result){
                			           	    		console.log(i);
                			           	  		}
                			        		})
                			    	})(i);
                        			
                        		}//결제후 구매내역 저장
                        		
                        		location.reload();
							}else{
								return false
							}
						}else{
							return false;
						} 
                		sendMessage()//웹 알림 발생
                	};
                </script>
                
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->

    <!-- Footer Section Begin -->
    
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="../../market/js/jquery-3.3.1.min.js"></script>
    <script src="../../market/js/bootstrap.min.js"></script>
    <script src="../../market/js/jquery.nice-select.min.js"></script>
    <script src="../../market/js/jquery-ui.min.js"></script>
    <script src="../../market/js/jquery.slicknav.js"></script>
    <script src="../../market/js/mixitup.min.js"></script>
    <script src="../../market/js/owl.carousel.min.js"></script>
    <script src="../../market/js/main.js"></script>
    
    <!--js list made by kim -->
	<script src="../../js/webSocket.js"></script>



</body>

</html>