<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/include/header.jsp" />
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
		/*	
		let id = "";
		$('.layerPopUpButton').click(function(){
			window.location.reload();
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

	*/
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
<script src="https://unpkg.com/vue"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script type="text/x-template" id="listhrmtemplate">
<div>
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
<div class='search_box'>
	<button @click='show_add()'>글쓰기</button>
	<button @click='show_add()'>삭제</button>
</div>
</script>
<script type="text/javascript">
var listhrm = Vue.component('listhrm',{
    template: '#listhrmtemplate',
    data(){
        return {
          info: [],
          loading: true,
          errored: false 
        }
      },
      methods:{
    	  /* show_detail:function(boardId){
    		  App.qnaId=boardId; 
    		  App.currentview = 'detailhrm';
    		  App.showlist(3);
    	  },
    	  show_add:function(){
    		  App.currentview = 'addhrm';
    		  App.showlist(1);
    	  } */
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
					id : "${userInfo.id}"
				}
          })
          //.get('./emp.json')
          .then(response => {
        	  console.log(response.data.data);
        	  this.info = response.data.data
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
		   allviews:['listhrm','addhrm','modifyhrm','detailhrm'],
		   cutt:['게시판>리스트','게시판>글쓰기','게시판>수정','게시판>보기']
	},
	components: {
		//addhrm: addhrm,
		//idhrm: idhrm,
		//namehrm: namehrm,
		listhrm: listhrm,
		//detailhrm: detailhrm
	},
	methods:{
	 	showlist: function(val) {
	 		this.currentview=this.allviews[val];
	 		this.currenttitle=this.cutt[val];
	    }
	}
})
</script>
<jsp:include page="/WEB-INF/view/include/footer.jsp"/>