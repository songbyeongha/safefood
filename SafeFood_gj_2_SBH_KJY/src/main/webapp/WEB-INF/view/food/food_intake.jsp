<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
    <jsp:include page="/WEB-INF/view/include/header.jsp" />
    <style>
	@media (min-width: 1200px){
		.col-lg-6{
			width: 49%;
			margin-right: 1%;
			padding: 0px;
		}
	}
	.col-lg-6{
		padding: 0px;
	}
	.productImg{
		width: 127%;
	}
	.productContent>div{
	    font-size: 13px;
	}
	.productContent h2{
	 	font-size: 25px;
	}
	.productContent>div{
	    -webkit-line-clamp: 5;
	    max-height: 105px;
	}
	</style>
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
			url : "./main.do?action=search",
			data : {
				"select" : '<%=request.getParameter("select")%>',
				"input" : '<%=request.getParameter("input")%>'
			},
			success : function(data) {
				let food = JSON.parse(data);
				$(food).each(function(idx, item) {
					let code = item.code;
					let name = item.name;
					let maker = item.maker;
					let material = item.material;
					let image = item.img;
					let str = "";
					
					str += "<a href='<%=request.getContextPath()%>/food/food_detail.jsp?code="+encodeURI(code)+"'><div class='col-lg-6'>";
					str += "<div class='productImg' data-code='"+code+"'><img src='<%=request.getContextPath()%>/"+image+"'/>";
					str += "<div>"
							+ maker
							+ "</div>";
					str += "</div>";
					str += "<div class='productContent'>";
					str += "<h2>"
							+ name
							+ "</h2>";
					str += "<div>"
							+ material
							+ "</div><div class='contentButton'><button type='button' class='btn btn-info'>추가</button><button type='button' class='btn btn-info'>찜</button></div>";
					str += "</div>";
					str += "</div></a>";
					$("#productPlace").append(str);
				});
			},
			error : function() {
				alert("error")
			}
		});
		$.urlParam = function(name){
		    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(decodeURIComponent(window.location.href));
		    if (results==null){
		       return null;
		    }
		    else{
		       return results[1] || 0;
		    }
		}
		$("#searchButton").on("click",function(){
			location.href = "./food_list.jsp?select="+encodeURI($("#searchSelect").val())+"&input="+encodeURI($("#searchInput").val());
		});
		$("#searchSelect").val($.urlParam('select'));
		$("#searchInput").val(($.urlParam('input')!=0)?$.urlParam('input'):"");
		$(".search_button").keypress(function (e) {
		   if (e.which == 13){
			   $("#searchButton").trigger("click");
		   }
		});
	});
	
</script>

	<div class="search_place">
		<div class="slider">
			<div>
				<img src="<%=request.getContextPath()%>/images/m_img01.jpg" alt="" />
			</div>
			<div>
				<img src="<%=request.getContextPath()%>/images/m_img02.jpg" alt="" />
			</div>
			<div>
                <img src="<%=request.getContextPath()%>/images/m_img03.jpg" alt="" />
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
	<div id="productPlace" class="container"></div>
	<jsp:include page="/WEB-INF/view/include/footer.jsp"/>