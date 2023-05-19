require "rails_helper"

RSpec.describe "Recipe Show Page", type: :feature do
  before(:each) do
    @filet_mignon = Recipe.create!(name: "Filet Mignon", complexity: "5", genre: "Fancy")

    @filet_mignon_meat = @filet_mignon.ingredients.create!(name: "Filet Mignon Meat", cost: 50)
    @butter = @filet_mignon.ingredients.create!(name: "Butter", cost: 2)
  end

  describe "/recipes/:id" do
    it "displays the recipe's name, complexity, and genre" do
      visit "/recipes/#{@filet_mignon.id}"
      save_and_open_page
      expect(page).to have_content("Filet Mignon")
      expect(page).to have_content("Complexity: 5")
      expect(page).to have_content("Genre: Fancy")

      expect(page).to have_content("Filet Mignon Meat")
      expect(page).to have_content("Butter")
    end
  end
end