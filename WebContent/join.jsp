<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8"/>
<link rel="shortcut icon" href="images/icon_favicon.ico"/>
<link rel="stylesheet" type="text/css" href="css/common.css"/> 
<link rel="stylesheet" type="text/css" href="css/joinlogin.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script type="text/javascript" src="js/area.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/validate.js"></script>
<script type="text/javascript">
$(function(){
	$('#pw').on('keyup', function(){
		if($('#pw').val().length < 10) {
			$('#pw').prev().html('비밀번호는 10자 이상').addClass('check');
		} else {
			$('#pw').prev().html('');
		}
	});
	$('#pwRep').on('keyup', function(){
		if($('#pw').val() != $('#pwRep').val()) {
			$('#pwRep').prev().html('비밀번호가 일치하지 않습니다.').addClass('check');
		} else {
			$('#pwRep').prev().html('');
		}
	});
	
	$('#email').on('keyup', function(){
		var email = $('#email').val();
		$.ajax({
			type: 'POST',
			url: 'emailCheck',
			data: {
				email: email
			},
			success: function(result){
				if(result == 1) {
					$('#email').prev().html('사용할 수 없는 이메일입니다.').addClass('check');
				} else {
					$('#email').prev().html('');
				}
			}
		});
	});
	
	$('#id').on('keyup', function(){
		var id = $('#id').val();
		$.ajax({
			type: 'POST',
			url: 'idCheck',
			data: {
				id: id
			},
			success: function(result){
				if(result == 1) {
					$('#id').prev().html('사용할 수 없는 아이디입니다.').addClass('check');
				} else {
					$('#id').prev().html('');
				}
			}
		});
	});
});
</script>
<title>회원 가입</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<div class="joinbody">
		<form class="joinform" action="join" method="post" name="joinform" id="joinForm">
			<div class="container">
				<h1>회원 가입</h1>
				<hr>
				
				<label><b>아이디</b><span></span><input type="text" placeholder="아이디를 입력해 주세요." name="id" id="id"/></label>

				<label><b>이메일</b><span></span><input type="email" placeholder="이메일을 입력해 주세요." name="email" id="email"/></label>
				
				<label><b>비밀번호</b><span></span><input type="password" placeholder="비밀번호를 입력해 주세요." name="pw" id="pw"/></label>
				
				<label><b>비밀번호 확인</b><span></span><input type="password" placeholder="비밀번호를 한 번 더 입력해 주세요." name="pwRep" id="pwRep"/></label>
				
				<label><b>이름</b><input type="text" placeholder="이름을 입력해 주세요." name="name" id="name"/></label>
				
				<label for="birthY"><b>생년월일</b></label>
				<div class="birth">
					<input type="text" class="birthY" placeholder="년(4자)" maxlength="4" name="birthY" id="birthY"/>
					<select class="birthM" name="birthM">
						<option>월</option>
						<option value="01">01</option>
						<option value="02">02</option>
						<option value="03">03</option>
						<option value="04">04</option>
						<option value="05">05</option>
						<option value="06">06</option>
						<option value="07">07</option>
						<option value="08">08</option>
						<option value="09">09</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select>
					<select class="birthD" name="birthD">
						<option>일</option>
						<option value="01">01</option>
						<option value="02">02</option>
						<option value="03">03</option>
						<option value="04">04</option>
						<option value="05">05</option>
						<option value="06">06</option>
						<option value="07">07</option>
						<option value="08">08</option>
						<option value="09">09</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
						<option value="21">21</option>
						<option value="22">22</option>
						<option value="23">23</option>
						<option value="24">24</option>
						<option value="25">25</option>
						<option value="26">26</option>
						<option value="27">27</option>
						<option value="28">28</option>
						<option value="29">29</option>
						<option value="30">30</option>
						<option value="31">31</option>
					</select>
				</div>
				
				<label><b>성별</b></label>
				<div class="gender">
					<label for="notsay"><input type="radio" name="gender" value="응답 안 함" id="notsay"/><span></span>응답 안 함</label>
					<label for="male"><input type="radio" name="gender" value="남자" id="male"/><span></span>남자</label>
					<label for="female"><input type="radio" name="gender" value="여자" id="female"/><span></span>여자</label>
				</div>
				
				<!-- 
				<label><b>취미</b></label>
				<div class="hobby">
					<label for="music"><input type="checkbox" name="hobby" value="music" id="music"/><span></span>음악 감상</label>
					<label for="movie"><input type="checkbox" name="hobby" value="movie" id="movie"/><span></span>영화 감상</label>
					<label for="game"><input type="checkbox" name="hobby" value="game" id="game"/><span></span>게임</label>
					<label for="read"><input type="checkbox" name="hobby" value="read" id="read"/><span></span>독서</label>
				</div>
   				-->
				<input type="submit" class="joinbtn" value="가입하기"/>
			</div>
		</form>
	</div>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>