require 'rails_helper'

RSpec.describe 'Recipes Show Page' do 
  # User Story 2 - Recipes Show

  # As a visitor,
  # When I visit '/recipes/:id',
  # Then I see the recipe's name, complexity and genre,
  # and I see a list of the names of the ingredients for the recipe.

  describe 'Show Page' do 
    it 'shows the recipe info ' do 
    recipe = Recipe.create!(name: "Crispy Pork Belly", complexity: 3, genre: "Awesome")

    visit "/recipes/#{recipe.id}"

    expect(page).to have_content("Crispy Pork Belly")
    expect(page).to have_content("Recipe Complexity: 3")
    expect(page).to have_content("Recipe Genre: Awesome")
  end

    it 'shows the ingredients used in recipe' do 
      recipe = Recipe.create!(name: "Crispy Pork Belly", complexity: 3, genre: "Awesome")
      ingredient_1 = recipe.ingredients.create!(name: "Pork Belly", cost: 11)
      ingredient_2 = recipe.ingredients.create!(name: "Salt", cost: 100)

      visit "/recipes/#{recipe.id}"

      expect(page).to have_content("Pork Belly")
      expect(page).to have_content("Salt")
    end

    it 'shows the total cost of the ingredients' do 
      recipe = Recipe.create!(name: "Crispy Pork Belly", complexity: 3, genre: "Awesome")
      ingredient_1 = recipe.ingredients.create!(name: "Pork Belly", cost: 11)
      ingredient_2 = recipe.ingredients.create!(name: "Salt", cost: 100)

      visit "/recipes/#{recipe.id}"

      expect(page).to have_content("Total Cost: 111")
    end
  end 


end