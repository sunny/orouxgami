require 'open-uri'
require 'yaml'

ANIMAUX_YML = File.dirname(__FILE__) + '/data/zoo.yml'

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
  
  def <=>(animal)
    nom <=> animal.nom
  end
    
 
  def self.all
    return @all unless @all.nil?
    i = -1
    yaml = YAML.load(open(ANIMAUX_YML))
    @all = yaml['animaux'].map do |attributes|
      Animal.new(attributes.merge('index' => i += 1))
    end
  end

  def self.find(id)
    self.all.find { |animal| animal.id == id }
  end

  def self.last
    self.all.last
  end

  def self.taxonomies
    self.all.collect { |animal| animal.classe }.uniq
  end

  def self.find_by_taxonomy(taxonomy)
    self.all.select { |animal| animal.classe == taxonomy }.uniq
  end
end


