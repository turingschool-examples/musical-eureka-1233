# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Ingredient.destroy_all
Recipe.destroy_all
RecipeIngredient.destroy_all

recipe_1 = Recipe.create!(name: "baked ziti", complexity: 2, genre: "italian")
recipe_2 = Recipe.create!(name: "tamale pie", complexity: 1, genre: "mexican")
garlic = recipe_1.ingredients.create!(name: "garlic, cost: 1")
turkey = recipe_1.ingredients.create!(name: "ground turkey, cost: 6")
pasta = recipe_1.ingredients.create!(name: "penne", cost: 3)


recipe_ingredients_1 = RecipeIngredient.create!(recipe_id: recipe_1.id, ingredient_id: garli.id) 