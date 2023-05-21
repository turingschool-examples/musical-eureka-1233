require "rails_helper"

RSpec.describe "/ingredients", type: :feature do
  describe "As a visitor, when I visit the ingredients index page" do
    before(:each) do
      @ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 2)
      @ingredient_2 = Ingredient.create!(name: "Salt", cost: 4)
      @ingredient_3 = Ingredient.create!(name: "Butter", cost: 5)

      visit "/ingredients"
    end

    it "will list of all the ingredients including their name and cost" do
      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_1.cost)
      
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to have_content(@ingredient_2.cost)

      expect(page).to have_content(@ingredient_3.name)
      expect(page).to have_content(@ingredient_3.cost)
    end
  end
end