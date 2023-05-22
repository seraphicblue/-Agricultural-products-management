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
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3"><font _mstmutation="1" _msttexthash="18680857" _msthash="1">SB 관리자 </font><sup _msttexthash="4550" _msthash="2">2</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="index.html">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span _msttexthash="21036444" _msthash="3">대시보드</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading" _msttexthash="30317092" _msthash="4"> 인터페이스 </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span _msttexthash="21572616" _msthash="5">구성 요소</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar" _msthidden="3">
                    <div class="bg-white py-2 collapse-inner rounded" _msthidden="3">
                        <h6 class="collapse-header" _msttexthash="341471" _msthidden="1" _msthash="6">Custom Components:</h6>
                        <a class="collapse-item" href="buttons.html" _msttexthash="99294" _msthidden="1" _msthash="7">Buttons</a>
                        <a class="collapse-item" href="cards.html" _msttexthash="58968" _msthidden="1" _msthash="8">Cards</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span _msttexthash="22836892" _msthash="9">유틸리티</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar" _msthidden="5">
                    <div class="bg-white py-2 collapse-inner rounded" _msthidden="5">
                        <h6 class="collapse-header" _msttexthash="308620" _msthidden="1" _msthash="10">Custom Utilities:</h6>
                        <a class="collapse-item" href="utilities-color.html" _msttexthash="78949" _msthidden="1" _msthash="11">Colors</a>
                        <a class="collapse-item" href="utilities-border.html" _msttexthash="95550" _msthidden="1" _msthash="12">Borders</a>
                        <a class="collapse-item" href="utilities-animation.html" _msttexthash="159094" _msthidden="1" _msthash="13">Animations</a>
                        <a class="collapse-item" href="utilities-other.html" _msttexthash="60853" _msthidden="1" _msthash="14">Other</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading" _msttexthash="15348424" _msthash="15"> 애드온 </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span _msttexthash="16282344" _msthash="16">페이지</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar" _msthidden="7">
                    <div class="bg-white py-2 collapse-inner rounded" _msthidden="7">
                        <h6 class="collapse-header" _msttexthash="216567" _msthidden="1" _msthash="17">Login Screens:</h6>
                        <a class="collapse-item" href="login.html" _msttexthash="59891" _msthidden="1" _msthash="18">Login</a>
                        <a class="collapse-item" href="register.html" _msttexthash="116025" _msthidden="1" _msthash="19">Register</a>
                        <a class="collapse-item" href="forgot-password.html" _msttexthash="262561" _msthidden="1" _msthash="20">Forgot Password</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header" _msttexthash="164905" _msthidden="1" _msthash="21">Other Pages:</h6>
                        <a class="collapse-item" href="404.html" _msttexthash="73216" _msthidden="1" _msthash="22">404 Page</a>
                        <a class="collapse-item" href="blank.html" _msttexthash="125502" _msthidden="1" _msthash="23">Blank Page</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item active">
                <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span _msttexthash="10366200" _msthash="24">차트</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="tables.html">
                    <i class="fas fa-fw fa-table"></i>
                    <span _msttexthash="15879240" _msthash="25">테이블</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="검색 대상..." aria-label="검색" aria-describedby="basic-addon2" _mstplaceholder="164775" _msthash="26" _mstaria-label="74607">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none" _msthidden="1">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown" _msthidden="1">
                                <form class="form-inline mr-auto w-100 navbar-search" _msthidden="1">
                                    <div class="input-group" _msthidden="1">
                                        <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" _msthidden="A" _mstplaceholder="164775" _msthash="27" _mstaria-label="74607">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter" _msttexthash="9113" _msthash="28">3+</span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown" _msthidden="8">
                                <h6 class="dropdown-header" _msttexthash="202592" _msthidden="1" _msthash="29">
                                    Alerts Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#" _msthidden="2">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div _msthidden="2">
                                        <div class="small text-gray-500" _msttexthash="191633" _msthidden="1" _msthash="30">December 12, 2019</div>
                                        <span class="font-weight-bold" _msttexthash="1145443" _msthidden="1" _msthash="31">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#" _msthidden="2">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div _msthidden="2">
                                        <div class="small text-gray-500" _msttexthash="179179" _msthidden="1" _msthash="32">December 7, 2019</div><font _mstmutation="1" _msttexthash="1332864" _msthidden="1" _msthash="33">
                                        $290.29 has been deposited into your account!
                                    </font></div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#" _msthidden="2">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div _msthidden="2">
                                        <div class="small text-gray-500" _msttexthash="178204" _msthidden="1" _msthash="34">December 2, 2019</div><font _mstmutation="1" _msttexthash="3176017" _msthidden="1" _msthash="35">
                                        Spending Alert: We've noticed unusually high spending for your account.
                                    </font></div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#" _msttexthash="225862" _msthidden="1" _msthash="36">Show All Alerts</a>
                            </div>
                        </li>

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter" _msttexthash="5005" _msthash="37">7</span>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown" _msthidden="14">
                                <h6 class="dropdown-header" _msttexthash="225121" _msthidden="1" _msthash="38">
                                    Message Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#" _msthidden="3">
                                    <div class="dropdown-list-image mr-3" _msthidden="1">
                                        <img class="rounded-circle" src="../../../img/undraw_profile_1.svg" alt="..." _msthidden="A" _mstalt="14352" _msthash="39">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold" _msthidden="2">
                                        <div class="text-truncate" _msttexthash="2981589" _msthidden="1" _msthash="40">Hi there! I am wondering if you can help me with a
                                            problem I've been having.</div>
                                        <div class="small text-gray-500" _msttexthash="280072" _msthidden="1" _msthash="41">Emily Fowler · 58m</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#" _msthidden="3">
                                    <div class="dropdown-list-image mr-3" _msthidden="1">
                                        <img class="rounded-circle" src="../../../img/undraw_profile_2.svg" alt="..." _msthidden="A" _mstalt="14352" _msthash="42">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div _msthidden="2">
                                        <div class="text-truncate" _msttexthash="3756779" _msthidden="1" _msthash="43">I have the photos that you ordered last month, how
                                            would you like them sent to you?</div>
                                        <div class="small text-gray-500" _msttexthash="152724" _msthidden="1" _msthash="44">Jae Chun · 1d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#" _msthidden="3">
                                    <div class="dropdown-list-image mr-3" _msthidden="1">
                                        <img class="rounded-circle" src="../../../img/undraw_profile_3.svg" alt="..." _msthidden="A" _mstalt="14352" _msthash="45">
                                        <div class="status-indicator bg-warning"></div>
                                    </div>
                                    <div _msthidden="2">
                                        <div class="text-truncate" _msttexthash="4955132" _msthidden="1" _msthash="46">Last month's report looks great, I am very happy with
                                            the progress so far, keep up the good work!</div>
                                        <div class="small text-gray-500" _msttexthash="318929" _msthidden="1" _msthash="47">Morgan Alvarez · 2d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#" _msthidden="3">
                                    <div class="dropdown-list-image mr-3" _msthidden="1">
                                        <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="..." _msthidden="A" _mstalt="14352" _msthash="48">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div _msthidden="2">
                                        <div class="text-truncate" _msttexthash="7034664" _msthidden="1" _msthash="49">Am I a good boy? The reason I ask is because someone
                                            told me that people say this to all dogs, even if they aren't good...</div>
                                        <div class="small text-gray-500" _msttexthash="315822" _msthidden="1" _msthash="50">Chicken the Dog · 2w</div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#" _msttexthash="307840" _msthidden="1" _msthash="51">Read More Messages</a>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small" _msttexthash="34558251" _msthash="52">더글러스 맥기</span>
                                <img class="img-profile rounded-circle" src="../../../img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown" _msthidden="4">
                                <a class="dropdown-item" href="#" _msthidden="1">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i><font _mstmutation="1" _msttexthash="94315" _msthidden="1" _msthash="53">
                                    Profile
                                </font></a>
                                <a class="dropdown-item" href="#" _msthidden="1">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i><font _mstmutation="1" _msttexthash="117221" _msthidden="1" _msthash="54">
                                    Settings
                                </font></a>
                                <a class="dropdown-item" href="#" _msthidden="1">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i><font _mstmutation="1" _msttexthash="178984" _msthidden="1" _msthash="55">
                                    Activity Log
                                </font></a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal" _msthidden="1">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i><font _mstmutation="1" _msttexthash="79768" _msthidden="1" _msthash="56">
                                    Logout
                                </font></a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800" _msttexthash="10366200" _msthash="57">차트</h1>
                    <p class="mb-4" _msttexthash="2402823007" _msthash="58">Chart.js는 이 테마에서 차트를 생성하는 데 사용되는 타사 플러그인입니다.
 아래 차트는 사용자 정의되었습니다 - 추가 사용자 정의 옵션을 보려면 <a target="_blank" href="https://www.chartjs.org/docs/latest/" _istranslated="1">공식 차트를 방문하십시오.js
 선적 서류 비치</a>.</p>

                    <!-- Content Row -->
                    <div class="row">

                        <div class="col-xl-8 col-lg-7">

                            <!-- Area Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary" _msttexthash="23009883" _msthash="59">영역 차트</h6>
                                </div>
                                <div class="card-body">
                                    <div class="chart-area"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                        <canvas id="myAreaChart" width="571" height="400" style="display: block; height: 320px; width: 457px;" class="chartjs-render-monitor"></canvas>
                                    </div>
                                    <hr><font _mstmutation="1" _msttexthash="215862985" _msthash="60"> 영역 차트의 스타일은 파일에서 찾을 수 있습니다. </font><code>/js/demo/chart-area-demo.js</code></div>
                            </div>

                            <!-- Bar Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary" _msttexthash="22221355" _msthash="61">막대 차트</h6>
                                </div>
                                <div class="card-body">
                                    <div class="chart-bar"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                        <canvas id="myBarChart" width="571" height="400" style="display: block; height: 320px; width: 457px;" class="chartjs-render-monitor"></canvas>
                                    </div>
                                    <hr><font _mstmutation="1" _msttexthash="215074457" _msthash="62"> 막대 차트의 스타일은 파일에서 찾을 수 있습니다. </font><code>/js/demo/chart-bar-demo.js</code></div>
                            </div>

                        </div>

                        <!-- Donut Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary" _msttexthash="22030684" _msthash="63">도넛 차트</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                        <canvas id="myPieChart" width="571" height="316" style="display: block; height: 253px; width: 457px;" class="chartjs-render-monitor"></canvas>
                                    </div>
                                    <hr><font _mstmutation="1" _msttexthash="233168572" _msthash="64"> 도넛형 차트의 스타일은 파일에서 찾을 수 있습니다. </font><code>/js/demo/chart-pie-demo.js</code></div>
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

    <!-- Page level plugins -->
    <script src="../../../vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="../../../js/demo/chart-area-demo.js"></script>
    <script src="../../../js/demo/chart-pie-demo.js"></script>
    <script src="../../../js/demo/chart-bar-demo.js"></script>



</body>

</html>