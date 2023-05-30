<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title _msttexthash="22895990" _msthash="0">SB Admin 2 - 차트</title>

    <!-- Custom fonts for this template-->
    <link href="../../../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../../../css/sb-admin-2.min.css" rel="stylesheet">

<style type="text/css">/* Chart.js */
@keyframes chartjs-render-animation{from{opacity:.99}to{opacity:1}}.chartjs-render-monitor{animation:chartjs-render-animation 1ms}.chartjs-size-monitor,.chartjs-size-monitor-expand,.chartjs-size-monitor-shrink{position:absolute;direction:ltr;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1}.chartjs-size-monitor-expand>div{position:absolute;width:1000000px;height:1000000px;left:0;top:0}.chartjs-size-monitor-shrink>div{position:absolute;width:200%;height:200%;left:0;top:0}</style></head>
<body id="page-top">

    <!-- Page Wrapper -->	
	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<!-- 홈화면 링크 부분-->

			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="/company/main">

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
                    <h1 class="h3 mb-2 text-gray-800" _msttexthash="10366200" _msthash="57">장부 그래프</h1>
                    

                    <!-- Content Row -->
                    <div class="row">

                        <div class="col-xl-12 col-lg-7">

                            

                            <!-- Bar Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary" _msttexthash="22221355" _msthash="61">장부 그래프</h6>
                                </div>
                                <div> <!--  id="B" --> 
  <div> <!-- style="display:flex; align-items:center;" -->
  <form id="chartform"action="${pageContext.request.contextPath}/finance/filtered_data_o" method="get">
 <!--  <p><strong>매출 내역</strong></p><br> -->
    <table id="data-table">
      <tr>
        <th id="C"></th>
      <td id="I">
   <label class="test_obj">
    <input type="radio" name="date" value="today">
    <span>오늘</span>
</label>
 
<label class="test_obj">
    <input type="radio" name="date" value="1month">
    <span>1개월</span>
</label>
 
<label class="test_obj">
    <input type="radio" name="date" value="3month">
    <span>3개월</span>
</label>
<label class="test_obj">
    <input type="radio" name="date" value="1year">
    <span>1년</span>
</label>

 <label for="start-date-input"></label>
<input type="date" id="start-date-input" name="start-date" min="2021-01-01" max="" value="" required>

<label for="end-date-input"><a id="P">~</a></label>
<input type="date" id="end-date-input" name="end-date" min="" max="" value="" required>
<button type="button" class="resetButton" onclick="resetSearch()">X</button>
<button type="button" id="myButton" onclick="search()">검색 </button>
                                        
                                    </div>
                                <div class="card-body">
                                    <div class="chart-bar"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                        <canvas id="myChart" width="571" height="400" style="display: block; height: 320px; width: 457px;" class="chartjs-render-monitor"></canvas>
                                        <input type="hidden" id="totalselllist" value="${totalselllist}" />
                                        </table>
                                         </form>

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
                        <span _msttexthash="48660001" _msthash="65">저작권 © 웹 사이트 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" _msthidden="6">
        <div class="modal-dialog" role="document" _msthidden="6">
            <div class="modal-content" _msthidden="6">
                <div class="modal-header" _msthidden="3">
                    <h5 class="modal-title" id="exampleModalLabel" _msttexthash="215449" _msthidden="1" _msthash="66">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close" _msthidden="1" _mstaria-label="59709" _msthash="67">
                        <span aria-hidden="true" _msttexthash="19565" _msthidden="1" _msthash="68">×</span>
                    </button>
                </div>
                <div class="modal-body" _msttexthash="2662309" _msthidden="1" _msthash="69">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer" _msthidden="2">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal" _msttexthash="73216" _msthidden="1" _msthash="70">Cancel</button>
                    <a class="btn btn-primary" href="login.html" _msttexthash="79768" _msthidden="1" _msthash="71">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="../../../vendor/jquery/jquery.min.js"></script>
    <script src="../../../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../../../vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../../../js/sb-admin-2.min.js"></script>
    <script src="../../../js/sb-admin-2.min2.js"></script>

    <!-- Page level plugins -->
    <script src="../../../vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="../../../js/demo/chart-area-demo.js"></script>
    <script src="../../../js/demo/chart-pie-demo.js"></script>
    <script src="../../../js/demo/chart-bar-demo.js"></script>
<style>
  #data-table {
    margin: 20px auto 0;
  }
</style>
</body>

</html>