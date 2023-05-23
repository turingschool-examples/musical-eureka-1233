require "rails_helper"

RSpec.describe Recipe, type: :feature do
  
  describe "recipe show page" do
    before :each do 
      @tomatoes = Ingredient.create!(name: "tomatoes", cost: 5)
      @oil = Ingredient.create!(name: "olive oil", cost: 4)
      @beef = Ingredient.create!(name: "ground beef", cost: 10)
      @pasta = Ingredient.create!(name: "spaghetti", cost: 2)

      @pb = Ingredient.create!(name: "peanut butter", cost:1)
      @jelly = Ingredient.create!(name: "jelly", cost:3)
      @bread = Ingredient.create!(name: "whole wheat breat", cost: 6)

      @recipe1 = Recipe.create!(name: "spaghetti recipe", complexity: 2, genre: "Italian")
      @recipe2 = Recipe.create!(name: "pb&j", complexity: 1, genre: "snack")

      @rec_ingredients1 = RecipeIngredient.create!(recipe_id: @recipe1.id, ingredient_id: @tomatoes.id)
      @rec_ingredients2 = RecipeIngredient.create!(recipe_id: @recipe1.id, ingredient_id: @oil.id)
      @rec_ingredients3 = RecipeIngredient.create!(recipe_id: @recipe1.id, ingredient_id: @beef.id)
      @rec_ingredients4 = RecipeIngredient.create!(recipe_id: @recipe1.id, ingredient_id: @pasta.id)
      @rec_ingredients5 = RecipeIngredient.create!(recipe_id: @recipe2.id, ingredient_id: @pb.id)
      @rec_ingredients6 = RecipeIngredient.create!(recipe_id: @recipe2.id, ingredient_id: @jelly.id)
      @rec_ingredients7 = RecipeIngredient.create!(recipe_id: @recipe2.id, ingredient_id: @bread.id)
    end

    it "shows recipe attributes" do
      visit "/recipes/#{@recipe1.id}"

      expect(page).to have_content("Name: #{@recipe1.name}")
      expect(page).to have_content("Complexity: #{@recipe1.complexity}")
      expect(page).to have_content("Genre: #{@recipe1.genre}")

      expect(page).to_not have_content("Name: #{@recipe2.name}")
      expect(page).to_not have_content("Complexity: #{@recipe2.complexity}")
      expect(page).to_not have_content("Genre: #{@recipe2.genre}")

      visit "/recipes/#{@recipe2.id}"
      expect(page).to have_content("Name: #{@recipe2.name}")
      expect(page).to have_content("Complexity: #{@recipe2.complexity}")
      expect(page).to have_content("Genre: #{@recipe2.genre}")

      expect(page).to_not have_content("Name: #{@recipe1.name}")
      expect(page).to_not have_content("Complexity: #{@recipe1.complexity}")
      expect(page).to_not have_content("Genre: #{@recipe1.genre}")
    end

    it "shows list of ingredients for recipe" do
      visit "/recipes/#{@recipe1.id}"

      expect(page).to have_content(@rec_ingredients1.ingredient.name)
      expect(page).to have_content(@rec_ingredients2.ingredient.name)
      expect(page).to have_content(@rec_ingredients3.ingredient.name)
      expect(page).to have_content(@rec_ingredients4.ingredient.name)

      expect(page).to_not have_content(@rec_ingredients5.ingredient.name)
      expect(page).to_not have_content(@rec_ingredients6.ingredient.name)
      expect(page).to_not have_content(@rec_ingredients7.ingredient.name)

      visit "/recipes/#{@recipe2.id}"

      expect(page).to have_content(@rec_ingredients5.ingredient.name)
      expect(page).to have_content(@rec_ingredients6.ingredient.name)
      expect(page).to have_content(@rec_ingredients7.ingredient.name)

      expect(page).to_not have_content(@rec_ingredients1.ingredient.name)
      expect(page).to_not have_content(@rec_ingredients2.ingredient.name)
      expect(page).to_not have_content(@rec_ingredients3.ingredient.name)
      expect(page).to_not have_content(@rec_ingredients4.ingredient.name)

    end
  end
end
