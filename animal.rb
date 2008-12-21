require 'open-uri'
require 'yaml'
ANIMAUX_YML = 'http://edit.sunfox.org/zoorouxgami.yml/txt'

class Animal
  attr_accessor :id, :nom, :classe, :plieur, :photographe, :pelage, :provenance, :index
  def initialize(options)
    options.each do |k, v|
      self.send("#{k}=", v)
    end
    raise ArgumentError if @index.nil?
  end
  
  def precedant
    Animal.all[@index-1] unless @index == 0
  end
  
  def suivant
    Animal.all[@index+1]
  end
 
  def self.all
    return @all unless @all.nil?
    i = 0
    animaux = YAML.load(open(ANIMAUX_YML))
    @all = animaux.map do |k, attributes|
      attributes["id"] = k
      attributes["index"] = i
      i += 1
      Animal.new(attributes)
    end
    
  end
  
  def self.find(id)
    animal = self.all.find { |animal| animal.id == id }
    raise "No such animal" if animal.nil?
    animal
  end
  
  def self.last
    self.all.last
  end

  def self.classes
    classes = {}
    self.all.each do |animal|
      classes[animal.classe] = [] if classes[animal.classe].nil?
      classes[animal.classe].push animal
    end
    classes
  end
end


