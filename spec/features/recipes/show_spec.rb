require "rails_helper"

RSpec.describe "Recipe Show Page", type: :feature do
  before(:each) do
    test_data
  end

  describe "When I visit a recipe show page /recipes/:id" do
    it "shows the recipe name, complexity, and genre" do
      visit "/recipes/#{@burger.id}"

      expect(page).to have_content("Name: #{@burger.name}")
      expect(page).to have_content("Complexity: #{@burger.complexity}")
      expect(page).to have_content("Genre: #{@burger.genre}")
      expect(page).to_not have_content("#{@gc.name}")
      expect(page).to_not have_content("#{@struggle.name}")

      visit "/recipes/#{@gc.id}"

      expect(page).to have_content("Name: #{@gc.name}")
      expect(page).to have_content("Complexity: #{@gc.complexity}")
      expect(page).to have_content("Genre: #{@gc.genre}")
      expect(page).to_not have_content("#{@burger.name}")
      expect(page).to_not have_content("#{@struggle.name}")

      visit "/recipes/#{@struggle.id}"

      expect(page).to have_content("Name: #{@struggle.name}")
      expect(page).to have_content("Complexity: #{@struggle.complexity}")
      expect(page).to have_content("Genre: #{@struggle.genre}")
      expect(page).to_not have_content("#{@burger.name}")
      expect(page).to_not have_content("#{@gc.name}")
    end
  end

  describe "Total Cost of Ingredients for a Recipe" do
    it "Can calculate and display total cost of recipe" do
      visit "/recipes/#{@burger.id}"
      expect(page).to have_content("Total Cost: #{@burger.total_cost}")

      visit "/recipes/#{@gc.id}"
      expect(page).to have_content("Total Cost: #{@gc.total_cost}")

      visit "/recipes/#{@struggle.id}"
      expect(page).to have_content("Total Cost: #{@struggle.total_cost}")
    end
  end
end