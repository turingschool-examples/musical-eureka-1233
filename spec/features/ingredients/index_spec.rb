require "rails_helper"

RSpec.describe "the ingredients index page" do
  let!(:ingredient_1) { Ingredient.create(name: "Ground Beef", cost: 3) }
  let!(:ingredient_2) { Ingredient.create(name: "Bread", cost: 1) }
  let!(:ingredient_3) { Ingredient.create(name: "Cheese", cost: 2) }

  before(:each) do
    visit "/ingredients"
  end

  it "lists all ingredients and their cost" do
    expect(page).to have_content("All Ingredients")
    expect(page).to have_content(ingredient_1.name)
    expect(page).to have_content("Cost: $#{ingredient_1.cost}")
    expect(page).to have_content(ingredient_2.name)
    expect(page).to have_content("Cost: $#{ingredient_2.cost}")
    expect(page).to have_content(ingredient_3.name)
    expect(page).to have_content("Cost: $#{ingredient_3.cost}")
  end
end
