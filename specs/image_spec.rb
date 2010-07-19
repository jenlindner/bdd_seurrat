$LOAD_PATH << "lib"
require 'image'


describe Image do
  it "pushes row color data to pusher" do
    mock_channel = mock("channel")
    mock_channel.should_receive(:trigger).with("send_colors", :y => 0, :colors => ["rgb(0,0,0)", "rgb(0,0,0)", "rgb(0,1,0)"])
    mock_channel.should_receive(:trigger).with("send_colors", :y => 10, :colors => ["rgb(0,0,0)", "rgb(0,0,0)", "rgb(0,0,0)"])
    Pusher.should_receive("[]").twice.with("image_data").and_return(mock_channel)
    Image.process("specs/data/test.jpg")
  end
end