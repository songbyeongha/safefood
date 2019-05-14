<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/include/header.jsp" />
<script>
	$(document).ready(function() {
		$('.layerPopUpButton').click(function(){
			window.location.reload();
		});
		let id = "";
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
			url : "<c:url value='/intake' />",
			data : {
				"id" : "${userInfo.id}"
			},
			success : function(data) {
				let food = JSON.parse(data);
				$(food).each(function(idx, item) {
					let code = item.code;
					let name = item.name;
					let maker = item.maker;
					let material = item.material;
					let image = item.img;
					let intakeDate = item.intakeDate;
					let str = "";
					
					str += "<div class='col-lg-6'><a href='<c:url value='/foodDetail' />?code="+encodeURI(code)+"'><div>";
					str += "<div class='productImg' data-code='"+code+"'><img src='static/"+image+"'/>";
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
							+ "</div>";
					str += "</div></div></a>";
					str += "<div class='contentButton'><button type='button' class='btn btn-info intakeDelButton' code-data="+code+" date-data='"+intakeDate+"'>삭제</button></div>";
					$("#productPlace").append(str);
				});
				$(".intakeDelButton").each(function(){
					$(this).click(function(e){
						e.preventDefault();
						$.ajax({
							type : "POST",
							url : "<c:url value='/intakeDel' />",
							data : {
								code : $(this).attr("code-data"),
								id : "${userInfo.id}",
								intakeDate : $(this).attr("date-data")
							},
							success : function(data) {
								layerAlertOpen(data);
								
							},
							error : function() {
								console.log("error")
							}
						});
					});
				});
			},
			error : function() {
				layerAlertOpen("error")
			}
		});

	});
	
</script>
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
</div>
<h1>내 섭취정보</h1>
<div id="productPlace" class="container">
	
</div>
<jsp:include page="/WEB-INF/view/include/footer.jsp"/>