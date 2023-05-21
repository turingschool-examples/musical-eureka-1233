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
  end

# User Story 3 - Total Cost
  it "displays the total cost of all of the ingredients" do 
    recipe1 = Recipe.create!(name: "Garlic Pasta", complexity: 2, genre: "Italian")
    ingredient1 = Ingredient.create!(name: "Pasta", cost: 2)
    ingredient2 = Ingredient.create!(name: "Garlic", cost: 3)

    visit "/recipes/#{recipe1.id}"

    expect(page).to have_content("Total Cost: 5")
  end
  
  # Extension 2 - Add an Ingredient to a Recipe
  it "has a form to add an ingredient to a recipe" do 
    recipe1 = Recipe.create!(name: "Garlic Pasta", complexity: 2, genre: "Italian")
    ingredient1 = Ingredient.create!(name: "Pasta", cost: 2)
    ingredient2 = Ingredient.create!(name: "Garlic", cost: 3)

    visit "/recipes/#{recipe1.id}"

    expect(page).to_not have_content("Butter")
    expect(page).to have_field("Add Ingredient")

    ingredient3 = Ingredient.create!(name: "Butter", cost: 4)

    fill_in "add_ingredient", with: "#{ingredient3.id}"
    click_on "Submit"
    visit "/recipes/#{recipe1.id}"

    expect(page).to have_content("Butter")
  end
end
