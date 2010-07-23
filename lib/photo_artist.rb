require 'pusher'
require 'RMagick'

class PhotoArtist
  
  Pusher.app_id = '1436'
  Pusher.key = '279b70cc663845e74c75'
  Pusher.secret = '4491a3468b2f7d0ece6e'
  
  def self.save_image
    
  end
    
  
  def self.paint(path = "public/images/distance.jpg")
    image = Magick::ImageList.new(path)
    (image.rows / 10).times do |y|
      
      colors_of_row = []
      (image.columns / 10).times do |x|
        pixels = image.get_pixels((x * 10), (y * 10), 10, 10)
        colors_of_row << darkest_pixels(pixels)
      end
      Pusher["image_data"].trigger("begin_painting", :y => (y * 10), :colors => colors_of_row)
    end
    
  end
  
  def self.darkest_pixels(pixels)
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