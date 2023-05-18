<!-- 
   Date    : 2023.05.10
   name    : shoping-cart
   type    : form
   ver     : 2.0
   conect  : MarketController
   content : 장바구니 페이지
   writer  : 김기덕
   api     : x
-->
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
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img src="img/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="../img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="#">Spanis</a></li>
                    <li><a href="#">English</a></li>
                </ul>
            </div>
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="../maket">Home</a></li>
                <li><a href="./shop-grid.html">Shop</a></li>
                <li><a href="#">Pages</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="./shop-details.html">Shop Details</a></li>
                        <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                        <li><a href="./checkout.html">Check Out</a></li>
                        <li><a href="./blog-details.html">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="./blog.html">Blog</a></li>
                <li><a href="./contact.html">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <header class="header">
       
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="../market"><img src="../img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li>
                                <div class="header__top__right__auth">
                                    <a href="#"><i class="fa fa-user"></i> Logout</a>
                                </div>
                            </li>
                            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                        </ul>
                        <div class="header__cart__price">item: <span>$150</span></div>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
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
                            <li><a href="../search/100">식량작물</a></li>
                            <li><a href="../search/200">채소류</a></li>
                            <li><a href="../search/300">특용작물</a></li>
                            <li><a href="../search/400">과일류</a></li>
                            <li><a href="../search/500">축산물</a></li>
                            <li><a href="../search/600">수산물</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form method="post" action="../search">
                                <div class="hero__search__categories">
                                    모든 카테고리
                                    <span class="arrow_carrot-down"></span>
                                </div>
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
    <section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>장바구니</h2>
                        <div class="breadcrumb__option">
                            <a href="../market">홈</a>
                            <span>장바구니</span>
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
                            
                            <c:forEach items="${cart}" var="cart">	
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="../img/cart/cart-1.jpg" alt="">
                                        <h5>${cart.name}</h5>
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
                                <input id="userid" value="test1" hidden="hidden">
                                <c:set var="total" value="${total + cart.price*cart.count}"/>
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
                                	console.log(document.getElementById("total").textContent);
                        		}else if(idc[1] == '-'){
                        			if(parseInt(document.getElementById(idc[0]).value) > 0){
                        				document.getElementById(idc[0]).value=parseInt(document.getElementById(idc[0]).value)-parseInt(1);
                        				document.getElementById("total").textContent = parseInt(document.getElementById("total").textContent) - parseInt(document.getElementById(idc[0]+"price").textContent)+"원";
                        			}else {
                        				parseInt(document.getElementById(idc[0]).value) = 0;
                        			}   
                        			
                        		}                        		
                        		document.getElementById(idc[0]+"total").textContent = parseInt(document.getElementById(idc[0]).value) * parseInt(document.getElementById(idc[0]+"price").textContent)+"원"; 
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
                        		var oid = obj.getAttribute("id")
                        		var ocount = document.getElementById(oid+"oldcount").value;
                        		var ncount = obj.value;
                        		var id = obj.getAttribute("id");  
                       			if(ncount >= 0) {                      				
                       				document.getElementById(id+"total").textContent = parseInt(ncount) * parseInt(document.getElementById(id+"price").textContent)+"원";
                       			}else if(ncount < 0){
                       				ncount = 0;
                       			}
                       			if(document.getElementById(id+"total").textContent == "NaN원"){   				
                       				document.getElementById(id+"total").textContent = 0 +"원";
                       			}
                       			document.getElementById(id).value = ncount; 
                       			document.getElementById("total").textContent = parseInt(document.getElementById("total").textContent) + parseInt(document.getElementById(id+"price").textContent)*(ncount - ocount) +"원";
                       			document.getElementById(oid+"oldcount").value = ncount;
                        		document.getElementById("total").textContent = document.getElementById("total").textContent;
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
                        <a href="../continue"  class="primary-btn cart-btn cart-btn-right">계속 쇼핑하기</a>
                        
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
                        <a href="#" class="primary-btn" onclick="checkout()">결제</a>
                    </div>
                </div>
                
                <script>
                	function checkout(){
                		if(confirm('결제하시겠습니까?')){
							if(confirm('결제 완료')){
								var params = {
										userid : $("#userid").val()
					            };                        		
                        		$.ajax({
                        			type:"get",
                        			url: "../checkout",
                        			data: params
                        		});
                        		location.reload();
							}else{
								return false
							}
						}else{
							return false;
						}
                	}
                </script>
                
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->

    <!-- Footer Section Begin -->
    
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.nice-select.min.js"></script>
    <script src="../js/jquery-ui.min.js"></script>
    <script src="../js/jquery.slicknav.js"></script>
    <script src="../js/mixitup.min.js"></script>
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/main.js"></script>


</body>

</html>