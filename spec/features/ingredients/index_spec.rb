require "rails_helper"

RSpec.describe "/ingredients Show Page" do
  before(:each) do
    @ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 2)
    @ingredient_2 = Ingredient.create!(name: "Salt", cost: 4)
  end

  it "displays a list of all ingredients including name and cost" do
    visit "/ingredients"
    
    expect(page).to have_content("#{@ingredient_1.name}: #{@ingredient_1.cost}")
    expect(page).to have_content("#{@ingredient_2.name}: #{@ingredient_2.cost}")
  end
end