
class Taxonomy
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def id
    to_id(@name)
  end
  
  def to_s
    @name
  end
  
  def <=>(taxonomy)
    self.name <=> taxonomy.name
  end

  def animals
    Animal.find_by_taxonomy(@name)
  end

  def self.find_by_id(id)
    self.all.find { |taxonomy| taxonomy.id == id }
  end

  def self.all
    Animal.all.collect { |animal| animal.classe }.sort.uniq.collect { |name| Taxonomy.new(name) }
  end
end


