require 'rubygems'
require 'sinatra'
require 'haml'
require '../seurrat/lib/photo_artist'

post "/read_image" do
  PhotoArtist.paint  
end

get "/" do 
  haml :index
end

