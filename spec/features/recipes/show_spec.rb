require "rails_helper"


# User Story 2 - Recipes Show

# As a visitor,
# When I visit '/recipes/:id',
# Then I see the recipe's name, complexity and genre,
# and I see a list of the names of the ingredients for the recipe.

RSpec.describe "Recipes Show page" do
  let!(:ingredient_1) { Ingredient.create!(name: "Ground Beef", cost: "2")}
  let!(:ingredient_2) { Ingredient.create!(name: "Salt", cost: "4")}

  let!(:recipe_1) { Recipe.create!(name: "Hot Juicy Burgers", complexity: "2", genre: "American")}
  let!(:recipe_2) { Recipe.create!(name: "Hummus", complexity: "1", genre: "Middle Eastern")}
  let!(:recipe_ingredient_1) { RecipeIngredient.create!(ingredient_id: ingredient_1.id, recipe_id: recipe_1.id)}
  let!(:recipe_ingredient_2) { RecipeIngredient.create!(ingredient_id: ingredient_2.id, recipe_id: recipe_1.id)}
  describe "when a visitor visits a recipe's show page" do
    it "displays the recipe's name, complexity, and genre. displays list of the names of the ingredients for the recipe" do
      visit "/recipes/#{recipe_1.id}"

      expect(page).to have_content("Hot Juicy Burgers")
      expect(page).to have_content("2")
      expect(page).to have_content("American")
      expect(page).to have_content("Ground Beef")
      expect(page).to have_content("Salt")
      expect(page).to_not have_content("Pizza")
      expect(page).to_not have_content("Hard")
      expect(page).to_not have_content("Japanese")
    end
  end

  describe "User story 3" do
    let!(:ingredient_1) { Ingredient.create!(name: "Ground Beef", cost: "4")}
    let!(:ingredient_2) { Ingredient.create!(name: "Salt", cost: "18")}
    let!(:recipe_1) { Recipe.create!(name: "Hot Juicy Burgers", complexity: "2", genre: "American")}
    let!(:recipe_2) { Recipe.create!(name: "Hummus", complexity: "1", genre: "Middle Eastern")}
    let!(:recipe_ingredient_3) { RecipeIngredient.create!(ingredient_id: ingredient_1.id, recipe_id: recipe_2.id)}
    let!(:recipe_ingredient_4) { RecipeIngredient.create!(ingredient_id: ingredient_2.id, recipe_id: recipe_2.id)}

    it "displays the total cost of all the ingredients in the recipe" do
      visit "/recipes/#{recipe_2.id}"
      save_and_open_page

      expect(page).to have_content("Total Cost:22")
    end
  end
end