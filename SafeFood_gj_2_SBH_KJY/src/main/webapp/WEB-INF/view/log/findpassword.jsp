<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	$(function() {
		$("#backbtn").click{
			location.reload();
		}
	})
	function validation() {
		if (!$("#id").val() || !$("#name").val()) {
			alert("필수 입력 사항을 입력하세요.");
			return false;
		} else {
			return true;
		}
	}
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
		<c:url value="/findpass" var="findpass"></c:url>
		<form name="findform" action="${findpass }" method="post">
			<div class="w3-container w3-card-4">
				<div class="w3-center w3-large w3-margin-top">
					<h3>비밀번호 찾기</h3>
				</div>
				<div>
					<p>
						<label>ID</label> <input class="w3-input" placeholder="아이디를 입력해주세요" type="text" id="id"
							name="id" required>
					</p>
					<p>
						<label>이름</label> <input class="w3-input" placeholder="이름을 입력해주세요" type="text" id="name"
							name="name" required>
					</p>
					<p class="w3-center">
						<input type="submit" id=findBtn value="비밀번호 찾기"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round"
						>
						<button type="button" onclick="history.go(-1)" id="backbtn"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round"
						>취소</button>
					</p>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
<jsp:include page="/WEB-INF/view/include/footer.jsp"/>