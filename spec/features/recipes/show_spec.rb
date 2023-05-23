require "rails_helper"

RSpec.describe "the recipes show page" do
  before(:each) do
    @beef = Ingredient.create!(name: "Ground Beef", cost: 2)
    @salt = Ingredient.create!(name: "Salt", cost: 4)
    @flour = Ingredient.create!(name: "Flour", cost: 6)

    @recipe1 = Recipe.create!(name: "Pasta", complexity: 2, genre: "Italian")
    @recipe2 = Recipe.create!(name: "Meat Pie", complexity: 1, genre: "English")

    @recipe1_ingredient1 = RecipeIngredient.create!(recipe_id: @recipe1.id, ingredient_id: @beef.id)
    @recipe1_ingredient2 = RecipeIngredient.create!(recipe_id: @recipe1.id, ingredient_id: @salt.id)
    @recipe1_ingredient3 = RecipeIngredient.create!(recipe_id: @recipe1.id, ingredient_id: @flour.id)

    @recipe2_ingredient1 = RecipeIngredient.create!(recipe_id: @recipe2.id, ingredient_id: @beef.id)
    @recipe2_ingredient2 = RecipeIngredient.create!(recipe_id: @recipe2.id, ingredient_id: @flour.id)
  
    visit "/recipes/#{@recipe1.id}"
  end

  it "lists all the attributes of the recipe along with their ingredients" do
    expect(page).to have_content("Name: #{@recipe1.name}")
    expect(page).to have_content("Complexity: #{@recipe1.complexity}")
    expect(page).to have_content("Genre: #{@recipe1.genre}")

    expect(page).to have_content(@beef.name)
    expect(page).to have_content(@salt.name)
    expect(page).to have_content(@flour.name)

    visit "/recipes/#{@recipe2.id}"

    expect(page).to have_content("Recipe Name: #{@recipe2.name}")
    expect(page).to have_content("Complexity: #{@recipe2.complexity}")
    expect(page).to have_content("Genre: #{@recipe2.genre}")

    expect(page).to have_content(@beef.name)
    expect(page).to have_content(@flour.name)

    expect(page).to_not have_content(@salt.name)
  end

  it "provides the total cost of all ingredients for the recipe" do
    expect(page).to have_content("Total Cost: $ 12")
  
    visit "/recipes/#{@recipe2.id}"

    expect(page).to have_content("Total Cost: $ 8")

  end

end