<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/include/header.jsp" />
<style>
	.checkbox-inline+.checkbox-inline, .radio-inline+.radio-inline{
	    margin-left: 0px;
	}
	body .form-group input:disabled {
	    border: 0;
    	box-shadow: 0 0 0 #fff;
    	background: #fff !important;
    	cursor: auto !important;
	}
</style>

	<article class="container">
        <div>
            <div class="col-md-6 col-md-offset-3">
            <h3>회원탈퇴</h3>
            </div>
        </div>
        <div class="col-sm-6 col-md-offset-3">
        	<c:url value="/userremove" var="userremove"></c:url>
            <form action="userremove" method="POST">
            	<input type="hidden" value="" name="hiddenId">
                <div class="form-group">
                  <label for="InputEmail">이메일 주소(아이디)</label>
                    <input type="email" class="form-control" id="InputEmail" placeholder="이메일 주소를 입력해주세요" value="${userInfo.id }" readonly="readonly" name = "id">
                </div>
                <div class="form-group">
                    <label for="inputPassword">비밀번호</label>
                    <input type="password" class="form-control" id="inputPassword" placeholder="영문 숫자 포함 4자리 이상" name="password">
                </div>
                <div class="form-group">
                    <label for="inputName">이름</label>
                    <input type="text" class="form-control" id="inputName" placeholder="User Name" value="${userInfo.name }" readonly="readonly"">
                </div>
               

                <div class="form-group text-center">
                    <button type="submit" id="join-submit" class="btn btn-primary">
                        회원탈퇴<i class="fa fa-check spaceLeft"></i>
                    </button>
                </div>
            </form>
        </div>

    </article>
 
	<jsp:include page="/WEB-INF/view/include/footer.jsp"/>