require "rails_helper"

RSpec.describe "/recipes/:id Show Page" do
  before(:each) do
    @ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 2)
    @ingredient_2 = Ingredient.create!(name: "Salt", cost: 4)
    @ingredient_3 = Ingredient.create!(name: "Tomatoe Sauce", cost: 6)

    @recipe_1 = Recipe.create!(name: "Spaghetti", complexity: 4, genre: "Italian")
    @recipe_2 = Recipe.create!(name: "Hamburger", complexity: 1, genre: "American")

    RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_1)
    RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_2)
    RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_3)

    RecipeIngredient.create!(recipe: @recipe_2, ingredient: @ingredient_1)
    RecipeIngredient.create!(recipe: @recipe_2, ingredient: @ingredient_2)
  end

  it "displays the recipe's name, complexity and genre" do
    visit "/recipes/#{@recipe_1.id}"

    expect(page).to have_content(@recipe_1.name)
    expect(page).to have_content("Complexity: #{@recipe_1.complexity}")
    expect(page).to have_content("Genre: #{@recipe_1.genre}")

    visit "/recipes/#{@recipe_2.id}"

    expect(page).to have_content(@recipe_2.name)
    expect(page).to have_content("Complexity: #{@recipe_2.complexity}")
    expect(page).to have_content("Genre: #{@recipe_2.genre}")
  end

  it "displays a list of the names of hte ingredients for the recipe" do
    visit "/recipes/#{@recipe_1.id}"

    expect(page).to have_content("Ingredients:")
    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_2.name)
    expect(page).to have_content(@ingredient_3.name)

    visit "/recipes/#{@recipe_2.id}"

    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_2.name)
    expect(page).to_not have_content(@ingredient_3.name)
  end
end