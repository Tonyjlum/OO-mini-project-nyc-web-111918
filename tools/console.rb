require_relative '../config/environment.rb'


u1 = User.new("Tony")
u2 = User.new("Heather")

r1 = Recipe.new("Apple Salmon Roll")
r2 = Recipe.new("Volcano Roll")
r3 = Recipe.new("Cali Roll")
r4 = Recipe.new("Spicy Tuna Roll")
r5 = Recipe.new("Eel Cucumber")
r6 = Recipe.new("Miso Soup")

rc1 = RecipeCard.new(u1, r2, Time.now, 5)
rc2 = RecipeCard.new(u2, r1, Time.now, 5)
rc3 = RecipeCard.new(u1, r1, Time.now, 1)
rc4 = RecipeCard.new(u2, r3, Time.now, 5)
rc5 = RecipeCard.new(u1, r4, Time.now, 3)
rc6 = RecipeCard.new(u2, r4, Time.now, 2)
rc7 = RecipeCard.new(u1, r5, Time.now, 4)
rc8 = RecipeCard.new(u2, r6, Time.now, 4)


i1 = Ingredient.new("apples")
i2 = Ingredient.new("salmon")
i3 = Ingredient.new("poison")
i4 = Ingredient.new("rice")

a1 = Allergen.new(u1, i1)
a2 = Allergen.new(u2, i1)
a3 = Allergen.new(u1, i3)
a4 = Allergen.new(u2, i3)

ri1 = RecipeIngredient.new(r1, i1)
ri2 = RecipeIngredient.new(r2, i2)

r1.add_ingredients([i2, i4])
binding.pry
