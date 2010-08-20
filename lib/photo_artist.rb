require 'pusher'
require 'RMagick'

class PhotoArtist
  
  Pusher.app_id = '1436'
  Pusher.key = '279b70cc663845e74c75'
  Pusher.secret = '4491a3468b2f7d0ece6e'
  PATH = "public/images/art_for_humanity.png"
 
  def self.get_zoom_values(image, factor) 
    width = image.columns / factor
    height = image.rows / factor
    puts "width = #{width}"
    puts "height = #{height}"
    width_and_height = {"width" => width, "height" => height}
    width_and_height
  end
  
   
  def self.zoom(factor)
    @image = Magick::ImageList.new(PATH)
    width_and_height = self.get_zoom_values(@image, factor) 
    cropped_image = @image.crop(Magick::CenterGravity, width_and_height.fetch("width"), width_and_height.fetch("height"))
    puts cropped_image.inspect
    zoomed_image = cropped_image.resize(300,200)
    puts zoomed_image.inspect
    self.paint_zoom(zoomed_image)
  end
    
  def self.paint_zoom(image)
    (image.rows / 5).times do |y|
      colors_of_row = []
      (image.columns / 5).times do |x|
        pixels = image.get_pixels((x * 5), (y * 5), 5, 5)
       colors_of_row << darkest_pixels(pixels)
      end
      Pusher["image_data"].trigger("begin_painting", :y => (y * 5), :colors => colors_of_row )
    end
  end  
  
  def self.paint(path = PATH)
    image = Magick::ImageList.new(path)
    (image.rows / 5).times do |y|
      colors_of_row = []
      (image.columns / 5).times do |x|
        pixels = image.get_pixels((x * 5), (y * 5), 5, 5)
        colors_of_row << darkest_pixels(pixels)
      end
      Pusher["image_data"].trigger("begin_painting", :y => (y * 5), :colors => colors_of_row)
    end
  end
  
  
  def self.get_rgb_values(pixels)
    pixels.each do |p|
      return "rgb(#{p.red},#{p.green},#{p.blue})"
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