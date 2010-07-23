describe("Photo Artist", function(){

  var original_container;

  beforeEach(function() {
		original_container = $("#canvas");
	 	canvas_container = original_container.clone();	
	  square = canvas_container.get(0).getContext('2d');
		console.log("hello_world", square);
  });

	afterEach(function() {
	 	canvas_container.replaceWith(original_container);
		console.log("hello_world", square);
  });
  
	it("should color pixels in its canvas", function(){
		color = "rgb(55,55,55)";
		var fillRectCalled = false;

		mockSquare = {
			fillRect: function(a,b,c,d) {
				expect(b).toEqual(10);
				expect(c).toEqual(20);
				expect(d).toEqual(20);
				fillRectCalled = true;
			},
		};
		seurrat.color(mockSquare,10,10,color);
		expect(fillRectCalled).toBeTruthy();
		expect(mockSquare.fillStyle).toEqual(color);
	});
	
	it("should save painting as new image", function(){
		var previous_number_of_downloads = seurrat.downloads.length;
		mockCanvas = {};
		spyOn(seurrat, "export_png").andReturn(true);
		seurrat.export_art(mockCanvas);
		
		expect(seurrat.downloads.length).toBeGreaterThan(previous_number_of_downloads);
	});
  
});