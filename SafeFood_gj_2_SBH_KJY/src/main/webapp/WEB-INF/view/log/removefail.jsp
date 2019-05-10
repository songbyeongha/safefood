<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/include/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SafeFood</title>
</head>
<style>
	article{
		width:960px;
		margin:0 auto;
	}
	article>h1{
		text-align:center;
	}
	article>#button_section{
		text-align:center;
	}
</style>
<body>
<article>
	<h1>삭제에 실패 하였습니다. 재확인 바랍니다.</h1>
	<div id="button_section">
		<input type="button" value="이전 화면으로" onClick="location.href='userremove.jsp'">
	</div>
</article>
<jsp:include page="/WEB-INF/view/include/footer.jsp"/>

</body>
</html>