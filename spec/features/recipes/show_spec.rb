require "rails_helper"

RSpec.describe "Recipe show page" do 
  describe "shows recipes by id" do
    it "shows recipes attributes and ingredients" do 
      beef = Ingredient.create!(name: "Ground Beef", cost: 4)
      salt = Ingredient.create!(name: "Salt", cost: 1)
      hamburger = Recipe.create!(name: "Hamburger", complexity: 2, genre: "American")
      recipe_ingredients1 = RecipeIngredient.create!(recipe: hamburger, ingredient: beef)
      recipe_ingredients2 = RecipeIngredient.create!(recipe: hamburger, ingredient: salt)

      visit "/recipes/#{hamburger.id}"

      expect(page).to have_content("Ingredient: Ground Beef")
      expect(page).to have_content("Ingredient: Salt")
      expect(page).to have_content("Recipe: Hamburger")
      expect(page).to have_content("Complexity: 2")
      expect(page).to have_content("Genre: American")
      expect(page).to have_content("Total Cost: 5")

    end
  end
end