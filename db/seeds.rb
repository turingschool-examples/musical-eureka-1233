RecipeIngredient.destroy_all
Ingredient.destroy_all
Recipe.destroy_all

@beef = Ingredient.create!(name: "Ground Beef", cost: 4)
@cheese = Ingredient.create!(name: "Yellow Kind", cost: 2)
@tomato = Ingredient.create!(name: "Big Tomato", cost: 5)
@bun = Ingredient.create!(name: "Burger Bun", cost: 1)
@bread = Ingredient.create!(name: "Bread", cost: 3)

@burger = Recipe.create!(name: "Burger", complexity: 4, genre: "American")
@gc = Recipe.create!(name: "Grilled Cheese", complexity: 2, genre: "American")
@struggle = Recipe.create!(name: "Struggle", complexity: 1, genre: "All")

RecipeIngredient.create!(recipe: @burger, ingredient: @beef)
RecipeIngredient.create!(recipe: @burger, ingredient: @cheese)
RecipeIngredient.create!(recipe: @burger, ingredient: @tomato)
RecipeIngredient.create!(recipe: @burger, ingredient: @bun)

RecipeIngredient.create!(recipe: @gc, ingredient: @bread)
RecipeIngredient.create!(recipe: @gc, ingredient: @cheese)

RecipeIngredient.create!(recipe: @struggle, ingredient: @bread)