require "rails_helper"

RSpec.describe "Ingredient Index page '/ingredient'", type: :feature do
  before(:each) do
    test_data
  end

  describe "When I visit '/ingredients'" do
    it "I see all ingredient names and costs for each" do
      visit '/ingredients'

      within "#ingredient_#{@beef.id}" do
        expect(page).to have_content("Name: #{@beef.name}")
        expect(page).to have_content("Cost: #{@beef.cost}")
        expect(page).to_not have_content("Name: #{@cheese.name}")
      end
      within "#ingredient_#{@cheese.id}" do
        expect(page).to have_content("Name: #{@cheese.name}")
        expect(page).to have_content("Cost: #{@cheese.cost}")
        expect(page).to_not have_content("Name: #{@beef.name}")
      end
      within "#ingredient_#{@bun.id}" do
        expect(page).to have_content("Name: #{@bun.name}")
        expect(page).to have_content("Cost: #{@bun.cost}")
        expect(page).to_not have_content("Name: #{@tomato.name}")
      end
    end
  end
end