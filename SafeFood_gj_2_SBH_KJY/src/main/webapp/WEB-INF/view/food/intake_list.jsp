<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/include/header.jsp" />
<c:url value="/static/css/jquery-ui.min.css" var="datepicker" />
<link rel="stylesheet" href="${datepicker }">
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
	<div class='boardTitle'>
		<h5 v-html='currenttitle'></h5>
	</div>
	<component v-bind:is="currentview"></component>
</div>
<div id="chart_div" class="container"></div>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://unpkg.com/vue"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script type="text/x-template" id="listhrmtemplate">
<div>
<div class="dataPlace">
	<input type="text" id="datepicker1">
	~
	<input type="text" id="datepicker2">
	<input type="button" id="dateSearch" @click="changepage(1)" value="검색">
</div>
<div>
<table class='board_list_table'>
<col width="17%"><col width="17%"><col width="17%"><col width="17%"><col width="16%"><col width="16%">
	<tr>
		<th>섭취일</th>
		<th>식품명</th>
		<th>칼로리</th>
		<th>탄수화물</th>
		<th>단백질</th>
		<th>지방</th>
	</tr>
	<tr v-for="food in info">
		<td>{{food.intakeDate|formatDate}}</td>
		<td v-html="food.name" @click="show_detail(food.code)" ></td>
		<td v-html="food.calory"></td>
		<td v-html="food.carbo"></td>
		<td v-html="food.protein"></td>
		<td v-html="food.fat"></td>
	</tr>
</table>
</div>
<div>
<div class="pagebox">
<span @click="changepage(1)" class="page glyphicon glyphicon-backward"></span>
<span v-show="pagelist[0]!=1" @click="rowpagelist(-5)" class="page glyphicon glyphicon-chevron-left"></span>
<span @click="changepage(page)" class="page" v-for="page in pagelist" v-bind:class="{curpage:page===curpage}">{{page}}</span>
<span v-show="pagelist[0]+5<maxpage" @click="rowpagelist(5)" class="page glyphicon glyphicon-chevron-right"></span>
<span @click="changepage(maxpage)" class="page glyphicon glyphicon glyphicon-forward"></span>
</div>
<div class='search_box'>
	<button @click='show_add()'>삭제</button>
</div>
</script>
<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawVisualization);
let preList = ['섭취후'];
let afterList = ['섭취전'];
function drawVisualization() {
	var data = google.visualization.arrayToDataTable([
		['영양정보', '칼로리', '탄수화물', '단백질', '지방', '당류', '나트륨', '콜레스테롤', '포화 지방산', '트랜스지방'],
		['섭취전', 90, 80, 110, 90, 110, 90, 60, 90, 100],
		['섭취후', 100, 100, 120, 100, 130, 100, 80, 110, 120]
	]);
	var options = {
			title : '섭취량 그래프',
			vAxis: {title: '일일 섭취 권장량(100%)'},
			hAxis: {title: '날짜'}, 
			seriesType: 'line'
		};
	
	var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
	chart.draw(data, options);
}

$( document ).ready(function() {
    $.ajax({
        url: 'http://localhost:8080/foodwishget', // 요청 할 주소
        type: 'GET', // GET, PUT
        data: {
        	
   		}, // 전송할 데이터
		success: function (result) {
			$.each(result[0], function (key, value) {
				afterList.push(value);
			});
			console.log(list);
		}, // 요청 완료 시
        error: function(resTxt) {} // 요청 실패.
    });
});
$(function() {
	$.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd'
        ,showOtherMonths: true 
        ,showMonthAfterYear:true 
        ,changeYear: true 
        ,changeMonth: true
        ,yearSuffix: "년" 
        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12']
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
        ,dayNamesMin: ['일','월','화','수','목','금','토']
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']
        ,minDate: "-5Y"
        ,maxDate: "0"                
    });
	$("#datepicker1").datepicker();
	$("#datepicker2").datepicker();
    $('#datepicker1').datepicker('setDate', 'today');
    $('#datepicker2').datepicker('setDate', 'today');
});
var listhrm = Vue.component('listhrm',{
    template: '#listhrmtemplate',
    data(){
        return {
          info: [],
          loading: true,
          errored: false,
          checkNum : [],
          maxpage:[],
          curpage:1,
          pagelist:[],
          iscurpage:""
        }
      },
      methods:{
    	  delete_list:function(){
    		  App.currentview = 'listhrm';
    		  App.showlist(0);  
    	  },
    	  rowpagelist(interval){
    		  var startpage=this.pagelist[0]+interval;
    		  var endpage=this.pagelist[4]+interval;
    		  for(var ii=startpage;ii<=endpage;ii++){
    		  	if(ii<=0){
    		  		endpage++;
    		  	}else if(ii>this.maxpage){
    		  		startpage--;
    		  	}
    		  }
    		  this.pagelist=[];
    		  for(var i=startpage;i<=endpage;i++){
    		  	if(i>0 && i<=this.maxpage){
    		  		this.pagelist.push(i);
    		  	} 
    		  }
   		  },
   		  changepage(page){
    		  axios
    		  .get("<c:url value='/intake' />",{
		  		params: {
					id : "${userInfo.id}",
					startDate : $("#datepicker1").val(),
					endDate : $("#datepicker2").val(),
					page: page
		  		}
			  })
    		  .then(response => {
    			  this.info = response.data.data
    		  	  this.maxpage=response.data.maxpage;
    		  	  this.curpage=page;
    		  }).catch(error => {
    			  console.log(error)
   			  })
   			  .finally(() =>{ 
    			  this.changepagelist();
   			  });
		  },
		  changepagelist(){
			  this.pagelist=[];
			  var startpage=this.curpage-2;
			  var endpage=this.curpage+2;

			  for(var ii=startpage;ii<=endpage;ii++){
			  	if(ii<=0){
			  		endpage++;
			  	}else if(ii>this.maxpage){
			  		startpage--;
			  	}
			  }

			  for(var i=startpage;i<=endpage;i++){
			  	if(i>0 && i<=this.maxpage){
			  		this.pagelist.push(i);
			 	} 
			  }
			  
		  }
      },
      filters: {
    	  formatDate(value) {
    		return value.substr(0,10);
		  }
      },
      mounted () {
        axios
          .get("<c:url value='/intake' />",{
		  		params: {
					id : "${userInfo.id}",
					startDate : getTimeStamp(),
					endDate : getTimeStamp(),
					page: 1
				}
          })
          .then(response => {
        	  this.info = response.data.data;
        	  this.maxpage=response.data.maxpage;
        	  this.changepagelist();
          })
          .catch(error => {
        	  console.log(error)
        	  this.errored = true
          })
          .finally(() => this.loading = false)
      }
});
var App=new Vue({
	el: '#productPlace',
	data: {
		currenttitle:'섭취정보',
		qnaId:'',
		currentview: 'listhrm',
		   allviews:['listhrm']
	},
	components: {
		listhrm: listhrm
	},
	methods:{
	 	showlist: function(val) {
	 		this.currentview=this.allviews[val];
	    }
	}
})
</script>
<jsp:include page="/WEB-INF/view/include/footer.jsp"/>