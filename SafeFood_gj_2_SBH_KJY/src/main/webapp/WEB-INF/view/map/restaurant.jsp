<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/include/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<div>
			<h1>친환경음식점 위치</h1>
		</div>
		<br>
		<div id="map" style="width: 700px; height: 600px;"></div>
		<center>
</body>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d773d721c322d63e167ff0bd10f549d8"
></script>
<script>
	var container = document.getElementById('map');
	var options = {
		center : new daum.maps.LatLng(35.205289, 126.811378),
		level : 4
	};

	var map = new daum.maps.Map(container, options);

	// 마커가 표시될 위치 
	var markerPosition = new daum.maps.LatLng(35.205289, 126.811378);

	// 마커를 생성
	var marker = new daum.maps.Marker({
		position : markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	var iwContent = '<div style="padding:5px;">음식점 정보 <br><a href="http://map.daum.net/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="http://map.daum.net/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	iwPosition = new daum.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow = new daum.maps.InfoWindow({
		position : iwPosition,
		content : iwContent
	});

	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker);
</script>
</html>
<jsp:include page="/WEB-INF/view/include/footer.jsp" />
