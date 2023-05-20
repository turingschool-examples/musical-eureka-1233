# User Story 1 - Ingredients Index

# As a visitor,
# When I visit '/ingredients'
# I see a list of all the ingredients including their name and cost
# (e.g. "Ground Beef: 2"
#      "Salt: 4")

require "rails_helper"

RSpec.describe "Ingredients Index Page" do 
  describe " /ingredients" do
    before(:each) do
      @ing1 = Ingredient.create!(name: "Ground Beef", cost: 2)
      @ing2 = Ingredient.create!(name: "Salt", cost: 4)
      @ing3 = Ingredient.create!(name: "Lettuce", cost: 8)
    end

    it "displays a list of all the ingredients with name and cost" do
      visit "/ingredients"

      expect(page).to have_content("Ground Beef: 2")
      expect(page).to have_content("Salt: 4")
      expect(page).to have_content("Lettuce: 8")
      

    end
  end
end