require "rails_helper"

RSpec.describe "Ingredients index" do 
  describe "Shows all the ingredients" do 
    it "Shows ingredients names and cost" do
      ingredient1 = Ingredient.create!(name: "Spinach", cost: 2)
      ingredient2 = Ingredient.create!(name: "Ground Beef", cost: 5)
      ingredient3 = Ingredient.create!(name: "Chicken Breast", cost: 3)

      visit "/ingredients"

      expect(page).to have_content("Spinach: 2")
      expect(page).to have_content("Ground Beef: 5")
      expect(page).to have_content("Chicken Breast: 3")
    end
  end
end