<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8"/>
<title>page</title>
<link rel="shortcut icon" href="images/icon_favicon.ico"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<link rel="stylesheet" type="text/css" href="css/common.css"/>
<link rel="stylesheet" type="text/css" href="css/board.css"/> 
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/area.js"></script>
<script type="text/javascript" src="js/script.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<section>
		<!-- board -->
		<c:forEach var="board" items="${boardList}">
		<div class="board card">
			<h1><a href="BoardServlet?command=board_view&num=${board.num}">${board.title}</a></h1>
			<span><i class="far fa-user"></i>${board.name}</span>
			<span><i class="far fa-calendar-alt"></i><fmt:formatDate value="${board.writeDate}"/></span>
			<a href="BoardServlet?command=board_view&num=${board.num}" class="button">더 보기</a>
		</div>
		</c:forEach>
		<a href="BoardServlet?command=board_write_form"><input type="button" value="글 쓰기"/></a>
	</section>
	<aside>
	<c:if test="${not empty loginUser}">
		<!-- logout -->
		<div class="card userCard">
			<h3>${loginUser.id} 님</h3>
			<a href="logout"><input type="submit" class="logoutbtn" value="로그아웃"/></a>
			<a href="memberUpdate?id=${loginUser.id}">회원 정보 수정</a>
		</div>
	</c:if>
	
	<c:if test="${empty loginUser}">
		<!-- login -->
		<form action="login" class="loginform card" method="post">
			<input type="submit" class="loginbtn" value="로그인"/>
			<!-- <a href="#">이메일·비밀번호 찾기</a> -->
			<a href="join">회원 가입</a>
		</form>
	</c:if>
		
		<!-- banner -->
		<div class="card">
			<h2>T O D A Y</h2>
			<p>Horololo Horololo Horololo Horololo</p>
		</div>
	</aside>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>