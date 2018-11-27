class Recipe
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end


  def recipe_cards
    RecipeCard.all.select do |recipe_card|
      recipe_card.recipe == self
    end
  end

  def users
    recipe_cards.map do |rc|
      rc.user
    end
  end

  def recipe_ingredient
    RecipeIngredient.all.select do |ri|
      ri.recipe == self
    end
  end

  def ingredients
    recipe_ingredient.map do |ri|
      ri.ingredient
    end
  end

  def allergens
    Allergen.all.select do |alg|
      ingredients.include?(alg.ingredient)
    end
  end

  def add_ingredients(ingredients_array)
    ingredients_array.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end

  def self.recipe_card_count_hash
   rc_hash = Hash.new(0)
   RecipeCard.all.each do |rc|
     rc_hash[rc.recipe] += 1
   end
   rc_hash
  end

  def self.most_popular
    sorted_rc_hash.last[0]
  end

  def self.sorted_rc_hash
    recipe_card_count_hash.sort_by do |k, v|
      v
    end
  end

end
