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
  raise Sinatra::NotFound if @animal.nil?
  haml :animal
end

get '/taxonomie/:id' do
  @taxonomy = params[:id]
  @animals = Animal.find_by_taxonomy(@taxonomy).sort
  haml :taxonomy
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
  haml :'error'
end

get '/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :stylesheet
end

configure :production do
  error do
    haml :'error'
  end
end


