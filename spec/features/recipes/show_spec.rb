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
      recipe_2 = Recipe.create!(name: "Penut Butter", complexity: 5, genre: "Wicked Impressive")

      visit "/recipes/#{recipe_1.id}"
      expect(page).to have_content("Recipe Name: #{recipe_1.name}")
      expect(page).to have_content("Complexity: #{recipe_1.complexity}")
      expect(page).to have_content("Genre: #{recipe_1.genre}")

      expect(page).not_to have_content("Recipe Name: #{recipe_2.name}")
      expect(page).not_to have_content("Complexity: #{recipe_2.complexity}")
      expect(page).not_to have_content("Genre: #{recipe_2.genre}")

      visit "/recipes/#{recipe_2.id}"

      expect(page).to have_content("Recipe Name: #{recipe_2.name}")
      expect(page).to have_content("Complexity: #{recipe_2.complexity}")
      expect(page).to have_content("Genre: #{recipe_2.genre}")

    end

    it "displays a list of each recipes ingredients" do
      recipe_1 = Recipe.create!(name: "Ground Beef and Salt", complexity: 4, genre: "Impressive")
      recipe_2 = Recipe.create!(name: "Penut Butter", complexity: 5, genre: "Wicked Impressive")

      beef = Ingredient.create!(name: "Ground Beef", cost: 2)
      salt = Ingredient.create!(name: "Salt", cost: 4)
      penuts = Ingredient.create!(name: "Penut", cost: 7)


      rec_ing_1 = RecipeIngredient.create!(recipe_id: recipe_1.id, ingredient_id: beef.id)
      rec_ing_2 = RecipeIngredient.create!(recipe_id: recipe_1.id, ingredient_id: salt.id)

      rec_ing_3 = RecipeIngredient.create!(recipe_id: recipe_2.id, ingredient_id: penuts.id)
      rec_ing_4 = RecipeIngredient.create!(recipe_id: recipe_2.id, ingredient_id: salt.id)

      visit "/recipes/#{recipe_1.id}"
      expect(page).to have_content(rec_ing_1.ingredient.name)
      expect(page).to have_content(rec_ing_2.ingredient.name)

      expect(page).not_to have_content(rec_ing_3.ingredient.name)
      expect(page).not_to have_content(rec_ing_4.ingredient.id)

      visit "/recipes/#{recipe_2.id}"
      expect(page).to have_content(rec_ing_3.ingredient.name)
      expect(page).to have_content(rec_ing_4.ingredient.name)

      expect(page).not_to have_content(rec_ing_1.ingredient.name)
      expect(page).not_to have_content(rec_ing_2.ingredient.id)
    end
  end
end