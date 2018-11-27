class User
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
       recipe_card.user == self
    end
  end

 def recipes
   recipe_cards.map do |rc|
     rc.recipe
   end
 end

 def add_recipe_card(recipe, date, rating)
   RecipeCard.new(self, recipe, date, rating)
 end

 def declare_allergen(ingredient)
   Allergen.new(self, ingredient)
 end

 def all_allergens
   Allergen.all.select do |allergen|
     allergen.user == self
   end
 end

 def allergens
   all_allergens.map do |allergen|
     allergen.ingredient
   end
 end

 def top_three_recipes
 recipes_by_rating[-3..-1]
 end

 def recipe_cards_sorted_by_rating
   recipe_cards.sort_by do |rc|
     rc.rating
 end
end

def recipes_by_rating
 recipe_cards_sorted_by_rating.map do |recipe_cards|
   recipe_cards.recipe
 end
end

def most_recent_recipe
recipe_cards.last.recipe
end

end
