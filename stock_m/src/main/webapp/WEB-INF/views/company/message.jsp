<!--
   Date    : 2023.05.15
   name    : stockmanage
   type    : jsp
   ver     : 1.1
   connect  : StockController
   content : 재고관리내역 보여주는 페이지
   writer  : 이이지
   api     : x
  -->
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Tables</title>

<!-- Custom fonts for this template -->
<link href="../../../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../../../css/sb-admin-2.min.css" rel="stylesheet">
<link href="../../../css/sb-admin-2.min2.css" rel="stylesheet">

<!-- Custom styles for this page -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link href="../../../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<script src="../../../js/sell.js"></script>
<script src="../../../js/webSocket.js"></script>

</head>

<body id="page-top">

	<input type="hidden" name="command" id="command" value="common">
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<!-- 홈화면 링크 부분-->

			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="/company/main">

				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">
					관리해줘 <sup>업체</sup>
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->


			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->

			<!-- Nav Item - Pages Collapse Menu -->
			<!-- data-toggle 제거시 화살표 부분 제거-->

			<!-- Nav Item - Utilities Collapse Menu -->

			<!-- Divider -->

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
						<a class="collapse-item" href="/company/buy">발주</a> <a
							class="collapse-item" href="/company/sell">판매</a>
					</div>
				</div></li>

			<!-- Nav Item - Charts -->
			<li class="nav-item"><a class="nav-link" href="/company/cs">
					<i class="fas fa-fw fa-chart-area"></i> <span>재고 그래프</span>
			</a></li>

			<li class="nav-item"><a class="nav-link" href="/company/cr">
					<i class="fas fa-fw fa-chart-area"></i> <span>장부 그래프</span>
			</a></li>

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link"
				href="/company/stockmanage"> <i class="fas fa-fw fa-table"></i>
					<span>재고</span>
			</a></li>
			
			
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapse2Pages"
				aria-expanded="true" aria-controls="collapse2Pages"> 
				<i class="fas fa-fw fa-folder"></i> <span>알림 탭</span>
			</a>
				<div id="collapse2Pages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">알림 목록</h6>
						<a class="collapse-item" href="broadSelecStock">재고 알림</a> 
						<a class="collapse-item" href="broadSelecPrice">가격 알림</a>
						<a class="collapse-item" href="broadSelecLimit">한도 알림</a>
					</div>
				</div>
			</li>

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
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

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
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">${uid}</span>
								<img class="img-profile rounded-circle"
								src="../../img/undraw_profile.svg">
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 프로필
								</a>

								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									로그아웃
								</a>
							</div></li>
					</ul>
				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">메세지</h1>
					

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">알림 메세지</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">

								
								<c:if test="${count != 0 }">

									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<thead>
											<tr>
												<th>번호</th>
												<th>메세지 내용</th>
											</tr>
										</thead>
										<tfoot>

										</tfoot>
										
											<tbody>

												<c:forEach items="${page}" var="page" varStatus = "index">
													<tr onclick="show(${page.mesno})">
														<td >${index.index+1}</td>
														<td>${page.sub}</td>
													</tr>
												</c:forEach>

											</tbody>
										
									</table>
									
								</c:if>
								<c:if test="${count == 0 }">
									<h3>메세지가 없습니다.</h3>
								</c:if>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2020</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

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
	<!--Script-->
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>


	<!-- Bootstrap core JavaScript-->
	<script src="../../vendor/jquery/jquery.min.js"></script>
	<script src="../../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../../vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../../js/sb-admin-2.min.js"></script>   

	<!-- Page level plugins -->
	<script src="vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="../../js/demo/datatables-demo.js"></script>
	
	<script>
		function show(data){
			
			$.ajax({
				url: '/showmessage',
				type: 'get',
				data: { mesno: parseInt(data) },
				dataType: 'text',
				success: function(data) {
					const newWindow = window.open('', 'New Window', "top=500, left=500, width=570, height=70, menubar=no, toolbar=no, location=no");
					const contents = '<h4 style="color: white;">' + data + '</h4>';
					const buttonHtml = "<br><button onclick='window.close()'>Close</button>";
					const style = "<style> body { background-color: #009900; } button { position: fixed; top: 50%; left: 50%; transform: translate(-50%, -30%); width: 100px; height: 30px; } </style>";
					const finalHtml = style + contents + buttonHtml;
					newWindow.document.write(finalHtml);
					}
				});

		}
		
	</script>

</body>

</html>