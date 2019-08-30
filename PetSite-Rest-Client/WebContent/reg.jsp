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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
input[type=checkbox] {
    display: none;
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
			<h1 class="logo cursive">Register</h1>
			<br>
			<div class="content">
				<!-- <h4 class="motto">회원가입 페이지</h4> -->
				<div class="subscribe">
					<!--<h5 class="info-text">
                        Join the waiting list for the beta. We keep you posted.
                    </h5>-->

					<div id="formDiv">
							<form id="form" class="form-inline" role="form">
								<table id="table">
									<tr>
										<td>아이디(이메일)</td>
										<td><input class="form-control" type="email" id="id" name="id" required>
										<input class="btn btn-warning btn-fill" type="button" onclick="checkId()"value="아이디 중복체크">
										<input type="checkbox" id="idCheck"><br>
										<span id="checkIdSpan"></span>
										</td>
									</tr>
									<tr>
										<td>비밀번호</td>
										<td><input class="form-control" type="password" id="pw" name="pw" required></td>
									</tr>
									<tr>
										<td>비밀번호 다시 입력</td>
										<td><input class="form-control" type="password" id="pw2" name="pw2" required><br>
											<span id="pwSpan"></span> <span id="pwSpan2"></span> <input
											type="checkbox" id="pwCheck"></td>
									</tr>
									<tr>
										<td>이름</td>
										<td><input class="form-control" type="text" id="name" name="name" required>
											<span id="nameSpan"></span></td>
									</tr>
									<tr>
										<td>주소</td>
										<td>
											<input type="text" class="form-control" id="postcode" placeholder="우편번호"> <input
												type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
											<input type="text" class="form-control" id="address"  placeholder="주소"><br>
											<input type="text" class="form-control" id="detailAddress" placeholder="상세주소">
										<!-- <input class="form-control" type="text" id="address" name="address" required> -->
										</td>
									</tr>
									<tr>
										<td>사진</td>
										<td><input type="file" id="pic" name="pic"></td>
									</tr>
									<tr>
										<td colspan="3"><input type="submit" style="float: right" class="btn btn-warning btn-fill" value="JOIN US!"></td>
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
		$(document).ready(function() {

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

			$('#form').submit(function() {

				if (!$('#idCheck').prop('checked')) {
					alert('아이디 중복 체크를 해주세요!');
					return false;
				}
				if (!$('#pwCheck').prop('checked')) {
					alert('[비말번호 불일치] 다시 확인해주세요!');
					return false;
				}

				var checkPw = RegExp(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{4,10}$/); // 비밀번호: 영문 4글자~10글자 미만, 최소 1개의 숫자 또는 특수문자 포함
				var checkName = RegExp(/^[가-힣a-zA-Z]+$/); // 이름: 한글,영문만 가능

				// 비밀번호 유효성 검사
				if (!checkPw.test($('#pw').val())) {
					$('#pwSpan2').html(
							'[비밀번호] 영문 4글자~10글자 미만, 최소 1개의 숫자 또는 특수문자 포함');
					$('#pwSpan2').css('color', 'red');
					$('#pw2').focus();
					return false;
				}

				// 이름 유효성 검사
				if (!checkName.test($('#name').val())) {
					$('#nameSpan').html('[이름] 한글,영문만 가능');
					$('#nameSpan').css('color', 'red');
					$('#name').focus();
					return false;
				}

				var formData = new FormData(); // 파일 전송 -> FormData()활용

				formData.append('id', $('#id').val());
				formData.append('pw', $('#pw').val());
				formData.append('name', $('#name').val());
				formData.append('address', $('#address').val());
				formData.append('detailAddress', $('#detailAddress').val());
				
				if ($('#pic').val()) {
					formData.append('pic', $('#pic')[0].files[0]);
				}

				$.ajax({
					url : 'http://15.164.166.15:8080/ps/members/reg',
					type : 'POST',
					data : formData,
					processData : false, //파일 전송 시 필수
					contentType : false, //파일 전송 시 필수
					dataType: 'text',
					success : function(data) {
						alert(data);
						alert('이메일로 인증키를 발송하였습니다. 인증 후 사용해주세요!');
						location.href = "${pageContext.request.contextPath}/login.jsp";
					}
				});
				return false;
			});
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

		// 중복 아이디 체크
		function checkId() {

			var id = $('#id').val();
			if (id.length < 1) {
				alert('아이디를 입력해주세요!');
			} else {
				$.ajax({
					url : 'http://15.164.166.15:8080/ps/members/reg',
					type : 'GET',
					data : {
						id : id
					},
					dataType: 'text',
					success : function(data) {
						if (data == 'Y') {
							$('#checkIdSpan').html("사용 가능한 아이디");
							$('#checkIdSpan').css('color', 'green');
							$('#idCheck').prop('checked', true);
						} else {
							$('#checkIdSpan').html("사용 불가능한 아이디");
							$('#checkIdSpan').css('color', 'red');
							$('#idCheck').prop('checked', false);
						}
					}
				});
			}

		}
	</script>
</body>
<script src="js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
</html>