require 'rails_helper'

# As a visitor,
# When I visit '/recipes/:id',
# Then I see the recipe's name, complexity and genre,
# and I see a list of the names of the ingredients for the recipe.

RSpec.describe 'recipes show page', type: :feature do 
  before :each do 
    @spaghetti = Recipe.create!(name: 'Spaghetti', complexity: 2, genre: 'Feels good')
    @cornbread = Recipe.create!(name: 'Cornbread', complexity: 2, genre: 'Soul Food')
    @beans = Recipe.create!(name: 'Beans', complexity: 3, genre: 'Comfort Food')
    @borscht = Recipe.create!(name: 'Borscht', complexity: 3, genre: 'Feels good')

    @ground_beef = Ingredient.create!(name: 'ground beef', cost: 15)
    @garlic = Ingredient.create!(name: 'garlic', cost: 3)
    @onion = Ingredient.create!(name: 'onion', cost: 4)
    @salt = Ingredient.create!(name: 'salt', cost: 2)
    @cornmeal = Ingredient.create!(name: 'cornmeal', cost: 10)
    @fatback = Ingredient.create!(name: 'fatback', cost: 8)
    @butter = Ingredient.create!(name: 'butter', cost: 25)
    @beets = Ingredient.create!(name: 'beets', cost: 7)
    @pintos = Ingredient.create!(name: 'pintos', cost: 5)
    @tomatoes = Ingredient.create!(name: 'tomatoes', cost: 10)

    RecipeIngredient.create!(ingredient: @pintos, recipe: @beans)
    RecipeIngredient.create!(ingredient: @fatback, recipe: @beans)
    RecipeIngredient.create!(ingredient: @salt, recipe: @beans)

    RecipeIngredient.create!(ingredient: @tomatoes, recipe: @spaghetti)
    RecipeIngredient.create!(ingredient: @garlic, recipe: @spaghetti)
    RecipeIngredient.create!(ingredient: @onion, recipe: @spaghetti)
    RecipeIngredient.create!(ingredient: @salt, recipe: @spaghetti)

    RecipeIngredient.create!(ingredient: @cornmeal, recipe: @cornbread)
    RecipeIngredient.create!(ingredient: @butter, recipe: @cornbread)
    RecipeIngredient.create!(ingredient: @salt, recipe: @cornbread)

    RecipeIngredient.create!(ingredient: @beets, recipe: @borscht)
    RecipeIngredient.create!(ingredient: @salt, recipe: @borscht)
    end

  describe '/recipes/:id' do 
    it 'displays name, complexity, genre, ingredients' do 
      visit "/recipes/#{@spaghetti.id}"
      expect(page).to have_content(@spaghetti.name)
      expect(page).to have_content("Complexity: #{@spaghetti.complexity}")
      expect(page).to have_content("Genre: #{@spaghetti.genre}")
      expect(page).to have_content("Ingredients:")
      expect(page).to have_content(@tomatoes.name)
      expect(page).to have_content(@garlic.name)
      expect(page).to have_content(@onion.name)
      expect(page).to have_content(@salt.name)
    end

    it 'displays total cost of ingredients' do 
      visit "recipes/#{@beans.id}"
      expect(page).to have_content("Total Cost: 15")
    end
  end
end