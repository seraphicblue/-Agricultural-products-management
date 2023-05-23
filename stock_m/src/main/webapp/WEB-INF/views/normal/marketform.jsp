<%--      
   Date    : 2023.05.16
   name    : marketform
   type    : form
   ver     : 5.0
   conect  : MarketController
   content : 일반사용자용 구매 메인페이지
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
    <link rel="stylesheet" href="../market/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../market/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../market/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../market/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../market/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../market/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../market/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../market/css/style.css" type="text/css">
     
     <style>
.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
}

.switch input {
	opacity: 0;
	width: 0;
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

input:checked+.slider {
	background-color: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
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
     
     
</head>

<body>
<!-- Header Section Begin -->
    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="/normal/market"><img src="../market/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li>
                            	<div class="header__top__right__auth">
                            	<%-- logout기능 클릭시 MarketController에 logout메서드로 세션에 저장된 userid 정보를 삭제 --%>
                               		<a href="/logout"><i class="fa fa-user"></i> Logout</a> 
                           	 	</div>
                       		</li>
                       		<%-- 장바구니에 저장된 상품수 출력 및 클릭시 MarketController에 cform메서드로 해당유저의 장바구니로 이동 --%>
                            <li><a href="cart/${userid}"><i class="fa fa-shopping-bag"></i> <span id="ccount">${ccount}</span></a></li> 
                        </ul>
                        <%-- 장바구니에 저장된 상품들의 가격 총합 출력 --%>
                        <div class="header__cart__price">총 액: <span id="cprice">${cprice}원</span></div>
                    </div>
                </div>
            </div>            
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>전체 분류</span>
                        </div>
                        <%-- 상품을 분류코드로 분류하여 분류코드 별 상품정보를 MarketController에 pvform메서드로 shop-grid.jsp에 출력 --%>
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
                        	
                        	<%-- 상품을 상품명으로 검색하여 상품정보를 MarketController에 sform메서드로 shop-grid.jsp에 출력 --%>
                            <form action="/normal/search">                                
                                <input type="text" placeholder="검색할 상품명" name="pname">
                                <button type="submit" class="site-btn">검색</button>
                            </form>
                            
                        </div>
                    </div>
                    <div class="hero__item set-bg" data-setbg="../market/img/hero/banner.jpg">
                        <div class="hero__text">
                            <span>FRUIT FRESH</span>
                            <h2>Vegetable <br />100% Organic</h2>
                            <p>Free Pickup and Delivery Available</p>
                            <a href="#" class="primary-btn">SHOP NOW</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                
                <%-- MarketController에 mform메서드로 Product테이블에 저장된 모든 상품 정보를 list로 받아서 출력 --%>
                <c:forEach items="${list}" var="p">
                    <div class="col-lg-3">
                    	<a href="/normal/details/${p.pno}">
                        <div class="categories__item set-bg" data-setbg="../market/img/categories/cat-1.jpg">
                            <h5>${p.pname}</h5>
                        </div>
                        </a>
                    </div>
                </c:forEach>    
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

    <!-- Featured Section Begin -->
    
    <!-- Featured Section End -->

    <!-- Banner Begin -->
    <div class="banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="../market/img/banner/banner-1.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                        <!--hero__categories__all 이 부분 변경 필요 -->
                            <span >관심 업체</span>
                        </div>
                        <div class="shoping__cart__table">
                        <table>
									<thead>
										<tr>
											<th>no.</th>
											<th>회사 이름</th>
											<th>알림 설정</th>
											<th>삭제</th>
											<th>상태 변경</th>
										</tr>
									</thead>
									<c:forEach items="${mainList}" var="management"
										varStatus="count">
										<tr>
											<th>${count.index+1}</th>
											<th class="m_content">${management.m_content}</th>
											<th><label class="switch"> <input
													type="checkbox"> <span class="slider round"></span>
											</label></th>
											<th><button class="click"
													data-userid="${management.userid}">삭제</button></th>
											<th><button class="click2"
													data-userid="${management.userid}">변경</button></th>
										</tr>
									</c:forEach>
									</tbody>
								</table>
								<div class="header__cart"><div class="site-btn"><a href="interest"> 전체 보기</a></div></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner End -->

    <!-- Latest Product Section Begin -->
    <!-- Blog Section End -->

    <!-- Footer Section Begin -->
    
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="../market/js/jquery-3.3.1.min.js"></script>
    <script src="../market/js/bootstrap.min.js"></script>
    <script src="../market/js/jquery.nice-select.min.js"></script>
    <script src="../market/js/jquery-ui.min.js"></script>
    <script src="../market/js/jquery.slicknav.js"></script>
    <script src="../market/js/mixitup.min.js"></script>
    <script src="../market/js/owl.carousel.min.js"></script>
    <script src="../market/js/main.js"></script>	
    <!--js list made by kim -->
	<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../../js/priceWebSocket.js"></script>
    <!-- <script>
        $('document').ready(function () {
        	console.log("aaa");
            $.ajax({
                type: "get",	
                url: "/cartcount"   
                
            }).done(function(response){    
            	
            	document.getElementById("ccount").textContent = reponse.ccount;
            	document.getElementById("cprice").textContent = reponse.cprice;
            });
            console.log(document.getElementById("ccount").textContent);
        });
    </script> -->
    <script>
				$(document)
						.ready(
								function() {
									$('.click')
											.click(
													function() {
														var userid = $(this)
																.data('userid');
														var m_content = $(this)
																.closest('tr')
																.find(
																		'.m_content')
																.text();
														var m_content = $(this)
																.closest('tr')
																.find(
																		'.m_content')
																.text();
														location.href = "/company/delete?m_content="
																+ m_content
																+ "&userid="
																+ userid;

													});
								});

				$(document)
						.ready(
								function() {
									$('.click2')
											.click(
													function() {
														var userid = $(this)
																.data('userid');
														var m_content = $(this)
																.closest('tr')
																.find(
																		'.m_content')
																.text();
														console.log(m_content);
														$
																.ajax({
																	type : 'POST',
																	url : '/normal/check2',
																	data : {
																		'm_content' : m_content,
																		"userid" : userid
																	},
																	success : function(
																			result) {
																		if (result == true) {
																			location.href = "/normal/update?m_content="
																					+ m_content
																					+ "&userid="
																					+ userid;
																		} else {
																			location.href = "/normal/update2?m_content="
																					+ m_content
																					+ "&userid="
																					+ userid;
																		}
																	}

																});
													});
								});

				$(document).ready(
						function() {
							$('.switch input').change(
									function() {
										var Checked = $(this).is(":checked");
										var userid = $(this).closest('tr')
												.find('.userid').val();
										console.log("슬라이드 바 상태: " + Checked);
										console.log(userid);
										$.ajax({
											type : 'POST',
											url : '/normal/switch',
											data : {
												Checked : Checked,
												'userid' : userid
											},
											success : function(result) {
												if (result == true) {

												} else {

												}
											}

										});
									});
						});
			</script>

</body>

</html>