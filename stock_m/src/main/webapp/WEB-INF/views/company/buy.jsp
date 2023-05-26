<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>발주</title>

<!-- Custom fonts for this template-->
<link href="../../vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">


<!-- Custom styles for this template-->
<link href="../../css/sb-admin-2.min.css" rel="stylesheet">
<script src="../../js/webSocket.js"></script>


</head>

<body id="page-top">

	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<!-- 홈화면 링크 부분-->

			<a href="/company/main" class="sidebar-brand d-flex align-items-center justify-content-center" > 

				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">
					관리해줘 <sup>업체</sup>
				</div>
			</a>

			<hr class="sidebar-divider">


			<!-- Heading -->
			<div class="sidebar-heading">Addons</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>거래 탭</span>
			</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">발주 / 판매</h6>
						<a class="collapse-item" href="/company/buy">발주</a> 
						<a class="collapse-item" href="/company/sell">판매</a>
					</div>
				</div></li>

			<!-- Nav Item - Charts -->
			<li class="nav-item"><a class="nav-link"
				href="/company/cs"> <i class="fas fa-fw fa-chart-area"></i>
					<span>재고 그래프</span></a></li>
					
			<li class="nav-item"><a class="nav-link"
				href="/company/cr"> <i class="fas fa-fw fa-chart-area"></i>
					<span>장부 그래프</span></a></li>

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link" href="/company/stockmanage">
					<i class="fas fa-fw fa-table"></i> <span>재고</span>
			</a></li>
			
			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

			<!-- Sidebar Message -->


		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					
					<!-- Topbar Search -->
					

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<!-- Dropdown - Messages -->
							

						<!-- Nav Item - Alerts -->
						

						<!-- Nav Item - Messages -->
						
						<!-- Nav Item - User Information -->
						<!-- 로그아웃 마이페이 부분-->
						<li class="nav-item dropdown no-arrow">
						<a  class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">${uid}</span> <img class="img-profile rounded-circle"
								src="../../img/undraw_profile.svg">
						</a> 
						<!-- Dropdown - User Information -->
							<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#"> 
									<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 
									프로필
								</a>

								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> 
									<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									로그아웃
								</a>
							</div>
						</li>
					</ul>
				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">발주</h1>
					</div>

					<!-- Content Row -->
					<div class="row">

						<!-- Earnings (Monthly) Card Example -->
						<div id="Message" class="col-lg-6 mb-4" >
							<div class="card shadow mb-4" style="width: 1600px;">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">물품 발주</h6>
								</div>
								<table class="table table-bordered dataTable copyright text-center my-auto" id="dataTable"
									width="100%" cellspacing="0" role="grid"
									aria-describedby="dataTable_info" style="width: 100%;">
									<thead>
										<tr>
											<th>재고 번호</th>
											<th>재고 물품</th>
											<th>수량</th>
											
											<th>가격</th>
											<th>총가격</th>
											<th>추가</th>
										</tr>
									</thead>
									<tbody>

										<tr>
											<td class="sno"></td>
											<td style="padding-top: 12px">
											<input type="text" class="s_volume" value=0 size="10"
											style="width:45px;height:41px;"
												onchange="changeprice(this)"></td>
												<td align="center">
												<select class="navbar navbar-expand select_option" onchange="selectedoption(this)">
													<option value="">--------------------</option>
													<c:forEach items="${adminstockList}" var="option">
														<option value="${option.acontent}"
															data-volume="${option.a_volume}"
															data-ano="${option.ano}"
															title="${option.a_val}">${option.acontent}</option>
													</c:forEach>
											</select></td>
											<td style="padding-top: 12px">
											<input type="text" class="s_volume" placeholder="0" size="10"
											style="width:45px;height:41px;text-align:right;"
												onchange="changeprice(this)"></td>
											<td class="selectedvolume" style="vertical-align: middle;"></td>
											<td class="selectedprice" style="vertical-align: middle;"></td>
											<td><button class="btn btn-primary btn-icon-split click" style="width:45px;height:41px;align-items: center;">
											<!-- <i class="fas fa-check" ></i> -->
											<span>추가</span>
											</button></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->

			</div>
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">로그아웃 하시겠습니까?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-primary" href="/logout">로그아웃</a>
                </div>
                
            </div>
        </div>
    </div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>

			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="../../vendor/jquery/jquery.min.js"></script>
	<script src="../../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../../vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../../js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="../../vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="../../js/demo/chart-area-demo.js"></script>
	<script src="../../js/demo/chart-pie-demo.js"></script>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		function selectedoption(selectElement) {
			var selectedOption = selectElement.options[selectElement.selectedIndex];
			var selectedVolume = selectedOption.getAttribute("data-volume");
			var selectedAno = selectedOption.getAttribute("data-ano");
			var s_volume = selectElement.parentNode.parentNode
					.getElementsByClassName("s_volume")[0].value;
			var selectedPrice = selectElement.parentNode.parentNode
					.getElementsByClassName("selectedvolume")[0];
			var totalPrice = selectElement.parentNode.parentNode
					.getElementsByClassName("selectedprice")[0];

			selectElement.parentNode.parentNode
					.getElementsByClassName("s_volume")[0].value = '0';

			if (!isNaN(parseInt(selectedPrice.textContent) * s_volume)) {
				totalPrice.textContent = parseInt(selectedPrice.textContent)
						* s_volume;
			} else {
				totalPrice.textContent = 0;
			}

			selectedPrice.textContent = selectedVolume;
			selectElement.parentNode.parentNode.getElementsByClassName("sno")[0].textContent = selectedAno;
		}

		function changeprice(selectElement) {
			var s_volume = parseInt(selectElement.value);
			var selectedPrice = selectElement.parentNode.parentNode
					.getElementsByClassName("selectedvolume")[0];
			var totalPrice = selectElement.parentNode.parentNode
					.getElementsByClassName("selectedprice")[0];

			if (!isNaN(s_volume) && s_volume >= 0) {
				totalPrice.textContent = parseInt(selectedPrice.textContent)
						* s_volume;
			} else {
				alert("수량은 양수만 입력이 가능합니다");
				selectElement.value = "";
			}
		}

		$(document).ready(function() {
			$('.click2').click(
					function() {
						var scontent = $(this).closest('tr').find('.select_option').val();
						var selectedPrice = $(this).closest('tr').find('.selectedprice').text();
						var s_volume = $(this).closest('tr').find('.s_volume').val();
						var ano = parseInt($(this).closest('tr').find('.sno').text());
						var s_val = parseInt($(this).closest('tr').find('.select_option :selected').attr('title'));
						console.log(s_val);
						
												$.ajax({
															type : 'POST',
															url : '/company/checks',
															data : {
																's_price' : selectedPrice,
																'scontent' : scontent,
																's_volume' : s_volume,
																'ano' : ano,
																's_val': s_val
															},
															success : function(result) {
																$(".sno").text("");
																$(".select_option").val("");
																$(".s_volume").val("");
																$(".selectedvolume").text("");
																$(".selectedprice").text("");
																$(".sno").trigger("change");
																$(".selectedvolume").trigger("change");
																$(".selectedprice").trigger("change");
																
																if (result == true) {
																} else {
																	alert("한도 부족입니다.");
																}
															}
														});
											});
						});
	</script>
</body>

</html>
