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
* {
	color: white;
}

#forms {
	margin-top: 10px;
}

.btn-info:hover, .btn-info:focus, .btn-info:active, .btn-info.active,
	.open .dropdown-toggle.btn-info {
	color: #019600;
	border-color: #1084FF;
	background-color: rgba(0, 0, 0, .0);
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
			<h1 class="logo cursive">Donation</h1>
			<br>
			<div class="content">


				<!-- row1 시작 -->
				<div class="row">
					<!--유투브-->
					<div class="youtube">
						<div class="youtube-selected col-sm-6">
							<div id="youtube-player"></div>
						</div>
					</div>


					<!-- 폼 시작 -->
					<div id="forms">
						<div class="col-sm-6">
							<h2 class="text-center">후원하기</h2>
							<br>
							<form id="form" method="post"
								class="text-primary form-horizontal">
								<div class="form-group">
									<label class="control-label col-sm-3" for="uId">금액:</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="uId" id="uId"
											placeholder="후원 금액을 입력하세요.">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3" for="uName">계좌번호:</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="uName"
											id="uName" placeholder="계좌번호를 입력하세요.">
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-3">후원종류:</label>
									<div class="btn-group col-sm-9" data-toggle="buttons">
										<label class="btn btn-info active col-sm-4"> 
										<input
											type="radio" name="uPW" autocomplete="off" checked
											value="동물권 교육" class="radiobtn">동물권 교육
										</label> <label class="btn btn-info col-sm-4"> 
										<input
											type="radio" name="uPW" value="정책사업"
											autocomplete="off" class="radiobtn">정책사업
										</label> <label class="btn btn-info col-sm-4"> 
										<input
											type="radio" name="uPW" autocomplete="off"
											class="radiobtn" value="동물복지사업">동물복지사업
										</label>
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-offset-1 col-sm-11">
										<button type="submit" class="btn btn-success btn-block">후원하기</button>
									</div>
								</div>

							</form>
						</div>

					</div>
					<!-- 폼 끝 -->
				</div>

				<hr>
				<h2 class="text-center" style="margin-bottom: 30px">내 후원 기록</h2>

				<!-- row1 끝 -->
				<!-- row2 시작 -->
				<div class="row">
					<div class="col-sm-12">
						<form id="search" method="get">
							<div class="form-group row">

								<div class="col-sm-2">
									<select class="form-control" name="stype" id="stype">
										<option value="day" style="color: black;">날짜</option>
										<option value="account" style="color: black;">계좌 번호</option>
									</select>
								</div>
								<div class="col-sm-9" style="padding: 0;'">
									<input type="text" name="keyword" id="keyword"
										class="form-control" placeholder="Search">
								</div>
								<div class="input-group-btn col-sm-4">
									<button class="btn btn-success" type="submit">검색</button>
								</div>

							</div>
						</form>

						<!-- 테이블 -->
						<table id="donateList" class="table">

						</table>

						<!-- 페이지번호 -->
						<div id="index" class="btn-group"></div>

						<div style="height: 50px;"></div>

						<!-- 수정 -->
						<div id="editForm">
							<form id="editF" class="text-primary form-horizontal"></form>
						</div>

						<div style="height: 50px;"></div>
						
						<hr>
						<!-- 챗봇 -->
						<div class="col-sm-6">
							<div style="height: 50px;"></div>
							<h2 class="text-center">후원 방법을<br> 알려드립니다.</h2>
							<h2 class="text-center">후원 방법에 대해<br> 물어보세요</h2>
						</div>
						<div class="col-sm-6">
							<iframe allow="microphone;" width="100%" height="600"
								src="https://console.dialogflow.com/api-client/demo/embedded/e119c9cb-115e-44a9-b53e-bbcbfa03f51f">
							</iframe>
						</div>

					</div>
				</div>
				<!-- row2 끝 -->


				<div style="height: 50px;"></div>
			</div>
			<!-- context끝 -->
			<!-- footer 시작 -->
			<%@include file="../frame/footer.jsp"%>
			<!-- footer 끝 -->
		</div>
	</div>





</body>




<script src="../js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js" type="text/javascript"></script>




<script>
	function list() {
		/* 내 후원 결과 리스트 */
		$
				.ajax({
					url : 'http://13.125.67.76:8080/donate/donate',
					type : 'GET',
					data : {
						d_id : '${sessionScope.id}'
					},
					success : function(data) {
						var html = '<tr><td>NO</td><td>아이디</td><td>후원 금액</td><td>후원 날짜</td><td>후원 종류</td><td>계좌 번호</td><td>편집</td></tr>';
						var htmlIndex = '<div>';
						for (var i = 0; i < data.list.length; i++) {

							html += '<tr><td>\n';
							html += data.list[i].d_index + '</td><td>'
							html += data.list[i].id
									+ '</td><td id="m' + data.list[i].d_index + '">';
							html += data.list[i].d_money + '</td><td>';
							html += data.list[i].d_date
									+ '</td><td id="t' + data.list[i].d_index + '">';
							html += data.list[i].d_type
									+ '</td><td id="a' + data.list[i].d_index + '">';
							html += data.list[i].d_account + '</td><td>';
							html += '<button class="btn-danger"  style="color:white;"  onclick="del('
									+ data.list[i].d_index
									+ ')">취소하기</button><br>\n';
							html += '<button class="btn-info" style="color:white;"  onclick="edit('
									+ data.list[i].d_index
									+ ')">수정하기</button>\n';
							html += '</tr>\n';
						}
						for (var i = 1; i <= data.totalPageNumber / 5 + 0.9; i++) {
							htmlIndex += '<button class="btn-primary" style="color:white;" onclick="page('
									+ i + ')">' + i + '</button>';
						}
						htmlIndex += '</div>';

						$('#donateList').html(html);
						$('#index').html(htmlIndex);
					}
				});
	}

	/* 페이지 넘버 클릭시 발동 */
	function page(index) {
		/* 내 후원 결과 리스트 */
		$
				.ajax({
					url : 'http://13.125.67.76:8080/donate/donate',
					type : 'GET',
					data : {
						d_id : '${sessionScope.id}',
						p : index
					},
					success : function(data) {
						var html = '<tr><td>NO</td><td>아이디</td><td>후원 금액</td><td>후원 날짜</td><td>후원 종류</td><td>계좌 번호</td><td>편집</td></tr>';
						var htmlIndex = '<div>';
						for (var i = 0; i < data.list.length; i++) {

							html += '<tr><td>\n';
							html += data.list[i].d_index + '</td><td>'
							html += data.list[i].id
									+ '</td><td id="m' + data.list[i].d_index + '">';
							html += data.list[i].d_money + '</td><td>';
							html += data.list[i].d_date
									+ '</td><td id="t' + data.list[i].d_index + '">';
							html += data.list[i].d_type
									+ '</td><td id="a' + data.list[i].d_index + '">';
							html += data.list[i].d_account + '</td><td>';
							html += '<button  class="btn-danger"  style="color:white;" onclick="del('
									+ data.list[i].d_index
									+ ')">삭제하기</button><br>\n';
							html += '<button class="btn-info" style="color:white;"   onclick="edit('
									+ data.list[i].d_index
									+ ')">수정하기</button>\n';
							html += '</tr>\n';
						}
						for (var i = 1; i <= data.totalPageNumber / 5 + 0.9; i++) {
							htmlIndex += '<button class="btn-primary"  style="color:white;"  onclick="page('
									+ i + ')">' + i + '</button>';
						}
						htmlIndex += '</div>';

						$('#donateList').html(html);
						$('#index').html(htmlIndex);
					}
				});
	}

	/* 검색 한 후 페이지 넘버 클릭시 발동 */
	function page2(index, type, key) {
		/* 내 후원 결과 리스트 */
		$
				.ajax({
					url : 'http://13.125.67.76:8080/donate/donate',
					type : 'GET',
					data : {
						d_id : '${sessionScope.id}',
						p : index,
						stype : type,
						keyword : key
					},
					success : function(data) {
						var html = '<tr><td>NO</td><td>아이디</td><td>후원 금액</td><td>후원 날짜</td><td>후원 종류</td><td>계좌 번호</td><td>편집</td></tr>';
						var htmlIndex = '<div>';
						for (var i = 0; i < data.list.length; i++) {

							html += '<tr><td>\n';
							html += data.list[i].d_index + '</td><td>'
							html += data.list[i].id
									+ '</td><td id="m' + data.list[i].d_index + '">';
							html += data.list[i].d_money + '</td><td>';
							html += data.list[i].d_date
									+ '</td><td id="t' + data.list[i].d_index + '">';
							html += data.list[i].d_type
									+ '</td><td id="a' + data.list[i].d_index + '">';
							html += data.list[i].d_account + '</td><td>';
							html += '<button  class="btn-danger"  style="color:white;"  onclick="del('
									+ data.list[i].d_index
									+ ')">삭제하기</button><br>\n';
							html += '<button  class="btn-info"  style="color:white;"  onclick="edit('
									+ data.list[i].d_index
									+ ')">수정하기</button>\n';
							html += '</tr>\n';
						}
						for (var i = 1; i < data.totalPageNumber / 5 + 0.9; i++) {
							htmlIndex += '<button  class="btn-primary"  style="color:white;"  onclick="page2('
									+ i
									+ ',\''
									+ $('#stype').val()
									+ '\','
									+ $('#keyword').val()
									+ ')">'
									+ i
									+ '</button>';
						}
						htmlIndex += '</div>';

						$('#donateList').html(html);
						$('#index').html(htmlIndex);
					}
				});
	}

	/* 편집 */
	function edit(index) {
		var str1 = '#m' + index;
		var str2 = '#t' + index;
		var str3 = '#a' + index;

		var html = '<hr><h2 class="text-center" style="margin-bottom: 30px; color:white;">수정하기</h2>';

		html += '<input type="hidden" name="dI" id="dI" value="' + index + '"> <br>';
		html += '<div class="form-group"><label class="control-label col-sm-2" for="uId">금액:</label><div class="col-sm-8">'
				+ '<input type="text" class="form-control"  name="eM" id="eM" value="'
				+ $(str1).text()
				+ '" placeholder="후원 금액을 입력하세요.">'
				+ '</div></div>';

		html += '<div class="form-group">'
				+ '<label class="control-label col-sm-2" for="uName">계좌번호:</label>'
				+ '<div class="col-sm-8">'
				+ '<input type="text" class="form-control" name="eA" '
				+ 'id="eA" value="' + $(str3).text()
				+ '" placeholder="계좌번호를 입력하세요."></div></div>';

		html += '<div class="form-group"><label class="control-label col-sm-2" for="uId">후원 종류:</label><div class="col-sm-8">'
				+ '<input type="text" class="form-control"  name="eT" id="eT" value="'
				+ $(str2).text()
				+ '" placeholder="후원 종류를 입력하세요.">'
				+ '</div></div>';

		html += '<div class="form-group"><div class="col-sm-offset-1 col-sm-9"><button type="submit" class="btn btn-success btn-block">수정하기</button></div></div></form></div>';

		$('#editF').html(html);

	}

	/* 삭제 */
	function del(index) {

		if (confirm('결제를 취소하시겠습니까?')) {
			$.ajax({
				url : 'http://13.125.67.76:8080/donate/donate/' + index,
				type : 'DELETE',
				dataType:'text',
				success : function(data) {
					if (data == 'SUCCESS') {
						alert('취소되었습니다');
						list();
					}
				}
			});
		}
	}

	/* 페이지 로딩 후 실행 */
	$(document)
			.ready(
					function() {

						/* 리스트 띄우기 */
						list();

						/* 후원하기 */
						$('#form').submit(function() {

							$.ajax({
								url : 'http://13.125.67.76:8080/donate/donate',
								type : 'POST',
								data : {
									d_money : $('#uId').val(),
									d_type : $('input[type=radio]:checked').val(),
									d_account : $('#uName').val(),
									id : '${sessionScope.id}'
								},
								
								success : function(data) {
									alert(data);
								}
							});

						});

						/* 검색하기 */
						$('#search')
								.submit(
										function() {

											$
													.ajax({
														url : 'http://13.125.67.76:8080/donate/donate',
														type : 'GET',
														data : {
															d_id : '${sessionScope.id}',
															stype : $('#stype')
																	.val(),
															keyword : $(
																	'#keyword')
																	.val()
														},
														success : function(data) {
															var html = '<tr><td>NO</td><td>아이디</td><td>후원 금액</td><td>후원 날짜</td><td>후원 종류</td><td>계좌 번호</td><td>편집</td></tr>';
															var htmlIndex = '<div>';
															for (var i = 0; i < data.list.length; i++) {

																html += '<tr><td>\n';
																html += data.list[i].d_index
																		+ '</td><td>'
																html += data.list[i].id
																		+ '</td><td id="m' + data.list[i].d_index + '">';
																html += data.list[i].d_money
																		+ '</td><td>';
																html += data.list[i].d_date
																		+ '</td><td id="t' + data.list[i].d_index + '">';
																html += data.list[i].d_type
																		+ '</td><td id="a' + data.list[i].d_index + '">';
																html += data.list[i].d_account
																		+ '</td><td>';
																html += '<button class="btn-danger"  style="color:white;"  onclick="del('
																		+ data.list[i].d_index
																		+ ')">취소하기</button><br>\n';
																html += '<button class="btn-info" style="color:white;"   onclick="edit('
																		+ data.list[i].d_index
																		+ ')">수정하기</button>\n';
																html += '</tr>\n';
															}
															for (var i = 1; i < data.totalPageNumber / 5 + 1; i++) {
																htmlIndex += '<button class="btn-primary"  style="color:white;"   onclick="page2('
																		+ i
																		+ ',\''
																		+ $(
																				'#stype')
																				.val()
																		+ '\','
																		+ $(
																				'#keyword')
																				.val()
																		+ ')">'
																		+ i
																		+ '</button>';
															}
															htmlIndex += '</div>';

															$('#donateList')
																	.html(html);
															$('#index').html(
																	htmlIndex);
														}
													});
											return false;
										});

						$('#editF')
								.submit(
										function() {

											if (confirm('수정하시겠습니까?')) {
												$
														.ajax({
															url : 'http://13.125.67.76:8080/donate/donate',
															type : 'PUT',
															data : JSON
																	.stringify({
																		d_index : $(
																				'#dI')
																				.val(),
																		d_money : $(
																				'#eM')
																				.val(),
																		d_type : $(
																				'#eT')
																				.val(),
																		d_account : $(
																				'#eA')
																				.val()
																	}),

															contentType : 'application/json; charset=utf-8',
															dataType:'text',
															success : function(
																	data) {
																if (data == 'SUCCESS') {
																	alert('수정되었습니다');
																	$('#editF')
																			.html(
																					'');
																	list();
																}
															}

														});
											}
											return false;
										});

						$
								.ajax(
										{
											dataType : "json",
											url : 'https://www.googleapis.com/youtube/v3/search'
													+ '?part=snippet'
													+ '&maxResults=1'
													+ '&order=rating'
													+ '&q=유기견'
													+ '&type=video'
													+ '&videoDefinition=high'
													+ '&key=AIzaSyDayaIyuhYCbIoD7IC43M9mat-sTaS0uKI'
										})
								.done(
										function(data) {
											/* Initial */
											var tag = document
													.createElement('script');
											tag.src = "https://www.youtube.com/iframe_api";
											var firstScriptTag = document
													.getElementsByTagName('script')[0];
											firstScriptTag.parentNode
													.insertBefore(tag,
															firstScriptTag);

											var player;

											onYouTubeIframeAPIReady = function(
													event) {
												player = new YT.Player(
														'youtube-player',
														{
															videoId : data.items[0].id.videoId,
															height : '360px',
															width : '100%'
														});

											}

										});

					});
</script>
<!-- AIzaSyDayaIyuhYCbIoD7IC43M9mat-sTaS0uKI -->
</html>