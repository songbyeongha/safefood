<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/include/header.jsp" />
<c:url value="/static/images/faq.png" var="faq" />
<div id='app' class="container">
	<div class="boardImg">
		<img src="/static/images/faq.png" />
	</div>
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
<div class="layerPopUp1 layerPopUp">
<div class="layerPopUpContent"></div>
<button class="layerPopUpButton" @click='show_list1()'>확인</button>
</div>
<div>
<table class='board_list_table'>
<col width="3%"><col width="50%">
<col width="20%"><col width="20%"><col width="7%">
<tr>
  <th><input type="checkbox" @click="selectAll" v-model="allSelected"></th>
  <th>제목</th>
  <th>글쓴이</th>
  <th>등록일</th>
  <th>조회수</th>
</tr>
<tr v-for="board in info">
  <td><input type="checkbox" v-model="boardNos" @click="select" :value="board.qno"></td>
  <td v-html="board.title" @click="show_detail(board.qno)" class="table_title"></td>
  <td v-html="board.writer"></td>
  <td>{{board.inDate|formatDate}}</td>
  <td>{{ board.hit }}</td>
</tr>
</table>
</div>
<div class="pagebox">
<span @click="changepage(1)" class="page glyphicon glyphicon-backward"></span>
<span @click="changepage(page)" class="page" v-for="page in pagelist" v-bind:class="{curpage:page===curpage}">{{page}}</span>
<span @click="changepage(maxpage)" class="page glyphicon glyphicon glyphicon-forward"></span>
</div>
<c:if test="${!empty userInfo}">
<div class='search_box'>
	<button @click='show_add()'>글쓰기</button>
	<button @click='delete_list()'>삭제</button>
</div>
</c:if>
</script>

<script type="text/x-template" id="addhrmtemplate">
<div>
<div class="layerPopUp1 layerPopUp">
<div class="layerPopUpContent"></div>
<button class="layerPopUpButton" @click='show_list()'>확인</button>
</div>
<div>
<form action="" method="post" id="_frmForm" name="frmForm" @submit.prevent="addhrmtemplate">
<table class="board_list_table">
<colgroup>
<col style="width:10%;" />
<col style="width:90%;" />	
</colgroup>	
<tr>
<th>제목</th>
<td><input data-msg="제목" type="text" name="title" id="_title" size="30" v-model="ctitle"/></td>
</tr>
<tr>
<th>내용</th>
<td><textarea data-msg="내용" v-model="content" name="content"></textarea>
</tr>
</table>
<div class='search_box'>
<button type="submit" name="button">확인</button>
<button @click='show_list()'>취소</button>
</div>
</form>
</div>
</div>

</script>

<script type="text/x-template" id="detailtemplate">
<div>
	<div>
		<table class="board_list_table">
			<colgroup>
				<col style="width:10%;" />
				<col style="width:90%;" />	
			</colgroup>	
			<tr>
				<th>제목</th>
				<td v-text="board.title" class="detailTitle"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td v-text="board.content" class="detailContent"></td>
			</tr>
		</table>
		<div class='search_box'>
			<c:if test="${!empty userInfo}">
			<button @click='modify_list()'>수정</button>
			</c:if>
			<button @click='show_list()'>리스트</button>
		</div>
	</div>
</div>
</script>
<script type="text/x-template" id="modifytemplate">
<div>
	<div class="layerPopUp1 layerPopUp">
		<div class="layerPopUpContent"></div>
		<button class="layerPopUpButton" @click='show_list()'>확인</button>
	</div>
	<div>
		<table class="board_list_table">
			<colgroup>
				<col style="width:10%;" />
				<col style="width:90%;" />	
			</colgroup>	
			<tr>
				<th>제목</th>
				<td class="detailTitle">
					<input data-msg="제목" type="text" name="title" id="_title" size="30" v-model="ctitle"/>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td class="detailContent">
					<textarea data-msg="내용" name="content" v-model="content"></textarea>
				</td>
			</tr>
		</table>
		<div class='search_box'>
			<button @click='modify()'>확인</button>
			<button @click='show_list()'>취소</button>
		</div>
	</div>
</div>
</script>
<script type="text/javascript">
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
          iscurpage:"",
          selected: [],
          allSelected: false,
          boardNos: []
        }
      },
      methods:{
    	  show_detail:function(boardId){
    		  axios.put('http://localhost:9090/api/boards/hit/'+boardId)
    		  App.qnaId=boardId; 
    		  App.currentview = 'detailhrm';
    		  App.showlist(3);
    	  },
    	  show_add:function(){
    		  App.currentview = 'addhrm';
    		  App.showlist(1);
    	  },
    	  delete_list:function(){
    		  let flag = false;
    		  for(var no in this.boardNos) {
    			  axios.delete('http://localhost:9090/api/boards/'+this.boardNos[no])
    			  flag = true;
              }
    		  if(flag)
    		  	  layerAlertOpen1("삭제되었습니다.");
    		  else
    			  layerAlertOpen1("선택해주세요.");
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
    		  .get('http://localhost:9090/api/boards/page/'+page)
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
		  },
		  selectAll: function() {
	            this.boardNos = [];

	            if (!this.allSelected) {
	                for (board in this.info) {
	                    this.boardNos.push(this.info[board].qno);
	                }
	            }
	      },
	      select: function() {
	            this.allSelected = false;
	      },
	      show_list1:function(){
    		    window.location.reload();
    	  }
      },
      filters: {
    	  formatDate(value) {
    		return value.substr(0,10);
		  }
      },
      mounted () {
        axios
          .get('http://localhost:9090/api/boards/page/1')
          .then(response => {
        	  this.info = response.data.data
        	  this.maxpage=response.data.maxpage;
          })
          .catch(error => {
            console.log(error)
            this.errored = true
          })
          .finally(() => {
        	  this.loading = false
        	  this.changepagelist()
          })
      }
});
var detailhrm = Vue.component('detailhrm',{
    template: '#detailtemplate',
    data () {
        return {
          info: [],
          loading: true,
          errored: false ,
          cid:'',
          board:{}
        }
      },
      methods:{
    	  show_list:function(){
    		  App.currentview = 'listhrm';
    		  App.showlist(0);
    	  },
    	  modify_list(){
    		  App.currentview = 'modifyhrm';
    		  App.showlist(2);
    	  }
      },
      mounted () {
    	  axios
		    .get('http://localhost:9090/api/boards/'+App.qnaId)
		    .then(response => (this.board = response.data.data))
		    .catch(error => {
		      console.log(error)
		      this.errored = true
		    })
		    .finally(() => this.loading = false);
      }
      
});
var modifyhrm = Vue.component('modifyhrm',{
    template: '#modifytemplate',
    data () {
        return {
          info: [],
          loading: true,
          errored: false ,
	      deps:null,
          cid:'',
          ctitle:'',
          titls:null,
		  content:'',
	      writer:'${userInfo.id}',
          board:{}
        }
      },
      methods:{
    	  show_list:function(){
    		  App.currentview = 'listhrm';
    		  App.showlist(0);
    	  },
    	  modify(){
			if(this.ctitle==''){ alert('제목를 입력하세요.'); return ;}
			if(this.content==''){ alert('내용을 입력하세요'); return ;}
			axios.put('http://localhost:9090/api/boards/'+App.qnaId, {
				title: this.ctitle,
				content: this.content,
				writer: this.writer
			})
			.then(response => {
				if(response.data.status=='OK'){
					console.log("ok");
					layerAlertOpen1("수정 성공");
					layerCenter();
				}
			})
			.catch(error => {
				console.log(error)
				this.errored = true
			})
			.finally(() => this.loading = false);
    	  }
      },
      mounted () {
    	  axios
		    .get('http://localhost:9090/api/boards/'+App.qnaId)
		    .then(response => {
		    	this.board = response.data.data;
		    	this.ctitle = this.board.title;
		    	this.content = this.board.content;
		    })
		    .catch(error => {
		      console.log(error)
		      this.errored = true
		    })
		    .finally(() => this.loading = false);
      }
      
});
var addhrm = Vue.component('addhrm',{
	template: '#addhrmtemplate',
	data () {
		return {
			info: null,
			loading: true,
			errored: false,
			deps:null,
			titls:null,
			content:'',
			ctitle:'',
			writer:'${userInfo.id}'
		}
	},
	
	mounted () {
		axios
		.get('http://localhost:9090/api/boards')
		.then(response => (this.info = response.data))
		.catch(error => {
			console.log(error)
			this.errored = true
		})
		.finally(() => this.loading = false);
	}, 

	methods: {
		addhrmtemplate() {
			if(this.ctitle==''){ alert('제목를 입력하세요.'); return ;}
			if(this.content==''){ alert('내용을 입력하세요'); return ;}
			axios.post('http://localhost:9090/api/boards', {
				title: this.ctitle,
				content: this.content,
				writer: this.writer
			})
			.then(response => {
				if(response.data.status=='OK'){
					console.log("ok");
					layerAlertOpen1("글쓰기 성공");
					layerCenter();
				}
			})
			.catch(error => {
				console.log(error)
				this.errored = true
			})
			.finally(() => this.loading = false);
		},
		show_list:function(){
	  		App.currentview = 'listhrm';
	  		App.showlist(0);
	  	}
	}
});

var App=new Vue({
  el: '#app',
  data: {
	  currenttitle:'게시판>리스트',
	  qnaId:'',
	  currentview: 'listhrm',
      allviews:['listhrm','addhrm','modifyhrm','detailhrm'],
      cutt:['게시판>리스트','게시판>글쓰기','게시판>수정','게시판>보기']
   },
   components: {
       listhrm: listhrm,
	   addhrm: addhrm,
	   modifyhrm: modifyhrm,
       detailhrm: detailhrm
     },
     methods:{
    	 showlist: function(val) {
			 this.currentview=this.allviews[val];
    		 this.currenttitle=this.cutt[val];
         }
     }
})
 </script>
<jsp:include page="/WEB-INF/view/include/footer.jsp" />