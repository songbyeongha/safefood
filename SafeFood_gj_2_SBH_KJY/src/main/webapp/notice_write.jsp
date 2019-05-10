<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/view/include/header.jsp" />
<hr>
	제목<input type="text" placeholder="내용을 입력해주세요">
<hr>
	내용<input type="text" placeholder="내용을 입력해주세요">
<hr>
<div>
	<form action="" method="post">
		<input type="submit" value="제출">
		<input type="reset" value="취소">
	</form>
</div>

<jsp:include page="/WEB-INF/view/include/footer.jsp" />