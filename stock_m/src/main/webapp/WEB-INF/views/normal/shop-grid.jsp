<!--      
   Date    : 2023.05.16
   name    : shop-grid
   type    : form
   ver     : 5.0
   conect  : MarketController
   content : 상품 검색으로 넘어오는 페이지
   writer  : 김기덕
   api     : x
-->
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | Template</title>

    <!-- Google Font -->
    <link href="../market/https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

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
                        <h2>유기농 샵</h2>
                        <div class="breadcrumb__option">
                            <a href="/normal/market">홈</a>
                            <span>샵</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>분류</h4>
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
            	</div>
                <div class="col-lg-9 col-md-7">                            
                    <div class="row">
                    <c:if test="${cproduct > 0}">
                    	<c:forEach items="${list}" var="p" varStatus="status">                    
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" id="${status.count}pimg" data-setbg="">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="../#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="../#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="../#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="/normal/details/${p.pno}" id="${status.count}pname">${p.pname}</a></h6>
                                    <h5>${p.price}원</h5>
                                </div>
                            </div>
                        </div><!-- 상품1개 -->  
                        <c:set var="fina" value="${status.count}"/>
                        </c:forEach>
                        <script>
                        window.onload = function(){
                        	var fin = "${fina}"; 
                    		for(var i = 1; i < parseInt(fin)+1; i++){
                    			if(document.getElementById(i+"pname").textContent == "감자"){
                    				document.getElementById(i+"pimg").setAttribute("style", "background-image: url('../../market/img/product/potato.jpg');");
                    			}else if(document.getElementById(i+"pname").textContent == "양파"){
                    				document.getElementById(i+"pimg").setAttribute("style", "background-image: url('../../market/img/product/onion.jpg');");
                    			}else if(document.getElementById(i+"pname").textContent == "가지"){
                    				document.getElementById(i+"pimg").setAttribute("style", "background-image: url('../../market/img/product/eggplant.jpg');");
                    			}else if(document.getElementById(i+"pname").textContent == "토마토"){
                    				document.getElementById(i+"pimg").setAttribute("style", "background-image: url('../../market/img/product/tomato.jpg');");
                    			}else if(document.getElementById(i+"pname").textContent == "당근"){
                    				document.getElementById(i+"pimg").setAttribute("style", "background-image: url('../../market/img/product/carrot.jpg');");
                    			}
                    		}
                        }
                        </script>
                        
                        
                    </c:if>   
                    <c:if test="${cproduct == 0}">
                    <br><br>
                    	검색한 상품이 없습니다.
                    </c:if>               
                    </div>
                    <c:if test="${cproduct > 0}">
                    <c:if test="${p_val == null}">
                    <div class="product__pagination" id="page">
						<c:if test="${begin > pageNum }">
							<a href="search?pname=${pname}&p=${begin-1 }">[이전]</a>
						</c:if>
						<c:forEach begin="${begin }" end="${end}" var="i">
							<a href="search?pname=${pname}&p=${i}">${i}</a>
						</c:forEach>
						<c:if test="${end < totalPages }">
							<a href="search?pname=${pname}&p=${end+1}">[다음]</a>
						</c:if>
					</div>
					</c:if>
					<c:if test="${p_val > 0}">
                    <div class="product__pagination" id="page">
						<c:if test="${begin > pageNum }">
							<a href="p_val?p_val=${p_val}&p=${begin-1 }">[이전]</a>
						</c:if>
						<c:forEach begin="${begin }" end="${end}" var="i">
							<a href="p_val?p_val=${p_val}&p=${i}">${i}</a>
						</c:forEach>
						<c:if test="${end < totalPages }">
							<a href="p_val?p_val=${p_val}&p=${end+1}">[다음]</a>
						</c:if>
					</div>
					</c:if>
					</c:if>
                    <!-- <div class="product__pagination">
                        <a href="../#">1</a>
                        <a href="../#">2</a>
                        <a href="../#">3</a>
                        <a href="../#"><i class="fa fa-long-arrow-right"></i></a>
                    </div> -->
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->

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