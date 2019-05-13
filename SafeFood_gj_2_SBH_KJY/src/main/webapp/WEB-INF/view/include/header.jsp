<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>SafeFood</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    
	<c:url value="/static/css/main.css" var="mainCss"/>
    <c:url value="/static/css/jquery.bxslider.css" var="bxsliderCss"/>
    <link rel="stylesheet" href="${bxsliderCss }">
    <link rel="stylesheet" href="${mainCss }"/>
    <c:url value="/static/js/jquery.bxslider.js" var="bxsliderJs"/>
    <script src="${bxsliderJs }"></script>
    <c:url value="/static/js/main.js" var="mainJs"/>
    <script src="${mainJs }"></script>
    <script>
		let alarm="${alarm }";
		if(alarm) {
			alert(alarm);
		}
		$(function(){
			layerCenter();
		});
	</script>
</head>

<body>
	<header>
		<div class="layerPopUp">
			<div class="layerPopUpContent">
				texttexttexttexttexttexttexttext
			</div>
			<button onClick="layerAlertClose()" class="layerPopUpButton">확인</button>
		</div>
        <div class="headerTop">
            <div class="container">
                <nav id="infoLogin">
	               	<c:if test="${!empty userInfo}">
	               	<ul>
	               		<c:url value="/logout" var="logout"></c:url>
                        <li><a href="${logout }">LOGOUT</a></li>
                     	<c:url value="/userInfo" var="userInfo"/>
                     	<li><a href="${userInfo}">MYPAGE</a></li>
                    </ul>
                    </c:if>
                    <c:if test="${empty userInfo}">
                   	<ul>
                   		<c:url value="/login" var="login"/>
                   		<c:url value="/joinus" var="joinus"/>
                        <li><a href="${login}">LOGIN</a></li>
                        <li><a href="${joinus}">회원가입</a></li>
                    </ul>
                	</c:if>
                </nav>
            </div>
        </div>
        <div>
            <div class="container">
                <div class="mainLogo col-lg-2">
                	<c:url value="/index.jsp" var="mainPage"/>
                	<c:url value="/static/images/header-logo.jpg" var="logo"/>
                    <a href="${mainPage }"><img src="${logo }" alt="" /></a>
                </div>
                <nav class="mainNav col-lg-10">
                    <ul>
                    	<c:url value="/notice" var="notice"/> 
                        <li class="col-lg-2"><a href="${notice }">공지 사항</a></li>
	                    <c:url value="/foodList?select=name&input=" var="foodList"/> 
                        <li class="col-lg-2"><a href="${foodList }">상품 정보</a></li>
                        <li class="col-lg-3"><a href="#">베스트 섭취 정보</a></li>
                       	<c:if test="${!empty userInfo}">
                       	<c:url value="/foodIntake" var="foodIntake"/> 
                        <li class="col-lg-2"><a href="${foodIntake }">내 섭취 정보</a></li>
                        <li class="col-lg-2"><a href="#">예상 섭취 정보</a></li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

