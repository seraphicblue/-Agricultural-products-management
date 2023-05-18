<%-- 
   Date    : 2023.05.16
   name    : shoping-cart
   type    : form
   ver     : 5.0
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
<!-- Header Section Begin -->
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
                                    <a href="/logout"><i class="fa fa-user"></i> Logout</a>
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
                            <li><a href="/normal/p_val?p_val=500">축산물</a></li>
                            <li><a href="/normal/p_val?p_val=600">수산물</a></li>
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
    <!-- Hero Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../../market/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>장바구니</h2>
                        <div class="breadcrumb__option">
                            <a href="/normal/market">홈</a>
                            <span>장바구니</span>
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
                            
                            <c:forEach items="${cart}" var="cart" varStatus="status">	
                                <tr>
                                    <td class="shoping__cart__item">
                                        <a href="../details/${cart.product_pno}">
                                        <img src="../../market/img/cart/cart-1.jpg" alt="">
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
                                <input id="h${status.count}suserid" value="${cart.userid}" hidden="hidden">
                                <input id="h${status.count}pno" value="${cart.product_pno}" hidden="hidden">
                                <input id="h${status.count}price" value="${cart.price}" hidden="hidden">
                                <input id="h${status.count}bcount" value="${cart.count}" name="${cart.product_pno}bcount" hidden="hidden">
                                <input id="h${status.count}s_volume" value="${cart.s_volume}" hidden="hidden">
                                <input id="h${status.count}p_count" value="${cart.p_count}" hidden="hidden">
                                <input id="h${status.count}ssum" value="${cart.ssum}" hidden="hidden">
                                <input id="h${status.count}profit" value="${cart.profit}" hidden="hidden">
                                <input id="h${status.count}name" value="${cart.name}" hidden="hidden">
                                <c:set var="total" value="${total + cart.price*cart.count}"/>
                                <c:set var="fina" value="${status.count}"/>
                            </c:forEach>                          
                                
                            </tbody>                            
                        </table>
                        
                        <script>
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
                    <div class="shoping__cart__btns">
                        <a href="/normal/search?pname="  class="primary-btn cart-btn cart-btn-right">계속 쇼핑하기</a>
                        
                    </div>
                </div>

                <div class="col-lg-12">
                    <div class="shoping__checkout">
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
                
                <script>         
                	function checkout(){                		              		
                		if(confirm('구매하시겠습니까?')){
                			var fin = "${fina}"; 
                    		for(var i = 1; i < parseInt(fin)+1; i++){
                    			if(parseInt(document.getElementById("h"+i+"p_count").value) < parseInt(document.getElementById("h"+i+"bcount").value)){
                    				console.log(document.getElementById("h"+i+"p_count").value);
                    				console.log(document.getElementById("h"+i+"bcount").value);

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
                        		
                        		//location.reload();
							}else{
								return false
							}
						}else{
							return false;
						}
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



</body>

</html>