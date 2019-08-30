<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
    <nav class="navbar navbar-transparent navbar-fixed-top"
		role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> My Page <b class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<c:if test="${id eq null}">
							<li><a href="<c:url value='/reg.jsp' />"> 회원가입</a></li>
							<li><a href="<c:url value='/login.jsp' />"> 로그인</a></li>
							</c:if>
							<c:if test="${id ne null}">
							<li><a href="<c:url value='/membersC/mypage.jsp' />"> 마이페이지</a></li>
							</c:if>
						</ul></li>

				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<c:url value='/membersC/adoptdog.jsp' />"> <i class=""></i> 유기동물 목록</a></li>
					<li><a href="<c:url value='/membersC/donationView.jsp' />"> <i class=""></i> 후원하기</a></li>
					<li><a href="<c:url value='/membersC/main.jsp' />"> <i class=""></i> 정보 및 훈련</a></li>
					<li><a href="<c:url value='/'/>"> <i class=""></i> 홈</a></li>
				</ul>

			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>