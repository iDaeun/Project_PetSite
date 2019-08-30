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
#cel{
	display: inline;
	
}
#sub{
	display: inline;
	/* float: right; */
}
.sear{
	width: 220px;
	height: 39px;
	border-radius: 5px;
	margin-right: 10px; 
}
.content{
	margin-left: 230px;
}
p{
color: white;
}
#text{
	height: 300px;
}
#photo{
	border-radius: 3px;
	background-color: white;
	width: 220px;
}



</style>
<body>
	<!-- nav 시작 -->
	<%@include file="../frame/nav.jsp"%>
	<!-- nav 끝 -->


	<div class="main" style="background-image: url('../images/backgroud.jpg')">
		<div class="cover black" data-color="white"></div>

		<!-- context시작 -->
		<div class="container">
			<h1 class="logo cursive">write</h1>
			<br>
			<div class="content">
				<!--<h5 class="info-text">
                        Join the waiting list for the beta. We keep you posted.
                    </h5>-->

				<div id="formDiv">
		
	<div class="content">
		
		<form id="form" enctype="multipart/form-data">
			 <p>아이디 </p> <input type="text"
				name="uId" id="uId" value="${sessionScope.id}" class="sear" readonly> 
				<br><br><p>제목 </p><input
				type="text" name="title" id="title" class="sear"> <br><br>
				<input type="file"
				name="photo" id="photo" ><br>
			<p>내용</p><textarea rows="3" cols="30" name="text" id="text" class="sear"></textarea>
			<br><br><input type="submit" value="작성" id="sub" class="btn btn-warning">
			<a id="cencle" href="main.jsp" id="cel" class="btn btn-warning">취소</a>
		</form>
		
		
				</div>
			</div>
		</div>
		<!-- context끝 -->

		<!-- footer 시작 -->
		<%@include file="../frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>
	</div>


	<script>
		$(document).ready(function() {

			$('#form').submit(function() {

				/*var form = $('#form')[0];*/
				var formData = new FormData();

				formData.append("uId", $('#uId').val());
				formData.append("title", $('#title').val());
				formData.append("text", $('#text').val());
				formData.append("photo", $('#photo')[0].files[0]);

				$.ajax({

					url : 'http://ec2-15-164-103-108.ap-northeast-2.compute.amazonaws.com:8080/info/infoMain',
					type : 'POST',
					data : formData,
					contentType : false,
					processData : false,
					success : function(data) {
						alert('글이 작성되었습니다.');
						location.href = "main.jsp";
					}

				});
				return false;
			});

			$('#cencle').click(function() {

			});

		});
	</script>

</body>
<script src="../js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
</html>