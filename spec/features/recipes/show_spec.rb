require "rails_helper"

RSpec.describe "recipes show page" do
  let!(:recipe) { Recipe.create!(name: "Garlic Beans", complexity: 1, genre: "Legumes")}
  let!(:ingredient_1) { recipe.ingredients.create!(name: "Garlic Powder", cost: 1)}
  let!(:ingredient_2) { recipe.ingredients.create!(name: "Beans", cost: 3)}

  it "displays a specific recipes name, complexity, genre and list of ingredients" do
    visit "/recipes/#{recipe.id}"

    expect(page).to have_content("#{recipe.name}")
    expect(page).to have_content("Complexity: #{recipe.complexity}")
    expect(page).to have_content("Genre: #{recipe.genre}")
    expect(page).to have_content("Ingredients:")
    expect(page).to have_content("Beans")
    expect(page).to have_content("Garlic Powder")
  end
end