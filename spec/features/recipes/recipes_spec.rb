require "rails_helper"

RSpec.describe "the recipes show page" do
# User Story 2 - Recipes Show
  it "displays recipe details and a list of ingredients" do 
    recipe1 = Recipe.create!(name: "Garlic Pasta", complexity: 2, genre: "Italian")
    ingredient1 = Ingredient.create!(name: "Pasta", cost: 2)
    ingredient2 = Ingredient.create!(name: "Garlic", cost: 3)

    visit "/recipes/#{recipe1.id}"

    expect(page).to have_content(recipe1.name)
    expect(page).to have_content(recipe1.complexity)
    expect(page).to have_content(recipe1.genre)
    expect(page).to have_content(ingredient1.name)
    expect(page).to have_content(ingredient2.name)
    save_and_open_page
  end
end
