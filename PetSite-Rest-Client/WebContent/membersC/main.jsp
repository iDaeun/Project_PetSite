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
.formBlock {
	margin: 15px;
}

/* #formDiv {
	margin: 0 auto;
	width: 50%;
} */

.alllist {
	display: inline-block;
	width: 250px;
	height: 100%;
	border: 1px solid;
	border-radius: 5px;
	margin-top: 20px;
	text-align: center;
	background-color: white;
	margin-right: 5px;
	margin-left: 5px;
}

#pho {
cursor: pointer;
	width: 240px;
	height: 240px;
	margin-top: 10px;
	margin-bottom: 10px;
}
#del{
text-align:center;
	margin-right: 10px;
	width: 75px;
	margin-bottom: 10px;
}

#info {
	display: none;
}

#update {
	display: none;
}

#photo {
	cursor: pointer;
	width: 240px;
	height: 240px;
	margin-top: 10px;
	margin-bottom: 10px;
}
#phos{
	cursor: pointer;
	width: 240px;
	height: 240px;
	margin-top: 10px;
	margin-bottom: 10px;
	margin-left: 3px;
}

.youtube.img {
	width: 400px;
	height: 400px;
}

h3 {
	color: white;
}

/* #con {
	text-align: center;
	margin-bottom: 50px;
} */


#write {
	width: 340px;
}

.sear {
	width: 220px;
	height: 39px;
	border-radius: 5px;
	margin-right: 10px;
}

.idx {
	display: none;
	padding-top: 10px;
}

.allist {
	display: inline-block;
	width: 250px;
	height: 370px;
	border: 1px solid;
	border-radius: 5px;
	margin-top: 20px;
	text-align: center;
	background-color: white;
	margin-right: 5px;
	margin-left: 5px;
}
.alllists{
	display: inline-block;
	width: 250px;
	height: 370px;
	border: 1px solid;
	border-radius: 5px;
	margin-top: 20px;
	text-align: center;
	background-color: white;
	margin-right: 5px;
	margin-left: 5px;
}

#choice {
	margin: 10px;
}

#lists {
	width: 160px;
	margin-bottom: 10px;
}
#list{
	width: 1100px;
	margin-left: 20px;
}
#textList{
	width: 1100px;
	margin-left: 20px;
}

#iup {
	width: 160px;
	
}
#up{
	width: 75px;
	margin-bottom: 10px;
}
#selectList{
	display: inline-block;
	width: 250px;
	height: 370px;
	border: 1px solid;
	border-radius: 5px;
	margin-top: 20px;
	text-align: center;
	background-color: white;
	margin-right: 10px;
}
p{
color: white;
}
#contents{
	text-align: center;
	margin-bottom: 50px;
}
#photo{
	border-radius: 3px;
	background-color: white;
	width: 220px;
	height: 23px;
}
#photodiv{
	text-align: center;
}
#photoform{
	text-align: center;
	margin-left: 460px;
}
#photoupdate{
	margin-right: 460px;
	width: 220px;
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
			<h1 class="logo cursive">info</h1>
			<br>
			<div class="content">
				<!--<h5 class="info-text">
                        Join the waiting list for the beta. We keep you posted.
                    </h5>-->

				<div id="formDiv">

					<div id="contents">
						<!-- <div id="con"> -->
							<h3>유용한 정보/반려동물훈련법</h3>
							<hr>
							<br>
							<form name="form" method="post" onSubmit="return false;">
								<input type="text" id="search_box" class="sear">
								<button onClick="GetList();" class="btn btn-warning" id="bu">검색</button>
								<button onclick="none();" class="btn btn-warning">닫기</button>
								<br>
								<br>
							</form>

							<div id="getview"></div>
							<div id="getview2"></div>
							<div id="getview3"></div>
							<div id="view"></div>

							<div id="search">
								<form id="SearchForm">
									<input type="text" class="sear" id="searchTitle"> <input
										type="submit" value="게시물검색" class="btn btn-warning" id="bu"><br>
									<br>
								</form>
								<a href="writeInfo.jsp" class="btn btn-warning" id="write">글쓰기</a>
								<br> <br>
							</div>
							<div id="list"></div>
							<div id="textList"></div>
							<div id="selectList"></div>

							<div id="photodiv">
							<br><br>
								<form id="photoform" enctype="multipart/form-data">
									<input type="file" name="photo" id="photo">
									<input type="submit" value="사진수정" class="btn btn-warning" id="photoupdate">
								</form>
							</div>

							<div id="update">
								<form id="forms">
									<br>  <p>아이디</p><input
										type="text" name="uId" id="uId" class="sear" value="${sessionScope.id}" readonly><br><br>
										<p>제목</p> <input type="text" name="title" id="title" class="sear"><br><br>
									<p>내용</p><textarea rows="3" cols="30" name="text" id="text" class="sear"></textarea>
									<br><br><br>
									<input type="button" value="취소" id="cencle" class="btn btn-warning">
									<input type="submit" value="수정하기" class="btn btn-warning">
								</form>

							<!-- </div> -->

						</div>
					</div>

					<span id="span"></span>
				</div>
			</div>
		</div>
		<!-- context끝 -->

		<!-- footer 시작 -->
		<%@include file="../frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>

	<script>
		$(document).ready(function() {
			list();
		});

		/*전체리스트*/
		function list() {

			$('#list').css('display', 'block');
			$('#search').css('display', 'block');
			$('#photodiv').css('display', 'none');
			$('#selectList').css('display', 'none');
			
			$.ajax({
						url : 'http://ec2-15-164-103-108.ap-northeast-2.compute.amazonaws.com:8080/info/infoMain',
						type : 'GET',
						contentType : false,
						processData : false,
						success : function(data) {

							var html = '';

							for (i = 0; i < data.length; i++) {
								html += '<div class="allist">'
								html += '<div id="idx" class="idx">' + data[i].idx+ '</div>\n';
								html += '<div class="list"><img onclick="textList('+ data[i].idx+ ')" id="pho" src="http://ec2-15-164-103-108.ap-northeast-2.compute.amazonaws.com:8080/info/uploadfile/'
										+ data[i].photo + '"/></div>\n';
								html += '<br><div class="list">제목 : '+ data[i].title + '</div>\n';
								html += '<div class="list">작성자 :  '+ data[i].uId + '</div>\n';
								html += '<div class="list">'+ data[i].date.substr(0, 16)+ '</div>\n';
								html += '</div>'
								/*html += '수정'*/
							}
							/* for(i=0; i<data.length; i++){
							for(j=1; j<data[i].num; j++){
							    html += '<div class="list"><button onclick="pagenum('+data[i].num+')">'+data[j].num+'</button></div>';
							    }
							} */

							$('#list').html(html);
						}

					});
		};

		/*게시물*/
		function textList(idx) {

			$('#textList').css('display', 'block');
			$('#list').css('display', 'none');
			$('#search').css('display', 'none');
			$('#selectList').css('display', 'none');

			$.ajax({
						url : 'http://ec2-15-164-103-108.ap-northeast-2.compute.amazonaws.com:8080/info/infoMain/' + idx,
						type : 'GET',
						/*dataType: 'json',*/
						/*enctype: 'multipart/form-data',*/
						contentType : false,
						processData : false,
						success : function(data) {

							var html = '';

							html += '<div class="alllist">';
							html += '<div>아이디 : ' + data.uId
									+ ' 님의 글입니다. <br>\n';
							html += '</div>\n';
							html += '<div class="list">';
							html += '제목 : ' + data.title + '</div>\n';
							html += '<div class="list">';
							html += '<img id="pho" src="http://ec2-15-164-103-108.ap-northeast-2.compute.amazonaws.com:8080/info/uploadfile/'+data.photo +'"/></div>\n';
							html += '<div>';
							html += '내용 : ' + data.text + '</div>';
							html += '<div id="choice">';
							html += '<a href="main.jsp" class="btn btn-warning" id="lists">리스트</a><br>';
							if ('${sessionScope.id}' == data.uId) {
								html += '<button onclick ="del('+data.idx+')" class="btn btn-warning" id="del">삭제</button>';
								html += '<button onclick ="put('+ data.idx+')" class="btn btn-warning" id="up">수정</button><br>';
								html += '<button onclick ="putPhoto('+data.idx+')" class="btn btn-warning" id="iup">이미지 수정</button>';
								html += '</div>';
							}
							html += '</div>';

							$('#textList').html(html);
						}

					});
		};

		/*수정*/
		function put(idx) {

			$('#list').css('display', 'none');
			$('#search').css('display', 'none');
			$('#update').css('display', 'block');
			$('#photodiv').css('display', 'none');

			$('#forms').submit(function() {

				var getidx = idx;

				$.ajax({
					url : 'http://ec2-15-164-103-108.ap-northeast-2.compute.amazonaws.com:8080/info/infoMain/'+idx,
					type : 'PUT',
					dataType : 'text',
					data : JSON.stringify({
						uId : $('#uId').val(),
						title : $('#title').val(),
						text : $('#text').val()
					}),
					contentType : 'application/json; charset=utf-8',
					success : function(data) {
						if (data == 'success') {
							alert('정상적으로 수정되었습니다.');
							location.href="main.jsp";
						} else {
							alert('오류닷');
						}
					}

				});
				return false;
			});
			
		};

		/*사진수정*/
		function putPhoto(idx) {

			var getidx = idx;

			$('#list').css('display', 'none');
			$('#search').css('display', 'none');
			$('#update').css('display', 'none');
			$('#photodiv').css('display', 'block');

			$('#photoform').submit(function() {

				var formData = new FormData(form);

				formData.append("photo", $('#photo')[0].files[0]);

				$.ajax({
					url : 'http://ec2-15-164-103-108.ap-northeast-2.compute.amazonaws.com:8080/info/photoUpdate/'+idx,
					type : 'POST',
					data : formData,
					dataType : 'text',
					contentType : false,
					processData : false,
					success : function(data) {
						if (data == 'success') {
							alert('이미지가 정상적으로 수정되었습니다.');
							location.href="main.jsp";
						} else {
							alert('오류');
						}
					}

				});
				return false;
			});
			
		};

		/*삭제*/
		function del(idx) {

			if (confirm('정말 삭제하시겠습니까?')) {
				$.ajax({
					url : 'http://ec2-15-164-103-108.ap-northeast-2.compute.amazonaws.com:8080/info/infoMain/' + idx,
					type : 'DELETE',
					/*       contentType: false,
					       processData: false,*/
					       dataType : 'text',
					success : function(data) {
						if (data == 'success') {
							alert('삭제되었습니다.');
							location.href = "main.jsp"
						} else {
							alert('오류');
						}
					}

				});
			}
			;
		};

		/*검색 title 전달*/
		$('#SearchForm').submit(function() {
			
			/* $('#selectList').css('display', 'block'); */
			
							if ($('#searchTitle').val() == "") {
								location.href = "main.jsp";
							} else {
								$.ajax({
											url : 'http://ec2-15-164-103-108.ap-northeast-2.compute.amazonaws.com:8080/info/search/'
													+ $('#searchTitle').val(),
											type : 'GET',
											contentType : false,
											processData : false,
											success : function(data) {
												var html = '';
												if(data == ""){
													alert('검색하신 결과값이 없습니다.');
													location.href="main.jsp";
												}

												for (i = 0; i < data.length; i++) {
													html += '<div class="alllists">'
													html += '<div class="idx">'
															+ data[i].idx
															+ '</div>\n';
													html += '<div id="phos" class="list"><img onclick="textList('
															+ data[i].idx
															+ ')" id="pho" src="http://ec2-15-164-103-108.ap-northeast-2.compute.amazonaws.com:8080/info/uploadfile/'
															+ data[i].photo
															+ '"/></div>\n<br>';
													html += '<div class="list">제목 :  '
															+ data[i].title
															+ '</div>\n';
													html += '<div class="list">작성자 :  '
															+ data[i].uId
															+ '</div>\n';
													html += '<div class="list">'
															+ data[i].date
																	.substr(0,
																			16)
															+ '</div>\n';
													/* for(j=1; j<data[i].num; j++){
													    html += '<div class="list"><button onclick="pagenum('+data[i].title+','+data[i].num+')">'+data[j].num+'</button></div>';
													    } */
													html += '</div>'
													/*html += '수정'*/
												}

												$('#list').html(html);
												/* $('#list').css('display',
														'none'); */
												$('#update').css('display',
														'none');

											}
										});
								return false;
							}
						});

		/*  function pagenum(title,num) {
		 	if(title == null){
		 		title == "";
		 	}
			
		 	$.ajax({
		         url : 'http://localhost:8080/info/search/'+title+'/'+num,
		         type : 'GET',
		         contentType : false,
		         processData : false,
				success : function(data) {
		             
		             var html = '';
		     
					for(i=0; i<data.length; i++){
		                 html += '<div class="main">'
		                 html += '<div id="idx">'+data[i].idx+'</div>\n';
		                 html += '<div class="list"><img onclick="textList('+data[i].idx+')" id="pho" src="http://localhost:8080/info/uploadfile/'+data[i].photo +'"/></div>\n';
		                 html += '<div class="list">'+data[i].title +'</div>\n';
		                 html += '<div class="list">'+data[i].uId +'</div>\n';
		                 html += '<div class="list">'+data[i].date.substr(0,16)+'</div>\n';
		                 for(j=1; j<data[i].num; j++){
		                 html += '<div class="list"><button onclick="pagenum('+data[i].num+')">'+data[j].num+'</button></div>';
		                 }
		                 html += '</div>'
		             }

		             
		             $('#list').html(html);
				}			
				
			});
		 		
		 		
		 		
		 	}; */
		 	
		 	function none() {
				$('#getview').css('display','none');
				$('#getview2').css('display','none');
				$('#getview3').css('display','none');
			}

		//유튜브 검색
		function GetList(GetToken) {
			
			$('#getview').css('display','block');
			$('#getview2').css('display','block');
			$('#getview3').css('display','block');
			
			var getval = $("#search_box").val();
			if (getval == "") {
				alert("검색어를 입력하세요.");
				$("#search_box").focus();
				return;
			}
			/* $("#getview").empty();
			$("#view").empty(); */

			var youtubeUrl = "https://www.googleapis.com/youtube/v3/search?part=snippet&order=viewCount"
					+ "&q="
					+ encodeURIComponent(getval)
					+ "&type=video&videoDefinition=any&maxResults=3&key=AIzaSyAcezwf-iUpTYkBw2neqfl99jL8xFhSRfU";

			if (GetToken) {
				youtubeUrl += "&pageToken=" + GetToken;
			}

			$
					.ajax({
						type : "GET",
						url : youtubeUrl,
						dataType : "json",
						success : function(data) {
							var tag = document.createElement('script');
							tag.src = "https://www.youtube.com/iframe_api";
							var firstScriptTag = document
									.getElementsByTagName('script')[0];
							firstScriptTag.parentNode.insertBefore(tag,
									firstScriptTag);

							var player;

							var a = [ 'getview', 'getview2', 'getview3' ];

							onYouTubeIframeAPIReady = function(event) {

								for (var i = 0; i < 3; i++) {

									var a2 = a[i];
									player = new YT.Player(a2, {
										videoId : data.items[i].id.videoId,
										height : '640px',
										width : '100%'
									});

								}

							}
						}
					});
		}
	</script>
</body>
<script src="../js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
</html>