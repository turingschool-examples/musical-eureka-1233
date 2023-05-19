# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
    recipe_1 = Recipe.create!(name: "Cheeseburgers", complexity: 1, genre: "BBQ")
    ingredient_1 = recipe_1.ingredients.create!(name: "Cheese", cost: 4)
    ingredient_2 = recipe_1.ingredients.create!(name: "Burger", cost: 10)
    ingredient_3 = recipe_1.ingredients.create!(name: "Buns", cost: 3)
    recipe_2 = Recipe.create!(name: "Ravioli", complexity: 3, genre: "Italian")
    ingredient_4 = recipe_2.ingredients.create!(name: "Flour", cost: 5)
    ingredient_5 = recipe_2.ingredients.create!(name: "Water", cost: 0)
    ingredient_6 = recipe_2.ingredients.create!(name: "Cheese", cost: 6)