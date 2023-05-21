require "rails_helper"
RSpec.describe "/recipe:id", type: :feature do
  # User Story 2 - Recipes Show

  # As a visitor,
  # When I visit '/recipes/:id',
  # Then I see the recipe's name, complexity and genre,
  # and I see a list of the names of the ingredients for the recipe.

  let!(:recipe_1) { Recipe.create!(name: "baked ziti", complexity: 2, genre: "italian") }
  let!(:recipe_2) { Recipe.create!(name: "tamale pie", complexity: 1, genre: "mexican") }
  
  let!(:garlic) { recipe_1.ingredients.create!(name: "garlic", cost: 1) }
  let!(:turkey) { recipe_1.ingredients.create!(name: "ground turkey", cost: 6) }
  let!(:pasta) { recipe_1.ingredients.create!(name: "penne", cost: 3) }

  it 'lists the recipe info and the list of ingredients)' do
    visit "/recipes/#{recipe_1.id}"
    save_and_open_page

    within("#recipe-#{recipe_1.id}") do
    expect(page).to have_content(recipe_1.name)
    expect(page).to have_content(recipe_1.complexity)
    expect(page).to have_content(recipe_1.genre)
    expect(page).to have_content("garlic")
    expect(page).to have_content("ground turkey")
    expect(page).to have_content("penne")
    end
  end
end