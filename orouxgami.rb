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

use_in_file_templates!
 
__END__
@@ layout
!!!
%html
  %head
    %title
      Orouxgami
    %meta{'http-equiv' => 'Content-Type', :content => 'text/html; charset=utf-8'}
    %link{:rel => 'stylesheet', :href => '/stylesheet.css', :type => 'text/css'}
  %body
    #header
      %h1
        %a{:href => "/"}
          Zoorouxgami
      %p
        Blabla ici.

    #menu
      %ul
        %li
          %a{:href => "/abecedaire"}
            Abécédaire des pensionnaires
        %li
          %a{:href => "/auteurs"}
            Auteurs
        %li
          %a{:href => "/faq"}
            Faq
        %li
          %a{:href => "/nous-ecrire"}
            Nous écrire


    = yield


@@ index
%h2 Accueil


@@ abecedaire
%h2 Abécédaire des pensionnaires

- for classe, animaux in @classes do
  %h3= classe
  
  - for animal in animaux
    %ul    
      %li
        %a{:href => "/animal/#{animal.id}"}
          = animal.nom


@@ animal
%h2= @animal.nom

- if @animal.precedant
  %p#precedent
    %a{:href => "/animal/#{@animal.precedant.id}", :title => @animal.precedant.nom }
      Précédent

- if @animal.suivant
  %p#suivant
    %a{:href => "/animal/#{@animal.suivant.id}", :title => @animal.suivant.nom }
      Suivant

%dl
  %dt Nom
  %dd= @animal.nom
  
  %dt Classe
  %dd= @animal.classe
  
  %dt Plieur
  %dd= @animal.plieur
  
  %dt Photographe
  %dd= @animal.photographe
  
  %dt Pelage
  %dd= @animal.pelage
  
  %dt Provenance
  %dd
    %a{:href => @animal.provenance}= @animal.provenance

@@ stylesheet
body
  padding: 0 5em
  margin: 0
  background: white
  color: #333
  font: 1.5em Helvetica, sans-serif

