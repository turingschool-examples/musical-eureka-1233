require "rails_helper"

RSpec.describe "ingredients index page" do
  let!(:ingredient_1) { Ingredient.create!(name: "Garlic Powder", cost: 1)}
  let!(:ingredient_2) { Ingredient.create!(name: "Beans", cost: 3)}

  it "displays all of the ingredients and their cost" do
    visit "/ingredients"

    expect(page).to have_content("#{ingredient_1.name}: #{ingredient_1.cost}")
    expect(page).to have_content("#{ingredient_2.name}: #{ingredient_2.cost}")
  end
end