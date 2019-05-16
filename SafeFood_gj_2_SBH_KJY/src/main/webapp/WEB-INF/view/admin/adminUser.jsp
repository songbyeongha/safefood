<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보보기</title>
<c:url value="/static/css/main.css" var="mainCss" />
<link rel="stylesheet" href="${mainCss }" />
<style type="text/css">
body{
    background-image: url(http://getwallpapers.com/wallpaper/full/a/5/d/544750.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    height: 100%;
    font-family: 'Numans', sans-serif;
}
#productPlace {
    padding: 30px 0px 120px;
    margin: 0 auto;
    margin-top: 60px;
    width: 75%;
    background: #fff;
    opacity: 0.84;
}
</style>
</head>
<body>
	
	<div id='productPlace' class="container">
	<div class="boardImg">
		<h1>회원정보보기</h1>
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
<table class='board_list_table'>
<col width="17%"><col width="17%"><col width="17%"><col width="17%"><col width="16%"><col width="16%">
	<tr>
		<th>ID</th>
		<th>이름</th>
		<th>성별</th>
		<th>나이</th>
		<th>키</th>
		<th>몸무게</th>
	</tr>
	<tr v-for="user in info">
		<td v-html="user.id"></td>
		<td v-html="user.name"></td>
		<td v-html="user.gender"></td>
		<td v-html="user.age"></td>
		<td v-html="user.kidney"></td>
		<td v-html="user.weight"></td>
	</tr>
</table>
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
      mounted () {
        axios
          .post("<c:url value='/adminuser' />")
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
var App=new Vue({
	el: '#productPlace',
	data: {
		currenttitle:'회원정보',
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
</body>
</html>