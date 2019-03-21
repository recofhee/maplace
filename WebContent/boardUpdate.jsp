<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <c:if test="${empty loginUser}">
	<jsp:forward page="login"/>
</c:if> --%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8"/>
<title>page</title>
<link rel="shortcut icon" href="images/icon_favicon.ico"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/common.css"/>
<link rel="stylesheet" type="text/css" href="css/board.css"/> 
<link rel="stylesheet" type="text/css" href="css/joinlogin.css"/> 
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script>
<script type="text/javascript" src="js/area.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/validate.js"></script>
<script type="text/javascript">
$(function(){
	$('#boardForm').submit(function(){
		CKEDITOR.instances.content.updateElement();
	});
});
</script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<div class="joinbody">
		<form action="boardUpdate" method="post" class="joinform" id="boardForm" enctype="multipart/form-data">
			<!-- <input type="hidden" name="command" value="board_update"/> -->
			<input type="hidden" name="num" value="${board.num}"/>
			<input type="hidden" name="name" value="${board.name}"/>
			
			<div class="container">
				<h1>글 수정</h1>
				<hr>
				
				<c:choose>
					<c:when test="${(not empty loginUser) and (loginUser.admin eq 1)}">
						<!-- 관리자 -->
						<input type="text" name="name" id="name" value="${board.name}" placeholder="작성자를 입력해 주세요."/>
						<input type="text" name="title" id="title" value="${board.title}" placeholder="제목을 입력해 주세요."/>
						<input type="hidden" value="${board.pass}" name="pass" id="pw"/>
					</c:when>
					
					<c:when test="${(not empty loginUser)}">
						<!-- 회원 -->
						<c:if test="${loginUser.id eq board.id}">
							<input type="hidden" value="${loginUser.id}" name="id" id="id"/>
							<input type="hidden" value="${loginUser.name}" name="name" id="name"/>
							<input type="hidden" value="${loginUser.pw}" name="pass" id="pw"/>
							<input type="text" name="title" id="title" value="${board.title}" placeholder="제목을 입력해 주세요."/>
						</c:if>
						<c:if test="${empty board.id}">
							<input type="text" name="name" id="name" value="${board.name}" placeholder="작성자를 입력해 주세요."/>
							<input type="text" name="title" id="title" value="${board.title}" placeholder="제목을 입력해 주세요."/>
							<input type="password" name="pass" id="pass" placeholder="비밀번호를 입력해 주세요."/>
						</c:if>
					</c:when>
					
					<c:when test="${(empty loginUser) and (empty board.id)}">
						<!-- 비회원 -->
						<input type="text" name="name" id="name" value="${board.name}" placeholder="작성자를 입력해 주세요."/>
						<input type="text" name="title" id="title" value="${board.title}" placeholder="제목을 입력해 주세요."/>
						<input type="password" name="pass" id="pass" placeholder="비밀번호를 입력해 주세요."/>
					</c:when>
				</c:choose>
				<textarea cols="70" rows="15" name="content">${board.content}</textarea>
				<input type="file" name="fileName" accept=".gif, .jpg, .png"/>
				
				<input type="submit" value="확인"/>
				<a href="BoardServlet?command=board_list"><input type="button" value="글 목록"/></a>
			</div>
		</form>
	</div>
	
	<jsp:include page="footer.jsp"/>
<script type="text/javascript">
//textarea editor
CKEDITOR.replace('content', {
    filebrowserUploadUrl: '/upload'
});
</script>
</body>
</html>