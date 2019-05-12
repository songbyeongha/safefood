
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/include/header.jsp" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>	

	$("#findform").on("submit", function(e) {
		if (!validation()) {
			e.preventDefault();
		}
	});
</script>
<title>비밀번호 찾기</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		
			<div class="w3-container w3-card-4">
				<div class="w3-center w3-large w3-margin-top">
					<h3>비밀번호 찾기</h3>
				</div>
				
				<br>
				<h2>비밀번호 : ${password }</h2>
				
				<br>
			</div>
	
	</div>
</body>
</html>
<jsp:include page="/WEB-INF/view/include/footer.jsp"/>