class Ingredient
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.allergen_hash
    a_hash = Hash.new(0)
    Allergen.all.map do |allergen|
      a_hash[allergen.ingredient] += 1
    end
    a_hash
  end

  def self.sort_allergen_hash
    allergen_hash.sort_by do |ingredient, quantity|
      quantity
    end
  end

  def self.most_common_allergen
    sort_allergen_hash.last[0]
  end
end
