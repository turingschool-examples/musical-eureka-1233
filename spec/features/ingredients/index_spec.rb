require "rails_helper"

RSpec.describe "Ingredients Index Page", type: :feature do
  let!(:ingredient1) { Ingredient.create!(name: "Peach", cost: "5")}

  describe "ingredients listed" do
    it "should display the list of ingredients including their name and cost" do
      visit "/ingredients"
      
      expect(page).to have_content("Ingredients Index Page")
      
      expect(page).to have_content(ingredient1.name)
      expect(page).to have_content(ingredient1.cost)
    end
  end
end

# User Story 1 - Ingredients Index

# As a visitor,
# When I visit '/ingredients'
# I see a list of all the ingredients including their name and cost
# (e.g. "Ground Beef: 2"
#      "Salt: 4")