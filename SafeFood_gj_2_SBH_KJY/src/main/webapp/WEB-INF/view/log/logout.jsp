<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/include/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>
<article>
	<h1>로그 아웃 되었습니다.</h1>
	<div id="button_section">
	
		<input type="button" value="메인화면" onClick="location.href='index.jsp'">
	</div>
</article>
<jsp:include page="/WEB-INF/view/include/footer.jsp"/>
</body>
</html>