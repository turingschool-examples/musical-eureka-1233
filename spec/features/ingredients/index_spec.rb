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
  end
end