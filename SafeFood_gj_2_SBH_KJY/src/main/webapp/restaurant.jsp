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
		<h1>모범음식점 위치</h1>
	</div>
	<br>
	<div id="map" style="width:700px;height:600px;"></div>
	<center>
</body>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d773d721c322d63e167ff0bd10f549d8"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(35.205289, 126.811378),
			level: 4
		};

		var map = new daum.maps.Map(container, options);
	</script>
	


</html>
<jsp:include page="/WEB-INF/view/include/footer.jsp"/>

