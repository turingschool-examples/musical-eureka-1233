require "rails_helper"

RSpec.describe "Recipes show page" do
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
end