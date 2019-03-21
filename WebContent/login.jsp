<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8"/>
<title>Login</title>
<link rel="shortcut icon" href="images/icon_favicon.ico"/>
<link rel="stylesheet" type="text/css" href="css/common.css"/>
<link rel="stylesheet" type="text/css" href="css/joinlogin.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/validate.js"></script>
<script type="text/javascript" src="js/area.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript">
$(function(){
	$('#loginForm').on('submit', function(){
		/* var id = $('#id').val();
		var pw = $('#pw').val();
		$.ajax({
			type: 'POST',
			url: 'login',
			data: {
				id: id,
				pw: pw
			},
			success: function(result){
				if(result == 1) {
					alert(result);
					return false;
					//location.href = 'login&id='+id+'&pw='+pw;
				} else {
					alert(result);
					alert('비밀번호가 일치하지 않습니다.');
					$('#pw').focus();
					return false;
				}
			}
		}); */
		
		if($('#id').val() == '') {
			alert('아이디를 입력해 주세요.');
			$('#id').focus();
			return false;
		}
		if($('#pw').val() == '') {
			alert('비밀번호를 입력해 주세요.');
			$('#pw').focus();
			return false;
		}
		return true;
	});
});
</script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<div class="loginbody">
		<form action="login" class="loginform card" method="post" id="loginForm">
			<div class="container">
				<label>아이디<input type="text" id="id" name="id" placeholder="Id"/></label>
				<label>비밀번호<input type="password" id="pw" name="pw" placeholder="Password"/></label>
				
				<input type="submit" class="loginbtn" id="loginBtn" value="로그인"/>
				<a href="#">아이디·비밀번호 찾기</a>
				<a href="join">회원 가입</a>
			</div>
		</form>
	</div>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>