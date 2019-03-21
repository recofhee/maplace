/**
 * 유효성 검사
 */

$(function(){
	/*$('#loginForm').on('submit', function(){
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
	});*/
	
	$('#joinForm').on('submit', function(){
		var gender = $(this).find('input[name="gender"]');
//		var hobby = $(this).find('input[name="hobby"]');
		var genderFlag = false;
//		var hobbyCnt = 0;
		
		gender.each(function(){
			if($(this).is(':checked')) {
				genderFlag = true;
			}
		});
		
/*		hobby.each(function(){
			if($(this).is(':checked')) {
				hobbyCnt++;
			}
		});
*/
		
		if($('#id').val() == '') {
			alert('아이디를 입력해 주세요.');
			$('#id').focus();
			return false;
		}
		if($('#email').val() == '') {
			alert('이메일을 입력해 주세요.');
			$('#email').focus();
			return false;
		}
		if($('#pw').val() == '') {
			alert('비밀번호를 입력해 주세요.');
			$('#pw').focus();
			return false;
		}
		if($('#pw').val().length < 10) {
			alert('비밀번호는 10자 이상.');
			$('#pw').focus();
			return false;
		}
		if($('#pwRep').val() == '') {
			alert('비밀번호를 확인해 주세요.');
			$('#pwRep').focus();
			return false;
		}
		if($('#pw').val() != $('#pwRep').val()) {
			alert('비밀번호가 일치하지 않습니다.');
			$('#pwRep').focus();
			return false;
		}
		if($('#name').val() == '') {
			alert('이름을 입력해 주세요.');
			$('#name').focus();
			return false;
		}
		if(!genderFlag) {
			alert('성별을 선택해 주세요.');
			return false;
		}
		/*if(hobbyCnt < 1) {
			alert('하나 이상의 취미를 선택해 주세요.');
			return false;
		}*/
	});
	
	/*$('#loginForm').submit(function(){
		var email = $('#email').val();
		var pw = $('#pw').val();
		
		$.ajax('login', {
			success: function(data){
				if(data == 'failed') {
					alert('이메일 및 비밀번호를 확인해 주세요.');
					$('#email').focus();
				} else {
					//alert('로그인 성공');
					location.href = 'main.jsp';
				}
			},
			data: 'email=' + email + '&pw=' + pw,
			method: 'POST'
		});
		return false;
	});*/
	
	$('#boardForm').on('submit', function(){
		if($('#name').val() == '') {
			alert('작성자를 입력해 주세요.');
			$('#name').focus();
			return false;
		}
		if($('#pass').val() == '') {
			alert('비밀번호를 입력해 주세요.');
			$('#pass').focus();
			return false;
		}
		if($('#title').val() == '') {
			alert('제목을 입력해 주세요.');
			$('#title').focus();
			return false;
		}
		return true;
	});
});