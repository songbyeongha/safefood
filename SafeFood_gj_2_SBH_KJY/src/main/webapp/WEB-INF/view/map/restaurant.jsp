<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/include/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
</head>
<body>
	<center>
		<div>
			<h1>유기농음식점 위치</h1>
		</div>
		<br>
		<div id="map" style="width: 700px; height: 600px;"></div>
	<center>
</body>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d773d721c322d63e167ff0bd10f549d8">
</script>
<script>
	var mapContainer = document.getElementById('map');
	var mapOption = {
		center : new daum.maps.LatLng(35.205289, 126.811378),
		level : 4
	};

	var map = new daum.maps.Map(mapContainer, mapOption);
	// 마커가 표시될 위치 
	var markerPosition = new daum.maps.LatLng(35.205289, 126.811378);

	

	var positions = [
	    {
	    	content : '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
            '            어느멋진날' + 
            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="https://t1.daumcdn.net/cfile/tistory/26DD3933597A843E17" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis">광주광역시 광산구 장덕동 1673</div>' + 
            '                <div class="jibun ellipsis">전화번호 : 010-8601-7741</div>' + 
            '                <div><a href="https://www.diningcode.com/profile.php?rid=vNSICEQtIZxL" target="_blank" class="link">홈페이지</a></div>' + 
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>',
	        latlng: new daum.maps.LatLng(35.211915, 126.873583)
	    },
	    {
	    	content : '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
            '            타오(TAO)' + 
            '            <div class="close" onclick="closeOverlay(oberla)" title="닫기"></div>' + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="http://www.polinews.co.kr/data/photos/201704/art_1493084853.jpg" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis">광주광역시 광산구 수완동 1452</div>' + 
            '                <div class="jibun ellipsis">전화번호 : 062-955-2215</div>' + 
            '                <div><a href="https://store.naver.com/restaurants/detail?id=19958242" target="_blank" class="link">홈페이지</a></div>' + 
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>', 
	        latlng: new daum.maps.LatLng(35.189385, 126.823022)
	    },
	    {
	    	content : '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
            '            백미당' + 
            '            <div class="close" onclick="closeOverlay(oberla)" title="닫기"></div>' + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="https://s3-ap-northeast-1.amazonaws.com/dcreviewsresized/20190116114335141_menu0_6a56c75d506a.jpg" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis">광주광역시 서구 광천동 49-1</div>' + 
            '                <div class="jibun ellipsis">전화번호 : 062-955-7258</div>' + 
            '                <div><a href="https://www.diningcode.com/profile.php?rid=K8RoZoWlDces" target="_blank" class="link">홈페이지</a></div>' + 
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>', 
	        latlng: new daum.maps.LatLng(35.159894, 126.880401)
	    }
	];

	var markers = [];
	var overlays = [];
	
	for (var i = 0; i < positions.length; i++) {
		var marker = new daum.maps.Marker({
			map : map,
			position : positions[i].latlng
		});
		
		var overlay = new daum.maps.CustomOverlay({
	        content: positions[i].content,
	        map: map,
	        position: positions[i].latlng       
	    });
	

	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
	function closeOverlay() {
		 overlay.setMap(null);    
		 console.log("222222");
		}
	}
	daum.maps.event.addListener(marker, 'click', function() {
	    overlay.setMap(map);
	    console.log("11111111");
	});
	function closeOverlay() {
		overlay.setMap(null);    
		console.log("222222");
	}
	
</script>
</html>
<jsp:include page="/WEB-INF/view/include/footer.jsp" />
