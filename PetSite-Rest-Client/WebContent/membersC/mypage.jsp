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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<title>Time Lapse</title>

<link href="../css/bootstrap.css" rel="stylesheet" />
<link href="../css/coming-sssoon.css" rel="stylesheet" />

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
#myInfo{
	color: white;
}
h2{
	text-align: center;
}
#table{
	color: white;
	margin: 0 auto;
}
img{
	width: 250px;
}
button{
	margin: 5px;
}
input[type=checkbox] {
    display: none;
}
input{
	margin: 5px;
}

</style>

</head>

<body>
	<!-- nav 시작 -->
	<%@include file="../frame/nav.jsp"%>
	<!-- nav 끝 -->


	<div class="main" style="background-image: url('../images/backgroud.jpg')">
		<div class="cover black" data-color="white"></div>

		<!-- context시작 -->
		<div class="container">
			<h1 class="logo cursive">My page</h1>
			<br>
			<div class="content">
				<div class="subscribe">
					<!--<h5 class="info-text">
                        Join the waiting list for the beta. We keep you posted.
                    </h5>-->

					<div id="formDiv">
						<form id="form" class="form-inline" role="form" onsubmit="return false">
							<div id="myInfo"></div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- context끝 -->

		<!-- footer 시작 -->
		<%@include file="../frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>
	
    <script>
    
 	// KAKAO :: 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('582e4d9c58d4a5fb561e39ea1d4f40b9');
 
        $(document).ready(function() {
        	
        	var type = '${type}';
        	
        	//alert(type);
        	
        	if(type == 'kakao'){
        		// 카카오로 로그인 되어있을 때
        		infoWithKakao()
        	} else {
        		// 일반 회원으로 로그인 되어있을 때
            myInfo();
            }
        });
        
     // 주소 API
		function execDaumPostcode() {
			new daum.Postcode({
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('postcode').value = data.zonecode;
							document.getElementById("address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("detailAddress")
									.focus();
						}
					}).open();
		}
        
        // 정보 확인
        function infoWithKakao(){
        	Kakao.API.request({
                url: '/v2/user/me',
                success: function(res) {
                    //alert(JSON.stringify(res));
                    
                    var id = res.kakao_account.email;
                    var pic = res.properties.profile_image;
                    var nickname = res.properties.nickname;
                

                    var html = '';
                    html += '<h2>카카오로 로그인 중입니다</h2>'
                    html += '<table id="table"> <tr>';
                    html += '<td>아이디: </td>';
                    html += '<td>' + id + '</td> </tr>';
                    html += '<tr><td>닉네임: </td>';
                    html += '<td>' + nickname + '</td></tr>';
                    html += '<tr><td>사진</td>';
                    html += '<td><img class="img-circle" style="width:150px" src="'+pic+'"></td></tr></table>';
                    html += '<button onclick="logoutWithKakao()" style="float: right" class="btn btn-warning btn-fill">로그아웃</button>';

                    $('#myInfo').html(html);
                },
                fail: function(error) {
                    alert(JSON.stringify(error));
                }
            });
        }
        
     // 로그아웃
        function logoutWithKakao() {
            Kakao.Auth.logout(function() {
            	
            	//alert('카카오 토큰 제거');
            	
            	$.ajax({
                	url: "${pageContext.request.contextPath}/logout.jsp",
                	type: 'GET',
                	dataType: 'text',
                	success: function(data){
                    	alert(data);
                    	location.href = "${pageContext.request.contextPath}/index.jsp";
                    }
                });
            });
        }

        function myInfo() {
        	
        	var id = '${id}';

            $.ajax({
                url: 'http://15.164.166.15:8080/ps/members/mypage',
                type: 'GET',
                data: {id: id},
                success: function(data) {
                    //alert(JSON.stringify(data));

                    var html = '';
                    html += '<table id="table"> <tr>';
                    html += '<td>아이디</td>';
                    html += '<td>' + data.id + '</td> </tr>';
                    html += '<tr><td>비밀번호</td>';
                    html += '<td>' + data.pw + '</td></tr>';
                    html += '<tr><td>이름</td>';
                    html += '<td>' + data.name + '</td></tr>';
                    html += '<tr><td>주소</td>';
                    html += '<td>' + data.address + '</td></tr>';
                    html += '<tr><td>사진</td>';
                    html += '<td><img class="img-rounded" alt="Cinque Terre" src="http://15.164.166.15:8080/ps/file/' + data.pic_name + '"></td></tr>';
                    html += '<tr><td>가입날짜</td>';
                    html += '<td>' + data.regDate + '</td></tr></table>';
                    html += '<button style="float: right" class="btn btn-warning btn-fill" onclick="edit(\'' + data.id + '\')">회원수정</button>';
                    html += '<button style="float: right" class="btn btn-warning btn-fill" onclick="deleteMem(\'' + data.id + '\')">회원탈퇴</button>';
                    html += '<button style="float: right" class="btn btn-warning btn-fill" onclick="logout(\'' + data.id + '\')">로그아웃</button>';

                    $('#myInfo').html(html);
                }

            });
        }
        
        function logout(id){
        	
        	$.ajax({
            	url: "${pageContext.request.contextPath}/logout.jsp",
            	data: {
            		id: id
            	},
            	type: 'GET',
            	dataType: 'text',
            	success: function(data){
                	alert(data);
                	location.href = "${pageContext.request.contextPath}/index.jsp";
                }
            });
        	
        }
        
        function deleteMem(id){
        	
        	$.ajax({
        		url: 'http://15.164.166.15:8080/ps/members/mypage',
                type: 'DELETE',
                data: JSON.stringify({
                	id: id
                }),
                contentType: 'application/json; charset=utf-8',
                dataType: 'text',
                success: function(data){
                	alert(data);
	                	$.ajax({
	                    	url: "${pageContext.request.contextPath}/logout.jsp",
	                    	data: {
	                    		id: id
	                    	},
	                    	type: 'GET',
	                    	success: function(data){
	                        	alert(data);
	                        	location.href = "${pageContext.request.contextPath}/index.jsp";
	                        }
	                    });
                }
        	});
        }

        function edit(id) {

            $.ajax({
                url: 'http://15.164.166.15:8080/ps/members/mypage/id',
                type: 'GET',
                data: {
                    id: id
                },
                success: function(data) {
                    //alert(JSON.stringify(data));

                    var html = '';

                    /*사진*/
                    html += '<table id="table"><tr><td>사진</td>';
                    html += '<td><img class="img-rounded" alt="Cinque Terre" src="http://15.164.166.15:8080/ps/file/' + data.pic_name + '"></td></tr>';
                    html += '<tr><td>사진수정</td>';
                    html += '<td><input type="file" id="pic"></td>';
                    html += '<td><input id="feditbtn" class="btn btn-warning btn-fill" type="button" value="사진 업로드"></td></tr></table><hr>';

                    /*아이디,비밀번호,이름,주소*/
                    html += '<table id="table"><tr>';
                    html += '<td>아이디</td>';
                    html += '<td> <input class="form-control" type="text" value="' + data.id + '" id="id" readonly>' + '</td> </tr>';
                    html += '<tr><td>비밀번호</td>';
                    html += '<td> <input class="form-control" type="password" id="pw" onfocusout="checkPw()">' + '</td> </tr>';
                    html += '<tr><td>비밀번호 다시 입력</td>';
                    html += '<td> <input class="form-control" type="password" id="pw2"><span id="pwSpan"></span><span id="pwSpan2"></span><input type="checkbox" id="pwCheck"></td></tr>';
                    html += '<tr><td>이름</td>';
                    html += '<td> <input class="form-control" type="text" value="' + data.name + '" id="name" readonly>' + '</td></tr>';
                    html += '<tr><td>주소</td>';
                    html += '<td> <input type="text" class="form-control" id="postcode" placeholder="우편번호"> <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>'
                    html +=	'<input type="text" class="form-control" id="address" value="' + data.address + '"><br>'
                    html +=	'<input type="text" class="form-control" id="detailAddress" placeholder="상세주소"> </td>'
                   /*  html += '<td> <input class="form-control" type="text" value="' + data.address + '" id="address">' + '</td></tr>' */
                    html += '<tr><td colspan="2"><input id="Oeditbtn" class="btn btn-warning btn-fill" type="button" value="수정완료"></td></tr></table>';

                    html += '<button style="float: right" class="btn btn-warning btn-fill" onclick="cancel()">취소</button>';

                    $('#myInfo').html(html);

                    /*사진 업로드*/
                    $('#feditbtn').click(function() {
						
                    	//alert('들어옴');
                        var formData = new FormData(); // 파일 전송 -> FormData()활용

                        formData.append('id', $('#id').val());
                        if ($('#pic').val()) {
                            formData.append('pic', $('#pic')[0].files[0]);
                        } else {
                            alert('사진을 업로드 해주세요!');
                            return false;
                        }

                        $.ajax({
                            url: 'http://15.164.166.15:8080/ps/members/mypage',
                            type: 'POST',
                            data: formData,
                            processData: false, //파일 전송 시 필수
                            contentType: false, //파일 전송 시 필수
                            dataType: 'text',
                            success: function(data) {
                                alert(data);
                            }
                        });
                        return false;
                    });

                    /*그 외 업로드*/
                    $('#Oeditbtn').click(function() {

                        if (!$('#pwCheck').prop('checked')) {
                            alert('[비말번호 불일치] 다시 확인해주세요!');
                            return false;
                        }

                        var checkPw = RegExp(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{4,10}$/); // 비밀번호: 영문 4글자~10글자 미만, 최소 1개의 숫자 또는 특수문자 포함

                        // 비밀번호 유효성 검사
                        if (!checkPw.test($('#pw').val())) {
                            $('#pwSpan2').html('[비밀번호] 영문 4글자~10글자 미만, 최소 1개의 숫자 또는 특수문자 포함');
                            $('#pwSpan2').css('color', 'red');
                            $('#pw2').focus();
                            return false;
                        }

                        $.ajax({
                            url: 'http://15.164.166.15:8080/ps/members/mypage',
                            type: 'PUT',
                            data: JSON.stringify({
                                id: $('#id').val(),
                                pw: $('#pw').val(),
                                address: $('#address').val(),
                                detailAddress: $('#detailAddress').val()
                            }),
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'text',
                            success: function(data) {
                                alert(data);
                                location.href = "${pageContext.request.contextPath}/membersC/mypage.jsp";
                            }
                        });
                        return false;
                    });
                }

            });

        }
        
        function cancel(){
        	location.href = "${pageContext.request.contextPath}/membersC/mypage.jsp";
        }

        function checkPw() {
            // 비밀번호 재입력 시 일치하는지 확인
            $('#pw2, #pw').focusout(function() {
                if ($('#pw').val() == $('#pw2').val()) {
                    $('#pwSpan').html('비밀번호 일치');
                    $('#pwSpan').css('color', 'green');
                    $('#pwCheck').prop('checked', true);
                } else {
                    $('#pwSpan').html('비밀번호 불일치');
                    $('#pwSpan').css('color', 'red');
                    $('#pwSpan').focus();
                    $('#pwCheck').prop('checked', false);
                }
            });
        }
    </script>
</body>
<script src="../js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
</html>
