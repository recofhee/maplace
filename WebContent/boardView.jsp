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
<link rel="stylesheet" type="text/css" href="css/common.css"/>
<link rel="stylesheet" type="text/css" href="css/board.css"/> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script>
<script type="text/javascript" src="js/area.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript">
$(function(){
	$('#updBoardBtn').on('click', function(){ // modal은 click
		var pass = $('#updPass').val();
		var num = '${board.num}';
		$.ajax({
			type: 'POST',
			url: 'passCheck',
			data: {
				num: num,
				pass: pass
			},
			success: function(result){
				if(result == 1) {
					location.href = 'BoardServlet?command=board_update_form&num='+num;
				} else {
					alert('비밀번호가 일치하지 않습니다.');
					$('#updPass').focus();
					return false;
				}
			}
		});
	});
	$('#delBoardBtn').on('click', function(){ // modal은 click
		var pass = $('#delPass').val();
		var num = '${board.num}';
		$.ajax({
			type: 'POST',
			url: 'passCheck',
			data: {
				num: num,
				pass: pass
			},
			success: function(result){
				if(result == 1) {
					location.href = 'BoardServlet?command=board_delete&num='+num;
				} else {
					alert('비밀번호가 일치하지 않습니다.');
					$('#delPass').focus();
					return false;
				}
			}
		});
	}); 
	
	$('#delConfirm').click(function(){
		var result = confirm('삭제하시겠습니까 ?');
		
		if(result) {
			location.href = 'BoardServlet?command=board_delete&num='+'${board.num}';
		} else {
			return false;
		}
	});
});
</script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<div class="boardbody board">
			<h1>${board.title}</h1>
			<div class="fl">
				<span><i class="far fa-user"></i>${board.name}</span>
				<span><i class="far fa-calendar-alt"></i><fmt:formatDate value="${board.writeDate}" pattern="yyyy.MM.dd, HH:mm:ss"/></span>
			</div>
			<div class="fr">
				<span><i class="far fa-eye"></i>${board.readCount}</span>
			</div>
			<div class="boardcont">
			<c:if test="${not empty board.fileName}">
				<img alt="${board.fileName}" src="upload/${board.fileName}">
			</c:if>
				${board.content}
			</div>
			<div class="row">
				<a href="BoardServlet?command=board_list"><input type="button" value="글 목록"/></a>
					<c:choose>
						<c:when test="${(not empty loginUser) and (loginUser.admin eq 1)}">
							<!-- 관리자 -->
							<!-- 수정 삭제 모두 가능 -->
							<a href="BoardServlet?command=board_update_form&num=${board.num}"><input type="button" value="글 수정"/></a>
							<a href="BoardServlet?command=board_delete&num=${board.num}" id="delConfirm"><input type="button" value="글 삭제"/></a>
						</c:when>
						
						<c:when test="${(not empty loginUser)}">
							<!-- 회원 -->
							<!-- 수정 삭제 : 비회원 글 비밀번호 입력 후 가능, 자기가 작성한 글 가능 -->
							<c:if test="${loginUser.id eq board.id}">
								<a href="BoardServlet?command=board_update_form&num=${board.num}"><input type="button" value="글 수정"/></a>
								<a href="#delPassForm" rel="modal:open"><input type="button" value="글 삭제"/></a>
							</c:if>
							<c:if test="${empty board.id}">
								<a href="#updPassForm" rel="modal:open"><input type="button" value="글 수정"/></a>
								<a href="#delPassForm" rel="modal:open"><input type="button" value="글 삭제"/></a>
							</c:if>
						</c:when>
						
						<c:when test="${(empty loginUser) and (empty board.id)}">
							<!-- 비회원 -->
							<!-- 수정 삭제 : 비회원 글 비밀번호 입력 후 가능, 회원이 작성한 글은 보여지면 안 됨 -->
							<a href="#updPassForm" rel="modal:open"><input type="button" value="글 수정"/></a>
							<a href="#delPassForm" rel="modal:open"><input type="button" value="글 삭제"/></a>
						</c:when>
					</c:choose>
					
			</div>
	</div>
	
	<!-- 글 수정 modal -->
	<div id="updPassForm" class="modal">
		<input type="password" name="pass" id="updPass" placeholder="비밀번호를 입력해 주세요."/>
		<input type="button" value="글 수정" id="updBoardBtn"/>
	</div>
	
	<!-- 글 삭제 modal -->
	<div id="delPassForm" class="modal">
		<input type="password" name="pass" id="delPass" placeholder="비밀번호를 입력해 주세요."/>
		<input type="button" value="글 삭제" id="delBoardBtn"/>
	</div>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>