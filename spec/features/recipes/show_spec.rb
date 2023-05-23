# User Story 2 - Recipes Show

# As a visitor,
# When I visit '/recipes/:id',
# Then I see the recipe's name, complexity and genre,
# and I see a list of the names of the ingredients for the recipe.
# `
require "rails_helper"

RSpec.describe "Recipe Show Page", type: :feature do
  let!(:ingredient1) { Ingredient.create!(name: "Peach", cost: "3")}
  let!(:ingredient2) { Ingredient.create!(name: "Cheese", cost: "5")}
  let!(:recipe1) { Recipe.create!(name: "Burrito", complexity: 3, genre: "Mexican")}
  let!(:recipe_ingredient1) { recipe1.recipe_ingredients.create!(ingredient: ingredient1)}
  let!(:recipe_ingredient2) { recipe1.recipe_ingredients.create!(ingredient: ingredient2)}
  
  describe "Recipes listed" do
    it "should display the recipe's name, complexity and genre, and I see a list of the names of the ingredients for the recipe" do
      visit "/recipes/#{recipe1.id}"

      expect(page).to have_content("Recipes")
      
      expect(page).to have_content(recipe1.name)
      expect(page).to have_content(recipe1.complexity)
      expect(page).to have_content(recipe1.genre)
      
      expect(page).to have_content(ingredient1.name)
      expect(page).to have_content(ingredient1.cost)
      expect(page).to have_content(ingredient2.name)
      expect(page).to have_content(ingredient2.cost)
    end

    it "should display total cost of all ingredients in recipe" do
      visit "/recipes/#{recipe1.id}"

      expect(page).to have_content("Total Cost: 8")
    end
  end
end