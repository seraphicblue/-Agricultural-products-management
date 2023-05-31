<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Register</title>

    <!-- Custom fonts for this template-->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="../https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>                                
                            </div>
                            <form class="user" method="post">
                            
                            	<div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <select onchange="cselect()" id="select" name="role">
                                        	<option selected disabled hidden="">사용자의 유형을 선택해 주세요.</option>
                            				<option value="ROLE_COMPANY">업체</option>
                            				<option value="ROLE_NORMAL">일반인</option> 
                            			</select>
                            			<input name="enabled" value="3" hidden="">
                                    </div>
                                    <div class="col-sm-6">
                                        <label><input type="radio" name="gender" value="남" checked> 남자</label>
                                    	<label><input type="radio" name="gender" value="여"> 여자</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" id="username"
                                         name="username"   placeholder="이름">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user" id="age"
                                         name="age"   placeholder="나이">
                                    </div>
                                </div>
                                <div class="form-group row" style="margin-bottom: 3px">
                                	<div class="col-sm-6 mb-3 mb-sm-0" >
                                        <input type="text" class="form-control form-control-user" id="userid"
                                    	 name="userid" onchange="return idchecked()" placeholder="아이디">
                                    </div>
                                    <div class="col-sm-6" style="padding-top: 10px">
                                        <button type="button" onclick="return idchecked()">아이디 중복확인</button>                                        
                                    </div>                                    
                                </div>
                                <div class="form-group row">
                                	<div class="col-sm-6 mb-3 mb-sm-0" align="center">
                                        <span id="idchecked">아이디 중복확인을 해주세요.</span>
                                        <input type="hidden" name="idcheck" id="idcheck" value="unchecked">
                                    </div>                                    
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"
                                         name="userpw"   id="userpw" placeholder="비밀번호">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"
                                            id="userpwr" placeholder="비밀번호 확인">
                                    </div>
                                </div>
                            
                            <script>
                            	function cselect(){                            		
                            		if(document.getElementById("select").value == "ROLE_COMPANY") {
                            			location.href = "insertCompany";
                            		}
                            	}
                            	
                            	function idchecked() {
                                    var id = document.getElementById('userid').value;
                                    if (id.length < 5 || id == "") {
                                        alert('id는 5글자 이상이어야 합니다.');
                                        return false;
                                    }
                                 	// 공백과 특수문자 확인
                                    var regex = /^[a-zA-Z0-9]*$/;
                                    if (!regex.test(id)) {
                                        alert('ID에는 공백과 특수문자를 사용할 수 없습니다.');
                                        return false;
                                    }
                                    $.ajax({
                                        type: "get",
                                        url: "../login/idcheck",
                                        data: { "userid": id },
                                        dataType: "json",  // JSON 형식으로 데이터를 받음
                                        success: function(data) {
                                            if (data.cid > 0) {
                                                alert('이미 존재하는 ID입니다.');
                                                $('#idchecked').html('다른 ID를 입력해 주세요.');
                                            }else {
                                            	alert('사용 가능한 ID입니다.');
                                            	$('#idchecked').html('사용가능한 ID입니다.');
                                            	document.getElementById('idcheck').value = "checked";
                                            }
                                        },
                                        error: function() {
                                            alert('서버와의 통신에 문제가 발생했습니다.');
                                        }
                                    });
                                }
                            	
                            	function test() {
                          	      var p1 = document.getElementById('userpw').value;
                          	      var p2 = document.getElementById('userpwr').value;
                          	      var n = document.getElementById('username').value;
                          	      var a = document.getElementById('age').value;
                          	      var r = document.getElementById('select').value;
                          	      var id = document.getElementById('userid').value;
                          	   	  var cid = document.getElementById('idcheck').value;
                          	      
                          	      if(r != "ROLE_NORMAL" || r != "ROLE_NORMAL") {
                    	              alert('사용자 유형을 선택해주세요.');
                    	              return false;
                    	          }
                          	      
                          	      if(n.length < 2) {
                      	              alert('이름을 입력해주세요.');
                      	              return false;
                      	          }
                          	      // 공백과 특수문자 확인
                                  var regex = /^[a-zA-Z가-힣]*$/;
                                  if (!regex.test(n)) {
                                      alert('이름에는 공백, 특수문자, 자음 또는 모음을 사용할 수 없습니다.');
                                      return false;
                                  }	
                          	      
                          	      if(isNaN(a) || a == "") {
                      	              alert('나이는 숫자만 입력해주세요.');
                      	              return false;
                      	          }
                          	      
                          	      // 숫자 입력 확인
                                  var regex = /^[0-9]*$/;
                                  if (!regex.test(a)) {
                                      alert('나이는 숫자만 입력해주세요.');
                                      return false;
                                  }
                          	      
                          	      if(a < 14 || a > 140) {
                      	              alert('14살 이하는 가입할수 없습니다.');
                      	              return false;
                      	          }                          	      
                          	      
                          	      if(id.length < 5) {
                      	              alert('id는 5글자 이상이어야 합니다.');
                      	              return false;
                      	          }
                          	      // 공백과 특수문자 확인
                                  var regex = /^[a-zA-Z0-9]*$/;
                                  if (!regex.test(id)) {
                                      alert('ID에는 공백과 특수문자를 사용할 수 없습니다.');
                                      return false;
                                  }
                                  
                                  if(cid == "unchecked") {
                      	              alert('ID중복 확인을 해주세요.');
                      	              return false;
                      	          }
                          	      
                          	      if(p1.length < 3) {
                      	              alert('비밀번호는 4글자 이상이어야 합니다.');
                      	              return false;
                      	          }                          	      
                          		  // 공백과 특수문자 확인
                                  var regex = /^[a-zA-Z0-9!@#$%^&*]*$/;
                                  if (!regex.test(p1)) {
                                      alert('비밀번호에는 공백을 사용할 수 없습니다.');
                                      return false;
                                  }
                          	          
                          	      if( p1 != p2 ) {
                          	            alert("비밀번호불일치");
                          	            return false;
                          	          } else{
                          	            alert("비밀번호가 일치합니다");
                          	            return true;
                          	          }
                          	    }
                          </script>
                            
                                <button type="submit" onclick="return test()" class="btn btn-primary btn-user btn-block">
                                    회원가입
                                </button>
                                <hr>
                                <a href="index.html" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Register with Google
                                </a>
                                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                    <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                                </a>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="login.html">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../js/sb-admin-2.min.js"></script>

</body>

</html>