<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<title>Time Lapse</title>

<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/coming-sssoon.css" rel="stylesheet" />

<!--     Fonts     -->
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Grand+Hotel'
	rel='stylesheet' type='text/css'>

<style>
.formBlock {
	margin: 15px;
}

#formDiv {
	margin-top: 50px;
}
#table{
	color: white;
	margin: 0 auto;
}
input{
	margin: 5px;
}
</style>

</head>

<body>
	<!-- nav 시작 -->
	<%@include file="frame/nav.jsp"%>
	<!-- nav 끝 -->


	<div class="main" style="background-image: url('images/backgroud.jpg')">
		<div class="cover black" data-color="white"></div>

		<!-- context시작 -->
		<div class="container">
			<h1 class="logo cursive">Login</h1>
			<br>
			<div class="content">
				<div class="subscribe">
					<!--<h5 class="info-text">
                        Join the waiting list for the beta. We keep you posted.
                    </h5>-->

					<div id="formDiv">
							<form id="form" class="form-inline" role="form">
								<table id="table">
									<tr>
										<td>아이디</td>
										<td><input class="form-control" type="email" id="id" name="id" required></td>
									</tr>
									<tr>
										<td>비밀번호</td>
										<td><input class="form-control" type="password" id="pw" name="pw" required></td>
									</tr>
									<tr>
										<td colspan="2"><input type="submit" style="float: right" class="btn btn-warning btn-fill" value="LOGIN!">
										<span id="span"></span>
										</td>
									</tr>
									<tr>
										<td colspan="2"><a id="custom-login-btn" href="javascript:loginWithKakao()">
										<img style="float: right" src="images/kakao_account_login_btn_medium_narrow.png" /></a></td>
									</tr>
								</table>
							</form>
					</div>
				</div>
			</div>
		</div>
		<!-- context끝 -->

		<!-- footer 시작 -->
		<%@include file="frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>
	
	<script>
	
	// KAKAO :: 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('582e4d9c58d4a5fb561e39ea1d4f40b9');
	
        $(document).ready(function() {
            $('#form').submit(function() {

                var id = $('#id').val();

                $.ajax({
                    url: 'http://15.164.166.15:8080/ps/members/login',
                    type: 'POST',
                    data: $('#form').serialize(),
                    success: function(data) {
                        //alert(data.view);
                        //alert(data.id);
                        if (data.view == 'success') {
                            //인증처리됨 -> 메인화면으로
                            alert('인증완료된 회원입니다!');
                            
                            $.ajax({
                            	url: "${pageContext.request.contextPath}/loginProcess.jsp",
                            	data: {
                            		id: data.id
                            	},
                            	type: 'GET'
                            });
                           	
                            /* Swal.fire('인증되었습니다!')*/
                            /* location.href = "http://15.164.166.15:8080/psClient/index.jsp"; */
                            location.href = "${pageContext.request.contextPath}/index.jsp";
                            //location.href = "main.html";
                        }
                        if (data.view == 'undefined') {
                            //미인증 회원 -> 이메일 다시 보내기
                            var chk = confirm('미인증 상태입니다, 인증키를 다시 보내시겠습니까?');
                            if (chk) {
                                $.ajax({
                                    url: 'http://15.164.166.15:8080/ps/members/verify/resend',
                                    data: {
                                        id: id
                                    },
                                    type: 'GET',
                                    success: function(data) {
                                        if (data == 'success') {
                                            $('#span').html("인증키 재전송 완료, 이메일을 통해 인증해주세요!");
                                            $('#span').css('color', 'green');
                                        } else {
                                            $('#span').html("인증키 재전송 실패ㅠㅜ");
                                            $('#span').css('color', 'red');
                                        }
                                    }
                                });
                            }
                        }
                        if (data.view == 'loginfail') {
                            //로그인 실패
                            alert('로그인 실패, 다시 로그인해주세요!');
                            location.replace("${pageContext.request.contextPath}/login.jsp");
                            //location.replace("login.html");
                        }
                    }
                });
                return false;
            });
        });
        
     // 로그인
        function loginWithKakao() {
            // 로그인 창을 띄웁니다.
            Kakao.Auth.login({
                success: function(authObj) {
                   
                	//alert('Auth.login >>>>> '+JSON.stringify(authObj));

                    // 정보 확인 -> id(email) session에 저장
                        Kakao.API.request({
                            url: '/v2/user/me',
                            success: function(res) {
                                //alert('API.request >>>>> '+JSON.stringify(res));
                                var id = res.kakao_account.email;
                                var type = 'kakao';
                                
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/loginProcess.jsp",
                                    data: {
                                        id: id,
                                        type: type
                                    },
                                    type: 'GET',
                                    success: function(data){
                                    	alert('[카카오]로그인 성공');
                                    	location.href = "${pageContext.request.contextPath}/index.jsp";
                                    }
                                });
                            },
                            fail: function(error) {
                                alert(JSON.stringify(error));
                            }
                        });
                    
                    
                },
                fail: function(err) {
                    alert(JSON.stringify(err));
                    alert('[카카오]로그인 실패');
                }
            });
        };
    </script>
</body>
<script src="js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
</html>