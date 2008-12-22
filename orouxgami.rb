require 'rubygems'
require 'sinatra'
require 'animal'



get '/' do
  @animal = Animal.last
  haml :animal
end

get '/animal/:id' do
  @animal = Animal.find(params[:id])
  haml :animal
end

get '/abecedaire' do
  @classes = Animal.classes
  haml :abecedaire
end


get '/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :stylesheet
end

not_found do
  haml :'404'
end

configure :production do
  error do
    haml :'500'
  end
end

