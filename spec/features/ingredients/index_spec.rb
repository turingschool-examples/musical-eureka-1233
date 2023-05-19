require "rails_helper"

RSpec.describe "ingredients index page", type: :feature do
  before :each do
    @beef = Ingredient.create!(name: "Beef", cost: 4)
    @potatoes = Ingredient.create!(name: "Potatoes", cost: 6)
    @salt = Ingredient.create!(name: "Salt", cost: 2)
  end
  describe "/ingredients" do
    it "lists all ingredients including their name and cost" do
      visit "/ingredients"

      expect(page).to have_content("Name: Beef")
      expect(page).to have_content("Cost: 4")
      expect(page).to have_content("Name: Potatoes")
      expect(page).to have_content("Cost: 6")
      expect(page).to have_content("Name: Salt")
      expect(page).to have_content("Cost: 2")
    end
  end
end