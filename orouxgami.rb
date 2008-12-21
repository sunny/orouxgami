require 'rubygems'
require 'sinatra'
require 'animal'

get '/' do
  @animal = Animal.last
  haml :animal
end

get '/abecedaire' do
  @classes = Animal.classes
  haml :abecedaire
end

get '/animal/:id' do
  @animal = Animal.find(params[:id])
  haml :animal
end

get '/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :stylesheet
end

