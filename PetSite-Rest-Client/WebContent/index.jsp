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
</style>

</head>

<body>
	<!-- nav 시작 -->
	<%@include file="frame/nav.jsp"%>
	<!-- nav 끝 -->


	<div class="main" style="background-image: url('images/Labrador.mp4')">
		<!-- 영상배경 시작 -->
		<%@include file="frame/filmBackground.jsp"%>
		<!-- 영상배경 끝 -->
		
		<!-- context시작 -->
		<div class="container">
			<h1 class="logo cursive">Find your New Family</h1>
			<br>
			<div class="content">
				<!-- <h4 class="motto">메인페이지!!!</h4> -->
				<div class="subscribe">
					<!--<h5 class="info-text">
                        Join the waiting list for the beta. We keep you posted.
                    </h5>-->
				</div>
			</div>
		</div>
		<!-- context끝 -->

		<!-- footer 시작 -->
		<%@include file="frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>
</body>
<script src="js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
</html>