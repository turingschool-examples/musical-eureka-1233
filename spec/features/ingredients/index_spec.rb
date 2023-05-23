require "rails_helper"



# As a visitor,
# When I visit '/ingredients'
# I see a list of all the ingredients including their name and cost
# (e.g. "Ground Beef: 2"
#      "Salt: 4")
#US 1
RSpec.describe "the Ingredient Index page" do
  let!(:ingredient_1) { Ingredient.create!(name: "Yams", cost: "77")}
  let!(:ingredient_2) { Ingredient.create!(name: "Ground Beef", cost: "2")}
  let!(:ingredient_3) { Ingredient.create!(name: "Salt", cost: "4")}
  
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

  describe "Extention 1" do
    it "As a visitor when I visit the ingredients index page, it displays the list of ingredients alphabetically" do
      visit "/ingredients"
      save_and_open_page

      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(ingredient_2.name)
      expect(page).to have_content(ingredient_3.name)
    end
  end
end