<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="birth" value="${mVo.birth}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8"/>
<link rel="shortcut icon" href="images/icon_favicon.ico"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/common.css"/> 
<link rel="stylesheet" type="text/css" href="css/joinlogin.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script type="text/javascript" src="js/area.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/validate.js"></script>
<script type="text/javascript">
$(function(){
	// 수정 필요
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
				console.log(result);
				
				if(result == 1) {
					$('#email').prev().html('사용할 수 없는 이메일입니다.').addClass('check');
					return false;
				} else {
					$('#email').prev().html('');
				}
			}
		});
	});
	
	if(${mVo.gender eq '응답 안 함'}){
		$('#notsay').attr('checked', 'checked');
	} else if(${mVo.gender eq '남자'}) {
		$('#male').attr('checked', 'checked');
	} else if(${mVo.gender eq '여자'}) {
		$('#female').attr('checked', 'checked');
	}
	
	$('#birthM').find('option:eq(${fn:substring(birth, 4, 6)})').prop("selected", true);
	$('#birthD').find('option:eq(${fn:substring(birth, 6, 8)})').prop("selected", true);
	
	/* 회원 탈퇴 여부 */
	$('#delMemberBtn').on('click', function(){
		var id = '${mVo.id}';
		var pw = $('#delPass').val();
		$.ajax({
			type: 'post',
			url: 'memberPwCheck',
			data: {
				id: id,
				pw: pw
			},
			success: function(result){
				if(result == 1) {
					/* location.href = 'memberDelete?id='+id+'&pw='+pw;
					return false; */
					location.href = 'memberDelete?id='+id;
				} else {
					alert('비밀번호가 일치하지 않습니다.');
					$('#delPass').focus();
					return false;
				}
			}
		});
	});
});
</script>
<title>회원 정보 수정</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<div class="joinbody">
		<form class="joinform" action="memberUpdate" method="post" name="joinform" id="joinForm">
			<div class="container">
				<h1>회원 정보 수정</h1>
				<hr>
				
				<label><b>아이디</b><span></span><input type="text" value="${mVo.id}" name="id" id="id" readonly="readonly"/></label>

				<label><b>이메일</b><span></span><input type="email" value="${mVo.email}" name="email" id="email"/></label>
				
				<label><b>비밀번호</b><span></span><input type="password" placeholder="비밀번호를 입력해 주세요." name="pw" id="pw"/></label>
				
				<label><b>비밀번호 확인</b><span></span><input type="password" placeholder="비밀번호를 한 번 더 입력해 주세요." name="pwRep" id="pwRep"/></label>
				
				<label><b>이름</b><input type="text" value="${mVo.name}" name="name" id="name"/></label>
				
				<label for="birthY"><b>생년월일</b></label>
				<div class="birth">
					<input type="text" class="birthY" value="${fn:substring(birth, 0, 4)}" maxlength="4" name="birthY" id="birthY"/>
					<input type="hidden" value="${mVo.birth}" name="birthY"/>
					<select class="birthM" name="birthM" id="birthM">
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
					<select class="birthD" name="birthD" id="birthD">
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
   				
   				<fmt:formatDate value="${mVo.reg}" var="reg" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초"/>
   				<label><b>가입일시</b><span></span><input type="text" value="${reg}" name="reg" id="reg" readonly="readonly"/></label>
   				
   				<div class="updateSec">
					<input type="submit" class="joinbtn" value="수정"/>
	   				<a href="#delPassForm" title="회원 탈퇴" rel="modal:open"><i class="fas fa-user-slash"></i></a>
   				</div>
			</div>
		</form>
	</div>
	
	<jsp:include page="footer.jsp"/>
	
	<!-- 글 삭제 modal -->
	<div id="delPassForm" class="modal">
		<input type="password" name="pw" id="delPass" placeholder="비밀번호를 입력해 주세요."/>
		<input type="button" value="회원 탈퇴" id="delMemberBtn"/>
	</div>
</body>
</html>