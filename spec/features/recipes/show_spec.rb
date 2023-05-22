require 'rails_helper'

RSpec.describe "/recipes/id" do
  before :each do
    @milk = Ingredient.create!(name: "Milk", cost: 2)
    @flour = Ingredient.create!(name: "Flour", cost: 1)

    @cake = Recipe.create!(name: "Cookies", complexity: 3, genre: "Desert")
    @soup = Recipe.create!(name: "Pea Soup", complexity: 4, genre: "Dinner")

    RecipeIngredient.create!(recipe: @cake, ingredient: @milk)
    RecipeIngredient.create!(recipe: @cake, ingredient: @flour)

  end
  describe "As a visitor, when I visit the recipe's show page " do
    it 'displays the name, complexity and genre' do
      visit "/recipes/#{@cake.id}"

      expect(page).to have_content(@cake.name)
      expect(page).to have_content(@cake.complexity)
      expect(page).to have_content(@cake.genre)
    end
    it 'displays a list of the names of ingredients for the recipe' do
      visit "/recipes/#{@cake.id}"

      expect(page).to have_content(@milk.name)
      expect(page).to have_content(@flour.name)
    end
    it 'displays the total cost of the ingredients' do
      visit "/recipes/#{@cake.id}"
      save_and_open_page
      expect(page).to have_content("Total Cost of Ingredients: 3")
    end
  end
end