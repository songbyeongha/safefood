function onDragStart(target,e){
    e.dataTransfer.setData("tarketCode",target.id);
}
function onDrop(target,e){
    let tCode = e.dataTransfer.getData('tarketCode');
	target.classList.add('shake');
	setTimeout(function() {
		target.classList.remove('shake');
	}, 500);
	$.ajax({
		type : "post",
		url : "/wishInsert",
		data : {
			id : $(target).attr('id'),
			code : tCode
		},
		success : function(data) {
			layerAlertOpen(data);
		},
		error : function() {
			layerAlertOpen("잘 못 넣었습니다.")
		}
	});
    e.preventDefault();
}

function layerAlertOpen1(msg){
	$('.layerPopUpContent').text(msg);
	$('.layerPopUp1').show();
	$('.layerPopUpButton').focus();
}

function layerAlertOpen(msg){
	$('.layerPopUpContent').text(msg);
	$('.layerPopUp').show();
	$('.layerPopUpButton').focus();
}
function layerAlertClose(){
	$('.layerPopUp').hide();
}
function layerCenter(){
	let width = $('.layerPopUp').width();
	let height = $('.layerPopUp').height();
	$('.layerPopUp').css({'left':($(window).width() - width)/2, 'top':($(window).height()/2)-height});
}

function getTimeStamp() {
	var d = new Date();
	var s =
    leadingZeros(d.getFullYear(), 4) + '-' +
    leadingZeros(d.getMonth() + 1, 2) + '-' +
    leadingZeros(d.getDate(), 2);

	return s;
}

function leadingZeros(n, digits) {
	var zero = '';
	n = n.toString();

	if (n.length < digits) {
		for (i = 0; i < digits - n.length; i++)
			zero += '0';
	}
	return zero + n;
}

function percent(molecule,denominator){
	return molecule/denominator*100;
}

function calCalory(gender, weight, kidney, age, level){
	if(gender == "남성"){
		return (66+(13.8*weight)+(5*kidney)-(6.8*age))*level;
	}else{
		return (655+(9.6*weight)+(1.8*kidney)-(4.7*kidney))*level;
	}	
}

function calCarbo(gender, age){
	if(gender == "남성"){
		if(age>19)
			return 410;
		else
			return 420;
	}else{
		if(age>19)
			return 330;
		else
			return 315;
	}	
}

function calProtein(gender, age){
	if(gender == "남성"){
		if(age>19)
			return 55;
		else
			return 60;
	}else{
		if(age>19)
			return 50;
		else
			return 45;
	}	
}

function calFat(gender, age){
	if(gender == "남성"){
		if(age>19)
			return 850;
		else
			return 150;
	}else{
		if(age>19)
			return 105;
		else
			return 115;
	}	
}

function calSugar(calory){
	return calory*0.1;
}

function calChole(age){
	if(age>19)
		return 300;
	else
		return 10;
}

function calFattyacid(age, calory){
	if(age>19)
		return calory*0.07;
	else
		return calory*0.08;
}

function calTransfat(calory){
		return calory*0.01;
}