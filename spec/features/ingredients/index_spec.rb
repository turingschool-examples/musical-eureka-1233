require "rails_helper"

RSpec.describe "/ingredients, ingredients index page", type: :feature do
  before(:each) do
    @ingredient1 = Ingredient.create!(name: "Ground Beef", cost: 2)
    @ingredient2 = Ingredient.create!(name: "Salt", cost: 4)
  end
  
  describe "as a visitor to /ingredients page" do
    it "should see a list of all ingredients and their attributes" do
      visit "/ingredients"
      
      expect(page).to have_content("All Ingredients")
      expect(page).to have_content(@ingredient1.name)
      expect(page).to have_content(@ingredient1.cost)
      expect(page).to have_content(@ingredient2.name)
      expect(page).to have_content(@ingredient2.cost)
    end
  end
end