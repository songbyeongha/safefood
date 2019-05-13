<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/include/header.jsp" />
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

	<article class="container">
        <div>
            <div class="col-md-6 col-md-offset-3">
            <h3>회원정보</h3>
            </div>
        </div>
        <div class="col-sm-6 col-md-offset-3">
            <c:url value="/updateUser" var="updateUser"></c:url>
            <form action="${updateUser }" method="post" id="modify">
            	<input type="hidden" name="action" value="modify">
                <div class="form-group">
                    <label for="InputEmail">이메일 주소(아이디)</label>
                    <input type="text" class="form-control" id="inputEmail" placeholder="이메일 주소를 입력해주세요" value="${userInfo.id }" name="id">
                </div>
                 <div class="form-group">
                    <label for="InputEmail">비밀번호</label>
                    <input type="password" class="form-control" id="inputpassword" name="password" placeholder="비밀번호를 입력해주세요" value="${userInfo.password }" name="password" required="required">
                </div>
                <div class="form-group">
                    <label for="inputName">이름</label>
                    <input type="name" class="form-control" id="inputName" name="name" placeholder="이름을 입력하세요" value="${userInfo.name }" name="name" required="required">
                </div>
                <div class="form-group">
                    <label for="inputAddress">주소</label>
                    <input type="text" class="form-control" id="inputAddress" name="address" placeholder="주소를 입력하세요" value="${userInfo.address }" required="required">
                </div>
                <div class="form-group">
                    <label for="inputPhone">전화번호</label>
                    <input type="text" class="form-control" id="inputPhone" placeholder="010-xxxx-xxxx" value="${userInfo.phone }" name="phone" required="required">
                </div>
                
				 <div class="form-group">
                    <fieldset>
                    	<%
							List<String> allergy = (List<String>) session.getAttribute("allergy");
							boolean[] booAllergy = new boolean[14];
							String[] str = {"대두","땅콩","우유","게","새우","참치","연어","쑥","소고기","닭고기",
											"돼지고기","복숭아","민들레","계란흰자"};
							if(allergy!=null){
								for(int i=0;i<allergy.size();i++){
									for(int j=0;j<14;j++){
										if(allergy.get(i).equals(str[j])){
											booAllergy[j]=true;
										}
									}
								}
							}
						%>
                    	<label for="inputAllergy">알레르기</label><br>
                    	<label class="checkbox-inline"><input type="checkbox"  value="대두" name="allergy" <%if(booAllergy[0]){%>checked<%}%>>대두</label>
                    	<label class="checkbox-inline"><input type="checkbox" value="땅콩" name="allergy" <%if(booAllergy[1]){%>checked<%}%>>땅콩</label>
                    	<label class="checkbox-inline"><input type="checkbox" value="우유" name="allergy"<%if(booAllergy[2]){%>checked<%}%>>우유</label>
                    	<label class="checkbox-inline"><input type="checkbox" value="게" name="allergy" <%if(booAllergy[3]){%>checked<%}%>>게</label>
                    	<label class="checkbox-inline"><input type="checkbox" value="새우" name="allergy" <%if(booAllergy[4]){%>checked<%}%>>새우</label>
                    	<label class="checkbox-inline"><input type="checkbox"  value="참치" name="allergy" <%if(booAllergy[5]){%>checked<%}%>>참치</label>
                    	<label class="checkbox-inline"><input type="checkbox"  value="연어" name="allergy" <%if(booAllergy[6]){%>checked<%}%>>연어</label>
                    	<label class="checkbox-inline"><input type="checkbox" value="쑥" name="allergy" <%if(booAllergy[7]){%>checked<%}%>>쑥</label>
                    	<label class="checkbox-inline"><input type="checkbox"  value="소고기" name="allergy" <%if(booAllergy[8]){%>checked<%}%>>소고기</label>
                    	<label class="checkbox-inline"><input type="checkbox" value="닭고기" name="allergy" <%if(booAllergy[9]){%>checked<%}%>>닭고기</label>
                    	<label class="checkbox-inline"><input type="checkbox" value="돼지고기" name="allergy" <%if(booAllergy[10]){%>checked<%}%>>돼지고기</label>
                    	<label class="checkbox-inline"><input type="checkbox" value="복숭아" name="allergy" <%if(booAllergy[11]){%>checked<%}%>>복숭아</label>
                    	<label class="checkbox-inline"><input type="checkbox" value="민들레" name="allergy" <%if(booAllergy[12]){%>checked<%}%>>민들레</label>
                    	<label class="checkbox-inline"><input type="checkbox" value="계란흰자" name="allergy" <%if(booAllergy[13]){%>checked<%}%>>계란흰자</label>
                    </fieldset>
                </div> 
                <div class="form-group text-center">
	                <span>
	                	<c:url value="/userremove" var="userremove"></c:url>
	                    <a href="${userremove }" class="btn btn-primary">회원탈퇴</a>
	                </span>
	                <span>
	                	<input type="submit" class="btn btn-primary" value="정보 수정">
	                </span>
                </div>
            </form>
        </div>

    </article>
	<jsp:include page="/WEB-INF/view/include/footer.jsp"/>