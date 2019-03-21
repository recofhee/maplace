<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<div class="joinbody">
		<form action="boardWrite" method="post" class="joinform" id="boardForm" enctype="multipart/form-data">
			<!-- <input type="hidden" name="command" value="board_write"/> -->
			<div class="container">
				<h1>글 쓰기</h1>
				<hr>
				
				<%-- <input type="hidden" name="email" value="${loginUser.email}" disabled="disabled"/>
				<input type="hidden" name="name" value="${loginUser.name}" disabled="disabled"/>
				<input type="text" name="title" id="title" placeholder="제목을 입력해 주세요."/>
				<input type="password" name="pass" id="pass" placeholder="비밀번호를 입력해 주세요."/>
				<textarea cols="70" rows="15" name="content"></textarea>
				
				<input type="submit" value="글 쓰기"/>
				<a href="BoardServlet?command=board_list"><input type="button" value="글 목록"/></a> --%>
				
				<c:if test="${not empty loginUser}">
					<input type="hidden" value="${loginUser.id}" name="id" id="id"/>
					<input type="hidden" value="${loginUser.name}" name="name" id="name"/>
					<input type="hidden" value="${loginUser.pw}" name="pass" id="pw"/>
					<input type="text" name="title" id="title" placeholder="제목을 입력해 주세요."/>
				</c:if>
				<c:if test="${empty loginUser}">
					<input type="text" name="name" id="name" placeholder="작성자를 입력해 주세요."/>
					<input type="text" name="title" id="title" placeholder="제목을 입력해 주세요."/>
					<input type="password" name="pass" id="pass" placeholder="비밀번호를 입력해 주세요."/>
				</c:if>
				<textarea cols="70" rows="15" name="content"></textarea>
				<input type="file" name="fileName" accept=".gif, .jpg, .png"/>
				
				<input type="submit" value="글 쓰기"/>
				<a href="BoardServlet?command=board_list"><input type="button" value="글 목록"/></a>
			</div>
		</form>
	</div>
	
	<jsp:include page="footer.jsp"/>
<script type="text/javascript">
$(function(){
	//textarea editor
	CKEDITOR.replace('content');
	
	$('#boardForm').submit(function(){
		CKEDITOR.instances.content.updateElement();
	});
});
</script>
</body>
</html>