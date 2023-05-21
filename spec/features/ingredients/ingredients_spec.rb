require "rails_helper"

RSpec.describe "the ingredients index" do
# User Story 1 - Ingredients Index
  it "displays ingredients" do 
    ingredient1 = Ingredient.create!(name: "Pasta", cost: 2)
    ingredient2 = Ingredient.create!(name: "Garlic", cost: 3)

    visit "/ingredients"

    expect(page).to have_content(ingredient1.name)
    expect(page).to have_content(ingredient1.cost)
    expect(page).to have_content(ingredient2.name)
    expect(page).to have_content(ingredient2.cost)
  end

# Extension 1 - Ingredients Sorted Alphabetically
  it "displays ingredients in alphabetical order" do 
    ingredient1 = Ingredient.create!(name: "Pasta", cost: 2)
    ingredient2 = Ingredient.create!(name: "Garlic", cost: 3)

    visit "/ingredients"
    
    expect(page).to have_content(ingredient2.name)
    expect(page).to have_content(ingredient1.name)
    ingredient_names = page.all(".ingredient-name").map(&:text)
    expect(ingredient_names).to eq(ingredient_names.sort)
  end
end
