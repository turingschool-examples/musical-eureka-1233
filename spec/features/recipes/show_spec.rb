require "rails_helper"

RSpec.describe "/recipes/:id, recipe show page", type: :feature do
  describe "as a visitor to show page" do
    before(:each) do
      @recipe1 = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
      @recipe2 = Recipe.create!(name: "Mac and Cheese", complexity: 1, genre: "American")

      @ingredient1 = Ingredient.create!(name: "Ground Beef", cost: 2)
      @ingredient2 = Ingredient.create!(name: "Salt", cost: 4)
      @ingredient3 = Ingredient.create!(name: "Pasta", cost: 5)
      @ingredient4 = Ingredient.create!(name: "Tomato", cost: 1)

      RecipeIngredient.create!(recipe_id: @recipe1.id, ingredient_id: @ingredient1.id)
      RecipeIngredient.create!(recipe_id: @recipe1.id, ingredient_id: @ingredient3.id)
      RecipeIngredient.create!(recipe_id: @recipe1.id, ingredient_id: @ingredient4.id)
    end

    it "should see the specific recipe and it's attributes and ingredients needed" do
      visit "/recipes/#{@recipe1.id}"

      
      expect(page).to have_content("Name: #{@recipe1.name}")
      expect(page).to have_content("Complexity: #{@recipe1.complexity}")
      expect(page).to have_content("Genre: #{@recipe1.genre}")

      expect(page).to have_content("Ingredients:")
      expect(page).to have_content(@ingredient1.name)
      expect(page).to have_content(@ingredient3.name)
      expect(page).to have_content(@ingredient4.name)

      expect(page).to_not have_content(@recipe2.name)
      expect(page).to_not have_content(@ingredient2.name)
    end

    it "shows the total cost of all ingredients for the recipe" do
      visit "/recipes/#{@recipe1.id}"

      expect(page).to have_content("Total Cost: 8")
    end
  end
end