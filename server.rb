require 'rubygems'
require 'sinatra'
require 'haml'

post "/read_image" do
  Image.process
end

get "/" do 
  haml :index
end

