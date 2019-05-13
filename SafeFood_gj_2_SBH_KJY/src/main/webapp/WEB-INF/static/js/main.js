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
		url : "/intakeInsert",
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
function layerAlertOpen(msg){
	$('.layerPopUpContent').text(msg);
	$('.layerPopUp').show();
}
function layerAlertClose(){
	$('.layerPopUp').hide();
}
function layerCenter(){
	let width = $('.layerPopUp').width();
	let height = $('.layerPopUp').height();
	console.log(height);
	$('.layerPopUp').css({'left':($(window).width() - width)/2, 'top':($(window).height()/2)-height});
}