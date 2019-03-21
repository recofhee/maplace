$(function(){
	/**
	 * header에 있는 nav active
	 * 수정 요함 !!!!
	 */
	$('a.nav').click(function(){
		
		/*$('a.nav').removeClass('active');
		$(this).addClass('active');*/
		
		$(this).addClass('active').siblings().removeClass('active');
		
	});
	/*$('#topnav a[href ~= "Board"]').click(function(){*/
	/*$('#topnav > ul > li:nth-child(3) > a').click(function(){
		$('a.nav').removeClass('active');
		$('#topnav > ul > li:nth-child(3) > a').addClass('active');
	});*/

});