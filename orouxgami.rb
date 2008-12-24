require 'rubygems'
require 'sinatra'
require 'animal'
require 'taxonomy'
require 'helpers'

get '/' do
  @animal = Animal.last
  haml :animal
end

get '/animal/:id' do
  @animal = Animal.find(params[:id]) or raise Sinatra::NotFound
  haml :animal
end

get '/taxonomie' do
  @animals = Animal.all.sort
  @taxonomies = Taxonomy.all.sort
  @title = "Abécédaire des pensionnaires"
  haml :taxonomy
end

get '/taxonomie/:id' do
  @taxonomy = Taxonomy.find_by_id(params[:id]) or raise Sinatra::NotFound
  @animals = @taxonomy.animals
  @taxonomies = Taxonomy.all
  @title = @taxonomy.name
  haml :taxonomy
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

get '/liens' do
  haml :liens
end

get '/nous-ecrire' do
  haml :nousecrire
end

post '/nous-ecrire' do
  send_email(
    :from => 'negatif@gmail.com',
    :to => 'negatif@gmail.com',
    :subject => "[Orouxgami] Nouveau message",
    :message => "Name: #{params[:name]}\nEmail: #{params[:email]}\nMessage: #{params[:email]}"
  )
  haml :merci
end

not_found do
  @code = 404
  haml :'error'
end

get '/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :stylesheet
end

configure :production do
  error do
    @code = 500
    haml :'error'
  end
end


