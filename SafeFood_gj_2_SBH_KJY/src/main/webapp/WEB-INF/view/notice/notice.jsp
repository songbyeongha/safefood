<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/include/header.jsp" />
<c:url value="/static/images/faq.png" var="faq" />
<div id='app'>
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
<div>
<table class='board_list_table'>
<col width="3%"><col width="70%">
<col width="10%"><col width="10%"><col width="7%">
<tr>
  <th><input type="checkbox"></th>
  <th>제목</th>
  <th>글쓴이</th>
  <th>등록일</th>
  <th>조회수</th>
</tr>
<tr v-for="board in info">
  <td><input type="checkbox"></td>
  <td v-html="board.title" @click="show_detail(board.qno)" ></td>
  <td v-html="board.writer"></td>
  <td>{{board.inDate|formatDate}}</td>
  <td>{{ board.hit }}</td>
</tr>
</table>
</div>
<div>
<div class='search_box'>
	<button @click='show_add()'>글쓰기</button>
	<button @click='show_add()'>삭제</button>
</div>
</script>
<script type="text/x-template" id="addhrmtemplate">
<div>
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
<button type="submit" name="button" @click='show_list()'>확인</button>
<button @click='show_list()'>취소</button>
</div>
</form>
</div>
</div>
</script>
<script>
	
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
				<td v-text="board.title"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td v-text="board.content"></td>
			</tr>
		</table>
		<div class='search_box'>
			<button @click='show_list()'>리스트</button>
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
          errored: false 
        }
      },
      methods:{
    	  show_detail:function(boardId){
    		  App.qnaId=boardId; 
    		  App.currentview = 'detailhrm';
    		  App.showlist(3);
    	  },
    	  show_add:function(){
    		  App.currentview = 'addhrm';
    		  App.showlist(1);
    	  }
      },
      filters: {
    	  formatDate(value) {
    		return value.substr(0,10);
		  }
      },
      mounted () {
        axios
          .get('http://121.147.32.115:9090/api/boards')
          //.get('./emp.json')
          .then(response => {
        	  this.info = response.data.data
          })
          .catch(error => {
            console.log(error)
            this.errored = true
          })
          .finally(() => this.loading = false)
      }
});
/*var idhrm = Vue.component('idhrm',{
    template: '#idhrmtemplate',
    data () {
        return {
          info: [],
          loading: true,
          errored: false ,
          cid:'',
          cemp:{}
        }
      },
      filters: {
    	   salarydecimal (value) {
          return value.toFixed(2)
        }
      }, 
      mounted () {
        axios
          .get('http://localhost:8197/ssafyvue/api/findAllEmployees')
           //.get('./emp.json')
          .then(response => (this.info = response.data))
          .catch(error => {
            console.log(error)
            this.errored = true
          })
          .finally(() => this.loading = false);
      },
      methods: {
    	   findbyid() {
    		   axios
    		    .get('http://localhost:8197/ssafyvue/api/findEmployeeById/'+this.cid)
    		     //.get('./emp.json')
    		    .then(response => (this.cemp = response.data))
    		    .catch(error => {
    		      console.log(error)
    		      this.errored = true
    		    })
    		    .finally(() => this.loading = false);
    	   }
      }
});
*/
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
    	  }
      },
      mounted () {
    	  axios
		    .get('http://121.147.32.115:9090/api/boards/'+App.qnaId)
		    .then(response => (this.board = response.data.data))
		    .catch(error => {
		      console.log(error)
		      this.errored = true
		    })
		    .finally(() => this.loading = false);
      }
      
});
/*
var namehrm = Vue.component('namehrm',{
    template: '#namehrmtemplate',
    data () {
        return {
          info: [],
          loading: true,
          errored: false ,
          cname:'',
          cemps:[]
        }
      },
      filters: {
    	   salarydecimal (value) {
          return value.toFixed(2)
        }
      }, 
      mounted () {
        axios
          .get('http://localhost:8197/ssafyvue/api/findAllEmployees')
           //.get('./emp.json')
          .then(response => (this.info = response.data))
          .catch(error => {
            console.log(error)
            this.errored = true
          })
          .finally(() => this.loading = false);
      },
      methods: {
    	  searchname() {
    		   axios
    		    .get('http://localhost:8197/ssafyvue/api/findLikeEmployees/'+this.cname)
    		     //.get('./emp.json')
    		    .then(response => (this.cemps = response.data))
    		    .catch(error => {
    		      console.log(error)
    		      this.errored = true
    		    })
    		    .finally(() => this.loading = false);
    	   },
    	   currentEmp(){
    		   console.log();
    	   }
      }
});
*/
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
			writer:'aaa'
		}
	},
	
	mounted () {
		axios
		.get('http://121.147.32.115:9090/api/boards')
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
	   addhrm: addhrm,
	   //idhrm: idhrm,
	   //namehrm: namehrm,
       listhrm: listhrm,
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