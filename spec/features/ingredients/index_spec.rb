require 'rails_helper'

RSpec.describe "Ingredients Index" do 
  # User Story 1 - Ingredients Index

  # As a visitor,
  # When I visit '/ingredients'
  # I see a list of all the ingredients including their name and cost
  # (e.g. "Ground Beef: 2"
  #     "Salt: 4")

  describe 'Index page' do 
    it 'has a list of ingredients and their attributes' do 
      ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 2)
      ingredient_2 = Ingredient.create!(name: "Salt", cost: 100)

      visit '/ingredients'
# save_and_open_page
      expect(page).to have_content("Ground Beef: 2")
      expect(page).to have_content("Salt: 100")
    end

    # Extension 1 - Ingredients Sorted Alphabetically

    # As a visitor,
    # When I visit '/ingredients',
    # Then I see that the list of ingredients is sorted alphabetically by name

    it 'shows the ingredients sorted alphabetically by name' do 
      ingredient_1 = Ingredient.create!(name: "Xantham gum", cost: 2)
      ingredient_2 = Ingredient.create!(name: "Salt", cost: 100)

      visit '/ingredients'

      expect(ingredient_2.name).to appear_before(ingredient_1.name) 
    end
  end
end