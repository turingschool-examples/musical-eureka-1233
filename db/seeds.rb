# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
    @ingredient_1 = Ingredient.create!(name: "Bison Brisket", cost: 25)
    @ingredient_2 = Ingredient.create!(name: "Potatoes", cost: 4)
    @spaghetti = Recipe.create!(name: 'Spaghetti', complexity: 2, genre: 'Feels good')
    @cornbread = Recipe.create!(name: 'Cornbread', complexity: 2, genre: 'Soul Food')
    @beans = Recipe.create!(name: 'Beans', complexity: 3, genre: 'Comfort Food')
    @borscht = Recipe.create!(name: 'Borscht', complexity: 3, genre: 'Feels good')

    @ground_beef = Ingredient.create!(name: 'ground beef', cost: 15)
    @garlic = Ingredient.create!(name: 'garlic', cost: 3)
    @onion = Ingredient.create!(name: 'onion', cost: 4)
    @salt = Ingredient.create!(name: 'salt', cost: 2)
    @cornmeal = Ingredient.create!(name: 'cornmeal', cost: 10)
    @fatback = Ingredient.create!(name: 'fatback', cost: 8)
    @butter = Ingredient.create!(name: 'butter', cost: 25)
    @beets = Ingredient.create!(name: 'beets', cost: 7)
    @pintos = Ingredient.create!(name: 'pintos', cost: 5)
    @tomatoes = Ingredient.create!(name: 'tomatoes', cost: 10)