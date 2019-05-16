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
<div id="chart_div" class="container"></div>
<div id="oneDayhalf" class="container">
	<span class="oneDayTitle">하루 섭취량 50% 넘은 영양분 </span>
	<div class="oneDayContent">
	</div>
</div>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		let arrayDate = [
			['영양정보', '칼로리', '탄수화물', '단백질', '지방', '당류', '나트륨', '콜레스테롤', '포화 지방산', '트랜스지방']
			];
		let intakeDate="";
		let calory=0,carbo=0,protein=0,fat=0,sugar=0,natrium=0,chole=0,fattyacid=0,transfat=0;
		let caloryB=calCalory("${userInfo.gender}",${userInfo.weight},${userInfo.kidney},${userInfo.age},${userInfo.level});
		let carboB=calCarbo("${userInfo.gender}", ${userInfo.age});
		let proteinB=calProtein("${userInfo.gender}", ${userInfo.age});
		let fatB=calFat("${userInfo.gender}", ${userInfo.age});
		let sugarB=calSugar(caloryB);
		let natriumB=1500;
		let choleB=calChole(${userInfo.age});
		let fattyacidB=calFattyacid(${userInfo.age},caloryB);
		let transfatB=calTransfat(caloryB);
		let d = new Date();
		let nowDate = d.getFullYear()+"-"+(d.getMonth() + 1)+"-"+d.getDate();
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawVisualization);
		function drawVisualization() {
			var data = google.visualization.arrayToDataTable(arrayDate);
			var options = {
					title : '일일 섭취량 예상 그래프',
					vAxis: {title: '일일 섭취 권장량(100%)'},
					hAxis: {title: '종류'}, 
					seriesType: 'bars'
				};
			
			var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
			chart.draw(data, options);
		}
		
		$( document ).ready(function() {
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
						str += "<div class='contentButton'><button type='button' class='btn btn-info intakeButton' code-data="+code+">섭취</button><button type='button' class='btn btn-info wishDelButton' code-data="+code+">삭제</button></div>";
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
		    $.ajax({
		        url: "<c:url value='/intake' />",
		        type: 'GET',
		        data: {
		        	id : "${userInfo.id}",
		        	startDate:nowDate,
		        	endDate:nowDate,
		        	page:1
		        }, // 전송할 데이터
				success: function (result) {
					//console.log(result.totalInfo);
					for(let i = 0;i<result.totalInfo.length;i++){
						calory+=result.totalInfo[i].calory;
			  			carbo+=result.totalInfo[i].carbo;
			  			protein+=result.totalInfo[i].protein;
			  			fat+=result.totalInfo[i].fat;
			  			sugar+=result.totalInfo[i].sugar;
			  			natrium+=result.totalInfo[i].natrium;
			  			chole+=result.totalInfo[i].chole;
			  			fattyacid+=result.totalInfo[i].fattyacid;
			  			transfat+=result.totalInfo[i].transfat;
					}
					temp = ['섭취전',
		  				percent(calory,caloryB),
		  				percent(carbo,carboB),
		  				percent(protein,proteinB),
		  				percent(fat,fatB),
		  				percent(sugar,sugarB),
	  					percent(natrium,natriumB),
		  					percent(chole,choleB),
		  				percent(fattyacid,fattyacidB),
		  				percent(transfat,transfatB)
						];
			  	  	arrayDate.push(temp);
			  	  	$.ajax({
						type : "get",
						url : "<c:url value='/wish2' />",
						data : {
							"id" : "${userInfo.id}"
						},
						success : function(result) {
							console.log(result);
							for(let i = 0;i<result.data.length;i++){
								calory+=result.data[i].calory;
					  			carbo+=result.data[i].carbo;
					  			protein+=result.data[i].protein;
					  			fat+=result.data[i].fat;
					  			sugar+=result.data[i].sugar;
					  			natrium+=result.data[i].natrium;
					  			chole+=result.data[i].chole;
					  			fattyacid+=result.data[i].fattyacid;
					  			transfat+=result.data[i].transfat;
							}
							temp = ['섭취후',
				  				percent(calory,caloryB),
				  				percent(carbo,carboB),
				  				percent(protein,proteinB),
				  				percent(fat,fatB),
				  				percent(sugar,sugarB),
			  					percent(natrium,natriumB),
				  					percent(chole,choleB),
				  				percent(fattyacid,fattyacidB),
				  				percent(transfat,transfatB)
								];
					  	  	arrayDate.push(temp);
					  	  	drawVisualization();
						},
						error : function() {
							layerAlertOpen("error")
						}
					});
			  	    let ostr = "";
						for(let i=1;i<10;i++){
							if(arrayDate[1][i]>50){
								console.log(arrayDate[0][i]);
								ostr += "<span>"+arrayDate[0][i]+"</span>";
							}
						}
					$(".oneDayContent").html(ostr);
					//$(".oneDayContent").html();
			  	  	console.log(arrayDate[1][1]);
				}, // 요청 완료 시
		        error: function(resTxt) {} // 요청 실패.
		    });
		    
		});
	</script>
	
	<jsp:include page="/WEB-INF/view/include/footer.jsp"/>