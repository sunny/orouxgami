require 'rubygems'
require 'sinatra'
require 'animal'
require 'helpers'

get '/' do
  @animal = Animal.last
  haml :animal
end

get '/animal/:id' do
  @animal = Animal.find(params[:id])
  haml :animal
end

get '/abecedaire' do
  @animals = Animal.all.sort
  @taxonomies = Animal.taxonomies.sort
  haml :abecedaire
end

get '/auteurs' do
  haml :auteurs
end

get '/faq' do
  haml :faq
end

get '/carte' do
  haml :carte
end

not_found do
  @error_code = 404
  haml :'error'
end

get '/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :stylesheet
end

configure :production do
  error do
    @error_code = 500
    haml :'error'
  end
end


