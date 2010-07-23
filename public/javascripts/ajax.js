$(document).ready( function(){ 
	$("#draw").click(function(){
		$.post("/read_image");
	});
	$("#download_art").click(function(){
		canvas = document.getElementById("canvas");
		seurrat.download_art(canvas);
	});
});