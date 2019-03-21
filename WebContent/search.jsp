<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="robots" content="noindex" />
<!-- 로봇에게(모든 검색에서) 인덱스(노출) 주지 않겠다 -->
<!--<meta name="googlebots-news" content="noindex"> // 구글 뉴스에게 인덱스 주지 않겠다 -->
<meta name="viewport" content="width=device-width, user-scalable=no" />
<title>Map Search</title>
<link rel="shortcut icon" href="images/icon_favicon.ico" />
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/search.css" />
<link rel="stylesheet" type="text/css" href="css/index.css" />
<link rel="stylesheet" type="text/css" href="css/map.css" />
<!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
<link href="css/bootstrap.custom.css" rel="stylesheet">
<link href="css/lightbox.min.css" rel="stylesheet">
<script src="js/lightbox.min.js"></script>
<script type="text/javascript" src="js/area.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<div class="container">
	
		<!-- <div id="map" style="width:500px;height:400px;"></div> -->
		
		<div class="bs-row maplace-wrap">
			<div class="col-xs-12 col-md-6 maplace-left">
				<div id="map">
					<!-- <div id="breadcrumbs">당신의 위치입니다.</div> -->
					<ul id="level">
						<li><i class="fas fa-plus"></i></li>
						<li><i class="fas fa-minus"></i></li>
					</ul>
				</div>
			</div>
		
			<div class="col-xs-12 col-md-6 maplace-right">
				<div class="input-group">
					<input type="text" class="form-control" name="q" placeholder="검색어 2글자 이상 입력">
					<span class="input-group-btn">
						<button class="btn btn-danger" type="button" id="searchBtn">검색</button>
					</span>
				</div><!-- /input-group -->
				<hr>
				<div id="result" class="maplace-list"></div>
			</div>
		</div>
	</div>
	
	<jsp:include page="footer.jsp"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9ed6c754957d0e2dc8c9ae0f52c1606a&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">
var map;
var marker;
$(document).ready(function(){
	var container = document.getElementById('map'); 
	var center = new daum.maps.LatLng(37.574985,126.976795);
	var options = { 
		center: center, 
		//draggable: false,
		level: 3 
	};
	map = new daum.maps.Map(container, options);
	var geocoder = new daum.maps.services.Geocoder();

	marker = new daum.maps.Marker({
	    map: map,
	    position: center
	});

	var content = '<div class="wrap">' + 
        '    <div class="info">' + 
        '        <div class="title">' + 
        '            광화문' +
        '        </div>' + 
        '        <div class="body">' + 
        '            <div class="img">' +
        '                <img src="https://cdn.pixabay.com/photo/2016/04/27/12/23/seoul-1356499_1280.jpg" width="110">' +
        '           </div>' + 
        '            <div class="desc">' + 
        '                <div>서울특별시 종로구 세종로 사직로 161</div>' + 
        '                <div class="telfax ellipsis">Tel 02-3700-3900</div>' + 
        '                <div><a href="http://www.royalpalace.go.kr/" target="_blank" class="link">웹 사이트</a></div>' + 
        '            </div>' + 
        '        </div>' + 
        '    </div>' +    
        '</div>';

	var overlay = new daum.maps.CustomOverlay({
	    content: content,
	    map: map,
	    position: marker.getPosition()       
	});

	marker.setMap(map);

	var mapTypeControl = new daum.maps.MapTypeControl();

	map.addControl(mapTypeControl, daum.maps.ControlPosition.BOTTOMLEFT);

	daum.maps.event.addListener(map, 'click', function(evt) {
	    // 클릭한 위도, 경도 정보를 가져옵니다 
	    var latlng = evt.latLng;

	    console.log(latlng.getLat()+' : '+latlng.getLng()+' : ');
		map.panTo(latlng);
		marker.setPosition(latlng);

		fetchPlaceStore(latlng.getLat(), latlng.getLng());
	});

	/* daum.maps.event.addListener(map, 'idle', function() {
		var pos = map.getCenter();
	    geocoder.coord2addr(pos, function(status, result){
	    	//console.log(result[0].fullName);
	    	$('#breadcrumbs').text(result[0].fullName);
	    });
	}); */
});

$(document).on('click', '.list-group-item', function(){
	$(this).siblings().removeClass('active').end().addClass('active');

	//console.log($(this).data('lat')+' '+$(this).data('lng'));
	var place = new daum.maps.LatLng($(this).data('lat'), $(this).data('lng'));
	
	// 마커를 생성합니다
	var marker = new daum.maps.Marker({
	    position: place
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	map.setCenter(place);
	//marker.setPosition(place);
	
});

$(document).on('click', '#level > li', function(){
	var level = map.getLevel();
	switch($(this).index()) {
		case 0: // Zoom-In
			map.setLevel(level - 1);
			break;
		case 1: // Zoom-out
			map.setLevel(level + 1);
			break;
		default:
			break;
	}
});

$(document).on('keydown', 'input[name="q"]', function(event) {
	// $('#log').html(event.type + ' : ' +  event.which);
	//console.log((event.type + ' : ' +  event.which));
	if (event.which == 13) { // enter
		$('#searchBtn').click();
		$('#searchBtn').blur();
		//$('#searchBtn').trigger('click'); // 위와 똑같
	}
});

$('#searchBtn').click(function(){
	var query = $('input[name="q"]').val();

	if(query.length < 2){
		alert('검색어는 2글자 이상으로 입력해 주세요 !');
		return false;
	}

	$.ajax({
		url: 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword',
		dataType: 'xml',
		method: 'get',
		data: {
			ServiceKey: 'Kiu7SmjMjp1LBwqSgiRBX8A1gqRdHISqmpE3z+OnGepmax9Pv0xJQsYilf1cKZ39eAlT4W/IeEsaxiv0yD5m9Q==',
			keyword: query,
			MobileOS: 'ETC',
			MobileApp: 'AppTesting'
		}
	}).done(function(data){
		//console.log(data);
		setUIfromTourAPI(data);
	});
});

function fetchPlaceStore(lat, lng, radius) {
	//http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey=인증키&contentTypeId=39&mapX=126.981106&mapY=37.568477&radius=2000&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1

	var radius = (typeof radius == 'undefined') ? 2000 : radius;

	$.ajax({
		url: 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList',
		dataType: 'xml',
		method: 'get',
		data: {
			ServiceKey: 'Kiu7SmjMjp1LBwqSgiRBX8A1gqRdHISqmpE3z+OnGepmax9Pv0xJQsYilf1cKZ39eAlT4W/IeEsaxiv0yD5m9Q==',
			mapX: lng,
			mapY: lat,
			radius: radius,
			MobileOS: 'ETC',
			MobileApp: 'AppTesting'
		}
	}).done(function(data){
		// console.log(data);
		setUIfromTourAPI(data);
	});
};

function setUIfromTourAPI(data) {
	var items = $(data).find('item');
	var results = [];
	$.each(items, function(k, v){
		var firstimage = $(this).find('firstimage').text();
		firstimage = firstimage ? firstimage : 'https://dummyimage.com/300x200/999/fff';
		var title = $(this).find('title').text();
		var addr1 = $(this).find('addr1').text();
		var mapx = $(this).find('mapx').text();
		var mapy = $(this).find('mapy').text();

		// results.push('<div class="panel panel-default"><div class="panel-heading" data-lat="'+mapy+'" data-lng="'+mapx+'">'+title+'</div><div class="panel-body"><div class="bs-row"><div class="col-sm-3"><img src="'+firstimage+'" class="img-responsive img-thumbnail center-block" alt=""></div><div class="col-sm-9"><dl class="dl-horizontal"><dt>장소</dt><dd>'+title+'</dd><dt>주소</dt><dd>'+addr1+'</dd></dl></div></div></div></div>');

		results.push('<li class="list-group-item" data-lat="'+mapy+'" data-lng="'+mapx+'"><div class="bs-row"><div class="col-sm-3"><a href="'+firstimage+'" data-lightbox="'+title+'" class="img-responsive center-block" alt="image"><img src="'+firstimage+'" width="200" class="img-thumbnail"></a></div><div class="col-sm-9"><h4>'+title+'</h4><p>'+addr1+'</p></div></div></li>');
	});

	$('#result').html('<ul class="list-group">'+results.join('')+'</ul>');
};

//버튼 클릭에 따라 지도 확대, 축소 기능을 막거나 풀고 싶은 경우에는 map.setZoomable 함수를 사용합니다
function setZoomable(zoomable) {
    // 마우스 휠로 지도 확대,축소 가능여부를 설정합니다
    map.setZoomable(zoomable);    
}

$(function(){
	/* var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new daum.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴 */
	
	
	
	$('a.nav').removeClass('active');
	$('[href="search"]').addClass('active');
});
</script>
</body>
</html>