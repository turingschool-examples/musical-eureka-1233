require "rails_helper"

RSpec.describe "Recipes show page" do
  # As a visitor,
  # When I visit '/recipes/:id',
  # Then I see the recipe's name, complexity and genre,
  # and I see a list of the names of the ingredients for the recipe.
  it "can display recipes details" do
    recipe_1 = Recipe.create!(name: "Cheeseburgers", complexity: 1, genre: "BBQ")
    
    visit "/recipes/#{recipe_1.id}"
    
    expect(page).to have_content("Name: Cheeseburgers")
    expect(page).to have_content("Complexity: 1")
    expect(page).to have_content("Genre: BBQ")

    recipe_2 = Recipe.create!(name: "Ravioli", complexity: 3, genre: "Italian")
    visit "/recipes/#{recipe_2.id}"
    expect(page).to have_content("Name: Ravioli")
    expect(page).to have_content("Complexity: 3")
    expect(page).to have_content("Genre: Italian")
  end

  it "can get total cost" do
    recipe_1 = Recipe.create!(name: "Cheeseburgers", complexity: 1, genre: "BBQ")
    ingredient_1 = recipe_1.ingredients.create!(name: "Cheese", cost: 4)
    ingredient_2 = recipe_1.ingredients.create!(name: "Burger", cost: 10)
    ingredient_3 = recipe_1.ingredients.create!(name: "Buns", cost: 3)
    visit "/recipes/#{recipe_1.id}"
    expect(page).to have_content("Cost: 17")

    recipe_2 = Recipe.create!(name: "Ravioli", complexity: 3, genre: "Italian")
    ingredient_4 = recipe_2.ingredients.create!(name: "Flour", cost: 5)
    ingredient_5 = recipe_2.ingredients.create!(name: "Water", cost: 0)
    ingredient_6 = recipe_2.ingredients.create!(name: "Cheese", cost: 6)
    visit "/recipes/#{recipe_2.id}"
    expect(page).to have_content("Cost: 11")
  end

end