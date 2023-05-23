require "rails_helper"

RSpec.describe "/recipes/:id", type: :feature do
  before(:each) do
    @ingredient_1 = Ingredient.create!(name: "Lemon", cost: 2)
    @ingredient_2 = Ingredient.create!(name: "Asparagus", cost: 1)
    @ingredient_3 = Ingredient.create!(name: "Salmon", cost: 10)

    @ingredient_4 = Ingredient.create!(name: "Sauce", cost: 4)
    @ingredient_5 = Ingredient.create!(name: "Spaghetti", cost: 2)
    @ingredient_6 = Ingredient.create!(name: "Ground Beef", cost: 7)

    @ingredient_7 = Ingredient.create!(name: "Salt", cost: 4)
    @ingredient_8 = Ingredient.create!(name: "Pepper", cost: 4)
    @ingredient_9 = Ingredient.create!(name: "Avocado Oil", cost: 4)

    @recipe_1 = Recipe.create!(name: "Tangy Salmon", complexity: 5, genre: "Mediterranean")
    @recipe_2 = Recipe.create!(name: "Tried and True", complexity: 2, genre: "Italian")
    @recipe_3 = Recipe.create!(name: "Avo Asparagus", complexity: 1, genre: "Sides")

    # Tangy Salmon
    RecipeIngredient.create!(recipe_id: @recipe_1.id, ingredient_id: @ingredient_1.id)
    RecipeIngredient.create!(recipe_id: @recipe_1.id, ingredient_id: @ingredient_2.id)
    RecipeIngredient.create!(recipe_id: @recipe_1.id, ingredient_id: @ingredient_3.id)
    RecipeIngredient.create!(recipe_id: @recipe_1.id, ingredient_id: @ingredient_7.id)
    RecipeIngredient.create!(recipe_id: @recipe_1.id, ingredient_id: @ingredient_8.id)
    RecipeIngredient.create!(recipe_id: @recipe_1.id, ingredient_id: @ingredient_9.id)

    # Tried and True
    RecipeIngredient.create!(recipe_id: @recipe_2.id, ingredient_id: @ingredient_4.id)
    RecipeIngredient.create!(recipe_id: @recipe_2.id, ingredient_id: @ingredient_5.id)
    RecipeIngredient.create!(recipe_id: @recipe_2.id, ingredient_id: @ingredient_6.id)
    RecipeIngredient.create!(recipe_id: @recipe_2.id, ingredient_id: @ingredient_7.id)
    RecipeIngredient.create!(recipe_id: @recipe_2.id, ingredient_id: @ingredient_8.id)

    # Avo Asparagus
    RecipeIngredient.create!(recipe_id: @recipe_3.id, ingredient_id: @ingredient_1.id)
    RecipeIngredient.create!(recipe_id: @recipe_3.id, ingredient_id: @ingredient_2.id)
    RecipeIngredient.create!(recipe_id: @recipe_3.id, ingredient_id: @ingredient_7.id)
    RecipeIngredient.create!(recipe_id: @recipe_3.id, ingredient_id: @ingredient_8.id)
    RecipeIngredient.create!(recipe_id: @recipe_3.id, ingredient_id: @ingredient_9.id)
  end

  describe "show Tangy Salmon page" do
    it "shows a specific recipe with name, complexity and genre along with a list of the names of the ingredients for the recipe" do
      visit "/recipes/#{@recipe_1.id}"

      expect(page).to have_content(@recipe_1.name)
      expect(page).to have_content(@recipe_1.complexity)
      expect(page).to have_content(@recipe_1.genre)
      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to have_content(@ingredient_3.name)
      expect(page).to have_content(@ingredient_7.name)
      expect(page).to have_content(@ingredient_8.name)
      expect(page).to have_content(@ingredient_9.name)
    end

    it "shows the total cost of all the ingredients in the recipe" do
      visit "/recipes/#{@recipe_1.id}"

      expect(page).to have_content("Total Cost: $25")
    end
  end

  describe "show Tried and True page" do
    it "shows a specific recipe with name, complexity and genre along with a list of the names of the ingredients for the recipe" do
      visit "/recipes/#{@recipe_2.id}"

      expect(page).to have_content(@recipe_2.name)
      expect(page).to have_content(@recipe_2.complexity)
      expect(page).to have_content(@recipe_2.genre)
      expect(page).to have_content(@ingredient_4.name)
      expect(page).to have_content(@ingredient_5.name)
      expect(page).to have_content(@ingredient_6.name)
      expect(page).to have_content(@ingredient_7.name)
      expect(page).to have_content(@ingredient_8.name)
    end

    it "shows the total cost of all the ingredients in the recipe" do
      visit "/recipes/#{@recipe_2.id}"

      expect(page).to have_content("Total Cost: $21")
    end
  end

  describe "show Avo Asparague page" do
    it "shows a specific recipe with name, complexity and genre along with a list of the names of the ingredients for the recipe" do
      visit "/recipes/#{@recipe_3.id}"

      expect(page).to have_content(@recipe_3.name)
      expect(page).to have_content(@recipe_3.complexity)
      expect(page).to have_content(@recipe_3.genre)
      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to have_content(@ingredient_7.name)
      expect(page).to have_content(@ingredient_8.name)
      expect(page).to have_content(@ingredient_9.name)
    end

    it "shows the total cost of all the ingredients in the recipe" do
      visit "/recipes/#{@recipe_3.id}"

      expect(page).to have_content("Total Cost: $15")
    end
  end

  describe "add an ingredient to recipe" do
    it "creates a form to add an ingredient to a recipe" do
      visit "/recipes/#{@recipe_3.id}"

      expect(page).to have_content(@recipe_3.name)
      expect(page).to have_content(@recipe_3.complexity)
      expect(page).to have_content(@recipe_3.genre)
      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to have_content(@ingredient_7.name)
      expect(page).to have_content(@ingredient_8.name)
      expect(page).to have_content(@ingredient_9.name)

      fill_in(:name, with: "Ingredient_Name")
      fill_in(:cost, with: 100)
      click_button("Submit")

      expect(page).to have_content("Ingredient Name")
      expect(page).to have_content(100)
    end

    it "shows the total cost of all the ingredients in the recipe" do
      visit "/recipes/#{@recipe_3.id}"

      expect(page).to have_content("Total Cost: $15")
    end
  end
end