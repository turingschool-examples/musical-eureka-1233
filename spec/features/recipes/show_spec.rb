require 'rails_helper'

RSpec.describe "ingredients index" do
  before(:each) do
    @tomatoe = Ingredient.create!(name: "tomatoe", cost: 2)
    @lettuce = Ingredient.create!(name: "lettuce", cost: 1)
    @bread = Ingredient.create!(name: "bread", cost: 5)
    @bacon = Ingredient.create!(name: "bacon", cost: 10)
    @ham = Ingredient.create!(name: "ham", cost: 12)
    
    @lt = Recipe.create!(name: "LT", complexity: 3, genre: "Veggie Sandwich")
    @ham_sandwich = Recipe.create!(name: "Ham Sandwich", complexity: 1, genre: "Meat Sandwich")
    @bacon_sandwich = Recipe.create!(name: "Bacon Sandwich", complexity: 1, genre: "Meat Sandwich")

    @lt_recipe = RecipeIngredients.create!(ingredient_id: @tomatoe.id, ingredient_id: @lettuce.id, ingredient_id: @bread.id, recipe_id: @lt.id )
    @ham_sandwich_recipe = RecipeIngredients.create!(ingredient_id: @ham.id, ingredient_id: @bread.id, recipe_id: @ham_sandwich.id)
    @bacon_sandwich_recipe = RecipeIngredients.create!(ingredient_id: @bacon.id, ingredient_id: @bread.id, recipe_id: @bacon_sandwich.id)
  end

  it 'show recipe with name, complexity, and genre' do
    visit "/recipes/#{@lt.id}"

    expect(page).to have_content(@lt.name)
    expect(page).to have_content(@lt.complexity)
    expect(page).to have_content(@lt.genre)

    visit "/recipes/#{@ham_sandwich.id}"

    expect(page).to have_content(@ham_sandwich.name)
    expect(page).to have_content(@ham_sandwich.complexity)
    expect(page).to have_content(@ham_sandwich.genre)

    visit "/recipes/#{@bacon_sandwich.id}"

    expect(page).to have_content(@bacon_sandwich.name)
    expect(page).to have_content(@bacon_sandwich.complexity)
    expect(page).to have_content(@bacon_sandwich.genre)
  end

  it 'show a list of the ingredients for the recipe' do
    visit "/recipes/#{@lt.id}"

    expect(page).to have_content("tomatoe")
    expect(page).to have_content("lettuce")    
    expect(page).to have_content("bread")

    visit "/recipes/#{@ham_sandwich.id}"

    expect(page).to have_content("ham")
    expect(page).to have_content("bread")

    visit "/recipes/#{@bacon_sandwich.id}"

    expect(page).to have_content("bacon")
    expect(page).to have_content("bread")

  end
end