<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8"/>
<title>index</title>
<link rel="shortcut icon" href="images/icon_favicon.ico"/>
<link rel="stylesheet" type="text/css" href="css/index.css"/> 
<link rel="stylesheet" type="text/css" href="css/common.css"/>
<link rel="stylesheet" type="text/css" href="slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/area.js"></script>
<script type="text/javascript" src="js/script.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<section>
		<!-- slider -->
		<div class="imgslide card">
			<img alt="random image" src="https://picsum.photos/700/300/?random"/>
			<img alt="random image" src="https://picsum.photos/g/700/300/"/>
			<img alt="random image" src="https://picsum.photos/700/300/?random"/>
			<img alt="random image" src="https://picsum.photos/g/700/300/"/>
		</div>
		<!-- list --> <!-- list -->
		<div class="card row">
			<div class="list">
				<blockquote>
					<p>MAPLACE = MAP + PLACE</p>
					<p>
					이 웹 사이트는 개인 프로젝트로 제작되었으며,
					지도 검색, 회원·비회원 게시판의 기능이 있다.
					</p>
				</blockquote>
			</div>
			<div class="list">
				<blockquote>
					<p>
					Daum API를 연동하여 지도에서 원하는 위치에 핀을 놓으면
					주변 장소의 정보가 뜨며 또한 검색 결과에 따라 해당하는 장소의
					위치를 지도에 표시해 주고 그에 대한 이미지를 볼 수 있다.
					</p>
				</blockquote>
			</div>
		</div>

	</section>
	
	<aside>
		<!-- login -->
		<c:if test="${empty loginUser}">
			<form action="login" class="loginform card" method="post">
				<input type="submit" class="loginbtn" value="로그인"/>
				<!-- <a href="#">아이디·비밀번호 찾기</a> -->
				<a href="join">회원 가입</a>
			</form>
		</c:if>

		<!-- logout -->
		<c:if test="${not empty loginUser}">
			<div class="card userCard">
				<h3>${loginUser.id} 님</h3>
				<a href="logout"><input type="submit" class="logoutbtn" value="로그아웃"/></a>
				<a href="memberUpdate?id=${loginUser.id}">회원 정보 수정</a>
			</div>
		</c:if>

		<!-- banner -->
		<div class="card">
			<h2>T O D A Y</h2>
			<p>Horololo Horololo Horololo Horololo</p>
		</div>
	</aside>
	
	<jsp:include page="footer.jsp"/>

<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="slick/slick.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#topnav a:first').addClass("active");
	
	// image slide
	$('.imgslide').slick({
		dots: true,
		infinite: true,
		slidesToShow: 1,
		autoplay: true,
		fade: true
	});
});
</script>
</body>
</html>