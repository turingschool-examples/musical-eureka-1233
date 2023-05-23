require "rails_helper"

RSpec.describe "the ingredients index" do
  before(:each) do
    @beef = Ingredient.create!(name: "Ground Beef", cost: 2)
    @salt = Ingredient.create!(name: "Salt", cost: 4)
    @flour = Ingredient.create!(name: "Flour", cost: 6)

    visit "/ingredients"
  end

  it "lists all the ingredients with their attributes" do
    expect(page).to have_content("Name: #{@beef.name}")
    expect(page).to have_content("Cost: #{@beef.cost}")

    expect(page).to have_content("Name: #{@salt.name}")
    expect(page).to have_content("Cost: #{@salt.cost}")
    
    expect(page).to have_content("Name: #{@flour.name}")
    expect(page).to have_content("Cost: #{@flour.cost}")
  end
end