require 'rubygems'
require 'sinatra'
require 'haml'
require '../seurrat/lib/photo_artist'

post "/read_image" do
  PhotoArtist.paint  
end

get "/zoom" do
  PhotoArtist.zoom(2)  
end

get "/" do 
  haml :index
end

