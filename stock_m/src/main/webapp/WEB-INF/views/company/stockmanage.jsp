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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Tables</title>

    <!-- Custom fonts for this template -->
    <link href="../../../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../../../css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="../../../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

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
                    <h1 class="h3 mb-2 text-gray-800">Tables</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">재고관리</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                             
                             <form action="/company/search">
                             <input type="text" name="search" size="15" maxlength="50" />
                             <input type="submit" value="검색" />
                             </form>	
                              <c:if test="${count != 0 }">
                              
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                           <th><input type="checkbox" id="checkall" onclick="selectAll(this)"></th>
					                       <th>재고내용</th>
					                        <th>재고코드</th>
					                       <th>재고번호</th>
					                       <th>재고수량</th>
					                       <th>관리버튼</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                    
                                    </tfoot>
                                    <form action="/company/supdate" id="upform">
                                    <tbody>
                                      
                                        <c:forEach items="${stockList}" var="stock">
				
					<tr>
					<td>
                      <input type="checkbox" id="test_check" name='test_check' value="${stock.sno}"></td>
                  <td><input type="text" id="scontent_${stock.sno}" value="${stock.scontent}" name="scontent" readonly></td>
                  <td><input type="text" id="s_val_${stock.sno}" value="${stock.s_val}" name="s_val" readonly></td>
						<td><input type="text" id="sno_${stock.sno}" value="${stock.sno}" name="sno" readonly></td><!-- 상세보기 -->
						<td><input class="a" type="text"  id="s_volume_${stock.sno}" value="${stock.s_volume}" name="s_volume"></td>
						<td>	
                            <button type="button" id="${stock.sno}" onclick="dc(this)">삭제</button></td>
					</tr>
				
				                      </c:forEach>
				
                                    </tbody>
                                     </form> 
                                    <button type="submit"> 통합수정</button>
				                    <button onclick="delcheckit()">통합삭제</button>
                                </table>
                                </form>
                                </c:if>
                                <c:if test="${count == 0 }">
	아직 입력한 글이 없습니다.
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
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>
    <!--Script-->
<script src="https://code.jquery.com/jquery-2.2.4.min.js" ></script>
<script type="text/javascript">
var inputElements = document.querySelectorAll('input.a');

inputElements.forEach(function(inputElement) {
  inputElement.addEventListener('change', function(event) {
    var sno = event.target.id.toString().split("_")[2];
    var s_volume = event.target.value;
    var str = sno.toString() + "A" + s_volume.toString();
    console.log(str);
    console.log('Value changed: ' + event.target.value, sno);

    $.ajax({
      url: "/company/ssupdate/" + str,
      type: "GET",
      dataType: "text"
    }).done(function() {
      document.location.reload();
    });
  });
});

//"/company/ssupdate?sno=" + sno + "&s_volume=" + s_volume
function selectAll(selectAll){
	  const checkboxes 
	     = document.querySelectorAll('input[name="test_check"]');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	}

/* function up(button){
    var sno = button.id.toString().split("_"); 
    console.log(sno);
    //document.getElementById("sno_" + sno).removeAttribute("readonly");
   // document.getElementById("pno_" + sno).removeAttribute("readonly");
    document.getElementById("s_volume_" + sno).removeAttribute("readonly"); 
        
} *///main코드 수정 23.05.23

/*function supdate(button){
	var sno = button.id.toString().split("_"); 
	var element = document.getElementById("s_volume_" + sno);
	var s_volume = element.value;
	
	
	 $.ajax({
	      type: "GET",
	      url: "/company/supdate",
	      data: {sno:sno, s_volume:s_volume}
	   
	      
	    }).done(function(){
	    	document.location.reload();

	})
	
}*///main코드 수정 23.05.23
	function dc(obj){
		var params = {
				sno : obj.getAttribute("id")
        };
		$.ajax({
		      type: "GET",
		      url: "/company/sdelete",
		      data: params,
		   
		      
		    }).done(function(){
		    	document.location.reload();
 
		})
	}
	
	  function delcheckit(obj) {
	    var checkboxes = document.querySelectorAll('input[name="test_check"]:checked');
	    var selectedItems = [];

	    checkboxes.forEach(function (checkbox) {
	      selectedItems.push(checkbox.value);
	     console.log("여긴 아작스"+selectedItems);
	    });
	    $.ajax({
	    	  type: "GET",
	    	  url: "/company/scheckdelete",
	    	  data: { selectedItems: selectedItems },
	    	}).done(function() {

	    	  document.location.reload();
	    	});
	    
	  } 
	
	function upform(){
		document.getElementById("upform").submit();
	} 
	    function upcheckit(button) {
		 
		   
		    var checkboxes = document.querySelectorAll('input[name="test_check"]:checked');
		    var selectedItems = [];
		  
		   
		   
		    checkboxes.forEach(function (checkbox) {
		      selectedItems.push(checkbox.value);
		      
		    });
		    $.ajax({
		    	  type: "GET",
		    	  url: '/company/stockupdate',
		    	  data:  { selectedItems: selectedItems },
		                      
		    	}).done(function() {
		    	  document.location.reload();
		    	});
		    
		  } 
	  </script>
	 
	  
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

</body>

</html>