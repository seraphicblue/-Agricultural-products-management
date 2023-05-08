<!--      
   Date    : 2023.05.08
   name    : shop-grid
   type    : form
   ver     : 1.0
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
    <link href="../https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="../../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../../css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../../css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../../css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../../css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../../css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../../css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../../css/style.css" type="text/css">
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
            <a href="../#"><img src="../img/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li>
                    <div class="header__top__right__auth">  
                        <a href="../#"><i class="fa fa-user"></i> Logout</a>
                    </div>
                </li>
                <li><a href="../#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="../img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="../#">Spanis</a></li>
                    <li><a href="../#">English</a></li>
                </ul>
            </div>
            <div class="header__top__right__auth">
                <a href="../#"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="../#"><i class="fa fa-facebook"></i></a>
            <a href="../#"><i class="fa fa-twitter"></i></a>
            <a href="../#"><i class="fa fa-linkedin"></i></a>
            <a href="../#"><i class="fa fa-pinterest-p"></i></a>
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
                        <a href="../../market"><img src="../img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li>
                                <div class="header__top__right__auth">
                                    <a href="../#"><i class="fa fa-user"></i> Logout</a>
                                </div>
                            </li>
                            <li><a href="../#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
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
                        <h2>Organi Shop</h2>
                        <div class="breadcrumb__option">
                            <a href="../market">Home</a>
                            <span>Shop</span>
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
                                <li><a href="../search/100">식량작물</a></li>
                            	<li><a href="../search/200">채소류</a></li>
                            	<li><a href="../search/300">특용작물</a></li>
                            	<li><a href="../search/400">과일류</a></li>
                            	<li><a href="../search/500">축산물</a></li>
                            	<li><a href="../search/600">수산물</a></li>
                            </ul>
                        </div>
                </div>
            </div>
                <div class="col-lg-9 col-md-7">                            
                    <div class="row">
                    	<c:forEach items="${list}" var="p">                    
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="../img/product/product-1.jpg">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="../#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="../#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="../#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="../details/${p.pno}">${p.pname}</a></h6>
                                    <h5>${p.price}원</h5>
                                </div>
                            </div>
                        </div><!-- 상품1개 -->   
                        </c:forEach>                  
                    </div>
                    <div class="product__pagination">
                        <a href="../#">1</a>
                        <a href="../#">2</a>
                        <a href="../#">3</a>
                        <a href="../#"><i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->

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