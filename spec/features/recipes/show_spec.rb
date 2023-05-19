require "rails_helper"

RSpec.describe "Recipe Show Page", type: :feature do
  before(:each) do
    @filet_mignon = Recipe.create!(name: "Filet Mignon", complexity: "5", genre: "Fancy")
    @spaghetti = Recipe.create!(name: "Spaghetti", complexity: 1, genre: "Italian")

    @filet_mignon_meat = @filet_mignon.ingredients.create!(name: "Filet Mignon Meat", cost: 50)
    @butter = @filet_mignon.ingredients.create!(name: "Butter", cost: 2)
    @noodles = @spaghetti.ingredients.create!(name: "Noodles", cost: 4)
    @sauce = @spaghetti.ingredients.create!(name: "Sauce", cost: 3)
  end

  describe "/recipes/:id" do
    it "displays the recipe's name, complexity, and genre" do
      visit "/recipes/#{@filet_mignon.id}"

      expect(page).to have_content("Filet Mignon")
      expect(page).to have_content("Complexity: 5")
      expect(page).to have_content("Genre: Fancy")

      expect(page).to have_content("Filet Mignon Meat")
      expect(page).to have_content("Butter")
    end

    it "displays the total cost of all ingredients in a recipe" do
      visit "/recipes/#{@filet_mignon.id}"
      expect(page).to have_content("Total Cost: 52")

      visit "/recipes/#{@spaghetti.id}"
      expect(page).to have_content("Total Cost: 7")
    end
  end
end