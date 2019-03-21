/**
 * 
 */

$(function(){
	// 메뉴 상단 스크롤 위치에 따른 고정
	$(this).on('scroll', function(){
		if(window.scrollY > 375) {
			$('.topnav').addClass('navFix');
		} else {
			$('.topnav').removeClass('navFix');
		}
	});
});