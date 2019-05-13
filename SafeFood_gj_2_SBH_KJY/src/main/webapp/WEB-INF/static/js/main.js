function onDragStart(target,e){
    e.dataTransfer.setData("text",target.id);
}
function onDrop(target,e){
    var id = e.dataTransfer.getData('Text');
	console.log(id);
	
	target.classList.add('shake');
	setTimeout(function() {
		target.classList.remove('shake');
	}, 500);
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
	$('.layerPopUp').css({'left':($(window).width() - width)/2, 'top':($(window).height()-height)/2});
}