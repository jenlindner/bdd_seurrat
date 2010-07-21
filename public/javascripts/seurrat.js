function setEverythingUp($){
	
	var element = document.getElementById('canvas');
	var canvas = element.getContext('2d');
	
	var paint = new Pusher('279b70cc663845e74c75', 'image_data');	
	paint.bind('begin_painting', function(data){
		var x = 0;
		data.colors.forEach(function(color) {
			seurrat.color(canvas, x, data.y, color);
			x += 10;
		});
	});
}

$(document).ready(function() { setEverythingUp(jQuery) });

var seurrat = {
	color: function(el,x,y,color){
		el.fillStyle = color;
		el.fillRect(x,y,x+10,y+10);
	}
}