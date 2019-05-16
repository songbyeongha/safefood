<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/include/header.jsp" />
<script>
$(function(){
    $('#join-submit').click(function(e){
    	if (!validation()) {
			e.preventDefault();
		}
    });
    function validation() {
        if($("#inputPassword").val() ==''){
            alert('비밀번호를 입력하세요');
            $("#inputPassword").focus();
            return false;
        }
        if($("#inputPasswordCheck").val() ==''){
            alert('비밀번호를 다시 한번 더 입력하세요');
            $("#inputPasswordCheck").focus();
            return false;
        }
        if($("#inputPassword").val()!== $("#inputPasswordCheck").val()){
            alert('비밀번호를 둘다 동일하게 입력하세요');
            return false;
        }
        return true;
	}

});	
</script>
<style>
	.checkbox-inline+.checkbox-inline, .radio-inline+.radio-inline{
	    margin-left: 0px;
	}
</style>

	<script type="text/javascript">
 	$(function(){
 		let allergyArray = [
 			<c:forEach var="item" items="${allergy}">
	 		   "${item.name}",
	 		</c:forEach>
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
            <h3>회원수정</h3>
            </div>
        </div>
        <div class="col-sm-6 col-md-offset-3">
        	<c:url value="/usermodify" var="usermodify"></c:url>
            <form action="${usermodify }" method="post">
            	<input type = "hidden" name ="hiddenId" value="${userInfo.id }"> 
                <div class="form-group">
                    <label for="InputEmail">이메일 주소(아이디)</label>
                    <input type="text" class="form-control" id="InputEmail" placeholder="이메일 주소를 입력해주세요" value="${userInfo.id }" readonly="readonly" name="id">
                </div>
                <div class="form-group">
                    <label for="inputPassword">비밀번호</label>
                    <input type="password" class="form-control" id="inputPassword" placeholder="영문 숫자 포함 6자리 이상" value="" name="password">
                </div>
                <div class="form-group">
                    <label for="inputPasswordCheck">비밀번호 확인</label>
                    <input type="password" class="form-control" id="inputPasswordCheck" placeholder="비밀번호 확인">
                </div>
                <div class="form-group">
                    <label for="inputName">이름</label>
                    <input type="text" class="form-control" id="inputName" placeholder="" value="" name="name">
                </div>
                <div class="form-group">
                    <label for="inputAddress">주소</label>
                    <input type="text" class="form-control" id="inputAddress" placeholder="" value="" name="address">
                </div>
                <div class="form-group">
                    <label for="inputPhone">전화번호</label>
                    <input type="tel" class="form-control" id="inputPhone" placeholder="" value="" name="phone">
                </div>
                <div class="form-group">
                    <label for="inputPhone">나이</label>
                    <input type="tel" class="form-control" id="inputPhone" placeholder="ex) 26" name="age">
                </div>
                <div class="form-group">
                    <label for="inputPhone">체중</label>
                    <input type="tel" class="form-control" id="inputPhone" placeholder="ex) 78" name="weight">
                </div>
                <div class="form-group">
                    <label for="inputPhone">키</label>
                    <input type="tel" class="form-control" id="inputPhone" placeholder="ex) 192" name="kidney">
                </div>
                <div class="form-group">
                    <label for="inputPhone">성별</label>
                    <fieldset>
                    	<label class="checkbox-inline "><input type="checkbox" id="genbox1" value="남성" name="gender">남성</label>
                    	<label class="checkbox-inline "><input type="checkbox" id="genbox2" value="여성" name="gender">여성</label>
                    </fieldset>
                </div>
                <div class="form-group">
                    <label for="inputPhone">활동레벨</label>
                    <input type="tel" class="form-control" id="inputPhone" placeholder="ex) 40" name="level">
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
                    <button type="submit" id="join-submit" class="btn btn-primary">
                        회원수정<i class="fa fa-check spaceLeft"></i>
                    </button>
                </div>
            </form>
        </div>

    </article>
	<jsp:include page="/WEB-INF/view/include/footer.jsp"/>