<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/include/header.jsp" />
<script>
$(function(){
   $(".form-group input").attr("disabled","disabled");
});	
</script>
<style>
	.checkbox-inline+.checkbox-inline, .radio-inline+.radio-inline{
	    margin-left: 0px;
	}
	body .form-group input {
	    border: 0;
    	box-shadow: 0 0 0 #fff;
    	background: #fff !important;
    	cursor: auto !important;
	}
</style>

	<script type="text/javascript">
	$(function(){
		let allergyArray = [
			
		];
		console.log(allergyArray);
		$("input[name=allergy]").each(function(){
			for(let i=0;i<allergyArray.length;i++){
				if(allergyArray[i]==$(this).val()){
					console.log($(this).val());
					$(this).attr("checked","checked");
					break;
				}
			}
		});
		
	
	});
	</script>
	<article class="container">
        <div>
            <div class="col-md-6 col-md-offset-3">
            <h3>회원정보</h3>
            </div>
        </div>
        <div class="col-sm-6 col-md-offset-3">
            <c:url value="/userInfo" var="userInfosend"></c:url>
            <form action="${userInfosend }" method="POST">
                <div class="form-group">
                    <label for="InputEmail">이메일 주소(아이디)</label>
                    
                    <input type="text" class="form-control" id="InputEmail" placeholder="이메일 주소를 입력해주세요" value="${userInfo.id }" name="id">
                </div>
                <div class="form-group">
                    <label for="inputName">이름</label>
                    <input type="text" class="form-control" id="inputName" placeholder="User Name" value="${userInfo.name }" name="name">
                </div>
                <div class="form-group">
                    <label for="inputAddress">주소</label>
                    <input type="text" class="form-control" id="inputAddress" placeholder="address" value="${userInfo.address }" name="address">
                </div>
                <div class="form-group">
                    <label for="inputPhone">전화번호</label>
                    <input type="tel" class="form-control" id="inputPhone" placeholder="010-xxxx-xxxx" value="${userInfo.phone }" name="phone">
                </div>
                
				<div class="form-group">
                    <label for="inputAllergy">알레르기</label>
                    <fieldset>
                    	<label class="checkbox-inline"><input type="checkbox" id="Checkbox1" value="대두" name="allergy">대두</label>
                    	<label class="checkbox-inline"><input type="checkbox" id="Checkbox2" value="땅콩" name="allergy">땅콩</label>
                    	<label class="checkbox-inline"><input type="checkbox" id="Checkbox3" value="우유" name="allergy">우유</label>
                    	<label class="checkbox-inline"><input type="checkbox" id="Checkbox4" value="게" name="allergy">게</label>
                    	<label class="checkbox-inline"><input type="checkbox" id="Checkbox5" value="새우" name="allergy">새우</label>
                    	<label class="checkbox-inline"><input type="checkbox" id="Checkbox6" value="참치" name="allergy">참치</label>
                    	<label class="checkbox-inline"><input type="checkbox" id="Checkbox7" value="연어" name="allergy">연어</label>
                    	<label class="checkbox-inline"><input type="checkbox" id="Checkbox8" value="쑥" name="allergy">쑥</label>
                    	<label class="checkbox-inline"><input type="checkbox" id="Checkbox9" value="소고기" name="allergy">소고기</label>
                    	<label class="checkbox-inline"><input type="checkbox" id="Checkbox10" value="닭고기" name="allergy">닭고기</label>
                    	<label class="checkbox-inline"><input type="checkbox" id="Checkbox11" value="돼지고기" name="allergy">돼지고기</label>
                    	<label class="checkbox-inline"><input type="checkbox" id="Checkbox12" value="복숭아" name="allergy">복숭아</label>
                    	<label class="checkbox-inline"><input type="checkbox" id="Checkbox13" value="민들레" name="allergy">민들레</label>
                    	<label class="checkbox-inline"><input type="checkbox" id="Checkbox14" value="계란흰자" name="allergy">계란흰자</label>
                    </fieldset>
                </div>
                <div class="form-group text-center">
	                <span>
	                	<c:url value="/userremove" var="userremove"></c:url>
	                    <a href="${userremove }" class="btn btn-primary">회원탈퇴</a>
	                </span>
	                <span>
	                	<c:url value="/usermodify" var="usermodify"></c:url>
	                	<a href="${usermodify }" class="btn btn-primary">회원수정</a>
	                </span>
                </div>
            </form>
        </div>

    </article>
	<jsp:include page="/WEB-INF/view/include/footer.jsp"/>