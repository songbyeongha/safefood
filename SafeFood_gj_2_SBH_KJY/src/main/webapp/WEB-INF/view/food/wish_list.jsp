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
	h1{
	    text-align: center;
	    margin-bottom: 40px;
	    color: #265a88;
	    font-weight: bold;
	    text-shadow: 1px 1px 20px #40b5d7;
	}
	</style>
<script>
	$(document).ready(function() {
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
			url : "<c:url value='/wish' />",
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
					str += "<div class='contentButton'><button type='button' class='btn btn-info intakeButton' code-data="+code+">추가</button><button type='button' class='btn btn-info wishDelButton' code-data="+code+">삭제</button></div>";
					$("#productPlace").append(str);
				});
				$(".intakeButton").each(function(){
					$(this).click(function(e){
						e.preventDefault();
						$.ajax({
							type : "post",
							url : "<c:url value='/intakeInsert' />",
							data : {
								id :"${userInfo.id}",
								code : $(this).attr("code-data")
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
				$(".wishDelButton").each(function(){
					$(this).click(function(e){
						e.preventDefault();
						$.ajax({
							type : "POST",
							url : "<c:url value='/wishDel' />",
							data : {
								code : $(this).attr("code-data"),
								id : "${userInfo.id}"
							},
							success : function(data) {
								layerAlertOpen(data);
								$(".layerPopUpButton").click(function(){
									location.reload();
								});
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
	<h1>찜 목록</h1>

<div id="productPlace" class="container"></div>
<div id="chart_div" style="width:900px; height: 500px;" class="container"></div>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawVisualization);
	
		function drawVisualization() { 
			var data = google.visualization.arrayToDataTable([
					['영양정보', '칼로리', '탄수화물', '단백질', '지방', '당류', '나트륨', '콜레스테롤', '포화 지방산', '트랜스지방'],
					['영양정보',  165,     938,     522,    98,   450,   614.6,    13.8,     4,        13],
				]);
			var options = {
					title : '찜목록 섭취그래프',
					vAxis: {title: '수치'},
					hAxis: {title: '종류'}, 
					seriesType: 'bars',
					series: {5: {type: 'line'}}
				};
			
			var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
			chart.draw(data, options);
		}
	</script>
	<jsp:include page="/WEB-INF/view/include/footer.jsp"/>