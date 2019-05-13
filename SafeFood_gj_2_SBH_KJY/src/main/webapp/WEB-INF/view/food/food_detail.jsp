<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/include/header.jsp" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
#allergyText{
    line-height: 35px;
}
.allergyThing{
    margin-right: 5px;
    color: #fff8dc;
    background: #265a88;
    padding: 3px 7px;
    border-radius: 15px;
    font-weight: bold;
    text-shadow: 0px 0px 30px #efd03d;
    box-shadow: 0px 0px 7px #5442b7;
}

/* css추가사항 부분 시작 */
.font_center {
	text-align: center;
}

#icon>img {
	display: block;
	margin-left: auto;
	margin-right: auto;
}

#menu_bar>ul {
	overflow: hidden;
}

#menu_bar>ul>li {
	float: left;
}

#menu_bar>ul>li>a {
	display: block;
	padding: 2px 10px;
	background-color: aqua;
	color: white;
}

#menu_bar>ul>li>a:hover {
	background: blue;
}

#menu_bar>ul>li:first-child>a {
	border-radius: 10px 0 0 10px;
}

#menu_bar>ul>li:last-child>a {
	border-radius: 0 10px 10px 0;
}

#nav {
	margin: 20px;
}

#calorie_detail label {
	margin-left: 30px;
	margin-right: 30px;
}
/* css 추가부분 끝 */
#productImg img{
	width: 80%;
}
#calorie_detail table{
    margin: 20px auto 0;
}
.frame {
	border-radius: 4px;
	background: #265a88;
	padding: 20px;
	min-width: 450px;
}

body .frame .content h1 {
	margin: 0 0 10px 0;
	text-align: center;
	color: white;
	font-weight: 100;
	text-transform: uppercase;
}

#svg {
	width: 500px;
	height: 300px;
}

.content {
	text-align: center;
}
#quantity{
	margin-top: 30px;
    text-align: center;
}
#quantity h5{
    font-size: 25px;
}
#quantity input{
	margin-top: 10px;
    width: 70px;
    text-align: center;
    box-shadow: 0px 0px 30px #d83737;
    font-size: 20px;
    border: 0;
    border-radius: 20px;
    text-indent: 18px;
}
#menu_bar{
    text-align: center;
}
#menu_bar button{
    width: 90px;
    margin: 0 5px;
}
#svg text{
	color:#fff;
}
</style>
	<!-- 영이 부분 -->
	<div id="header">
		<h1 class="font_center">제품정보</h1>

	</div>

	<div id="icon">
		<c:url value="/static/images/backpack.png" var="icon"/>
		<img src="${icon }" alt="" width="50" height="50" />
		<!-- 로고 이미지 -->
	</div>

	<div id="info">
		<div class="container">
			<div id="img">
				<img>
				<!-- 제품이미지 들어갈곳 -->

			</div>
			<div id="product_detail">
				<table>
					<colgroup>
						<col width="20%" />
						<col width="20%" />
						<col width="60%" />
					</colgroup>
					<tr>
						<td id="productImg" rowspan="4"></td>
						<td><label>제품명</label></td>
						<td id="productName"></td>
					</tr>
					<tr>
						<td><label>제조사</label></td>
						<td id="productMaker"></td>
					</tr>
					<tr>
						<td><label>원재료</label></td>
						<td id="productMaterial"></td>
					</tr>
					<tr>
						<td><label>알레르기 성분</label></td>
						<td id="allergyText">
							
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="container">

		<div id="quantity">
			<h5>Quantity</h5>
			<input type="number" name="val" id="quantity" value="1">

		</div>
		<div id="nav">
			<nav id="menu_bar">
				<button type='button' class='btn btn-info intakeButton' code-data="${param.code}">추가</button>
				<button type='button' class='btn btn-info'>찜</button>
			</nav>
		</div>
	</div>
	<div id="calorie_title">
		<div class="container">
			<h3>영양정보</h3>
		</div>
	</div>


	<div id="calorie">
			<div id="data">
			<div class="container">
				<div id="graph">
					<!-- 그래프 들어갈 부분 -->
					<div class="frame col-lg-10">
						<div class="content">
							<h1>Nutrition Information</h1>
							<svg id="svg"></svg>
						</div>
					</div>
					<div id="calorie_detail" class="col-lg-2">
						<table>
							<tr>
								<td><label>일일 제공량</label></td>
								<td id="supportpereat">
									<!-- 각 영양소 정보 -->
								</td>
							</tr>
							<tr>
								<td><label>칼로리</label></td>
								<td id="calory">
									<!-- 각 영양소 정보 -->
								</td>
							</tr>
							<tr>
								<td><label>탄수화물</label></td>
								<td id="carbo">
									<!-- 각 영양소 정보 -->
								</td>
							</tr>
							<tr>
								<td><label>단백질</label></td>
								<td id="protein">
									<!-- 각 영양소 정보 -->
								</td>
							</tr>
							<tr>
								<td><label>지방</label></td>
								<td id="fat">
									<!-- 각 영양소 정보 -->
								</td>
							</tr>
							<tr>
								<td><label>당류</label></td>
								<td id="sugar">
									<!-- 각 영양소 정보 -->
								</td>
							</tr>
							<tr>
								<td><label>나트륨</label></td>
								<td id="natrium">
									<!-- 각 영양소 정보 -->
								</td>
							</tr>
							<tr>
								<td><label>콜레스테롤</label></td>
								<td id="chole">
									<!-- 각 영양소 정보 -->
								</td>
							</tr>
							<tr>
								<td><label>포화 지방산</label></td>
								<td id="fattyacid">
									<!-- 각 영양소 정보 -->
								</td>
							</tr>
							<tr>
								<td><label>트랜스지방</label></td>
								<td id="transfat">
									<!-- 각 영양소 정보 -->
								</td>
							</tr>
						</table>
					</div>
				</div>

				
			</div>
		</div>
	</div>


	
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/snap.svg/0.3.0/snap.svg-min.js'></script>
	<script>

		//타겟 영양소를 저장할 변수
		let t_supportpereat = 0;
		let t_calory = 0;
		let t_carbo = 0;
		let t_protein = 0;
		let t_fat = 0;
		let t_sugar = 0;
		let t_natrium = 0;
		let t_chole = 0;
		let t_fattyacid = 0;
		let t_transfat = 0;

		//백분율 저장 변수
		let val_calory = 0;
		let val_carbo = 0;
		let val_protein = 0;
		let val_fat = 0;
		let val_sugar = 0;
		let val_natrium = 0;
		let val_chole = 0;
		let val_fattyacid = 0;
		let val_transfat = 0;

		let t_total = 0; //백분율 계산을 위한 전체데이터 합 변수
		let product_Name = "";
		$.ajax({
			type : "get",
			url : "<c:url value='/detail' />",
			data : {
				"code" : "${param.code}"
			},
			success : function(data) {
				let food = JSON.parse(data);
				console.log(food);
				let code = food.code;
				let name = food.name;
				let maker = food.maker;
				let material = food.material;
				let image = food.img;
				let supportpereat = food.supportpereat; //일일 제공량
				let calory = food.calory; //칼로리
				let carbo = food.carbo; //탄수화물
				let protein = food.protein; //단백질
				let fat = food.fat; //지방
				let sugar = food.sugar; //당류
				let natrium = food.natrium; //나트륨
				let chole = food.chole; //콜레스테롤
				let fattyacid = food.fattyacid; //포화 지방산
				let transfat = food.transfat; //트랜스지방
				
				$("#productImg").html("<img src='static/"+image+"'/>");
				$("#productName").text(name);
				$("#productMaker").text(maker);
				$("#productMaterial").text(material);
			
				t_supportpereat = supportpereat;
				t_supportpereat *= 1;

				t_calory = calory;
				t_calory *= 1;

				t_carbo = carbo;
				t_carbo *= 1;

				t_protein = protein;
				t_protein *= 1;

				t_fat = fat;
				t_fat *= 1;

				t_sugar = sugar;
				t_sugar *= 1;

				t_natrium = natrium;
				t_natrium *= 1;

				t_chole = chole;
				t_chole *= 1;

				t_fattyacid = fattyacid;
				t_fattyacid *= 1;

				t_transfat = transfat;
				t_transfat *= 1;

				//백분율 계산
				t_total += t_calory;
				t_total += t_carbo;
				t_total += t_protein;
				t_total += t_fat;
				t_total += t_sugar;
				t_total += t_natrium;
				t_total += t_chole;
				t_total += t_fattyacid;
				t_total += t_transfat;

				val_calory = (t_calory / t_total) * 100;
				val_carbo = (t_carbo / t_total) * 100;
				val_protein = (t_protein / t_total) * 100;
				val_fat = (t_fat / t_total) * 100;
				val_sugar = (t_sugar / t_total) * 100;
				val_natrium = (t_natrium / t_total) * 100;
				val_chole = (t_chole / t_total) * 100;
				val_fattyacid = (t_fattyacid / t_total) * 100;
				val_transfat = (t_transfat / t_total) * 100;
				
				var foodDatas = [ {
					value : val_calory,
					label : '칼로리',
					color : '#FD4AB4'
				}, {
					value : val_carbo,
					label : '탄수화물',
					color : '#FFE4C4'
				}, {
					value : val_protein,
					label : '단백질',
					color : '#0000FF'
				}, {
					value : val_fat,
					label : '지방',
					color : '#A52A2A'
				}, {
					value : val_sugar,
					label : '당류',
					color : '#D2691E'
				}, {
					value : val_natrium,
					label : '나트륨',
					color : '#FFF8DC'
				}, {
					value : val_chole,
					label : '콜레스테롤',
					color : '#F0F8FF'
				}, {
					value : val_fattyacid,
					label : '포화지방산',
					color : '#00BFFF'
				}, {
					value : val_transfat,
					label : '트랜스지방',
					color : '#ADFF2F'
				}, ];
				
				var donutSize = 300;
				var donut = $('#svg').donut({
				    donutSize: donutSize,
				    center: {
				        x: donutSize / 2,
				        y: donutSize / 2
				    },
				    radius: donutSize * 0.3 / 1,
				    data: foodDatas
				});

				donut.startShowAnimation(function(){
				  $('button').attr('disabled', false);
				});
				
				// 가져온 데이터 영양소 정보에 표시 구현 부분
				$('#supportpereat').append(t_supportpereat);
				$('#calory').append(t_calory);
				$('#carbo').append(t_carbo);
				$('#protein').append(t_protein);
				$('#fat').append(t_fat);
				$('#sugar').append(t_sugar);
				$('#natrium').append(t_natrium);
				$('#chole').append(t_chole);
				$('#fattyacid').append(t_fattyacid);
				$('#transfat').append(t_transfat);
				$.ajax({
					type : "GET",
					url : "<c:url value='/allergy' />",
					data : {
						"id" : "${userInfo.id}",
						"text" : material
					},
					success : function(data) {
						let str = "";
						let findStr = JSON.parse(data);
						console.log(data);
						$(findStr).each(function(idx, item) {
							str += "<span class='allergyThing'>"+item+"</span>";					
						});
						$("#allergyText").html(str);
					},
					error : function() {
						layerAlertOpen("error")
					}
				});

			},
			error : function() {
				layerAlertOpen("error");
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
		$(".intakeButton").click(function(e){
			e.preventDefault();
			$.ajax({
				type : "post",
				url : "<c:url value='/intakeInsert' />",
				data : {
					id : "${userInfo.id}",
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
	</script>
	<c:url value="/static/js/svg-donut-chart-framework.js" var="framework"/>
	<script src="${framework }"></script>
	<jsp:include page="/WEB-INF/view/include/footer.jsp"/>