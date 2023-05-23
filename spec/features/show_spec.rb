require "rails_helper"

RSpec.describe "Recipes", type: :feature do
  describe "Recipes Show" do
    it "displays the recipe's name, complexity, genre, and ingredient names" do
      recipe = Recipe.create(name: "Spaghetti Bolognese", complexity: "Medium", genre: "Italian")
      ingredient1 = Ingredient.create(name: "Ground Beef", cost: 2)
      ingredient2 = Ingredient.create(name: "Salt", cost: 4)
      recipe.ingredients << [ingredient1, ingredient2]

      visit "/recipes/#{recipe.id}"

      expect(page).to have_content(recipe.name)
      expect(page).to have_content(recipe.complexity)
      expect(page).to have_content(recipe.genre)
      expect(page).to have_content(ingredient1.name)
      expect(page).to have_content(ingredient2.name)
    end
  end
end