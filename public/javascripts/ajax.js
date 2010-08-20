$(document).ready( function(){ 
	$("#draw").click(function(){
		$.post("/read_image");
	});
	$("#export_art").click(function(){
		canvas = document.getElementById("canvas");
		seurrat.export_art(canvas);
	});
	$("#zoom").click(function(){
		canvas = document.getElementById("canvas");
		$.get("/zoom");
	});
});