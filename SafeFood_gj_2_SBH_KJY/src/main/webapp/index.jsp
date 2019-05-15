<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:include page="/WEB-INF/view/include/header.jsp" />

<style>
	h1{
	    background: #213242;
	    padding: 40px;
	    margin: 0;
	    color: #fff;
	    text-shadow: 1px 1px 3px #000000;
	}
	.contentButton{
	    bottom: 15px;
	}/* 
	.productWrapper .bhProductContent{
		cursor: url(static/images/basket.png) 0 0,auto;
	} */
</style>

    <div class="search_place">
        <div class="slider">
        	<c:url value="/static/images/m_img01.jpg" var="img01"/>
        	<c:url value="/static/images/m_img02.jpg" var="img02"/>
        	<c:url value="/static/images/m_img03.jpg" var="img03"/>
            <div>
                <img src="${img01 }" alt="" />
            </div>
            <div>
                <img src="${img02 }" alt="" />
            </div>
            <div>
                <img src="${img03 }" alt="" />
            </div>
        </div>
        <div class="search_back">
            <div class="container search">
                <div class="search_menu">
                    <div>
                        <h6>검색 조건</h6>
                        <select class="search_button" id="searchSelect">
                            <option value="name">상품명</option>
                            <option value="maker">제조사</option>
                            <option value="material">재료</option>
                        </select>
                    </div>
                    <div>
                        <h6>검색 단어</h6>
                        <input class="search_button" type="text" name="val" id="searchInput">
                        <a href="#" class="searchButton btn btn-primary btn-lg active" role="button" id="searchButton">검색</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="search"></div>
    <h1>베스트 식품</h1>
    <div id="productPlace" class="productWrapper">
    
    </div>
   	<c:url value="/static/images/basket.png" var="basket"/>
    <c:if test="${!empty userInfo}">
    	<img class='basket' src="${basket }"  id="${userInfo.id}" ondragenter="return false;" ondragover="return false;" ondrop="onDrop(this,event)" onclick="layerAlertOpen('상품을 드래그해서 넣어주세요')"/>
    </c:if>
    <script>
	$(document).ready(function() {    
		$('.slider').bxSlider({
			auto : true,
			speed : 500,
			pager : false,
			mode:'fade',
			infiniteLoop:true,
			controls: false,
		});
		
		$.ajax({
			type : "get",
			url : "<c:url value='/bestSearch' />",
			success : function(data) {
				let food = JSON.parse(data);
				$(food).each(function(idx, item) {
					let code = item.code;
					let name = item.name;
					let maker = item.maker;
					let material = item.material;
					let image = item.img;
					let str = "";
					if (idx < 12) {
						str += "<div class='bhProductContent'>";
						str += "<div class='ProductImgCover'></div>"
						//"+ maker + "
						str += "<div class='bhProductText'><h2>"+ name + "</h2>"+ material;
						str += "</div>";
						str += "<img class='bhProductImg' src='static/"+image+"' id='"+code+"' draggable='true' ondragstart='onDragStart(this,event)'/>";
						//<div class='contentButton'><button type='button' class='btn btn-info intakeButton' code-data="+code+">추가</button><button type='button' class='btn btn-info'>찜</button></div>
						str += "</div>";
						str += "</div>";
						$("#productPlace").append(str);
					}
					
				});
			},
			error : function() {
				console.log("error")
			}
		});
		$("#searchButton").on("click",function(){
			location.href =  "./foodList?select="+$("#searchSelect").val()+"&input="+$("#searchInput").val();
		});
		$(".search_button").keypress(function (e) {
		   if (e.which == 13){
			   $("#searchButton").trigger("click");
		   }
		});
		
	});

	</script>
    <jsp:include page="/WEB-INF/view/include/footer.jsp"/>
