<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
		<div>
			<div class="col-md-6 col-md-offset-3">
				<h3>LOGIN</h3>
			</div>
		</div>
		<c:url value="/adminlog" var="adminlog"></c:url>
		<form accept-charset="UTF-8" role="form" method="post" action="${adminlog }"
			class="col-md-6 col-md-offset-3" id="loginform">
			<div class="form-group">
				<label for="username-email">E-mail</label> <input name="user_id"
					value='' id="username-email" placeholder="E-mail" type="text"
					class="form-control" />
			</div>
			<div class="form-group">
				<label for="password">비밀번호</label> <input name="password"
					id="password" value='' placeholder="Password" type="password"
					class="form-control" />
			</div>
			<div class="form-group">
				<input type="submit"
					class="btn btn-default btn-login-submit btn-block m-t-md"
					value="로그인" />
			</div>
			<c:url value="/findid" var="findid"></c:url>
			<c:url value="/findpassword" var="findpass"></c:url>
			<span class='text-center'><a href="${findid }" class="text-sm">아이디
					찾기</a></span> <span class='text-center'><a href="${findpass }" class="text-sm">비밀번호
					찾기</a></span>
		</form>
	</div>
</body>

<script>
	function validation() {
		if (!$("#username-email").val() || !$("#password").val()) {
			alert("필수 입력 사항을 입력하세요.");
			return false;
		} else {
			return true;
		}
	}
	$("#loginform").on("submit", function(e) {
		if (!validation()) {
			e.preventDefault();
		}
	});
	let loginfail = request.getAttribute("loginfail");
	if(loginfail){
		alert('로그인에 실패하였습니다. 입력값을 확인 바랍니다.');
	}
</script>
</html>