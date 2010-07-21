$LOAD_PATH << "lib"
require 'photo_artist'
require 'cat'
require 'spec_helper'

describe PhotoArtist do
  it "pushes row color data to pusher" do
    mock_channel = mock("channel")
    mock_channel.should_receive(:trigger).with("send_colors", :y => 0, :colors => ["rgb(0,0,0)", "rgb(0,0,0)", "rgb(0,1,0)"])
    mock_channel.should_receive(:trigger).with("send_colors", :y => 10, :colors => ["rgb(0,0,0)", "rgb(0,0,0)", "rgb(0,0,0)"])
    Pusher.should_receive("[]").twice.with("image_data").and_return(mock_channel)
    PhotoArtist.process("specs/data/test.jpg")
  end
  
  
  it "creates a new image and saves it"
  
  it "creates an image with darkest pixels if asked for dark pixels" do
     PhotoArtist.get_darkest_pixels
     PhotoArtist.draw
     #expects darkest pixels of test square in original to match darkest pixels in created image
  end
    
  it "creates its image with red pixels if asked for red pixels"
  it "should create zoom effect by accurately enlarging a given rectangle of pixels"
  it "should slowly draw one row at a time"
  it "should draw its image so that it appears all at once to user"
  
  
end


# okay so it's always about the state of an object. you're always using methods to change the state of something
# and then testing one public method by checking state -- but never really testing inner private methods
# object uses to accomplish its evil tasks. you don't test methods per se. So you're also always building objects.
# so i have an image processing object. what do i want to test? the state it leaves its targets in after it's done 
# its processing on them. And actually really it's a drawing program. it draws and creates new images. it creates 
# its own paint from one image, so one thing to test might be that it creates the kind of paint it wants to: if 
# it wants darkest or reddest or bluest pixels, then make sure it gets those pixel values correctly. the other thing 
# will be the zoom factor. if it wants to select a range in one picture to draw larger in aanother, you should check 
# that it accomplishes this. perhaps by confirming rgb values in one place are the same as where they end up, in correct
# size ratio.


# describe Cat do
#   before(:each) do
#     @kitty = Cat.new
#   end
#   
#   it "says meow" do
#     Cat.new.say.should match "meow"
#   end
#   
#   it "drinks wine and speaks french" do
#    Cat.new.drinks("wine").should_not match "nien fraulien"
#   end
#   
#   it "purrs when given love" do
#     #mock_love = mock("love")
#     @kitty.should respond_to :purrs
#   end
#   
#   it "wants to be outside" do
#     @kitty.tries_to_go_outside
#     @kitty.is_happy.should == false
#   end
#   
#   it "is happy if outside" do
#       puts @kitty.is_outside
#       @kitty.goes_outside
#       puts @kitty.is_outside
#       @kitty.is_outside == true
#     end
#   end