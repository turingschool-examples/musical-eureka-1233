require "rails_helper"



# As a visitor,
# When I visit '/ingredients'
# I see a list of all the ingredients including their name and cost
# (e.g. "Ground Beef: 2"
#      "Salt: 4")
#US 1
RSpec.describe "the Ingredient Index page" do
  let!(:ingredient_1) { Ingredient.create!(name: "Ground Beef", cost: "2")}
  let!(:ingredient_2) { Ingredient.create!(name: "Salt", cost: "4")}

  describe "When a visitor visits the index page" do
    it "should display all the ingredients, including their name and cost" do
      visit "/ingredients"
      
      expect(page).to have_content("Ground Beef")
      expect(page).to have_content("Salt")
      expect(page).to have_content("2")
      expect(page).to have_content("4")
      expect(page).to_not have_content("Chicken")
      expect(page).to_not have_content("3")
    end
  end
end