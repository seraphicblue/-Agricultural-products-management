<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="../market/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="../market/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="../market/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="../market/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="../market/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="../market/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="../market/css/slicknav.min.css"
	type="text/css">
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
	<input type="hidden" name="command" id="command" value="common">
	<!-- Header Section Begin -->
	<%-- ------------------------- 다른 페이지들과 공통부분 시작 ------------------------- --%>
	<header class="header">

		<div class="container">
			<div class="row">

				<div class="col-lg-3">
					<div class="header__logo">
						<a href="/normal/market"><img src="../../market/img/logo.png"
							alt=""></a>
					</div>
				</div>
				<div class="col-lg-6"></div>
				<div class="col-lg-3">
					<div class="header__cart">
						<ul>
							<li>
								<div class="header__top__right__auth">
									<a href="/logout"><i class="fa fa-user"></i> Logout</a>
								</div>
							</li>
							<li><a href="/normal/cart/${userid}"><i
									class="fa fa-shopping-bag"></i> <span id="ccount">${ccount}</span></a></li>
						</ul>
						<div class="header__cart__price">
							총 액: <span id="cprice">${cprice}원</span>
						</div>
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
							<i class="fa fa-bars"></i> <span>전체 분류</span>
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
	<!-- Hero Section End -->
	<%-- ------------------------- 다른 페이지들과 공통부분 끝 ------------------------- --%>

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="../../market/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<%-- 장바구니 페이지의 중단부에 토마토 부분 --%>
					<div class="breadcrumb__text">
						<h2>유의 업체</h2>
						<div class="breadcrumb__option">
							<a href="/normal/market">홈</a> <span>유의 업체</span>
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

				<div class="col-lg-3 col-md-5">
					<div class="sidebar">
						<div class="sidebar__item">
							<div>
								<h4>관리 여부</h4>
							</div>
							<ul>
								<li><a href="/normal/interest">관심 업체 관리</a></li>
								<li><a href="/normal/management2">유의 업체관리</a></li>
								<li><a href="/normal/listall">전체 관리</a></li>
								<li><a href="/normal/broadSelecMenu">가격 알림 관리</a></li>
							</ul>
						</div>
					</div>
				</div>


				<div class="col-lg-9">

					<div>
						<!-- Page Heading -->

						<h1 class="h3 mb-2 text-gray-800">유의 업체</h1>

						<div class="hero__search__form">
							<form action="/normal/inmasearch" method="GET">

								<div class="search">
									<input type="text" name="keyword" placeholder="추가하실 기업을 입력해주세요">
									<button type="submit" class="site-btn">검색</button>
								</div>
							</form>
						</div>
					</div>

					<div class="shoping__cart__table">
						<table>
							<c:if test="${count != 0 }">
								<tr>
									<th>no.</th>
									<th>회사 명</th>
									<th>회사 홈페이지</th>
									<th>사업자 번호</th>
									<th>추가</th>
								</tr>
								<c:forEach items="${mList}" var="user" varStatus="count">
									<tr>
										<td>${count.index+1}</td>
										<td class="username" data-userid="${user.userid}">${user.userid}</td>
										<td>${user.gender}</td>
										<td>${user.age}</td>
										<td><button class="click">추가</button></td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${count == 0 }">
	검색 조건에 맞는 글이 없습니다.
	</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

	</section>
	<!-- Shoping Cart Section End -->

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
	<script src="../../../js/webSocket.js"></script>
	<!--js list made by kim -->
	<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../../js/priceWebSocket.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<script>
		$(document).ready(function() {
			$(".click").click(function() {
				var username = $(this).parent().siblings('.username').text();
				var c_userid = $(this).parent().siblings('.username').attr('data-userid');
				$.ajax({
					type : 'POST',
					url : '/normal/check',
					data : {
						'username' : username,
						'c_userid' : c_userid
					},
					success : function(result) {
						if (result === false) {
							alert('이미 추가된 업체입니다.');
						} else {
							location.href = "/normal/insert2?id=" + username+"&c_userid="+c_userid;
						}
					}

				});
			});
		});
	</script>
</body>
</html>