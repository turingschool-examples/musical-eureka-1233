require "rails_helper"

RSpec.describe Recipe, type: :model do
  before :each do 
    @spaghetti = Recipe.create!(name: 'Spaghetti', complexity: 2, genre: 'Feels good')
    @ground_beef = Ingredient.create!(name: 'ground beef', cost: 15)
    @garlic = Ingredient.create!(name: 'garlic', cost: 3)
    @onion = Ingredient.create!(name: 'onion', cost: 4)
    @salt = Ingredient.create!(name: 'salt', cost: 2)
    @tomatoes = Ingredient.create!(name: 'tomatoes', cost: 10)
    RecipeIngredient.create!(ingredient: @tomatoes, recipe: @spaghetti)
    RecipeIngredient.create!(ingredient: @garlic, recipe: @spaghetti)
    RecipeIngredient.create!(ingredient: @onion, recipe: @spaghetti)
    RecipeIngredient.create!(ingredient: @salt, recipe: @spaghetti)
  end 

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe "relationships" do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe "methods" do 
    it 'total_cost' do 
      expect(@spaghetti.total_cost).to eq(19)
    end
  end
end