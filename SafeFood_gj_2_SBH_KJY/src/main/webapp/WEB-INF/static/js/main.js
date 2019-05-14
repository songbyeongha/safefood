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
