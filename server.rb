require 'rubygems'
require 'sinatra'
require 'haml'
require '../seurrat/lib/photo_artist'

post "/read_image" do
  PhotoArtist.process  
end

get "/" do 
  haml :index
end

