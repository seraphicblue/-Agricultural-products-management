<%--      
   Date    : 2023.05.16
   name    : shop-details
   type    : form
   ver     : 5.0
   conect  : MarketController
   content : 상품의 상세페이지
   writer  : 김기덕
   api     : x
--%>
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
                        <h2>${product.pname}</h2>
                        <div class="breadcrumb__option">
                            <a href="/normal/market">홈</a>
                            <c:choose>
                            	<c:when test="${product.p_val eq 100}"><a href="/normal/p_val?p_val=100">식량작물</a></c:when>
                            	<c:when test="${product.p_val eq 200}"><a href="/normal/p_val?p_val=200">채소류</a></c:when>
                            	<c:when test="${product.p_val eq 300}"><a href="/normal/p_val?p_val=300">특용작물</a></c:when>
                            	<c:when test="${product.p_val eq 400}"><a href="/normal/p_val?p_val=400">과일류</a></c:when>
                            	<c:when test="${product.p_val eq 500}"><a href="/normal/p_val?p_val=500">축산물</a></c:when>
                            	<c:when test="${product.p_val eq 600}"><a href="/normal/p_val?p_val=600">수산물</a></c:when>
                            	<c:otherwise>없는분류코드입니다.</c:otherwise>
                            </c:choose>
                            <span>${product.pname}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="../../market/img/product/details/product-details-1.jpg" alt="">
                        </div>
                        <div class="product__details__pic__slider owl-carousel">
                            <img data-imgbigurl="../../market/img/product/details/product-details-2.jpg"
                                src="../../market/img/product/details/thumb-1.jpg" alt="">
                            <img data-imgbigurl="../../market/img/product/details/product-details-3.jpg"
                                src="../../market/img/product/details/thumb-2.jpg" alt="">
                            <img data-imgbigurl="../../market/img/product/details/product-details-5.jpg"
                                src="../../market/img/product/details/thumb-3.jpg" alt="">
                            <img data-imgbigurl="../../market/img/product/details/product-details-4.jpg"
                                src="../../market/img/product/details/thumb-4.jpg" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>${product.pname}</h3>
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <span>(18 reviews)</span>
                        </div>
                        <div class="product__details__price">${product.price}원</div>
                        <p>Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Vestibulum ac diam sit amet quam
                            vehicula elementum sed sit amet dui. Sed porttitor lectus nibh. Vestibulum ac diam sit amet
                            quam vehicula elementum sed sit amet dui. Proin eget tortor risus.</p>
                       
                        
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" id="count" value="1" onchange="cchange(this)">
                                </div>
                            </div>
                        </div>                        
							<input id="userid" value="${userid}" hidden="hidden">
							<input id="product_pno" value="${product.pno}" hidden="hidden">
							<input id="price" value="${product.price}" hidden="hidden">
							<input id="name" value="${product.pname}" hidden="hidden">
							<button type="button" class="primary-btn" onclick="return carton()">장바구니에 담기</button>
							<a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
							
						<script>
							function carton(){
								var params = {
										userid : $("#userid").val()
					                    , product_pno : $("#product_pno").val()
					                    , count : $("#count").val()
					                    , price : $("#price").val()
					                    , name : $("#name").val()
					            };
								if(${product.p_count} >= $("#count").val() && $("#count").val() > 0){
									$.ajax({
										type:"post",
										url: "../addcart",
										data:params
									}).done(function(reponse){
										if(confirm('장바구니로 이동하시겠습니까?')){
											window.location.replace('../cart/${userid}');
										}else{
											return false;
										}
									});
								}else if(${product.p_count} < $("#count").val()){
									alert("준비된 상품갯수를 초과했습니다.");
									alert("${product.pname}" + "의 남은 수량은 " + ${product.p_count} +"개 입니다.");									
								}else {
									alert("1이상의 숫자만 입력해 주세요.");
								}																	
							}
							
							function cchange(obj){
								var inputValue = $(obj).val();
								  
								  if (/^\d+$/.test(inputValue)) {
								    // 입력된 값이 숫자인 경우
								    // 원하는 작업을 수행하세요.
								  } else {
								    // 입력된 값이 숫자가 아닌 경우
								    alert("1이상의 숫자만 입력해 주세요.");
								    $(obj).val(""); // 입력된 값을 비워줍니다.
								  }
							}
						</script>                      
                        <ul>
                            <li><b>Availability</b> <span>In Stock</span></li>
                            <li><b>Shipping</b> <span>01 day shipping. <samp>Free pickup today</samp></span></li>
                            <li><b>Weight</b> <span>0.5 kg</span></li>
                            <li><b>Share on</b>
                                <div class="share">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">Description</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">Information</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">Reviews <span>(1)</span></a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Infomation</h6>
                                    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
                                        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Vivamus
                                        suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam sit amet quam
                                        vehicula elementum sed sit amet dui. Donec rutrum congue leo eget malesuada.
                                        Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur arcu erat,
                                        accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a
                                        pellentesque nec, egestas non nisi. Vestibulum ac diam sit amet quam vehicula
                                        elementum sed sit amet dui. Vestibulum ante ipsum primis in faucibus orci luctus
                                        et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam
                                        vel, ullamcorper sit amet ligula. Proin eget tortor risus.</p>
                                        <p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem
                                        ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet
                                        elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum
                                        porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus
                                        nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.
                                        Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Sed
                                        porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum
                                        sed sit amet dui. Proin eget tortor risus.</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Infomation</h6>
                                    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
                                        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
                                        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
                                        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
                                        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
                                        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
                                        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
                                        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
                                        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
                                        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
                                        Proin eget tortor risus.</p>
                                    <p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem
                                        ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet
                                        elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum
                                        porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus
                                        nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Infomation</h6>
                                    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
                                        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
                                        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
                                        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
                                        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
                                        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
                                        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
                                        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
                                        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
                                        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
                                        Proin eget tortor risus.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>Related Product</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../../market/img/product/product-1.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../../market/img/product/product-2.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../../market/img/product/product-3.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../../market/img/product/product-7.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Crab Pool Security</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Related Product Section End -->

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