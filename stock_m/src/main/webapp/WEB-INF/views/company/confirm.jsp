<!--
   Date    : 2023.05.15
   name    : confirm
   type    : jsp
   ver     : 1.1
   connect  : RevenueController
   content : 판매내역보여주는 페이지
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
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
     <!--<link href="../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet"> -->
	
		
		
	
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
                        <div align="left" style="color:green">
                            장부입력
                             			<!-- <div id="search" > -->
	                                    
		                                   <select id="sbchange" name="searchn" >
			                               <option value="snb" >전체</option>
			                               <option value="buy">구매</option>
			                               <option value="sell">판매</option>
		                                   </select>
	                                       	
                                          <!--  </div> -->
                         </div>  
                        </div>
                        
                     
                        
                        
                        <div class="card-body">
                            <div class="table-responsive">
                              <c:if test="${count != 0 }">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead id="thead">
                                        <tr>
                                           <th><input type="checkbox" id="checkall" onclick="selectAll(this)"></th>
					                       <th>날짜</th>
					                       <th>거래번호</th>
					                       <th>구분</th>
                                           <th>상품명</th>
					                       <th>금액</th>
					                       <th>재고량</th>
					                       <th>관리버튼</th>
                                        </tr>
                                    </thead>
                                    </thead>
                                    <tfoot>
                                           
                              
                                        
                                    </tfoot>
                                  
                                    <tbody id="formin" >
                                    <c:forEach items="${totalList}" var="t">
                                   	<tr>
		     	    			
		     	    			<td><input id="test_check" name="test_check" value="${t.no}" type="checkbox"></td>
		     	    			<td>${t.date}</td>
		     	    		         <td>${t.no}</td>
		     	    		         <td>${t.kind}</td>
		     	    		         <td>${t.pname}</td>
		     	    		          <td>${t.price}</td>
		     	    		        <td>${t.count}</td>
		     	    		      <td><button type="button" id="${t.no}" title="${t.kind}" onclick="nodelete(this)">삭제</button></td>
		     	    		</tr>
                                     	</c:forEach>
                                    </tbody>
                                     
                                   
                                </table>
                                 
                                   <form action='/company/buyinsert'  id='buyinsert' >
                                    </form>
                                      <form action='/company/sellinsert'  id='sellinsert' >
                                    </form>
                            <button onclick='totaldel(this)'>통합삭제</button>
                                </c:if>
                                <c:if test="${count == 0 }">
	아직 거래가 없습니다.
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
//total 전체선택
/* function selectAll(selectAll){
	  const checkboxes 
	     = document.querySelectorAll('input[name="test_check"]');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	} */
	 function selectAll(selectAll){
		  const checkboxes 
		     = document.querySelectorAll('input[type="checkbox"]');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked
		  })
		} 	
	
/* //sell 전체선택	
function sellselectAll(selectAll){
	  const checkboxes 
	     = document.querySelectorAll('input[name="sell_check"]');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	}
//buy 전체선택
function buyselectAll(selectAll){
	  const checkboxes 
	     = document.querySelectorAll('input[name="buy_check"]');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	} */

function submitForm(){
	document.getElementById("upform").submit();
	
} 
function up(button){
    var sno = button.id.toString().split("_"); 
    console.log(sno);
    //document.getElementById("sno_" + sno).removeAttribute("readonly");
    document.getElementById("pno_" + sno).removeAttribute("readonly");
    document.getElementById("price_" + sno).removeAttribute("readonly"); 
        
}
function dc(obj){//buy 삭제
		
		bno = obj.getAttribute("id");
		console.log(bno);
		

$.ajax({
      type: "GET",
      url: "/company/rdelete",
      data: {bno:bno}
   	
      
    }).done(function(){
    	 //$("#sbchange").val("buy");
    	document.location.reload();
    	 

})
}

function sc(obj){//sell 삭제
	
	sno = obj.getAttribute("id");
	console.log(sno);
	

$.ajax({
  type: "GET",
  url: "/company/revselldel",
  data: {sno:sno}
	
  
}).done(function(){
	 //$("#sbchange").val("buy");
	document.location.reload();
	 

})
}
	/*function dc(obj){
		var params = {
				sno : obj.getAttribute("id")
        };
		$.ajax({
		      type: "GET",
		      url: "/company/rdelete",
		      data: params,
		   
		      
		    }).done(function(){
		    	//document.location.reload();
 
		})
	}*/
	function totaldel(obj){
		var element = document.getElementById("test_check");
		 var no=obj.getAttribute("id");
		 var kind=obj.getAttribute("title");
			console.log(no);
			console.log(kind);
		 if(obj.getAttribute("title") == "판매"){
			

			 var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
			    var selectedItems = [];
		        console.log(selectedItems);
			    checkboxes.forEach(function (checkbox) {
			      selectedItems.push(checkbox.value);
			    });
			    $.ajax({
			    	  type: "GET",
			    	  url: "/company/rcheckdelete",
			    	  data: { selectedItems: selectedItems },
			    	}).done(function() {
			    	  document.location.reload();
			    	});
			}
			else{
				var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
			    var selectedItems = [];
		        
			    checkboxes.forEach(function (checkbox) {
			      selectedItems.push(checkbox.value);
			     
			    });
			    $.ajax({
			    	  type: "GET",
			    	  url: "/company/revsellcheckdel",
			    	  data: { selectedItems: selectedItems },
			    	}).done(function() {
			    		 
			    	  document.location.reload();
			    	 
			    	});
	    
	  } 
	}
	
	//구매체크 삭제
	  function delcheckit(obj) {
	    var checkboxes = document.querySelectorAll('input[name="buy_check"]:checked');
	    var selectedItems = [];
        
	    checkboxes.forEach(function (checkbox) {
	      selectedItems.push(checkbox.value);
	     
	    });
	    $.ajax({
	    	  type: "GET",
	    	  url: "/company/rcheckdelete",
	    	  data: { selectedItems: selectedItems },
	    	}).done(function() {
	    		 
	    	  document.location.reload();
	    	 
	    	});
	    
	}
	//판매체크 삭제
	function delchecksell(obj) {
	    var checkboxes = document.querySelectorAll('input[name="sell_check"]:checked');
	    var selectedItems = [];
        console.log(selectedItems);
	    checkboxes.forEach(function (checkbox) {
	      selectedItems.push(checkbox.value);
	    });
	    $.ajax({
	    	  type: "GET",
	    	  url: "/company/revsellcheckdel",
	    	  data: { selectedItems: selectedItems },
	    	}).done(function() {
	    	  document.location.reload();
	    	});
	    
	  } 
	
	   function upcheckit(button) {
		 
		   
		    var checkboxes = document.querySelectorAll('input[name="test_check"]:checked');
		    var selectedItems = [];
		  
		   
		   
		    checkboxes.forEach(function (checkbox) {
		      selectedItems.push(checkbox.value);
		      
		    });
		    $.ajax({
		    	  type: "GET",
		    	  url: '/company/rcheckupdate',
		    	  data:  { selectedItems: selectedItems },
		                      
		    	}).done(function() {
		    	  document.location.reload();
		    	});
		    
		  } 
	   
	    function nodelete(obj){
		 var no=obj.getAttribute("id");
		 var kind=obj.getAttribute("title");
			console.log(no);
			console.log(kind);
		 if(obj.getAttribute("title") == "판매"){
			 $.ajax({
				  type: "GET",
				  url: "/company/revselldel",
				  data: {"sno":no}
					
				  
				}).done(function(){
					 //$("#sbchange").val("buy");
					 alert(no);
			        alert(kind);
					document.location.reload();
					 

				})
			}
			else{
				$.ajax({
				      type: "GET",
				      url: "/company/rdelete",
				      data: {"bno":no}
				   	
				      
				    }).done(function(){
				    	alert(no);
						alert(kind);
				    	 //$("#sbchange").val("buy");
				    		document.location.reload();
				    	 

				})
				
				
			} 

	$.ajax({
	      type: "GET",
	      url: "/company/rdelete",
	      data: {no:no}
	   	
	      
	    }).done(function(){
	    	 //$("#sbchange").val("buy");
	    	document.location.reload();
	    	 

	})
		   
	   } 
	  
	  /*  function checksnb(button) {
			

	    });
	    $.ajax({
	    	  type: "GET",
	    	  url: '/company/total',
	    	  data:  { "list":sellList, rbuyList:rbuyList },
	                      
	    	}).done(function() {
	    	  document.location.reload();
	    	});
	    
	  }  */
	  
	/*   function checkbuy(button) {
			

	    });
	    $.ajax({
	    	  type: "GET",
	    	  url: '/company/rbuy',
	    	  data:  { "list": rbuyList },
	                      
	    	}).done(function() {
	    	  document.location.reload();
	    	});
	    
	  } 

	   function checksell(button) {
			

		    });
		    $.ajax({
		    	  type: "GET",
		    	  url: '/company/confirm',
		    	  data:  { "list": sellList },
		                      
		    	}).done(function() {
		    	  document.location.reload();
		    	});
		    
		  }  */
	   
          //option 선택
		  $("#sbchange").change(function(event){
			   if($(this).val() == "snb"){
				   $.ajax({
				    	  type: "GET",
				    	  url: '/company/total',
				    	  dataType: "json"
				                      
				    	}).done(function(response) {
				    		
				    		$("#sbchange").val("total");
				    		console.log("totalList");
				    		$("input:checkbox[id='checkall']").prop("checked", false);
				    		
				    		 document.getElementById("buyinsert").style.display = "none";
		     	    		document.getElementById("sellinsert").style.display = "none";
		     	    		
		     	    		 
		     	    		var str = "";
		     	    		for(let rb in response){
		     	    			console.log(response[rb]["date"]);
		     	    			
		     	    			str += "<tr>";
		     	    			str+= "<td><input id='total_check' name='total_check' value="+response[rb]["no"]+" type='checkbox'></td>";
		     	    			str += "<td>"+response[rb]["date"]+"</td>"
		     	    		          +"<td>"+response[rb]["no"]+"</td>"
		     	    		          +"<td>"+response[rb]["kind"]+"</td>"
		     	    		          +"<td>"+response[rb]["pname"]+"</td>"
		     	    		         +"<td>"+response[rb]["price"]+"</td>"
		     	    		        +"<td>"+response[rb]["count"]+"</td>"
		     	    		      str += "<td><button type='button' id= '"+response[rb]["no"]+"' title='"+response[rb]["kind"]+"'  onclick=nodelete(this)>삭제</button></td>";
		     	    			str+="</tr>";
		     	    		     }
		     	    		
		     	    		       
		     	    		 $("#formin").html(str);
		     	    		
				    		 
				    		
				    	});
	           } else if($(this).val() == "sell"){
	        	   
	        	   $.ajax({
	 		    	  type: "GET",
	 		    	  url: '/company/rsell',
	 		    	  dataType: "json"
	 		    	}).done(function(response) {
	 		    		
	 		    		$("#sbchange").val("sell");
	 		    		$("input:checkbox[id='checkall']").prop("checked", false);
	 		    		document.getElementById("sellinsert").style.display = "block";
	 		    		document.getElementById("buyinsert").style.display = "none";
	 		    		
	 		    		
	 		    		console.log("sellList");
	 		    		 
	 		    		var str = "";
	     	    		for(let rb in response){
	     	    			console.log(response[rb]["sdate"]);
	     	    			
	     	    			str += "<tr>";
	     	    			
	     	    			str+= "<td><input id='sell_check' name='sell_check' value="+response[rb]["sno"]+" type='checkbox'></td>";
	     	    			str += "<td>"+response[rb]["sdate"]+"</td>"
	     	    		          +"<td>"+response[rb]["sno"]+"</td>"
	     	    		          +"<td>"+"판매"+"</td>"
	     	    		          +"<td>"+response[rb]["pname"]+"</td>"
	     	    		         +"<td>"+response[rb]["price"]+"</td>"
	     	    		        +"<td>"+response[rb]["scount"]+"</td>"
	     	    		      str += "<td><button type='button' id= "+response[rb]["sno"]+" onclick=sc(this)>삭제</button></td>";
	     	    			str+="</tr>";
	     	    		     }
	     	    		       
	     	    		 $("#formin").html(str);

	     	    		
	     	    		 var sts="";
	     	    		 sts+= "<button onclick='delchecksell(this)'>판매통합삭제</button>"
     	    	    	 sts +=  "<tr>"
     	    	    		sts +=  "<th><button type='button' id='plus' >+</button></th>"
     	    	    			sts += "<th></th>"
     	    	    				sts += "<th></th>"
     	    	    					sts += "<th>판매</th>"
     	    	    						sts += "<th><input type='text' name='pno'></th>"
     	    	    							sts += "<th><input type='text' name='price'></th>"
     	    	    								sts +="<th><input type='text' name='scount'></th>"
     	    	    									sts +="<th><input type='submit' value='입력'> </th>"
     	    	    										sts += "</tr>"
     	    	    											
     	    		   $("#sellinsert").html(sts);
	     	    		
	     	    	   
	     	    		});//done


	 		    	 
	 		    
	           }//else if
	           else if($(this).val() == "buy"){
	        	   $.ajax({
	     	    	  type: "GET",
	     	    	  url: '/company/rbuy',
	     	    	  dataType: "json"
	     	                      
	     	    	}).done(function(response) {
	     	    		
	     	    		$("#sbchange").val("buy");
	     	    		$("input:checkbox[id='checkall']").prop("checked", false);
	     	    		
	     	    		document.getElementById("buyinsert").style.display = "block";
	     	    		document.getElementById("sellinsert").style.display = "none";
	     	    		
	     	    		
	     	    		var str = "";
	     	    		for(let rb in response){
	     	    			console.log(response[rb]["bdate"]);
	     	    			
	     	    			str += "<tr>";
	     	    			str+= "<td><input id='buy_check' name='buy_check' value="+response[rb]["bno"]+" type='checkbox'></td>";
	     	    			str += "<td>"+response[rb]["bdate"]+"</td>"
	     	    		          +"<td>"+response[rb]["bno"]+"</td>"
	     	    		          +"<td>"+"구매"+"</td>"
	     	    		          +"<td>"+response[rb]["pname"]+"</td>"
	     	    		         +"<td>"+response[rb]["price"]+"</td>"
	     	    		        +"<td>"+response[rb]["bcount"]+"</td>"
	     	    		      str += "<td><button type='button' id= "+response[rb]["bno"]+" onclick=dc(this)>삭제</button></td>";
	     	    			str+="</tr>";
	     	    		     }
	     	    		       
	     	    		 $("#formin").html(str);
	     	    		    //$("#formin").append(str);

	     	    		
	     	    		 var sts="";
	     	    		 sts +="<button onclick='delcheckit(this)'>구매통합삭제</button>"
     	    	    	 sts +=  "<tr>"
     	    	    		sts +=  "<th><button type='button' id='plus' >+</button></th>"
     	    	    			sts += "<th></th>"
     	    	    				sts += "<th></th>"
     	    	    					sts += "<th>구매</th>"
     	    	    						sts += "<th><input type='text' name='pno'></th>"
     	    	    							sts += "<th><input type='text' name='price'></th>"
     	    	    								sts +="<th><input type='text' name='bcount'></th>"
     	    	    									sts +="<th><input type='submit' value='입력'> </th>"
     	    	    										sts += "</tr>"
     	    	    										
     	    	    											
     	    		   $("#buyinsert").html(sts);
	     	    		})
	     	    
	     	    		
	     	    
	     	    		
	     	    		
					 
	           }//else if
		   
		   })//function 
		   
	  </script>
	 
	  
	 <!-- Bootstrap core JavaScript-->
  <script src="../../../vendor/jquery/jquery.min.js"></script>
    <script src="../../../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../../../vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../../../js/sb-admin-2.min.js"></script>

   
  

</body>

</html>