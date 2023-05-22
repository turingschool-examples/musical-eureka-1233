# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@ingredient_1 = Ingredient.create!(name: "TVP", cost: 3)
@ingredient_2 = Ingredient.create!(name: "Celery", cost: 1)
@ingredient_3 = Ingredient.create!(name: "Carrots", cost: 2)
@ingredient_4 = Ingredient.create!(name: "Parsnips", cost: 1)
@ingredient_5 = Ingredient.create!(name: "Vital Wheat Gluten", cost: 3)
@ingredient_6 = Ingredient.create!(name: "Onion", cost: 4)
@ingredient_7 = Ingredient.create!(name: "Garlic", cost: 2)
@ingredient_8 = Ingredient.create!(name: "Fennel", cost: 2)
@ingredient_9 = Ingredient.create!(name: "Liquid Smoke", cost: 5)

@ingredient_10 = Ingredient.create!(name: "Silken Tofu", cost: 1)
@ingredient_18 = Ingredient.create!(name: "Dark Chocolate", cost: 4)
@ingredient_11 = Ingredient.create!(name: "Sea Salt", cost: 2)
@ingredient_12 = Ingredient.create!(name: "Maple Syrup", cost: 5)

@ingredient_13 = Ingredient.create!(name: "Miso Paste", cost: 5)
@ingredient_14 = Ingredient.create!(name: "Rice Vinegar", cost: 3)
@ingredient_15 = Ingredient.create!(name: "Soy Sauce", cost: 3)
@ingredient_16 = Ingredient.create!(name: "Toasted Sesame Seed Oil", cost: 4)
@ingredient_17 = Ingredient.create!(name: "Mirin", cost: 4)

@recipe_1 = Recipe.create!(name: "Vegan Meatball Soup", complexity:4, genre: "Soups")
@recipe_2 = Recipe.create!(name: "Chocolate Mousse", complexity:1, genre: "Desserts")
@recipe_3 = Recipe.create!(name: "Miso Dressing", complexity:1, genre: "Sauces")

RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_1)
RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_2)
RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_3)
RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_4)
RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_5)
RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_6)
RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_7)
RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_9)

RecipeIngredient.create!(recipe: @recipe_2, ingredient: @ingredient_10)
RecipeIngredient.create!(recipe: @recipe_2, ingredient: @ingredient_18)
RecipeIngredient.create!(recipe: @recipe_2, ingredient: @ingredient_11)
RecipeIngredient.create!(recipe: @recipe_2, ingredient: @ingredient_12)

RecipeIngredient.create!(recipe: @recipe_3, ingredient: @ingredient_13)
RecipeIngredient.create!(recipe: @recipe_3, ingredient: @ingredient_14)
RecipeIngredient.create!(recipe: @recipe_3, ingredient: @ingredient_15)
RecipeIngredient.create!(recipe: @recipe_3, ingredient: @ingredient_16)
RecipeIngredient.create!(recipe: @recipe_3, ingredient: @ingredient_17)