require "rails_helper"

RSpec.describe "all ingredients can be displayed" do
  it "can display all ingredients" do
    ingredient_1 = Ingredient.create!(name: "Cheese", cost: 4)
    ingredient_2 = Ingredient.create!(name: "Burger", cost: 10)
    ingredient_3 = Ingredient.create!(name: "Buns", cost: 3)
    visit "/ingredients"
    expect(current_path).to eq("/ingredients")
    expect(page).to have_content("Name: Cheese")
    expect(page).to have_content("Cost: 4")
    expect(page).to have_content("Name: Burger")
    expect(page).to have_content("Cost: 10")
    expect(page).to have_content("Name: Buns")
    expect(page).to have_content("Cost: 3")

  end
end
    