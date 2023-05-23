require "rails_helper"

RSpec.describe Ingredient, type: :feature do
  
  describe "ingredients index" do
    before :each do 
      @tomatoes = Ingredient.create!(name: "tomatoes", cost: 5)
      @oil = Ingredient.create!(name: "olive oil", cost: 4)
      @beef = Ingredient.create!(name: "ground beef", cost: 10)
      @pasta = Ingredient.create!(name: "spaghetti", cost: 2)
    end
    it "has list of all ingredients" do
      visit "/ingredients"

      expect(page).to have_content("Name: #{@tomatoes.name}")
      expect(page).to have_content("Cost: #{@tomatoes.cost}")

      expect(page).to have_content("Name: #{@oil.name}")
      expect(page).to have_content("Cost: #{@oil.cost}")

      expect(page).to have_content("Name: #{@beef.name}")
      expect(page).to have_content("Cost: #{@beef.cost}")

      expect(page).to have_content("Name: #{@pasta.name}")
      expect(page).to have_content("Cost: #{@pasta.cost}")
    end

    it "lists ingredients alphabetically" do
      visit "/ingredients"


    end
  end
end