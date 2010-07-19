$(document).ready( function(){ 
	$("#draw").click(function(){
		$.post("/read_image");
	});
});