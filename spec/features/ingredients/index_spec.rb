require "rails_helper"

RSpec.describe "/ingredients", type: :feature do
  # User Story 1 - Ingredients Index

  # As a visitor,
  # When I visit "/ingredients"
  # I see a list of all the ingredients including their name and cost
  # (e.g. "Ground Beef: 2"
  #      "Salt: 4")

  describe "as a visitor, when I visit the ingredients index page" do
    it "displays a list of all ingredients including their name and cost" do
      beef = Ingredient.create!(name: "Ground Beef", cost: 2)
      salt = Ingredient.create!(name: "Salt", cost: 4)

      visit "/ingredients"
      expect(page). to have_content("Name: #{beef.name}")
      expect(page). to have_content("Cost: #{beef.cost}")

      expect(page). to have_content("Name: #{salt.name}")
      expect(page). to have_content("Cost: #{salt.cost}")
    end
  end
end