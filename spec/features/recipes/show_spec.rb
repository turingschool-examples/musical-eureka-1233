require "rails_helper"

RSpec.describe "/recipes/:id", type: :feature do
  # User Story 2 - Recipes Show

  # As a visitor,
  # When I visit '/recipes/:id',
  # Then I see the recipe's name, complexity and genre,
  # and I see a list of the names of the ingredients for the recipe.

  describe 'as a visitor, when I visit the recipes show page' do
    it 'displays a recipes name, complexity and genre' do
      recipe_1 = Recipe.create!(name: "Ground Beef and Salt", complexity: 4, genre: "Impressive")

      visit "/recipes/:id"
      expect(page).to have_content("Recipe Name: #{recipe_1.name}")
      expect(page).to have_content("Complexity: #{recipe_1.complexity}")
      expect(page).to have_content("Genre: #{recipe_1.genre}")

    end

    it "displays a list of each recipes ingredients" do
      
    end
  end
end