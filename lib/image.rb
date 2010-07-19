require 'pusher'
require 'RMagick'

class Image
  
  def self.process(path = "public/images/distance.jpg")
    image = Magick::ImageList.new(path)
    (image.rows / 10).times do |y|
      
      colors_of_row = []
      (image.columns / 10).times do |x|
        pixels = image.get_pixels((x * 10), (y * 10), 10, 10)
        colors_of_row << darkest(pixels)
      end

      Pusher["image_data"].trigger("send_colors", :y => (y * 10), :colors => colors_of_row)
    end
  end
  
  def self.darkest(pixels)
    intense_pixel = nil
    intense_rgb = 765
    
    pixels.each do |p|
      current_rgb = p.red + p.green + p.blue
      if current_rgb < intense_rgb
        intense_rgb = current_rgb
        intense_pixel = p
      end
    end
    
    "rgb(#{intense_pixel.red},#{intense_pixel.green},#{intense_pixel.blue})"
  end
end