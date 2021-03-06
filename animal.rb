require 'open-uri'
require 'yaml'

ANIMAUX_YML = File.dirname(__FILE__) + '/data/zoo.yml'

class Animal
  attr_accessor :nom, :classe, :plieur, :photographe, :pelage, :provenance, :provenance_nom, :index
  def initialize(options)
    options.each do |k, v|
      self.send("#{k}=", v)
    end
    raise ArgumentError if @index.nil?
  end
  
  def id
    to_id(@nom)
  end

  def taxonomy
    Taxonomy.new(@classe)
  end

  def precedant
    Animal.all[@index-1] unless @index == 0
  end
  
  def suivant
    Animal.all[@index+1]
  end
  
  def <=>(animal)
    id <=> animal.id
  end
    
 
  def self.all
    return @all unless @all.nil?
    i = -1
    yaml = YAML.load(open(ANIMAUX_YML))
    @all = yaml.map do |attributes|
      Animal.new(attributes.merge('index' => i += 1))
    end
  end

  def self.find(id)
    self.all.find { |animal| animal.id == id }
  end

  def self.last
    self.all.last
  end

  def self.find_by_taxonomy(taxonomy)
    self.all.select { |animal| animal.classe == taxonomy }.sort.uniq
  end
end


